if status is-interactive
    # Commands to run in interactive sessions can go here
end

# sources
source ~/.asdf/asdf.fish
set -gx PATH $PATH ~/Documents/Projects/flutter/dev/flutter/bin

# general aliases
alias ll='ls -la'
alias ff='fastfetch'
alias fish-conf='nvim ~/.config/fish/config.fish'
alias fish-src='source ~/.config/fish/config.fish'

# git aliases
alias add='git add .'
alias commit='git commit -am'
alias push='git push'
alias stag='git status'
alias glog='git log'

# programming aliases
alias runp='python'
alias cr-env='python -m venv .venv'
alias src-env='source .venv/bin/activate.fish'
alias runcr='cargo run'
alias runr='ruby'

function runc -a ofile ifile -d "Compiles C"
    gcc -o $ofile $ifile
end

function aconda -d "Activates conda environment"
    eval "$(/home/buzzkill/anaconda3/bin/conda shell.fish hook)"
    conda activate $argv
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
    sudo dnf update -y
end

function upgrade -d "Upgrades system"
    sudo dnf upgrade -y
end

function download -a package -d "Installs package"
    sudo dnf install $package
    if test $status = 1
        return "Package not found."
    end
end

function delete -d "Deletes package"
    sudo dnf remove $argv
end

function search -d "Searches for package"
    dnf search $argv
end

# Created by `pipx` on 2024-12-12 13:24:18
set PATH $PATH /home/buzzkill/.local/bin
set -x PATH /usr/local/cuda-12.6/bin $PATH
