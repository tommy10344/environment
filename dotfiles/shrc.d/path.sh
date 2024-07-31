# PATH
export PATH=/usr/local/bin:${PATH}

if [ -d "/opt/homebrew/bin" ]; then
    export PATH=/opt/homebrew/bin:${PATH}
fi

export PATH=${HOME}/bin:${PATH}

if [ -d "${HOME}/.local/bin" ]; then
    export PATH=${HOME}/.local/bin:${PATH}
fi

# INCLUDE_PATH
if [ -d "/usr/local/include" ]; then
    export C_INCLUDE_PATH=/usr/local/include:${C_INCLUDE_PATH}
    export CPLUS_INCLUDE_PATH=/usr/local/include:${CPLUS_INCLUDE_PATH}
fi
if [ -d "/opt/homebrew/include" ]; then
    export C_INCLUDE_PATH=/opt/homebrew/include:${C_INCLUDE_PATH}
    export CPLUS_INCLUDE_PATH=/opt/homebrew/include:${CPLUS_INCLUDE_PATH}
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
if [ -d "/opt/homebrew/lib" ]; then
    export LIBRARY_PATH=/opt/homebrew/lib:${LIBRARY_PATH}
    export LD_LIBRARY_PATH=/opt/homebrew/lib:${LD_LIBRARY_PATH}
fi
if [ -d "${HOME}/lib" ]; then
    export LIBRARY_PATH=${HOME}/lib:${LIBRARY_PATH}
    export LD_LIBRARY_PATH=${HOME}/lib:${LD_LIBRARY_PATH}
fi

# Ruby
export PATH=/usr/local/opt/ruby/bin:$PATH

# Python
export PATH=/usr/local/opt/python@3/bin:$PATH

# OpenSSL(HomeBrew)
if [ -d "/usr/local/opt/openssl" ]; then
    export PATH=/usr/local/opt/openssl/bin:$PATH
fi
if [ -d "/opt/homebrew/opt/openssl" ]; then
    export PATH=/opt/homebrew/opt/openssl/bin:$PATH
fi

# curl
if [ -d "/usr/local/opt/curl" ]; then
    export PATH=/usr/local/opt/curl/bin:$PATH
fi
if [ -d "/opt/homebrew/opt/curl" ]; then
    export PATH=/opt/homebrew/opt/curl/bin:$PATH
fi

# NeoVim
export PATH=$HOME/neovim/bin:$PATH

# Add Visual Studio Code (code)
# https://code.visualstudio.com/docs/setup/mac
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH

# fastlane
export PATH=$HOME/.fastlane/bin:$PATH

# Flutter
if [ -d "`ghq root`/github.com/flutter/flutter" ]; then
  export PATH=`ghq root`/github.com/flutter/flutter/bin:$PATH
fi

# Dart
if [ -d "$HOME/.pub-cache" ]; then
  export PATH=$HOME/.pub-cache/bin:$PATH
fi

# .NET
# Global tools path
# https://learn.microsoft.com/ja-jp/dotnet/core/tools/global-tools#install-a-global-tool
if [ -d "$HOME/.dotnet/tools" ]; then
  export PATH=$HOME/.dotnet/tools:$PATH
fi
