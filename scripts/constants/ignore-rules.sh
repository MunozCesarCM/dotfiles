#!/bin/sh

IGNORE_RULES=(
    -E .cache
    -E .vim
    -E .pki
    -E .npm
    -E .local
    -E .DS_Store
    -E '**/node_modules/'
    -E '**/.git/'
    -E Library
)

