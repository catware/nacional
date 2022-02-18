export HOME=/home/nacional
export HOSTNAME=fisbaseapp
export HOSTTYPE=x86_64
export IFS=$' \t\n'
export LANG=en_US.UTF-8
export PGDATABASE=nacional
export PGHOST=10.176.5.153
export PGPORT=5432
export PGSCHEMA=public
export PGUSER=megatom
export SHELL=/bin/bash
export STRCONH='psql -H --log-file=demo.log -q -h 10.176.5.153 nacional megatom'
export STRCONN='psql --log-file=demo.log -q -h 10.176.5.153 nacional megatom'
export TERM=xterm
export OPTERR=1
export OPTIND=1
export OSTYPE=linux-gnu
export PATH=/home/nacional:/usr/bin:/usr/local/bin:/bin:/usr/local/games:/usr/games
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript
cd $HOME

#set >/tmp/car.txt
echo "delete from complemento"|/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom
/usr/bin/python /home/nacional/ReadPEDIDOS.py /home/nacional/upload/PEDIDOS.xls  |/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom
echo "delete from complemento where set=1"|/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom
echo "update from complementh set estado=1 where estado=0 and set=1"|/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom
