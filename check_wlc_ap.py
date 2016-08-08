#!/usr/bin/python

#######
# this is a script to check the currently joined Access Points to a Cisco Wireless Lan Controller.
# It relies on a file, passed as an argument, which contains the access points that "should" exist on said WLC.
# It will report a Critical error if ap's are not there, and a Warning error if an ap is there, but it shouldn't be
# (ie ap there but not in the list)
# edited July 23 2013 by Mike Albano
########

import commands, sys, re, os, syslog

#make sure arguments are passed to script
if len(sys.argv) < 4:
    sys.exit("usage: check_wlc_ap.py -H <wlc_ip_address> -f <aps_expected file>")


#print the differences between the 2 sets, created below, using message passed to function
def list_aps(apset, message):
    if len(apset) == 0:
        return
    print message
    for item in sorted(apset):
        print item
        #log the messages to syslog
        syslog.syslog('%s - %s' % (message, item))

def main():
    #create 2 empty sets
    configuredaps = set()
    activeaps = set()
    #create list from snmpget, and regex out just the AP's
    get_aps = commands.getoutput('snmpwalk -v2c -c public ' + sys.argv[2] + ' 1.3.6.1.4.1.14179.2.2.1.1.3')
    search_aps = re.findall(r'\"(\w.+)\"', get_aps)

    #add to configuredaps set by looping over sys.argv[4]
    apfile = open(sys.argv[4], 'rU')
    for line in apfile:
        configuredaps.add(line.strip())

    #add to activeaps set by looping over regex result (search_aps)
    for item in search_aps:
        activeaps.add(item)

    list_aps(configuredaps - activeaps, "The following APs are down: ")
    list_aps(activeaps - configuredaps, "The following APs were found but dont belong here: ")

    #exit with Critical if aps are down, Warning if don't belong on WLC
    if configuredaps - activeaps:
        sys.exit(2)
    if activeaps - configuredaps:
        sys.exit(1)

main()
