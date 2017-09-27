#!/bin/bash
# V0.1 Process multiple video in same folder
#		* Automaticly process multi video files in the same folder
#		- Quit and prompt usage if missing crop size parameter
# Authur: John Xu

set -o errexit				# to exit when a command failed	

	if [ ! -z "$1" ]		# Check if the cropsize parameter is provided
	then
		for f in *.MP4		# file extension could be capitalized or lower case, so we just check twice
		do
			checkSkipM.sh "$f" $1	
		done
		for f in *.mp4
		do
			checkSkipM.sh "$f" $1	
		done
		if [ ! -z "$2" ]	# if $2 exists, process the second screen
		then
			mkdir result1
			mv *.num result1/
			mv *.out result1/
			for f in *.MP4		# file extension could be capitalized or lower case, so we just check twice
			do
				checkSkipM.sh "$f" $2	# now process the second window number
			done
			for f in *.mp4
			do
				checkSkipM.sh "$f" $2	
			done
			
		fi	
	else
		echo "checkSkipF <cropsize>HxW+X+Y"
	fi


