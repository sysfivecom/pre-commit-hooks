#!/bin/bash
#
# Pre-commit hook to avoid accidentally adding unencrypted files with [git-crypt](https://www.agwa.name/projects/git-crypt/)
# Fix to [Issue #45](https://github.com/AGWA/git-crypt/issues/45)
#
# Usage: 
#    $> cd /path/to/repository
#    $> git-crypt init
#    $> curl <url/to/this/raw/gist> -o .git/hooks/pre-commit
#    $> chmod +x .git/hooks/pre-commit
#

if [ -d .git-crypt ]; then
    git-crypt status &>/dev/null
    if [[ $? -ne 0  ]]; then
        git-crypt status -e
        exit 1
    fi
fi