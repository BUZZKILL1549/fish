if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Aliases
alias ll='ls -alF'
alias sql='mysql -u root -p'
alias fish-conf='nvim ~/.config/fish/config.fish'
alias fish-src='source ~/.config/fish/config.fish'

# Functions
function update
    sudo apt-get update -y
    sudo apt-get upgrade -y
    flatpak update 
    flatpak upgrade 
end

function install
    read -P 'APT or Flatpak (A / F): ' repo
    if test "$repo" = "A"
        read -P 'Which package: ' package
        sudo apt install $package
    else if test "$repo" = "F"
        read -P 'Which package: ' package
        flatpak install $package
    end
end

function search
    read -P 'Which package: ' package
    echo 'Searching APT repositories: '
    apt search $package
    echo 'Searching Flatpak repositories: '
    flatpak search $package
end

function remove
    read -P 'APT or Flatpak (A / F): ' repo
    if test "$repo" = "A"
        read -P 'Which package: ' package
        sudo apt remove $package
        sudo apt autoremove
    else if test "$repo" = "F"
        read -P 'Which package: ' package
        flatpak remove $package
    end
end
