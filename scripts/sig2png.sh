#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Usage: sig2png.sh <PngFile>"
    exit 1
fi

gpg --no-options --with-colons --fixed-list-mode --list-sigs | python "$HOME/lib/sig2dot2/sig2dot/sig2dot.py" -u "[User ID not found]" | dot -Tpng > "$1"
