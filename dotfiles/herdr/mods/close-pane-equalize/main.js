// フォーカス中のペインを閉じ、残ったペインを均等な幅・高さに揃える（mods/equalize-panes）。
// キー（keys.json の mod.open:close-pane-equalize）で開かれ、仕事を終えたら自分で閉じる。
// タブ最後のペインを閉じるとタブごと閉じてフォーカスが別のタブへ移るので、そのときは揃えない
// （揃えると、閉じたのとは関係ない別のタブの幅を変えてしまう）。
import { View, div } from "gpui-kit";
import { focused, spaces, run, props, closeOverlay, notify } from "herdr";

function closeAndEqualize() {
  const f = focused();
  const tab = spaces()
    .find((s) => s.id === f?.space)
    ?.tabs.find((t) => t.id === f?.tab);
  run("pane.close", {});
  if (tab && tab.panes > 1) run("mod.open", { name: "equalize-panes" });
}

export default class ClosePaneEqualize extends View {
  init(_props, cx) {
    cx.spawn(async (_cx) => {
      try {
        closeAndEqualize();
      } catch (e) {
        notify({ title: "ペインを閉じられませんでした", body: String(e?.message ?? e), level: "error" });
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
