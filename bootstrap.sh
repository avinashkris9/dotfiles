#!/usr/bin/env bash


readonly VSCODE_EXTENSIONS_FILE="vscode-extensions.txt"
readonly INSTALL_VSCODE_EXTS=false




BASEDIR=$(dirname "$0")
printf "\r\033[2K \033[00;32m Setting Up\033[0m \n"

info () {
  printf "\r  [\033[00;36m Step\033[0m] $1\n"
}

start="$(date +%s)"

# ln -sv "~/.dotfiles/runcom/.bash_profile" ~
# Update Prompt to show Kubernetes Cluster . Thanks to @jonmosco

if ! [[ -f "kube-ps1.sh" ]]; then
    sh -c "curl https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh" >kube-ps1.sh
    
fi

info "Copying Git Config"
cp -pr $BASEDIR/.gitconfig ~/.gitconfig
info "Copying Git Ignore"
cp -pr $BASEDIR/.gitignore ~/.gitignore
info "Copying vimrc"
cp -pr $BASEDIR/.vimrc ~/.vimrc

if [ "$INSTALL_VSCODE_EXTS" = true ] ; then
  info "Install VSCode Extensions"
  cat $BASEDIR/$VSCODE_EXTENSIONS_FILE | while read extension || [[ -n $extension ]];
do
  code --install-extension $extension --force
done
fi

