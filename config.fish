if status is-interactive
    # Commands to run in interactive sessions can go here
end

# General aliases
alias ll='ls -la'
alias fishconf='nvim ~/.config/fish/config.fish'
alias fishsrc='source ~/.config/fish/config.fish'

# Coding aliases
function runp -d "Run python script"
    python $argv
end

function runc -d "Run C script"
    make $argv
    ./$argv
end

# Functions
function update -d "Updates system"
    sudo pacman -Syyu -y
    eos-update
end

function download -a flag package -d "Installs package"
    if test "$flag" = -P || test "$flag" = -p
        sudo pacman -S $package
    else if test "$flag" = -Y || test "$flag" = -y
        yay -S $package
    else
        sudo pacman -S $package
        if test $status = 1
            yay -S $package
            if test $status = 1
                return "Package not found"
            end
        end
    end
end

function delete -d "Uninstalls package"
    sudo pacman -R $argv
end

function search -d "Searches for packages in AUR"
    read -P "PACMAN[P] / YAY[Y]: " repo
    if test "$repo" = P || test "$repo" = p
        pacman -Ss $argv
    else if test "$repo" = Y || test "$repo" = y
        yay -Ss $argv
    end
end

function isearch -d "Searches for packages in system"
    read -P "Package: " package
    pacman -Qs $package
end

# Created by `pipx` on 2024-08-27 15:37:35
set PATH $PATH /home/buzzkill/.local/bin
