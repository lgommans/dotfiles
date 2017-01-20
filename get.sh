
# usage: . setup.sh

# setup.sh: sets up Luc Gommans' dotfiles on the local system and loads .bashrc.

dst="$dstdir/.dotfiles";
repo='https://github.com/lgommans/dotfiles';
zip="$repo/archive/master.zip";
zipdst="$dstdir/dotfiles.zip";

which wich;
if [ $? -eq 0 ]; then
	echo 'No `which` available. Refusing to run.';
	exit 3;
fi;

# Try to find or install git
which git;
if [ $? -eq 1 ]; then
	which apt-get;
	if [ $? -eq 0 ]; then
		if [ "x$(whoami)" -eq 'xroot' ]; then
			echo 'Press Enter to run `apt-get install git`.';
			read;
			apt-get install git;
		else
			which sudo;
			if [ $? -eq 0 ]; then
				echo 'Press Enter to run `sudo apt-get install git`.';
				read;
				apt-get install git;
			fi;
		fi;
	fi;
fi;

which git;
if [ $? -eq 0 ]; then
	if [ -d "$dst/.git" ]; then
		cd "$dst";
		git pull;
	else
		git clone "$repo" "$dst";
		if [ ! -d "$dst" ]; then
			echo 'Clone failed. Exiting.';
			exit 4;
		fi;
	fi;
else
	which unzip;
	if [ $? -eq 1 ]; then
		echo 'Unzip not available. Either install git or unzip.';
		exit 1;
	fi;

	which wget;
	if [ $? -eq 0 ]; then
		wget "$zip" -O "$zipdst";
	fi;
	if [ ! -f "$zipdst" ]; then
		which curl;
		if [ $? -eq 0 ]; then
			curl "$zip" > "$zipdst";
		fi;
	fi;
	if [ ! -f "$zipdst" ]; then
		which openssl;
		if [ $? -eq 0 ]; then
			echo -e 'GET /lgommans/dotfiles/archive/master.zip HTTP/1.0\r\n\r\n' \
				| openssl s_client -connect github.com:443 > "$zipdst";
		fi;
	fi;

	if [ -f "$zipdst" ]; then
		mkdir -p "$dstdir";
		cd "$dstdir";
		unzip "$zipdst";
		if [ -d "$dst" ]; then
			mv dotfiles-master/* "$dst";
			mv dotfiles-master/.* "$dst";
			rmdir dotfiles-master
		else
			mv dotfiles-master "$dst";
		fi;
		echo 'Download successful (no git).';
	else
		echo 'Could not find git, wget, curl or openssl. Failed to download.';
		exit 2;
	fi;
fi;

echo "Installing to '$HOME'...";
cd "$dst";
cp .* "$HOME";

echo 'Done. Loading bashrc.';
. ~/.bashrc

