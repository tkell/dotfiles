# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
setopt prompt_subst
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

# pyenv fun
get_pyenv () {
  IFS=$'\n'
  version_array=($(pyenv version))
  IFS=$' \t\n' # reset the IFS!
  version=$version_array[1] # zsh arrays are indexed from 1 
  if [[ "$#version_array" =~ 1 ]]; then
	  more_than_one_version=""
  else
	  more_than_one_version="*"
  fi

  python_version=`echo $version | cut -d' ' -f1`
  python_location=`echo $version | cut -d' ' -f4`
  if [[ "$python_location" =~ "/Users/thor/.pyenv/version" ]]; then
	  python_mode="global"
  else
	  python_mode="local"
  fi
  echo "$python_version ($python_mode)$more_than_one_version"
}
pyenv_prompt='%{$fg[green]%}$(get_pyenv)%{$reset_color%}'

get_offset () {
  local zero='%([BSUbfksu]|([FK]|){*})'
  current_prompt="${user_host} ${current_dir} ${rvm_ruby}"
  current_prompt_length=${#${(S%%)current_prompt//$~zero/}} 
  git_string=$(git_prompt_info)
  git_string_length=${#${(S%%)git_string//$~zero/}} 
  trailing_prompt="${pyenv_prompt}"
  trailing_prompt_length=${#${(S%%)trailing_prompt//$~zero/}} 
  num_spaces=$(($COLUMNS - $current_prompt_length - $git_string_length - 5 - $trailing_prompt_length))
  printf -- ' %.0s' $(seq $num_spaces); echo ""
}
offset='$(get_offset)'

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch} ${offset} ${pyenv_prompt}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

