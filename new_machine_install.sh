# Get ghostty by hand!

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# make brew writeable by me, not root
sudo chown -R thor /usr/local/Cellar
sudo chown -R thor /usr/local/Homebrew

# git
brew install git

# vim 
brew install vim

# ack
brew install ack

# fzf
brew install fzf

# uv -- this is new for 2025
curl -LsSf https://astral.sh/uv/install.sh | sh

# ruby, gem, rbenv
brew install ruby
brew install rbenv

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# scm_breeze
git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
sh ~/.scm_breeze/install.sh

# Clone dots into magic bare repo
git init --bare $HOME/.dotfiles.git
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dot remote add origin git@github.com:tkell/dotfiles.git
dot pull origin master

# install vim plugins, hmm

# move theme file and go go go!
cp bira-tk.zsh-theme .oh-my-zsh/themes
source ~.zshrc
