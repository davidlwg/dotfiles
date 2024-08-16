#!/bin/bash

cp -r ~/.config/nvim ./config 
cp -r ~/.config/kitty ./config
cp -r ~/.config/yabai./config
cp -r ~/.config/skhd ./config
cp -r ~/.config/borders ./config
cp -r ~/.zshrc .

git add .
git commit -m "Backup on $(date)"

git push
echo "Pushed to GitHub successfully".

