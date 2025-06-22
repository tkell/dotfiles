# Path to your oh-my-zsh installation.
export ZSH=/Users/thor/.oh-my-zsh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
# Remember that I manually added pyenv support
# to the bira themre in ~/.oh-my-zsh/themes/bira

# User configuration
export EDITOR='vim'
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
ssh-add -K ~/.ssh/id_rsa

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias v="vim"
alias a="ack"
alias pye="pylint -E"
alias black="black -S" # Prevent Black from ruining strings

jcat () {
  cat $1 | jq . | less
}

# Fuzzy Search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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

# iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# SCM Breeze
[ -s "/Users/thor/.scm_breeze/scm_breeze.sh" ] && source "/Users/thor/.scm_breeze/scm_breeze.sh"

#ImageMagick@6, for rMagick
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# Add python scripts for AWS cli
export PATH="/Users/thor/Library/Python/3.7/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thor/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thor/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/thor/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thor/google-cloud-sdk/completion.zsh.inc'; fi

# rbenv
eval "$(rbenv init - zsh)"

# avoid rake's [args] syntax clashing with zsh's globs
alias rake='noglob rake'
alias claude="/Users/thor/.claude/local/claude"
