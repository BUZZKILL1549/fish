if status is-interactive
    # Commands to run in interactive sessions can go here
end

# sources
#source ~/.asdf/asdf.fish
set -gx PATH $PATH ~/flutterdev/flutter/bin

# removes the welcome message
set fish_greeting

starship init fish | source

# fixes the sudo issue with nix-env
alias sudo='sudo --preserve-env=PATH env'

# general aliases
alias ls='eza --icons'
alias ll='eza --icons -l -a'
alias ff='fastfetch'
alias fish-conf='nvim ~/.config/fish/config.fish'
alias fish-src='source ~/.config/fish/config.fish'
alias untar='tar -xf'

# git aliases
alias add='git add .'
alias commit='git commit -am'
alias push='git push'
alias stag='git status'
alias glog='git log'

# programming aliases
alias runp='python'
alias crenv='python -m venv .venv'
alias srcenv='source .venv/bin/activate.fish'
alias runcr='cargo run'
alias runr='ruby'

function runc -a ofile ifile -d "Compiles C"
    gcc -o $ofile $ifile
end

#function aconda -d "Activates conda environment"
#    eval "$(/home/buzzkill/anaconda3/bin/conda shell.fish hook)"
#    conda activate $argv
#end

function cd -d "Changes directory" 
  if test (count $argv) -eq 1 && string match -qr '^[0-9]+$' $argv[1]
    set -l num $argv[1]
    for i in (seq $num)
      builtin cd ..
    end
  else
    builtin cd $argv
  end
end

#function cd -d "Changes directory with automatic env activation" --wraps=cd
#builtin cd $argv

#if not set -q VIRTUAL_ENV
#if test -d ./.venv/
#source ./.venv/bin/activate.fish
#end
#else
#set parentdir (dirname $VIRTUAL_ENV)
#if not string match -q "$parentdir" "$PWD"/*
#deactivate
#end
#end
#end

# functions
function update -d "Updates system"
    nix-env -u
end

function dupdate -d "Updates system debian packages"
    sudo apt update
end

function dupgrade -d "Upgrades system debian packages"
    sudo apt upgrade
end

function search -a package -d "Search debian packages"
    apt search $package
end

function download -a package -d "Installs package"
    nix-env -iA nixpkgs.$package
end

function delete -a package -d "Deletes package"
    nix-env -e $package
end
