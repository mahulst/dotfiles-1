#!/bin/bash

## Install Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Upgrade any already-installed formulae
brew upgrade --all

# Packages to install
apps=(
  coreutils                                     # utils
  curl                                          # utils
  fasd                                          # utils  (navigate directories fast, like autojump, z)
  fzf                                           # utils  (terminal fuzzy finder)
  git                                           # utils
  koekeishiya/formulae/khd                      # utils  (hotkey daemon)
  koekeishiya/formulae/kwm                      # utils  (window manager)
  neovim/neovim/neovim                          # editor
  pyenv                                         # python (used in neovim)
  pyenv-virtualenv                              # python (used in neovim)
  rbevn                                         # ruby   (used in neovim, and osx cocoapods)
  reattach-to-user-namespace                    # tmux   (copy-paste fix)
  ripgrep                                       # utils  (search fast)
  zsh                                           # shell
  wget                                          # utils
  wifi-password                                 # utils  (show the wifi-password in terminal)
  yarn                                          # js     (package manager)
)

reactnative=(
  android-sdk                                   # android/java
  ant                                           # java (build tool)
  gradle                                        # java (build tool)
  jenv                                          # java (verion manager)
  maven                                         # java (package manager)
  watchman                                      # js   (react-native dependency)
)

haskell=(
  haskell-stack                                 # haskell
)

fun=(
  ffmpeg                                        # utils (make videos)
  gifsicle                                      # utils (make gifs)
)

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap homebrew/services

# Make sure we’re using the latest Homebrew
brew update

# Install packages
brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

# Start kwm and khd by default
brew services start kwm
brew services start khd
