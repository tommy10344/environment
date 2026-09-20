# go install で入れたコマンド(gopls など)を PATH に出す。
# GOPATH は Go 1.8 以降 ~/go が既定なので export はせず、go 自身に聞く。
if type go > /dev/null 2>&1; then
    export PATH=$(go env GOPATH)/bin:${PATH}
fi
