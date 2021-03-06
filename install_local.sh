#!/bin/bash

cd "$(dirname $0)"

src_bin=bin
src_completion=completion

dst_bin=/usr/local/bin/
dst_completion=/etc/bash_completion.d/

# common functions.
die() {
    echo "${@}"
    exit 1
}

#Let mac user use homebrew to install.
name=$(uname)
if [ "Darwin" = "$name" ] ; then
    dst_completion=/usr/local/etc/bash_completion.d/
fi

# copy bin.
sudo cp $src_bin/* "$dst_bin"

if [ ! -d "$dst_completion" ] ; then
    mkdir -p "$dst_completion"
fi

# copy bash-completion.
sudo cp $src_completion/* "$dst_completion"

echo "git-gerrit install success."
