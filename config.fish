if status is-interactive
    # Commands to run in interactive sessions can go here
end

# sources
#source ~/.asdf/asdf.fish
#set -gx PATH $PATH ~/Documents/Projects/flutter/dev/flutter/bin

# removes the welcome message
set fish_greeting

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
    sudo pacman -Syu
end

function download -a package -d "Installs package"
    sudo pacman -S $package
    if test $status = 1
        yay -S $package
        if test $status = 1
            return "Package not found"
        end
    end
end

function delete -a package -d "Deletes package"
    sudo pacman -R $package
end

function autoremove -a package -d "Deletes package and all its dependencies"
    sudo pacman -Rns $package
end

function search -a package -d "Searches for package"
    yay -Ss $package
end

function isearch -a package -d "Searches the system for an installed package"
    yay -Qi $package
end
