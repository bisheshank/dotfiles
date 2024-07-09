#!bin/sh

## This file contains all of the aliases

## List
alias ll='ls -al'

## Git aliases
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gpull='git pull'
alias gpush='git push'
alias gs='git status'
alias glt='git log --all --decorate --oneline --graph'
alias gpushsub='git push --recurse-submodules=on-demand'

## Up alias
alias up='cd ..'

# Function to create 'cd ..' aliases
generate_up_aliases() {
  local home_depth=$(echo "$HOME" | tr -cd '/' | wc -c)
  local current_depth=$(pwd | tr -cd '/' | wc -c)
  local max_depth=$((current_depth - home_depth))
  local alias_name=""
  local path=".."

  for ((i = 1; i <= max_depth; i++)); do
    alias_name+="."
    alias "$alias_name"="cd $path"
    path+="/.."
  done
}

# Generate aliases
generate_up_aliases


## Colorized cat related
alias cat="bat --paging=never -pp --theme=TwoDark $*"
alias search='nvim $(fzf -m --preview="cat {}")'

## vim to nvim
alias vim='nvim'

## Make director and cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

