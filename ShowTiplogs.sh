
a=`date +%y%m%d%H%M`
#echo $a
#exit

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
export STRCONH='/usr/bin/psql -H --log-file=demo.log -q -h 10.176.5.153 nacional megatom'
export STRCONN='/usr/bin/psql --log-file=demo.log -q -h 10.176.5.153 nacional megatom'
export TERM=xterm
export OPTERR=1
export OPTIND=1
export OSTYPE=linux-gnu
export PATH=/home/nacional:/usr/bin:/usr/local/bin:/bin:/usr/local/games:/usr/games
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript
cd $HOME

#set >/tmp/car.txt
echo "tiplogs"
echo "select active,id,tipltipo,tiplestado,name,estado,parametros from tiplogs $1"|$STRCONN|grep -v rows

exit
#echo "CONTENEDORES"
#echo "select id,name,active,createdby,user_name(createdby),getstatus(wkfl,estado,1),estado,wkfl from contenes where operacionid in ( select id from ingresos where name like '%$1%' ) "|$STRCONH|grep -v rows 
#echo "ITEMS"
#echo "select i.id,
#contenedesc(i.ingitecontene),i.conocimiento,i.descmerca,
#i.active,user_name(it.createdby),
	i.ingiteunidades  iu,   it.ingiteunidades itu, 
	i.ingitekilos     ik,   it.ingitekilos    itk, 
	i.ingitevolumen   iv,   it.ingitevolumen  itv, 
	ltrim(i.observaciones)   iobs, ltrim(it.observaciones)  itobs,
	ltrim(i.observacion)     imc,  ltrim(it.observacion)    itmc,
	i.imo             iimo, it.imo 		 itimo,
	it.ubicacion      itub,
 	it.malac itmalac,
	(select peso from tipembalajes te  where i.ingitetipemb=te.id) as tara,
	(select count(*)  from pesadas ps  where ps.active is true and  i.id=ps.foreignid::integer) as pesadas
	FROM ingresoitems i LEFT JOIN ingresoitems_tally it ON (i.id=it.id) 
	WHERE i.active is true and 
		i.bajaapiso=1 and 
		i.ingresoid in ( select id from ingresos where name like '%$1%' ) "|$STRCONH|grep -v rows 



echo "STOCK"
echo "select id,name,active,disponibleenteros(id,1) bultos  from stockxubs where stocinghid in ( select id from ingresos where name like '%$1%' ) "|/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom|grep -v rows 
#echo "select active,createdby,user_name(createdby),count(*) from stockxubs  group by 1,2,3 order by 2"|/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom|grep -v rows 

#echo "ALTER SEQUENCE seq_excel  RESTART WITH 1;"|/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom
# 3 SOLAPA NACIONAL 2 FISCAL PROVI
#/usr/bin/python /home/nacional/ReadXLSJUMBO.py /home/nacional/upload/INGRESOS.xls 2 |/usr/bin/psql --log-file=/home/nacional/demo.log -q -h 10.176.5.153 nacional megatom
#rm -f /home/nacional/upload/old/INGRESOS.xls
#mv /home/nacional/upload/INGRESOS.xls /home/nacional/upload/old/INGRESOS.xls