FROM tomiyosi/base-dev
MAINTAINER Hiroaki Tomiyoshi<fomr1002@gmail.com>

# Haskell
RUN apt-get install -y haskell-stack
RUN stack install ghc-mod hlint haskell-docs
RUN stack install hoogle && hoogle data
