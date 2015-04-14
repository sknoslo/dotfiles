alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify prompt_subst
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

if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval C$color[1,1]="%{$terminfo[bold]$fg[${(L)color}]%}"
  eval CL$color[1,1]="%{$fg[${(L)color}]%}"
done
RC="%{$reset_color%}"

GO="%{$CC%}[%{$RC%}"
GC="%{$CC%}]%{$RC%}"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' actionformats "%{$GO%}%{$CW%}%b%{$RC%}%{$GC%}%{$CLR%}%u%{$CLG%}%c%{$RC%}(%a)"
zstyle ':vcs_info:*' formats "%{$GO%}%{$CW%}%b%{$RC%}%{$GC%}%{$CLR%}%u%{$CLG%}%c%{$RC%}"
zstyle ':vcs_info:*' branchformat '%b'
zstyle ':vcs_info:*' unstagedstr '+'
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' check-for-changes true

precmd() { vcs_info }
 
PROMPT='%{$CB%}%(4~,../,)%3~ ${vcs_info_msg_0_}
%{$CG%}>: %{$RC%}'
