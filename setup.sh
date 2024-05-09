#!/bin/sh

# 0. Prepare
MAIN="git-init-main"
GITHOOK=".git/hooks"
PRHOOK=".github"

if [ ! -d .git ]; then
    echo "No .git directory found in the current directory."
    exit 1
else
    mkdir -p "$GITHOOK" "$PRHOOK"
fi

# 1. Set gitmessage
if [ ! -e ~/.gitmessage.txt ]; then
    mv "$MAIN/.gitmessage.txt" ~/.gitmessage.txt
    echo -e "\033[0;32mMake ~/.gitmessage.txt\033[0m"
    git config commit.template ~/.gitmessage.txt
    echo "Template is applied to this project"
else
    read -p "~/.gitmessage.txt file already exists. Do you want to change it? (y/n): " choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/.gitmessage.txt" ~/.gitmessage.txt
        echo -e "\033[0;32mMake ~/.gitmessage.txt\033[0m"
        git config commit.template ~/.gitmessage.txt
        echo "Template is applied to this project"
    else
        echo "No changes made"
    fi
fi

# 2. Set commit-msg
if [ ! -e "$GITHOOK/commit-msg" ]; then
    mv "$MAIN/commit-msg" "$GITHOOK/commit-msg"
    echo -e "\033[0;32mMake .git/hooks/commit-msg\033[0m"
else
    read -p "Do you want to create commit-msg hook? (y/n): " choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/commit-msg" "$GITHOOK/commit-msg"
        echo -e "\033[0;32mMake .git/hooks/commit-msg\033[0m"
    else
        echo "No changes made"
    fi
fi

# 3. Set README.md
if [ ! -e "./README.md" ]; then
    mv "$MAIN/README.md" "./README.md"
    echo -e "\033[0;32mMake ./README.md\033[0m"
else
    read -p "Do you want to create README.md? (y/n): " choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/README.md" "./README.md"
        echo -e "\033[0;32mMake ./README.md\033[0m"
    else
        echo "No changes made"
    fi
fi

# 4. Set pull_request_template.md
if [ ! -e "$PRHOOK/pull_request_template.md" ]; then
    mv "$MAIN/pull_request_template.md" "$PRHOOK/pull_request_template.md"
    echo -e "\033[0;32mMake .github/pull_request_template.md\033[0m"
else
    read -p "Do you want to create pull_request_template.md? (y/n): " choice
    if [ "$choice" = "y" ]; then
        mv "$MAIN/pull_request_template.md" "$PRHOOK/pull_request_template.md"
        echo -e "\033[0;32mMake .github/pull_request_template.md\033[0m"
    else
        echo "No changes made"
    fi
fi

# 5. Set .gitignore
if [ ! -e "./.gitignore" ]; then
        read -p "Enter programming language for .gitignore\nYou can use ',' ex) scala,go\nIf you don't need this, just enter" LANG

        if [ -z "$LANG" ]; then
            echo -e "\033[0;31mDon't make .gitignore\033[0m"
        else
            echo -e "\n" >> .gitignore && curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore && echo -e "\n#idea\n.idea" >> .gitignore && echo -e "\033[0;32mMake .gitignore\033[0m"
        fi
else
    read -p "Do you want to create .gitignore? (y/n): " choice_gitignore
    if [ "$choice_gitignore" = "y" ]; then
        read -p "Enter programming language for .gitignore\nYou can use ',' ex) scala,go\nIf you don't need this, just enter" LANG

        if [ -z "$LANG" ]; then
            echo -e "\033[0;31mDon't make .gitignore\033[0m"
        else
            echo -e "\n" >> .gitignore && curl https://www.toptal.com/developers/gitignore/api/macos,intellij,$LANG >> .gitignore && echo -e "\n#idea\n.idea" >> .gitignore && echo -e "\033[0;32mMake .gitignore\033[0m"
        fi
    else
        echo "No changes made"
    fi
fi

#6. Clean up
rm -rf "$MAIN"

