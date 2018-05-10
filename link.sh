#!/usr/bin/env bash

pwd=$(/bin/pwd)

# Link .config files
mkdir -p ~/.config
ln -sfnt $HOME/.config $pwd/.config/*

# Link Firefox userChrome
if [[ -d ~/.mozilla ]]; then
  profileFolders=( $(cat ~/.mozilla/firefox/profiles.ini |\
    grep Path |\
    cut -d = -f 2 ))

  for profileFolder in ${profileFolders[@]}; do
    mkdir -p $HOME/.mozilla/firefox/$profileFolder/chrome
    ln -sfnt $HOME/.mozilla/firefox/$profileFolder/chrome/ $pwd/.mozilla/firefox/chrome/* 
  done
fi

# Link files in home folder
homeFiles=( tilde/.* )
for file in ${homeFiles[@]}; do
  if [[ $file == "tilde/.." || $file == "tilde/." ]]; then
    continue
  else
    ln -sfn $pwd/$file $HOME 
  fi
done
