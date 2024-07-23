#!/bin/sh

DATE=$(date+'%Y-%m-%d_%H-%M-%S')
grim -g "$(slurp)" ~/screenshots/$DATE.png
