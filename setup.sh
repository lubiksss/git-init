#!/bin/bash

MAIN="git-init-main"
GITHOOK=".git/hooks"
PRHOOK=".github"

mkdir -p $GITHOOK
mkdir -p $PRHOOK

[ ! -e "./READMD.md" ] && mv $MAIN/README.md "./README.md"
[ ! -e "./$GITHOOK/commit-msg" ] && mv $MAIN/commit-msg "./$GITHOOK/commit-msg"
[ ! -e "./$PRHOOK/pull_request_template.md" ] && mv $MAIN/pull_request_template.md "./$PRHOOK/pull_request_template.md"

echo "Enter programming language for .gitignore, Use ',': "
read LANG

echo -e "\n" >> .gitignore;
curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore;
echo -e "\n#idea\n.idea" >> .gitignore;

rm -rf $MAIN
