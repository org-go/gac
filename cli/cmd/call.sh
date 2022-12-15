#!/usr/bin/env bash


function call_cloc() {
    go install github.com/hhatto/gocloc/cmd/gocloc@latest && gocloc --include-lang=go  --match-d= ../../apps/ .
}
if ( [ $# -eq 1 ] && [ "$1" ==  "-cloc" ] ) ; then
    call_cloc
    exit 1
fi


#
