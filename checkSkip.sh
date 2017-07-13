#!/bin/bash
# V0.1 Process video and get the dropped frame rate
# V0.2 Use ffmpeg to crop when extracting image files
# V0.3 	MultiThread to speed up ocr processing
#		Put jpg files in ./tmp/ so easier to browse the result files
# Authur: John Xu
# Should check if $1 exists, it is the video file. $2 is used as crop parameter. If not specified, do not crop
set -o errexit				# to exit when a command failed	

	echo "checkSkipM.sh works in multi-thread mode thus is much faster. You are suggested to quit and use checkSkipM.sh instead"
	read -p "Press [Enter] key to continue, Ctrl+C to quit..."

	if [ -f "$1" ]
	then
		if [ ! -d "tmp/" ]
		then
			mkdir tmp
		fi

		if [ ! -z "$2" ]
		then
			cropsize="$2"				#Search and replace "x""+" with ":", so user can use imagemagick format parameter
			cropsize=${cropsize//x/\:}
			cropsize=${cropsize//+/\:}
			ffmpeg -i "$1" -vf "crop=$cropsize" ./tmp/frame-%06d.jpg
		else
			ffmpeg -i "$1" ./tmp/frame-%06d.jpg
#		then cropjpgs "$2"
		fi
		tessfiles.sh output.txt
#		python $HOME/software/scripts/python/checknum.py output.txt >result.txt
		checknum.py output.txt >result.txt
		tail -n 3 result.txt
	else
		echo "checkskip <videofilename> [cropParameter]"
	fi


