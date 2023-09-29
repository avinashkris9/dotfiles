#!/usr/bin/env bash

readonly VSCODE_EXTENSIONS_FILE="vscode-extensions.txt"
readonly INSTALL_VSCODE_EXTS=false

SCRIPT=$(realpath "$0") #Expecting coreutils
BASEDIR=$(dirname "$SCRIPT")


printf "\r\033[2K \033[00;32m Setting Up\033[0m \n"

info() {
  printf "\r  [\033[00;36m Step\033[0m] $1\n"
}

start="$(date +%s)"

# ln -sv "~/.dotfiles/runcom/.bash_profile" ~
# Update Prompt to show Kubernetes Cluster . Thanks to @jonmosco

if ! [[ -f "kube-ps1.sh" ]]; then
  sh -c "curl https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh" >kube-ps1.sh

fi

info "Copying Git Config"




if [ "$INSTALL_VSCODE_EXTS" = true ]; then
  info "Install VSCode Extensions"
  cat $BASEDIR/$VSCODE_EXTENSIONS_FILE | while read extension || [[ -n $extension ]]; do
    code --install-extension $extension --force
  done
fi

ln -nfs $BASEDIR/.editorconfig ~/.editorconfig
ln -nfs $BASEDIR/.vimrc ~/.vimrc
ln -nfs $BASEDIR/starship.toml ~/.config/starship.toml
ln -nfs $BASEDIR/.gitignore_global ~/.gitignore
ln -nfs $BASEDIR/.gitconfig ~/.gitconfig
exec zsh
