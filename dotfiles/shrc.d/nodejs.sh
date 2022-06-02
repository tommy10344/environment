# Volta: Node.js Version Manager
# https://volta.sh
if type volta > /dev/null 2>&1; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
fi
