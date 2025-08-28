#!/bin/bash
echo "Cleaning system..."
sudo apt update 
sudo apt upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y
sudo apt clean -y
rm -rf ~/.cache/thumbnails/*
sudo snap refresh
echo "System cleanup complete ✅"
