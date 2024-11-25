if status is-interactive
    # Commands to run in interactive sessions can go here
end

# general aliases
alias ll='ls -la'
alias fish-conf='nvim ~/.config/fish/config.fish'
alias fish-src='source ~/.config/fish/config.fish'

# git aliases
alias add='git add .'
alias commit='git commit -am '
alias push='git push'

# programming aliases
alias runp='python'
alias runc='cargo run'

# functions
function update -d "Updates system"
  sudo pacman -Syyu
end

function download -a package -d "Installs package"
	sudo pacman -S $package
  if test $status = 1
	  yay -S $package
    if test $status = 1
      return "Package not found."
    end
  end
end

function delete -d "Deletes package"
  sudo pacman -R $argv
end

function search -d "Searches for package"
  pacman -Ss $argv
end
