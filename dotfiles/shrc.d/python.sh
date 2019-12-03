# pyenv
if which pyenv > /dev/null; then
    # pyenv
    export PYENV_ROOT=${HOME}/.pyenv
    export PATH=${PYENV_ROOT}/bin:${PATH}
    eval "$(pyenv init -)"

    # pyenv-virtualenv
    eval "$(pyenv virtualenv-init -)"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
fi
