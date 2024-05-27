#!/bin/bash

cp -r ~/.config/nvim . 
cp -r ~/.config/kitty .

git add .
git commit -m "Backup on $(date)"

git push
echo "Pushed to GitHub successfully".

