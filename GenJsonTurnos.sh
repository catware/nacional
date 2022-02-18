export TERM=xterm
export HOMEM4=/home/nacional
export STRCONN="psql --log-file=demo.log -q -h 10.176.5.153 nacional megatom"
export PGPORT=5432
export PGSCHEMA=public

cd $HOMEM4
clear
rm -f $HOMEM4/dashboard/events.json.php
/usr/bin/python $HOMEM4/GenJsonTurnos.py|tr -d "\n"|sed "s|\[,{|\[{|g" > $HOMEM4/dashboard/events.json.php
/usr/bin/python $HOMEM4/Notifico.py 137 5

chown www-data:www-data $HOMEM4/dashboard/events.json.php
date >> /tmp/GenJsonTurnos.txt
exit
