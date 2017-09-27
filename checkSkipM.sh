#!/bin/bash
# V0.1 Process video and get the dropped frame rate
# V0.2 Use ffmpeg to crop when extracting image files
# V0.3 	MultiThread to speed up ocr processing
#		Put jpg files in ./tmp/ so easier to browse the result files
# V0.4 
#		x Process wrap (counter runs to end then restart from 0) 
#		  Implemented in checknumx.py
#		* Process long video (extract part of the video each time and join the results togather)
#		- Name the output/result files with the Video file name
#		* Automaticly process multi video files in the same folder
#		- Quit and prompt usage if missing crop size parameter
# Authur: John Xu
# Should check if $1 exists, it is the video file. $2 is used as crop parameter. If not specified, do not crop

set -o errexit				# to exit when a command failed	

	if [ -f "$1" ] && [ ! -z "$2" ]
	then
		filename=$(echo $1 | cut -f 1 -d '.')		# get the filename without extension

		if [ -d "tmp/" ]
		then
			rm -r tmp		# delete tmp folder, clear those image files left by last execution
		fi
		
		mkdir tmp
		
		cropsize="$2"				#Search and replace "x""+" with ":", so user can use imagemagick format parameter
		cropsize=${cropsize//x/\:}
		cropsize=${cropsize//+/\:}
		ffmpeg -i "$1" -vf "crop=$cropsize" ./tmp/frame-%06d.jpg

		tessfilesM.sh "$filename".num

#		python $HOME/software/scripts/python/checknum.py output.txt >result.txt
		checknumx.py "$filename".num >"$filename".out
		tail -n 3 "$filename".out
	else
		echo "checkskipm <videofilename> <cropParameter>"
	fi


