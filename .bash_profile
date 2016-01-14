# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"
# MacPorts Installer addition on 2012-09-05_at_09:37:46: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Sencha CMD
export PATH=/Users/jlow/bin/Sencha/Cmd/3.0.0.250:$PATH
# PhantomJS
export PATH=/Users/jlow/bin/phantomjs-1.8.1-macosx/bin:$PATH
# Air SDK
export PATH=$PATH:"/Library/WebServer/adobe air/sdk/2.7/bin"

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH

#Add Z to bash
. ~/code/z/z.sh

# Do I need this?
# export SENCHA_CMD_3_0_0="/Users/jlow/bin/Sencha/Cmd/3.0.0.250"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion