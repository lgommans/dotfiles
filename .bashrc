alias ls='ls -abvCF --color'
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
alias c-v='xclip -out -selection clipboard'
alias gpu='vblank_mode=0 primusrun'
alias inet='while :; do ping 80.100.131.150 -i 1.1 -W 1200; sleep 0.6; done'
alias inet6='while :; do ping6 2001:981:f115::1 -i 1.1 -W 1200; sleep 0.6; done'
alias ?=man
alias ??=wtf
alias spdt='wget http://dl.xs4all.nl/test/1GB.bin -q -O- | pv > /dev/null'
alias spdt4='wget -4 http://dl.xs4all.nl/test/1GB.bin -q -O- | pv > /dev/null'
alias spdt6='wget -6 http://dl.xs4all.nl/test/1GB.bin -q -O- | pv > /dev/null'
alias spdtv='wget http://dl.xs4all.nl/test/1GB.bin -O- | pv > /dev/null'
alias spdta='wget http://dl.xs4all.nl/test/1GB.bin -q -O- | pv -a > /dev/null'
alias grep='grep --color=auto'
alias gi="grep -i"
alias grpe=grep
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
alias ipa="ip a | grep -EA6 '(wlan0|eth0|eno1|tun0|tun1|wlp3s0|enp2s0)' | grep -Eo '(inet ([0-9]{1,3}\.){3}[0-9]*|inet6 [0-9a-f:]{2,45})'"
alias ipr='ip -4 r; ip -6 r'
alias ipqr='ip -6 r'
alias i=ipython
alias i3=ipython3
alias i3i='firefox /usr/share/doc/python3/html/search.html & q'
alias headall='for i in * .*; do if [ ! -d "$i" ]; then echo File $i:; head -7 "$i"; echo ---------------; echo; fi; done'
alias catall='for i in * .*; do if [ ! -d "$i" ]; then echo File $i:; cat "$i"; echo ---------------; echo; fi; done'
alias hdall='for i in * .*; do if [ ! -d "$i" ]; then echo File $i:; hd "$i" | head -7; echo ---------------; echo; fi; done'
alias srvbat='cat /sys/class/power_supply/BAT0/capacity'
alias o=xdg-open
alias vish='vim ~/.bashrc'
alias rlsh='. ~/.bashrc'
alias s='ssh s'
alias s4='ssh server04'
alias fixi3isearch='sudo sed -i '\''s/type="text" name="q"/type="text" autofocus name="q"/'\'' /usr/share/doc/python3/html/search.html'
alias lesss=less
alias les=less
alias bd='base64 -d'
alias ou='sudo apt-get install --only-upgrade'
alias avg="awk '{sum+=\$1} END{print \"avg=\" sum/NR}'"
alias cutoff='cut -b 1-$COLUMNS'

