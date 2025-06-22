# As of June 2025, this repo is using the --bare git repo magic, 
# from e.g. https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html


# Path to your oh-my-zsh installation.
export ZSH=/Users/thor/.oh-my-zsh
ZSH_THEME="bira-tk"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# uv
source $HOME/.local/bin/env

# User configuration, with magic dotfiles
export EDITOR='vim'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

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
