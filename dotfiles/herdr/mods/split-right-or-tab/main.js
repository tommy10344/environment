// 表示中のタブのペインを右に分割する。ただしタブのペインが既に MAX_PANES 個あるときは、
// 分割せずに新しいタブを開く（1 タブのペインを MAX_PANES 個までに抑える）。
// 分割したときは、続けてタブのペインを均等な幅・高さに揃える（mods/equalize-panes）。
// キー（keys.json の mod.open:split-right-or-tab）で開かれ、仕事を終えたら自分で閉じる。
// mod.open は引数に name しか取らないので、向きごとに mod を分けている
// （対になる mod: split-down-or-tab）。
import { View, div } from "gpui-kit";
import { focused, spaces, run, props, closeOverlay, notify } from "herdr";

const DIRECTION = "right";
const MAX_PANES = 3;

function splitOrNewTab() {
  const f = focused();
  const tab = spaces()
    .find((s) => s.id === f?.space)
    ?.tabs.find((t) => t.id === f?.tab);
  if (tab && tab.panes >= MAX_PANES) {
    // 既定で選択中のスペースに、フォーカス中のターミナルのフォルダで開く（分割と同じ）。
    run("tab.new", {});
  } else {
    run("pane.split", { direction: DIRECTION });
    // 分割したタブのペインを均等にする（⌘⇧E と同じ mod を開く）。
    run("mod.open", { name: "equalize-panes" });
  }
}

export default class SplitOrTab extends View {
  init(_props, cx) {
    cx.spawn(async (_cx) => {
      try {
        splitOrNewTab();
      } catch (e) {
        notify({ title: "ペインを追加できませんでした", body: String(e?.message ?? e), level: "error" });
      } finally {
        // mod.open はトグルなので、必ず閉じて次の押下で再実行されるようにする。
        const o = props()?.overlay;
        if (o) closeOverlay(o);
      }
    });
  }

  render() {
    return div();
  }
}
