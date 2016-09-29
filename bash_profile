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
alias bb='cd ..&&cd ..&&s&&pwd'
alias bbb='cd ..&&cd ..&&cd ..&&pwd'
alias src='source .bash_profile'
alias resize='/opt/ImageMagick/bin/convert'
alias b='cd ..&&pwd'
alias bs='b&&s'
alias raw='cd assets/images/game/raw&&s'
function cl(){
cd $1&&s
}

alias temp='for filename in ./*; do mv "./$filename" "./$(echo $filename | sed -e 's/ //g')";  done'

#Game Dev aliases
alias audio='audiosprite -g 0 -o audio -e "ogg,m4a,wav" *.ogg'
alias pageAudio='audiosprite -g 0 -o pageAudio -e "ogg,m4a,wav" *&&pageBack'
alias audioWAV='audiosprite -g 0 -o audio -e "ogg,m4a,wav" *.wav'
alias audioBG='audiosprite -g 0 -o bg_audio -e "ogg,m4a,wav" '
alias pageBack='mv pageAudio.json ..&&mv pageAudio.ogg ..&&mv pageAudio.m4a ..&&mv pageAudio.wav ..'
alias gg='cd /Users/benc/git/schoolzone/phaser/public_html/assets/phaser&&s'
alias work='cd /Users/benc/git/phaser_sandbox-benc1&&s'
alias src='source .bash_profile'
alias wrk='cd /Users/benc/git/phaser_sandbox-benc&&s'
alias halp='vim phaser/Useful\ commands' 
alias loader='rm index.html&&rm style.css&&rm sz.js&&cp /Users/benc/git/phaser_sandbox-benc1/Master\ Game\ Template/index.html .&&cp /Users/benc/git/phaser_sandbox-benc1/Master\ Game\ Template/style.css .&&cp /Users/benc/git/phaser_sandbox-benc1/Master\ Game\ Template/sz.js .'
alias fixit='touch index.html&&touch sz.js&&touch style.css'

#School Zone Specific
alias ot='cd /Users/benc/git/schoolzone/phaser/public_html/assets/on-track&&s'
alias gamePass='/Users/benc/scripts/gamePass.py'
alias cdn='/Users/benc/scripts/cdnFix.py'
alias newPass='/Users/benc/scripts/convertNewGames.py'
alias date='mv 1.0.1 2016-08-26_1.0.1'

function ma() {
cd main-assets&&cd 1.0.0
} 
#adds commits and pushes first parameter as commit message
function cm() {
ga&&git commit -m "$1"&&git pull origin master&&gp
}

#Eliminates all files that start with a given parameter
function rWord(){
for filename in ./*; do mv "./$filename" "./$(echo $filename | sed -e 's/'$1'//g')";  done
}
#this adds my script directory to the path
export PATH=/etc/paths.d/:$PATH

##
# Your previous /Users/benc/.bash_profile file was backed up as /Users/benc/.bash_profile.macports-saved_2016-06-14_at_08:29:23
##

# MacPorts Installer addition on 2016-06-14_at_08:29:23: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

