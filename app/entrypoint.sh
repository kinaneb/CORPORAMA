#!/bin/sh

if [ "$1" = 'bash' ]; then
    /bin/bash
elif [ "$1" = 'test' ]; then
    python3 test_app.py
else
    python3 app.py $@
fi