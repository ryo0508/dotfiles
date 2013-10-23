## Default shell configuration
#
# set prompt
#
# autoload colors
# ${fg[...]} や $reset_color をロード
autoload -U colors && colors

# ----------------------------------------------------------------------
# Gitレポジトリ内でのGitのStatus表示
# ----------------------------------------------------------------------
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

# ----------------------------------------------------------------------
# Shellの表示について
# ----------------------------------------------------------------------
colors
PROMPT="%{${fg[white]}%}%W %* %{${reset_color}%}%{${fg[green]}%}%2d %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
#RPROMPT="%{${fg[green]}%}%n@%m:{%${reset_color}%}[`rprompt-git-current-branch`%~]"

# ----------------------------------------------------------------------
# lsの色
# ----------------------------------------------------------------------
LSCOLORS=Gxfxcxdxbxegedabagacad
CLICOLOR=1

# If a command is not in the hash table, and there exists an executable directory by that name, perform the cd command to that directory.
setopt AUTO_CD

# auto directory pushd that you can get dirs list by cd -[tab]
DIRSTACKSIZE=20
setopt AUTO_PUSHD

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

# ================================================================
# zsh-completions 
# ================================================================
autoload -Uz compinit && compinit
export FPATH=/usr/local/share/zsh/site-functions:$FPATH:
zstyle ':completion:*' menu select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:descriptions' format '%BCompleting%b %U%d%u'

for function in ~/.zsh/functions/*; do
  source $function
done

## zsh editor
autoload zed


## terminal configuration
zstyle ':completion:*' list-colors 'di=41' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;31'

# ================================================================
# Alias
# ================================================================
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# ================================================================
# History configuration
# ================================================================
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


# ================================================================
# Perl Settings
# ================================================================
export PERL_CPANM_OPT="--local-lib=$HOME/.perl-extlib"
export PERL5LIB="$HOME/.perl-extlib/lib/perl5:$PERL5LIB"

. /usr/local/etc/profile.d/z.sh

export PATH=$PATH:/usr/local/share/npm/bin
export NPM_CONFIG_PREFIX=$HOME/.npm
