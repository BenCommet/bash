#Univeral use aliases
alias brc='vim .bash_profile'
alias l='ls -la'
alias s='ls'
alias ga='git add *'
alias gp='git push origin master'

#Game Dev aliases
alias audio='audiosprite -g 0 -o audio -e "ogg,m4a,wav" *.ogg'
alias work='cd /Users/benc/git/phaser_sandbox-benc'
alias src='source .bash_profile'
#adds commits and pushes first parameter as commit message
function cm() {
ga;
git commit -m "$1";
gp;
}
#this adds my script directory to the path
export PATH=/Users/benc/scripts:$PATH
