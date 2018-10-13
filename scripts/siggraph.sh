#!/bin/sh

# Deps:
# * graphviz
# * https://github.com/bmhm/sig2dot2

dotfile="/tmp/keys_temp.dot"
outfile="/tmp/keys_temp.png"

set -x

gpg --no-options --with-colons --fixed-list-mode --list-sigs | python "$HOME/lib/sig2dot2/sig2dot/sig2dot.py" -u "[User ID not found]" > "$dotfile"

dot -Tpng "$dotfile" > "$outfile"

feh "$outfile"

#rm "$dotfile"
#rm "$outfile"
