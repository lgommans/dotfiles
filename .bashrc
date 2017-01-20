alias ls='ls -aCF --color'
alias get='sudo apt-get install'
alias q='exit'
alias :q='exit'
alias -- -='cd -'
alias sl=ls
alias clac=calc
alias l=ls
alias ll='ls -lh'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias '......'='cd ../../../../..'
alias '.......'='cd ../../../../../..'
alias '........'='cd ../../../../../../..'
alias '.........'='cd ../../../../../../../..'
alias '..........'='cd ../../../../../../../../..'
alias '...........'='cd ../../../../../../../../../..'
alias '............'='cd ../../../../../../../../../../..'
alias '.............'='cd ../../../../../../../../../../../..'
alias '..............'='cd ../../../../../../../../../../../../..'
alias clip='xclip -in -selection clipboard'
alias paste='xclip -out -selection clipboard'
alias gpu='vblank_mode=0 primusrun'
alias inet='while :; do ping 80.100.131.150 -i 1.1 -W 1200; sleep 0.6; done'
alias inet6='while :; do ping6 2001:981:f115:1::3 -i 1.1 -W 1200; sleep 0.6; done'
alias ?=man
alias ??=wtf
alias bench='php -r "while(1);"'
alias spdt='wget http://dl.xs4all.nl/test/1GB.bin -q -O- | pv > /dev/null'
alias spdtv='wget http://dl.xs4all.nl/test/1GB.bin -O- | pv > /dev/null'
alias spdta='wget http://dl.xs4all.nl/test/1GB.bin -q -O- | pv -a > /dev/null'
alias grep='grep --color=auto'
alias g=grep
alias gv='grep -v'
alias gi="grep -i"
alias jbos=jobs
alias jbso=jobs
alias obs=jobs
alias jbs=jobs
alias josb=jobs
alias job=jobs
alias joba=jobs
alias objs=jobs
alias fgfg=fg
alias f=fg
alias ka=killall
alias ipa="ip a | grep -EA6 '(wlan0|eth0)' | grep -Eo '(inet ([0-9]{1,3}\.){3}[0-9]*|inet6 [0-9a-f:]{2,45})'"
alias i=ipython
alias i3=ipython3
alias headall='for i in * .*; do if [ ! -d "$i" ]; then echo File $i:; head -7 "$i"; echo ---------------; echo; fi; done'
alias catall='for i in * .*; do if [ ! -d "$i" ]; then echo File $i:; cat "$i"; echo ---------------; echo; fi; done'
alias hdall='for i in * .*; do if [ ! -d "$i" ]; then echo File $i:; hd "$i" | head -7; echo ---------------; echo; fi; done'
#function vimb { vim - +"file $1"; };
function sg { apt-cache search $@ | grep -i -C999 --color=always $1; };
function src { results=$(sg $@); resultcount=$(echo "$results" | wc -l); if [ "x$results" == "x" ]; then echo 'No results'; else if [ $resultcount -gt 50 ]; then "$results" | sort | less -R; else echo "$results" | sort; fi; fi; };
function wt { curl wttr.in/$1; }
function kascript { ps aux | grep "$1" | awk '{print $2}' | xargs kill; }
function pidofscript { ps aux | grep "$1" | awk '{print $2}'; }
function kascript9 { ps aux | grep "$1" | awk '{print $2}' | xargs kill -9; }
function show { apt-cache show $1 | grep -E '^( |Description-en|Size|Version|Insta)' | cat; }
function md { mkdir "$1"; cd "$1"; }
function dropm { result=$(curl --silent --user-agent cli --form "f=@$1" "http://dro.pm/fileman.php?secret=$2"); if [ "$result" == "1" ]; then echo Done; return; fi; echo "$result" | awk '{print $2}' | tr -d \\n | xsel -b; echo "$result"; }
function uspdt { curl --form x=@/dev/zero 'http://dro.pm' > /dev/null; }
#function uspdt { php -r '$x=str_repeat("a",1024*1024);while(true){echo $x;}' | curl --form x=@- 'http://dro.pm' > /dev/null; }
function hack { php -r '$fd = fopen("/dev/urandom", "r"); while(true){ echo substr(base64_encode(fread($fd, 158)), 0, 211) . "\n"; }' | pv -qL 3000 | lolcat -F 0.1 -p 10; }
function hack2 { php -r '$charset="0123456789abcdef";$fd = fopen("/dev/urandom", "r"); while(true){ $c = bin2hex(fread($fd, 1266));for ($i=0;$i<211*6;$i+=6){$x=0;for($j=0;$j<4;$j++){$x += strpos($charset, $c[$i + $j]);}echo chr(32+$x);}echo "\n"; }' | lolcat -F 0.01 -p 10; }
function hack3 { tput setaf 2; php -r '$charset="0123456789abcdef";$fd = fopen("/dev/urandom", "r"); while(true){ $c = bin2hex(fread($fd, 1266));for ($i=0;$i<211*6;$i+=6){$x=0;for($j=0;$j<4;$j++){$x += strpos($charset, $c[$i + $j]);}echo chr(32+$x);}echo "\n"; }'; }
function syncup { if [ ! -p /tmp/syncupfifo ]; then mkfifo /tmp/syncupfifo; fi; cat /tmp/syncupfifo; }
function syncupgo { if [ ! -p /tmp/syncupfifo ]; then echo No syncup clients found?; else echo > /tmp/syncupfifo; sleep 0.1; rm /tmp/syncupfifo; fi; }
shopt -s autocd
shopt -s histappend

