# Path to your oh-my-zsh installation.
export ZSH=/Users/thor/.oh-my-zsh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira-tk"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Remember that I manually added pyenv support
# to the bira themre in ~/.oh-my-zsh/themes/bira

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# User configuration
export EDITOR='vim'
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Fuzzy Search
source <(fzf --zsh)

# SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# rbenv
eval "$(rbenv init - zsh)"
# avoid rake's [args] syntax clashing with zsh's globs
alias rake='noglob rake'
alias claude="/Users/thor/.claude/local/claude"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# For a full list of active aliases, run `alias`.
bindkey '^h' backward-word
bindkey '^n' forward-word
alias v="vim"
alias a="ack"

jcat () {
  cat $1 | jq . | less
}

# music commands
tomp3 () {
  echo "$1 -- $2 -- $3 -- $4"
  echo "${1/wav/mp3}"
  ffmpeg -i "$1" -codec:a libmp3lame -b:a 320k "${1/wav/mp3}"
}

tomp3fromaif () {
  echo "$1 -- $2 -- $3 -- $4"
  echo "${1/aif/mp3}"
  ffmpeg -i "$1" -codec:a libmp3lame -b:a 320k "${1/aif/mp3}"
}

upload_dj_set () {
  echo $1*
  scp $1* tidepool@tidepool:/home/tidepool/www/fractal/sets
}
