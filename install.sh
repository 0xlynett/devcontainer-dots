#!/bin/sh

git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/key.pub
git config --global commit.gpgsign true

if [ -n "$GIT_SIGNING_KEY" ]; then
  mkdir -p ~/.ssh
  echo "$GIT_SIGNING_KEY" > ~/.ssh/key
  ssh-keygen -y -f ~/.ssh/key > ~/.ssh/key.pub
  chmod 600 ~/.ssh/key
  chmod 600 ~/.ssh/key.pub
  cp ./ssh-config.txt ~/.ssh/config
else
  echo "Signing key not found, going to continue without"
fi