export HISTSIZE=45000
export HISTCONTROL=ignorespace,ignoredups,erasedups
HISTTIMEFORMAT='%F %T '
export HISTIGNORE='..:...:....:1:acpi:l:ll:f:fg:bg:pwd:/tmp:tmp::vim:python:jobs:jbos:josb:su:sudo su: *'
export PATH="/home/luc/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/games:/usr/games:$PATH:/usr/lib/jvm/default-java/bin/"
PROMPT_COMMAND='history -a; echo -ne "\033]0;${PWD}\007"'
if [ "x$TERM" != "xdumb" ]; then
	export PS1="\n\D{%T} \[$(tput bold)\]\[$(tput setaf 3)\]${debian_chroot:+($debian_chroot)}\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h\[$(tput setaf 1)\]:\[$(tput setaf 3)\]\w\\[$(tput setaf 1)\]$\[$(tput setaf 3)\] \[$(tput setaf 7)\]\[$(tput sgr0)\]"
fi;

if [ $(expr index "$-" i) -gt 0 ]; then
	bind "set completion-ignore-case on"
	bind "set completion-map-case on"
	#bind "set show-all-if-ambiguous on"
fi;

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# Mobile
if [ -d /root/isd ]; then
	if [ "x$TERM" != "xdumb" ]; then
		export PS1="\n\[$(tput bold)\]\[$(tput setaf 3)\]${debian_chroot:+($debian_chroot)}\u\[$(tput setaf 1)\]@\[$(tput setaf 4)\]mobile\[$(tput setaf 1)\]:\[$(tput setaf 3)\]\w\\[$(tput setaf 1)\]$\[$(tput setaf 3)\] \[$(tput setaf 7)\]\[$(tput sgr0)\]"
	fi;

	function m {
		if [ ! -d /root/isd/media ]; then
			echo Mounting;
			mount /dev/block/mmcblk0p16 /root/isd;
			mount /dev/block/mmcblk1 /root/esd;
		else
			echo 'Already mounted';
		fi;
	}
	alias bat=batt
	function batt {
		echo Status: $(cat /sys/class/power_supply/battery/status);
		echo Charge: $(cat /sys/class/power_supply/battery/capacity)%;
		echo Temp: $(calc $(cat /sys/class/power_supply/battery/temp)/10)°C;
	}
	alias temp='echo Temperature should be divided by ten;cat /sys/devices/platform/sec-thermistor/temperature'
fi;

function updateosmand {
	for i in *.obf; do
		if [ ! -f "$i.done" ]; then
			echo "dling $i" &&
			wget -qc "http://download.osmand.net/download.php?standard=yes&file=$i.zip" -O "$i.zip" &&
			echo "unzip $i" &&
			mv $i $i.old &&
			unzip -qq $i.zip &&
			touch "$i.done" &&
			rm "$i.zip" &&
			rm "$i.old" &&
			echo "done  $i (don't forget to remove .done files)" &
		else
			echo "adone $i (already done)";
		fi;
	done
}

#if [ $(($(cat ~/.taskwarrior-lastrun)+7200)) -lt $(date +%s) ]; then
#if [ 0 -eq 1 ] && [ $(($(cat ~/.taskwarrior-lastrun)+987200)) -lt $(date +%s) ]; then
#	echo Did you read it?
#	read i;
#	if [ "$i" == "yes" ]; then
#		date +%s > ~/.taskwarrior-lastrun;
#	fi;
#fi;

