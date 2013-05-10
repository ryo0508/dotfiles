# Load RVM into a shell session *as a function*
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/local/bin:/usr/local/bin
PATH=$PATH:$HOME/resources/android_sdk/tools
PATH=$PATH:$HOME/android-sdks/platform-tools
PATH=$PATH:$HOME/.rbenv/shims
PATH=$PATH:/usr/local/share/npm/bin/
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/Cellar/

export FPATH=$FPATH:/usr/local/share/zsh/site-functions

#eval "$(rbenv init -)"

export EDITOR="$HOME/local/bin/vim"

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac


## Default shell configuration
#
# set prompt
#
# autoload colors
# ${fg[...]} や $reset_color をロード
autoload -U colors && colors

function rprompt-git-current-branch {
        local name st color

        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        if [[ -z $name ]]; then
                return
        fi
        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=${fg[green]}
        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
                color=${fg[yellow]}
        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=${fg_bold[red]}
        else
                color=${fg[red]}
        fi

        # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
        # これをしないと右プロンプトの位置がずれる
        echo "%{$color%}$name%{$reset_color%} "
}
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
RPROMPT='[`rprompt-git-current-branch`%~]'

colors
PROMPT="%{${fg[white]}%}%W %* %{${reset_color}%}%{${fg[green]}%}%2d %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[green]}%}%n@%m:{%${reset_color}%}[`rprompt-git-current-branch`%~]"

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -v

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
# bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

## terminal configuration
export LSCOLORS=bxfxcxdxbxegedabagacad
export LS_COLORS='di=41:ln=35:so=32:pi=33:ex=31:bd=46;31:cd=43;31:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=41' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;31'

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

brake() { ./bin/rake $1 }
brails() { ./bin/rails $1 }

# ================================================================
# Alias
# ================================================================
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -la"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias monit="ssh docci_monit01"

# ================================================================
# tmux alias
# ================================================================
tmux-att() { tmux attach-session -t $1 }

# Mailtrapのログを文字コード変換して
alias mailtrap_log="tail -F /var/tmp/mailtrap.log | perl -MEncode -pe '\$_ = encode(\"utf-8\", decode(\"iso-2022-jp\", \$_))"

# ================================================================
# Finderでのファイルの表示・非表示トグル 
# ================================================================
toggle_hidden_files() {
  is_showing=`defaults read com.apple.finder AppleShowAllFiles`

  if [ ${is_showing} = TRUE ]
  then
    defaults write com.apple.finder AppleShowAllFiles FALSE;
  else
    defaults write com.apple.finder AppleShowAllFiles TRUE;
  fi

  echo AppleShowAllFiles has been set to: `defaults read com.apple.finder AppleShowAllFiles`

  echo restarting Finder
  sudo killall Finder
}
