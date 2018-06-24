#!/bin/bash

# Toggles kecomp.py on/off.

pid=`pgrep -xa "python" | grep "kecomp.py" | cut -d " " -f 1`

if [ -z "$pid" ]; then
    kecomp.py &
    echo "kecomp.py toggled ON"
else
    kill $pid
    echo "kecomp.py toggled OFF"
fi
