check_vg_size
=============

Check volume groups usage and return nagios plugin style output

Usage: <br/>
-w warnlevel <br/> 
-c criticallevel<br/> 
[-v  volumeGroup] <br/>
[-a] - when -a used, all volumegroups defined by -v will be ommited and all groups which are found on system will be checked <br/>
[-p] - Use percentage for w and c instead of GB<br/>

Hay que dejar que el user que ejecuta el nrpe pueda ejecutar el comando vgs
