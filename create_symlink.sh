#!/bin/sh

this_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -x

ln -s "$this_directory/$1" "$HOME/$1"
