#!/bin/sh

dotfile="/tmp/keys_temp.dot"
outfile="/tmp/keys_temp.png"


gpg --no-options --with-colons --fixed-list-mode --list-sigs | python "$HOME/lib/sig2dot2/sig2dot/sig2dot.py" -u "[User ID not found]" > "$dotfile"

dot -Tpng > "$1"

sig2png.sh "$outfile"

feh "$outfile"

#rm "$dotfile"
#rm "$outfile"
