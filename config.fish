if status is-interactive
    # Commands to run in interactive sessions can go here
end

# General aliases
alias ll='ls -la'
alias fishconf='nvim ~/.config/fish/config.fish'
alias fishsrc='source ~/.config/fish/config.fish'

# Git aliases
alias gclone='gh repo clone'

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
    yay -Syyu -y
    eos-update
end

function download -d "Installs package"
    sudo pacman -S $argv
    if test $status = 1
        yay -S $argv
        if test $status = 1
            return "Package not found."
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