function bench {
	if [ $# -lt 1 ]; then threads=8; else threads=$1; fi;
	if [ $# -lt 2 ]; then ut=1; else ut=$2; fi;
	echo "Running $threads threads with update time ${ut}s.";
	for i in $(seq 1 $threads); do
		echo 'php -r '\''$x=0;$c=9;if('$i'=='$threads'){usleep(20e3);$c=10;}$start=microtime(true)+'$ut';while(1){if($x%10==0 && microtime(true)>$start){$start+='$ut';echo round($x/1e6/'$ut', 2).chr($c);$x=0;}$x++;}'\';
	done | parallel --nice 10 -uj $threads;
}
function skip { if [ $# -eq 0 ] || [ "x$1" == "x-h" ] || [ "x$1" == "x--help" ]; then echo -e 'Usage: skip N\nSkips the first N lines, or the last N if negative.\n'; return 1; fi; if [ $1 -lt 0 ]; then head -n $1; else tail -n +$(($1+1)); fi; };
function sg { apt-cache search $@ | grep -i -C999 --color=always $1; };
function srj { results=$(sg $@); resultcount=$(echo "$results" | wc -l); if [ "x$results" == "x" ]; then echo 'No results'; else if [ $resultcount -gt 50 ]; then echo "$results" | sort | less -R; else echo "$results" | sort; fi; fi; };
function wt { if [ $# -eq 0 ]; then curl https://wttr.in/Aachen; else curl https://wttr.in/$1; fi; }
function kascript { ps aux | grep "$1" | awk '{print $2}' | xargs kill; }
function pidofscript { ps aux | grep "$1" | awk '{print $2}'; }
function kascript9 { ps aux | grep "$1" | awk '{print $2}' | xargs kill -9; }
function show { apt-cache show $1 | grep -E '^( |Description-en|Size|Version|Insta|Depends:)' | cat; }
function md { mkdir -p "$1"; cd "$1"; }
function dropm { result=$(curl --silent --user-agent cli --form "f=@$1" "https://dro.pm/fileman.php?secret=$2"); if [ "$result" == "1" ]; then echo Done; return; fi; echo "$result" | awk '{print $2}' | tr -d \\n; echo "$result"; }
function uspdt { curl --form x=@/dev/zero 'https://dro.pm' > /dev/null; }
#function uspdt { php -r '$x=str_repeat("a",1024*1024);while(true){echo $x;}' | curl --form x=@- 'https://dro.pm' > /dev/null; }
function hack { php -r '$fd = fopen("/dev/urandom", "r"); while(true){ echo substr(base64_encode(fread($fd, 158)), 0, 211) . "\n"; }' | pv -qL 3000 | lolcat -F 0.1 -p 10; }
function hack2 { php -r '$charset="0123456789abcdef";$fd = fopen("/dev/urandom", "r"); while(true){ $c = bin2hex(fread($fd, 1266));for ($i=0;$i<211*6;$i+=6){$x=0;for($j=0;$j<4;$j++){$x += strpos($charset, $c[$i + $j]);}echo chr(32+$x);}echo "\n"; }' | lolcat -F 0.01 -p 10; }
function hack3 { tput setaf 2; php -r '$charset="0123456789abcdef";$fd = fopen("/dev/urandom", "r"); while(true){ $c = bin2hex(fread($fd, 1266));for ($i=0;$i<211*6;$i+=6){$x=0;for($j=0;$j<4;$j++){$x += strpos($charset, $c[$i + $j]);}echo chr(32+$x);}echo "\n"; }'; }
function hack4 { tput setaf 2; php -r '$precomp=[];for($i=0;$i<95;$i++){for($j=0;$j<95;$j++){for($k=0;$k<95;$k++){$precomp[$i*95*95+$j*95+$k]=chr($i+32).chr($j+32).chr($k+32);}}}$x=95*95*95;while(1){echo $precomp[mt_rand(0, $x)];}'; }
function syncup { if [ ! -p /tmp/syncupfifo ]; then mkfifo /tmp/syncupfifo; fi; cat /tmp/syncupfifo; }
function syncupgo { if [ ! -p /tmp/syncupfifo ]; then echo No syncup clients found?; else echo > /tmp/syncupfifo; sleep 0.1; rm /tmp/syncupfifo; fi; }
function pushdot { if [ $# -ne 1 ]; then echo 'Pass a file please.'; exit 1; fi; cd ~/.dotfiles; cp ~/.$1 .; git add .$1; git commit; git push; }
function updatedot { cd ~/.dotfiles; git pull; cp .* ~; }
function evince { $(which evince) "$@" 2>/dev/null & }
function fr { $@; while [ $? -ne 0 ]; do $@; done; } # fail-repeat
function resume { cd "$1"; e=$?; if [ $e -ne 0 ]; then return $e; fi; if [ ! -d seen ]; then echo "No seen folder. Did you cd to the right place?"; return 1; fi; while read line; do echo "Opening '$line'"; vlc "$line"; break; done <<< "$($(which ls) -1 *.mp4 *.mkv 2>/dev/null)"; echo -n "Move to seen? [Y/n] "; read asdf; if [ "x$asdf" == "x" ] || [ "x$asdf" == "xy" ] || [ "x$asdf" == "xY" ]; then mv "$line" seen; echo "Moved."; else echo "Not moved."; fi; cd -; }
function psa { if [ "x$1" == "x" ]; then ps aux; else ps aux | grep -v grep | grep -i "$1"; fi; }

shopt -s autocd
shopt -s histappend

export VISUAL=vim
export EDITOR="$VISUAL"
export HISTSIZE=45000
export HISTCONTROL=ignorespace,ignoredups,erasedups
HISTTIMEFORMAT='%F %T '
export HISTIGNORE='..:...:....:1:l:q:ll:f:fg:bg:pwd:/tmp:tmp::vim:python:jobs:jbos:josb:su:sudo su: *'
export PATH="/home/luc/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/games:/usr/games:$PATH:/usr/lib/jvm/default-java/bin/"
PROMPT_COMMAND='history -a; echo -ne "\033]0;${PWD}\007"'
if [ "x$TERM" != "xdumb" ]; then
	export PS1="\n\D{%T} \[$(tput bold)\]\[$(tput setaf 3)\]${debian_chroot:+($debian_chroot)}\u\[$(tput setaf 1)\]@\[$(tput setaf 3)\]\h\[$(tput setaf 1)\]:\[$(tput setaf 3)\]\w\\[$(tput setaf 1)\]$\[$(tput setaf 3)\] \[$(tput setaf 7)\]\[$(tput sgr0)\]"
fi;
export LANG=en_US.utf8

if [ $(expr index "$-" i) -gt 0 ]; then
	bind "set completion-ignore-case on"
	bind "set completion-map-case on"
	bind "set colored-stats on"
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
fi;

#if [ $(($(cat ~/.taskwarrior-lastrun)+7200)) -lt $(date +%s) ]; then
#if [ 0 -eq 1 ] && [ $(($(cat ~/.taskwarrior-lastrun)+987200)) -lt $(date +%s) ]; then
#	echo Did you read it?
#	read i;
#	if [ "$i" == "yes" ]; then
#		date +%s > ~/.taskwarrior-lastrun;
#	fi;
#fi;

function defaultinstall() {
    get wget curl inotify-tools vim traceroute arping gzip apcalc binutils pv file jq git htop iotop iftop tcpdump lsof strace mlocate net-tools openssh-client openssl pwgen progress rsync screen sed tar unzip zip apt-file whois xxd netcat-openbsd dnsutils;
    sudo apt-file update;
	sudo updatedb;
}
function defaultinstallhardware() {
    # default install on hardware, so ethtool, lm-sensors, etc. are useful
    get ethtool lshw lm-sensors;
}
function defaultinstalloptional() {
    get cloc ent exfat-utils tidy gifsicle imagemagick iperf3 openconnect parallel gnupg tmux smartmontools socat sqlite3 squashfs-tools ssss stunnel4 telnet time tshark units unrar usbutils vpnc woof dirmngr iperf mtr-tiny python3-scapy sipcalc ffmpeg tree vlock woof iperf{,3} sipcalc;
}
function defaultinstallfun() {
    get lolcat bsdgames fortune-mod minimodem toilet espeak morse cmatrix;
}
function defaultinstalllaptop() {
    get powertop acpi;
}
function defaultinstallwifi() {
    get wavemon wireless-tools iw;
}
function defaultinstallhack() {
    get aircrack-ng binwalk nmap nbtscan pari-gp john ent;
}
function defaultinstallandroid() {
	get aapt adb apktool;
}
function defaultinstallprogramming() {
    get python python3 php-cli perl golang make gcc gdb nodejs ruby python3-docs ipython ipython3 python3-pip python-pip parallel;
}
function defaultinstallgui() {
    get geany filezilla audacity bless gparted gimp jd-gui wireshark rdesktop retext vlc xdotool xclip hexchat pavucontrol quassel-client dia;
}
function defaultinstalltex() {
    # poppler-utils contains pdftotext
    get texlive texlive-fonts-extra texlive-fonts-recommended texlive-latex-extra texlive-extra-utils pdfgrep bibtex latexmk poppler-utils;
}

