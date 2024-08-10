#!/bin/bash
brew update
brew upgrade
brew autoremove
brew cleanup --prune=all
brew doctor
brew missing
echo macbook is squeaky clean!