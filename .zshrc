# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES
source $ZSH/oh-my-zsh.sh

# source $DOTFILES/kube-ps1.sh
source $DOTFILES/.exports
eval "$(starship init zsh)"
