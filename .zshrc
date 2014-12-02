# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/steffen/.zshrc'

autoload -U compinit promptinit colors
compinit
promptinit
colors

# End of lines added by compinstall
 
PROMPT="%{$fg_bold[blue]%}%~
%{$fg_bold[green]%}>: %{$reset_color%}"
