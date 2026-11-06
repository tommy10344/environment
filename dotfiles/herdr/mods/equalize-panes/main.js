// 表示中のタブのペインを均等な幅・高さに揃える。
// キー（keys.json の mod.open:equalize-panes）で開かれ、仕事を終えたら自分で閉じる。
// タブの分割構造は herdr.d.ts の API に出ていないので、herdr-core の
// "herdr-app" 文書（doc.get）から読み、各ノードの重みを layout.resize で書く。
import { View, div } from "gpui-kit";
import { exec, focused, spaces, run, props, closeOverlay, notify } from "herdr";

const isSplit = (n) => n && (n.type === "row" || n.type === "column");
const shownKids = (n) => (n.children || []).filter((c) => !c.hidden);

// dir（"row" = 横並び、"column" = 縦積み）の向きに、この部分木が何ペイン分を占めるか。
function span(node, dir) {
  const kids = shownKids(node);
  if (!isSplit(node) || kids.length === 0) return 1;
  const spans = kids.map((c) => span(c, dir));
  return node.type === dir ? spans.reduce((a, b) => a + b, 0) : Math.max(...spans);
}

// 各分割の子に、占めるペイン数に比例した重みを割り当てる（入れ子でも全ペインが揃う）。
function plan(node, out) {
  if (!isSplit(node)) return;
  const kids = shownKids(node);
  const spans = kids.map((c) => span(c, node.type));
  const total = spans.reduce((a, b) => a + b, 0);
  kids.forEach((c, i) => {
    // px で固定された子はそのままにする。
    if (!(c.size && "px" in c.size)) out.push({ id: c.id, weight: spans[i] / total });
    plan(c, out);
  });
}

async function readLayoutDoc(machine) {
  const params = { name: "herdr-app" };
  if (machine) params.on = machine;
  const req = JSON.stringify({ jsonrpc: "2.0", id: 1, method: "doc.get", params });
  const r = await exec("sh", ["-c", 'printf "%s\\n" "$1" | hc connect --json', "sh", req]);
  if (r.code !== 0) throw new Error(r.stderr.trim() || `hc connect が ${r.code} で終了`);
  const line = r.stdout.split("\n").find((l) => l.trim());
  const res = JSON.parse(line);
  if (res.error) throw new Error(res.error.message);
  return res.result.value;
}

async function equalize() {
  const f = focused();
  if (!f?.tab) return;
  const machine = spaces().find((s) => s.id === f.space)?.machine ?? null;
  const prefix = machine ? `${machine}/` : "";
  const tabId = f.tab.startsWith(prefix) ? f.tab.slice(prefix.length) : f.tab;

  const doc = await readLayoutDoc(machine);
  let root = null;
  for (const s of doc.spaces ?? []) for (const t of s.tabs ?? []) if (t.id === tabId) root = t.root;
  if (!root) throw new Error(`タブ ${tabId} が見つからない`);

  const out = [];
  plan(root, out);
  for (const { id, weight } of out) run("layout.resize", { id: prefix + id, weight });
}

export default class EqualizePanes extends View {
  init(_props, cx) {
    cx.spawn(async (_cx) => {
      try {
        await equalize();
      } catch (e) {
        notify({ title: "ペインを揃えられませんでした", body: String(e?.message ?? e), level: "error" });
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
