#!/bin/sh

if [ "$1" = 'bash' ]; then
    /bin/bash
elif [ "$1" = 'test' ]; then
    python test_app.py
else
    python app.py $@
fi