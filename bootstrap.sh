#!/usr/bin/env bash

readonly VSCODE_EXTENSIONS_FILE="vscode-extensions.txt"
readonly INSTALL_VSCODE_EXTS=false

DOTFILES=$(dirname "$(realpath -s "$0")")

log() {
  printf "\r  [\033[00;36m Step\033[0m] $1\n"
}

# ln -sv "~/.dotfiles/runcom/.bash_profile" ~
# Update Prompt to show Kubernetes Cluster . Thanks to @jonmosco

# if ! [[ -f "kube-ps1.sh" ]]; then
#     sh -c "curl https://raw.githubusercontent.com/jonmosco/kube-ps1/master/kube-ps1.sh" >kube-ps1.sh

# fi

if [ "$INSTALL_VSCODE_EXTS" = true ]; then
  log "Install VSCode Extensions"
  cat "${DOTFILES}/${VSCODE_EXTENSIONS_FILE}" | while read -r extension || [[ -n $extension ]]; do
    code --install-extension "${extension}" --force
  done
fi

ln -svf "${DOTFILES}"/.vimrc ~/.vimrc
ln -svf "${DOTFILES}"/.editorconfig ~/.editorconfig
ln -svf "${DOTFILES}"/.gitconfig ~/.gitconfig
ln -svf "${DOTFILES}"/.gitignore ~/.gitignore
ln -svf "${DOTFILES}"/.profile ~/.profile
ln -svf "${DOTFILES}"/.zprofile ~/.zprofile
ln -svf "${DOTFILES}"/.bash_profle ~/.bash_profle
