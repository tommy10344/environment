export PATH=/usr/local/bin:${PATH}
export PATH=${HOME}/bin:${PATH}
if [ -d "${HOME}/.local/bin" ]; then
    export PATH=${HOME}/.local/bin:${PATH}
fi

# INCLUDE_PATH
if [ -d "/usr/local/include" ]; then
    export C_INCLUDE_PATH=/usr/local/include:${C_INCLUDE_PATH}
    export CPLUS_INCLUDE_PATH=/usr/local/include:${CPLUS_INCLUDE_PATH}
fi
if [ -d "${HOME}/include" ]; then
    export C_INCLUDE_PATH=${HOME}/include:${C_INCLUDE_PATH}
    export CPLUS_INCLUDE_PATH=${HOME}/include:${CPLUS_INCLUDE_PATH}
fi

# LIBRARY_PATH
if [ -d "/usr/local/lib" ]; then
    export LIBRARY_PATH=/usr/local/lib:${LIBRARY_PATH}
    export LD_LIBRARY_PATH=/usr/local/lib:${LD_LIBRARY_PATH}
fi
if [ -d "${HOME}/lib" ]; then
    export LIBRARY_PATH=${HOME}/lib:${LIBRARY_PATH}
    export LD_LIBRARY_PATH=${HOME}/lib:${LD_LIBRARY_PATH}
fi

# Linuxbrew
# if [ -d "${HOME}/.linuxbrew" ]; then
#     export PATH="${HOME}/.linuxbrew/bin:${PATH}"
#     export MANPATH="${HOME}/.linuxbrew/share/man:${MANPATH}"
#     export INFOPATH="${HOME}/.linuxbrew/share/info:${INFOPATH}"
# fi

# NeoVim
export PATH="$HOME/neovim/bin:$PATH"

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"
