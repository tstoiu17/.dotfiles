#!/bin/bash

MONITOR=$1
ID_STYLUS=$(xinput | grep "Gaomon Tablet Pen Pen" | cut -f 2 | cut -c 4-5)

xinput map-to-output "$ID_STYLUS" "$MONITOR"

exit 0
