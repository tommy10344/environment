 # Safe-chain initialization script
 # @see https://github.com/AikidoSec/safe-chain
source ~/.safe-chain/scripts/init-posix.sh

# Claude Code のセッションでは python / python3 のラップだけ解除する。
# safe-chain のラッパは起動時にローカルプロキシを listen するため、Claude Code の
# sandbox（macOS Seatbelt）内では EPERM でクラッシュし、素の python 実行まで巻き込まれる。
# パッケージマネージャ系（pip/pip3/npm 等）のラップは維持し、実行系の python だけ素に戻す
# （python ラップの目的は `python -m pip install` の捕捉なので、失うものはその1経路のみ）。
if [ -n "${CLAUDECODE:-}" ]; then
  unalias python python3 2>/dev/null || true
  unset -f python python3 2>/dev/null || true
fi