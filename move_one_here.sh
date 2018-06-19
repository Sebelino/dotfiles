#!/bin/sh

# Move a dotfile to this directory and replace it with a symlink to its new location
# Usage:
# move_one_here.sh <dotfile>

source_path=$(readlink -f "$1")

this_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

destination_path="$this_directory/$( basename "$source_path" )"

set -x

cp "$source_path" "$this_directory" \
&& rm "$source_path" \
&& ln -s "$destination_path" "$source_path"

