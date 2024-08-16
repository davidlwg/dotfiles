#!/bin/bash

git pull

cp -r ~/.config/nvim ./config 
cp -r ~/.config/kitty ./config
cp -r ~/.zshrc .

git add .
git commit -m "Backup on $(date)"

git push
echo "Pushed to GitHub successfully".

