#!/bin/sh
# creates an template and opens vim for editing it. the journal is supposed to be written in RestructuredText format
# usage 
#dailyJournal   # journal of today
#dailyJournal  2   # it shows the journal of 2 days ago
#dailyJournal -d 20161010  # show the journal of the date 20161010 


if [ $# -eq 0 ]; then
	DAYS=0
	DA=`date --date="$DAYS days ago" +%Y%m%d%a`
else
	if [ $1 = "-d"   ]; then
		DA=`date --date="$2" +%Y%m%d%a`
	else
		DAYS=$1
		DA=`date --date="$DAYS days ago" +%Y%m%d%a`
	fi
fi

FILENAME=~/Dropbox/Notes/journal_commandline/daily$DA.txt 
if [  -f $FILENAME ]; then
	vim $FILENAME  -c 'set syntax=rst' -c 'set autochdir' -c 'set tags=tags;'
else
	touch $FILENAME
	echo **Journal for the day:  $DA**  > $FILENAME 
	echo >> $FILENAME
	echo >> $FILENAME
        echo   scratch >> $FILENAME
        echo   ======= >> $FILENAME
	vim $FILENAME  -c 'set syntax=rst' -c 'set autochdir' -c 'set tags=tags;'
fi

