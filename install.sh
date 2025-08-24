#!/bin/sh

curl -sS https://starship.rs/install.sh | sh

git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/key
git config --global commit.gpgsign true

echo $GIT_SIGNING_KEY > ~/.ssh/key

mkdir ~/.ssh
cp ./ssh-config.txt ~/.ssh/config