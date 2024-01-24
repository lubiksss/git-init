#!/bin/bash

MAIN="git-init-main"
GITHOOK=".git/hooks"
PRHOOK=".github"

mkdir -p $GITHOOK
mkdir -p $PRHOOK

[ ! -e "./READMD.md" ] && mv $MAIN/README.md "./README.md" && echo -e "\033[0;32mMake ./README.md\033[0m"
[ ! -e "./$GITHOOK/commit-msg" ] && mv $MAIN/commit-msg "./$GITHOOK/commit-msg" && echo -e "\033[0;32mMake .git/hooks/commit-msg\033[0m"
[ ! -e "./$PRHOOK/pull_request_template.md" ] && mv $MAIN/pull_request_template.md "./$PRHOOK/pull_request_template.md" && echo -e "\033[0;32mMake .github/pull_request_template.md\033[0m"

rm -rf $MAIN

echo -e "\nEnter programming language for .gitignore\nYou can use ',' ex) scala,go\nIf you don't need this, just enter"
read LANG

if [ -z "$LANG" ]
then
    echo -e "\033[0;31mDon't make .gitignore\033[0m"
    exit 0
fi

echo -e "\n" >> .gitignore && curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore && echo -e "\n#idea\n.idea" >> .gitignore && echo -e "\033[0;32mMake .gitignore\033[0m"
