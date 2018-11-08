#!/bin/bash
################################################################################
# See <https://gist.github.com/Falkor/848c82daa63710b6c132bb42029b30ef>
# Pre-commit hook to avoid accidentally adding unencrypted files with [git-crypt](https://www.agwa.name/projects/git-crypt/)
# Fix to [Issue #45](https://github.com/AGWA/git-crypt/issues/45)
#
# Usage: 
#    $> cd /path/to/repository
#    $> git-crypt init
#    $> curl <url/to/this/raw/gist> -o .git/hooks/pre-commit
#    $> chmod +x .git/hooks/pre-commit
#
# Otherwise, you might want to add it as a git submodule, using:
#    $> git submodule add https://gist.github.com/848c82daa63710b6c132bb42029b30ef.git config/hooks/pre-commit.git-crypt
#    $> cd .git/hooks
#    $> ln -s ../../config/hooks/pre-commit.git-crypt/pre-commit.git-crypt.sh pre-commit
#

STAGED_FILES=$(git diff --cached --name-status | awk '$1 != "D" { print $2 }' | xargs echo)

if [ -d .git-crypt ]; then
    git-crypt status ${STAGED_FILES} &>/dev/null
    if [[ $? -ne 0  ]]; then
        git-crypt status -e ${STAGED_FILES}
        exit 1
    fi
fi