# Zellij auto-start
# https://zellij.dev/documentation/integration#autostart-on-shell-creation
if command -v zellij &> /dev/null && [ -z "$ZELLIJ" ]; then
    eval "$(zellij setup --generate-auto-start zsh)"
fi
