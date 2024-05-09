#!/bin/sh

# 0. Prepare
MAIN="git-init-main"
GITHOOK=".git/hooks"
PRHOOK=".github"

if [ ! -d .git ]; then
    echo "\033[0;31mPlease 'git init' before setup\033[0m"
    rm -rf "$MAIN"
    exit 1
else
    mkdir -p "$GITHOOK" "$PRHOOK"
fi

# 1. Set gitmessage
if [ ! -e ~/.gitmessage.txt ]; then
    mv "$MAIN/.gitmessage.txt" ~/.gitmessage.txt
    git config commit.template ~/.gitmessage.txt
    echo "\033[0;32mMake ~/.gitmessage.txt and applied to this project\033[0m"
else
    printf "\033[0;31m~/.gitmessage.txt already exists. Do you want to change? (y/n): \033[0m"
	read choice
    if [ "$choice" = "y" ]; then
    mv "$MAIN/.gitmessage.txt" ~/.gitmessage.txt
    git config commit.template ~/.gitmessage.txt
    echo "\033[0;32mMake ~/.gitmessage.txt. and applied to this project\033[0m"
    else
        echo "\033[0;32mNo changes made\033[0m"
    fi
fi

# 2. Set commit-msg
if [ ! -e "$GITHOOK/commit-msg" ]; then
    mv "$MAIN/commit-msg" "$GITHOOK/commit-msg"
    echo "\033[0;32mMake .git/hooks/commit-msg\033[0m"
else
    printf "\033[0;31m$GITHOOK/commig-msg already exists. Do you want to change? (y/n): \033[0m"
	read choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/commit-msg" "$GITHOOK/commit-msg"
        echo "\033[0;32mMake .git/hooks/commit-msg\033[0m"
    else
        echo "\033[0;32mNo changes made\033[0m"
    fi
fi

# 3. Set pull_request_template.md
if [ ! -e "$PRHOOK/pull_request_template.md" ]; then
    mv "$MAIN/pull_request_template.md" "$PRHOOK/pull_request_template.md"
    echo "\033[0;32mMake .github/pull_request_template.md\033[0m"
else
    printf "\033[0;31m$PRHOOK/pull_request_template.md already exists. Do you want to change? (y/n): \033[0m"
	read choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/pull_request_template.md" "$PRHOOK/pull_request_template.md"
        echo "\033[0;32mMake .github/pull_request_template.md\033[0m"
    else
        echo "\033[0;32mNo changes made\033[0m"
    fi
fi

# 4. Set README.md
if [ ! -e "./README.md" ]; then
    mv "$MAIN/README.md" "./README.md"
    echo "\033[0;32mMake ./README.md\033[0m"
else
    printf "\033[0;31m./READMD.md already exists. Do you want to change? (y/n): \033[0m"
	read choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/README.md" "./README.md"
        echo "\033[0;32mMake ./README.md\033[0m"
    else
        echo "\033[0;32mNo changes made\033[0m"
    fi
fi

# 5. Set .gitignore
if [ ! -e "./.gitignore" ]; then
		printf "\033[0;31mEnter programming language for .gitignore. (scala,go,gradle): \033[0m"
		read LANG
        if [ -z "$LANG" ]; then
            echo "\033[0;31mDon't make .gitignore\033[0m"
        else
            echo "\n" >> .gitignore && curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore && echo "\n#idea\n.idea" >> .gitignore && echo "\033[0;32mMake .gitignore\033[0m"
        fi
else
    printf "\033[0;31m./gitignore already exists. Do you want to update? (y/n): \033[0m"
	read choice
    if [ "$choice" = "y" ]; then
		printf "\033[0;31mEnter programming language for .gitignore. (scala,go,gradle): \033[0m"
		read LANG
        if [ -z "$LANG" ]; then
            echo "\033[0;31mDon't make .gitignore\033[0m"
        else
            echo "\n" >> .gitignore && curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore && echo "\n#idea\n.idea" >> .gitignore && echo "\033[0;32mUpdate .gitignore\033[0m"
        fi
    else
        echo "\033[0;32mNo changes made\033[0m"
    fi
fi

#6. Clean up
rm -rf "$MAIN"

