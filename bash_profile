#Mac Specific commands
#Enable color in ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#Show all hidden files in finder


#Univeral use aliases
alias brc='vim .bash_profile'
alias l='pwd&&ls -la'
alias s='ls&&pwd'
alias ga='git add *'
alias gp='git push origin master'
alias b='cd ..'
alias bb='cd ..&&cd ..&&pwd'
alias src='source .bash_profile'
alias resize='/opt/ImageMagick/bin/convert'
alias b='cd ..&&pwd'
alias bs='b&&s'
alias raw='cd assets/images/game/raw&&s'

#Game Dev aliases
alias audio='audiosprite -g 0 -o audio -e "ogg,m4a,wav" *.ogg'
alias audioWAV='audiosprite -g 0 -o audio -e "ogg,m4a,wav" *.wav'
alias work='cd /Users/benc/git/phaser_sandbox-benc1/Napoleon\ Bone\ Apart&&s'
alias src='source .bash_profile'
alias wrk='cd /Users/benc/phaser/new\ games'
alias halp='vim phaser/Useful\ commands' 

#adds commits and pushes first parameter as commit message
function cm() {
ga&&git commit -m "$1"&&gp
}

#Eliminates all files that start with a given parameter
function rWord(){
for filename in ./*; do mv "./$filename" "./$(echo $filename | sed -e 's/"$1"//g')";  done
}
#this adds my script directory to the path
export PATH=/etc/paths.d/:$PATH

##
# Your previous /Users/benc/.bash_profile file was backed up as /Users/benc/.bash_profile.macports-saved_2016-06-14_at_08:29:23
##

# MacPorts Installer addition on 2016-06-14_at_08:29:23: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

