#!/usr/bin/zsh

#*********Script Info**********************************************
#Developed by Dhanush M
#Usage : Cleans the "Arch" System by removing the cache and orphans
#Date : Jun 19th, 2020
#Github-link : "https://github.com/Dhanush-arch"
#******************************************************************

#cleans the pacman cache of non-installed apps
echo "\n---Cleaning Pacman Cache 1st Process---\n"
sudo pacman -Sc

echo "\n---Cleaning Pacman Cache 2nd Process---\n"
#cleans the pacman cache of installed apps
sudo pacman -Scc

echo "\n---Removing The Orphans---\n"
#removes the unused packages(orphans)
sudo pacman -Rns $(pacman -Qtdq)

echo "\n---Cleaning \"Home\" Directory Cache---\n"
#cleans the home directory cache
rm -rf ~/.cache/*

echo "\n---Cleaning Systemd Journals---\n"
#cleans Systemd journals of size >= 1MB
sudo journalctl --vacuum-size=1M
