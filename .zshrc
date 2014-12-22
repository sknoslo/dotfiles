HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v

precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="(CMD)"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

zstyle :compinstall filename '/home/steffen/.zshrc'

export EDITOR=vim

autoload -U compinit promptinit colors
compinit
promptinit
colors
 
PROMPT="%{$fg_bold[blue]%}%~
%{$fg_bold[green]%}>: %{$reset_color%}"
