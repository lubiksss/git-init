#!/bin/bash

MAIN="git-init-main"
GITHOOK=".git/hooks"
PRHOOK=".github"

mkdir -p $GITHOOK
mkdir -p $PRHOOK

[ ! -e "./READMD.md" ] && mv $MAIN/README.md "./README.md"
[ ! -e "./$GITHOOK/commit-msg" ] && mv $MAIN/commit-msg "./$GITHOOK/commit-msg"
[ ! -e "./$PRHOOK/pull_request_template.md" ] && mv $MAIN/pull_request_template.md "./$PRHOOK/pull_request_template.md"

rm -rf $MAIN

echo -e "Enter programming language for .gitignore\nYou can use comma like scala,go\nYou don't need this, just enter"
read LANG

if [ -z "$LANG" ]
then
    echo "No programming language entered. Exiting..."
    exit 1
fi

echo -e "\n" >> .gitignore;
curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore;
echo -e "\n#idea\n.idea" >> .gitignore;

