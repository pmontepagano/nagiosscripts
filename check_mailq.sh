#!/bin/bash
#########################################
# special check_mailq for qmail by claudio kuenzler
# 2013-04-18 Created script
# 2014-05-07 Bugfix in getopt
#########################################

# Check for people who need help - aren't we all nice ;-)
#########################################################################
if [ "${1}" = "--help" -o "${#}" = "0" ];
       then
       echo -e "Wrong option given. Use -w and -c";
       exit 1;
fi

# Get user-given variables
#########################################################################
while getopts "w:c:" Input;
do
       case ${Input} in
       w)      warning=${OPTARG};;
       c)      critical=${OPTARG};;
       *)      echo "Wrong option given. Use -w and -c"
               exit 1
               ;;
       esac
done

mailq=$(/var/qmail/bin/qmail-qstat | sed -n '1p' | awk -F': ' '{print $2}')

if [[ $mailq -gt $warning ]]
then echo "MAILQ CRITICAL - $mailq mails in queue|qmailq=$mailq;$warning;$critical"; exit 2
elif [[ $mailq -gt $critical ]]
then echo "MAILQ WARNING - $mailq mails in queue|qmailq=$mailq;$warning;$critical"; exit 1
elif [[ $mailq -lt 0 ]]
then echo "MAILQ UNKNOWN - $mailq mails in queue cant really be..."; exit 3
else echo "MAILQ OK - $mailq mails in queue|qmailq=$mailq;$warning;$critical"; exit 0
fi

echo "MAILQ UNKNOWN - Should never come here"
exit 3 

