#! /bin/zsh
if [ "$#" -eq 0 ]; then
	content=$(cat /home/Niko/projects/bash/otw/.data)
	pass=$(echo "$content"  | tail -1| awk '{print $3}')
	level=$(echo "$content"  | head -1| awk '{print $3}')
	echo "$pass" | xclip -selection clipboard
	ssh -p 2220 $level
elif [ "$#" -eq 2 ]; then
	echo "level = bandit$1@bandit.labs.overthewire.org\npass = $2" > /home/Niko/projects/bash/otw/.data
	git add .
else
	git commit -m "updated level and pass"
	git push
fi
