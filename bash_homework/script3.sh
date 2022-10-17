# !bin/bash


source=/home/bim/bash_homework/source3
dest=/home/bim/bash_homework/dest3


for i in $(ls $source); do
	if [ -f $dest/$i ];
	then
		echo $i 'file exist - replacing...'
		rm -r $dest/$i
		cp -r $source/$i $dest/$i
		echo 'replacing was done'
		echo $i '['`date | sed 's/ /:/g'`']' '[rm:cp]' | column -t >> log3.txt
	else
		echo $i 'file not exist - copping...'
		cp -r $source/$i $dest/$i
		echo 'copping was done'
		echo $i '['`date | sed 's/ /:/g'`']' '[cp]' | column -t >> log3.txt
	
	fi



done;




