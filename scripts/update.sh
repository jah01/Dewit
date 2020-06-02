#!/bin/bash

if [ -d .git ]
then
  read -p "Enter the commit message: "  message
  read -p "Would you like to commit and push all changes with the following message: $(tput bold)${message}$(tput sgr0) (y/n)? "  confirm
  if [ "$confirm" = "y" ]; then
    git add .
    git commit -m "$message"
    git push
    echo "$(tput bold)Staged, committed, and pushed changes!$(tput sgr0)"
  else
    echo "$(tput bold)Process terminated.$(tput sgr0)"
  fi
else
  echo "$(tput bold)You must run this script from a Git repository directory!$(tput sgr0)"
fi