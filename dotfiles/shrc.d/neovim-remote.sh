function nvcd() {
    abspath=`cd $1 && pwd`
    nvr -c "lcd $abspath"
}
