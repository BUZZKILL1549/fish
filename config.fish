if status is-interactive
    # Commands to run in interactive sessions can go here
end

# sources
#source ~/.asdf/asdf.fish
#set -gx PATH $PATH ~/Documents/Projects/flutter/dev/flutter/bin
#pyenv init - fish | source

# startup shit
# removes the welcome message
set fish_greeting
clear && myfetch -c 8 -C " █"
starship init fish | source

# general aliases
alias ls='eza --icons'
alias ll='eza -l -F -a --icons'
alias ltree='eza -l -T --icons'
alias ff='fastfetch'
alias fish-conf='nvim ~/.config/fish/config.fish'
alias fish-src='source ~/.config/fish/config.fish'
alias hypredit='nvim ~/.config/hypr/hyprland.conf'
alias wayedit='nvim ~/.config/waybar/config.json'
alias untar='tar -xf'
alias pipes='pipes-rs -b true -r 1.0 -k heavy -p 20 -i true -t 0.3'

# git aliases
alias add='git add .'
alias commit='git commit -am'
alias push='git push'
alias pull='git pull'
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

function runcpp -a ofile ifile -d "Compiles C++"
    g++ -o $ofile $ifile
    ./$ofile
end

function aconda -d "Activates conda environment"
    eval "$(/home/buzzkill/anaconda3/bin/conda shell.fish hook)"
    conda activate $argv
end

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

# This does the automatic virtualenv initialization
# only issue is, it needs the pyenv-virtualenv thing installed
# but it seems pretty cool for version management so yee
#status --is-interactive; and pyenv virtualenv-init - | source

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

# Created by `pipx` on 2025-03-09 18:15:41
set PATH $PATH /home/buzzkill/.local/bin
