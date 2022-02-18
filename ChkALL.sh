
#!/bin/bash
# setupapachevhost.sh - Apache webhosting automation demo script
file=/tmp/domains.txt
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export PGDATABASE=nacional
export PGHOST=10.176.5.153
export PGPORT=5432
export PGSCHEMA=public
export PGUSER=megatom
PIPESTATUS=([0]="0")
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
PS2='> '
PS4='+ '
PWD=/home/nacional
SHELL=/bin/bash
export STRCONH='/usr/bin/psql -H --log-file=demo.log -q -h 10.176.5.153 nacional megatom'
export STRCONN='/usr/bin/psql --log-file=demo.log -q -h 10.176.5.153 nacional megatom'

# set the Internal Field Separator to |
#IFS='|'
for t in `echo "select ingrestado from ingresos where active is true"|$STRCONN`
do
export estado=`echo $t|cut -d"|" -f1`
#export id=`echo $t|cut -d"|" -f1`
echo  $estado
#echo "$t"
done