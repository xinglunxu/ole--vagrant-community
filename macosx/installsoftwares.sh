#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew tap caskroom/cask
brew cask install vagrant
brew cask install virtualbox
