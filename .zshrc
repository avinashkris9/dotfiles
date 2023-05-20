# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES
source $ZSH/oh-my-zsh.sh

source $DOTFILES/kube-ps1.sh
source $DOTFILES/.exports

# # Load the shell dotfiles, and then some:
# # * ~/.path can be used to extend `$PATH`.
# # * ~/.extra can be used for other settings you don’t want to commit.
# for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
# 	[ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;
PROMPT='$(kube_ps1)'$PROMPT