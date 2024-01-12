#!/bin/bash

function error() {
	echo $*
	exit 1
}

test -e "$1" || error "Usage: $0 <WoW base dir>"

CLASSIC="$1/_classic_era_/Interface/AddOns/"
WOTLK="$1/_classic_/Interface/AddOns/"
RETAIL="$1/_retail_/Interface/AddOns/"

function deploy() {
	rsync --delete -r -f '- .*' -f 'P */Libs/*' DBM-Core "$1" &
	rsync --delete -r -f '- .*' -f 'P */Libs/*' DBM-GUI "$1" &
	rsync --delete -r -f '- .*' -f 'P */Libs/*' DBM-StatusBarTimers "$1" &
}

deploy "$CLASSIC"
deploy "$WOTLK"
deploy "$RETAIL"

wait
