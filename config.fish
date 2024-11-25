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
