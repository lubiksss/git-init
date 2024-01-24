#!/bin/bash

MAIN="git-init-main"
GITHOOK=".git/hooks"
PRHOOK=".github"

mkdir -p $GITHOOK
mkdir -p $PRHOOK

mv $MAIN/README.md ../README.md
mv $MAIN/commit-msg ../$GITHOOK/commit-msg
mv $MAIN/pull_request_template.md ../$PRHOOK/pull_request_template.md

rm -rf MAIN
