
#psql --log-file=demo.log -q -h 10.176.5.153 mega4 megatom

if [ $# -gt 0 ] 
then

cd /home/$1

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export PGDATABASE=`grep "dbName"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export PGHOST=`grep "dbHost"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export PGUSER=`grep "dbUsername"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export PGUSERPWD=`grep "dbUserPassword"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export OUTFILE="cubostock.csv"

export PGPORT=5432
export PGSCHEMA=public


#echo $PGUSER
#echo $PGHOST
#echo $PGDATABASE
export STRCONN="psql -q  -U $PGUSER  -h  $PGHOST $PGDATABASE "
export STRCONNH="psql -q -H  -U $PGUSER  -h $PGHOST $PGDATABASE "



echo $STRCONN


export QUERY="select 
sum(disponibleenteros(id,3)) as bultos,
sum(disponibleenteros(id,2)) as kilos,
sum(disponiblevolumen(id)) as volumen,
(select name from ubicaciones where id =stockubicaid) ubicacion,
(select name from clientes where id=stocconsignatario)as cliente,
stocinghid operacion,
(select ubivolmax from ubicaciones where id=stockubicaid)ubimaxvol,
extract(year  from modifiedat)anio,
extract(month from modifiedat)mes
 from stockxubs where 
disponibleenteros(id,3)>0 and active is true group by 4,5,6,7,8,9 "



export QUERY="select 'C/S' as stock,
sum(disponibleenteros(id,3)) as bultos,
count(*) as palets,
(select name from clientes where id=stocconsignatario)as cliente,
(select i.interno from ingresos i where i.active is true and  i.id=stocinghid limit 1) operacion
 from stockxubs where 
disponibleenteros(id,3)>0 and estado=1 and active is true group by 1,4,5
union
select 'HOUSE' as stock ,
count(*)  as bultos,
count(*)  as contenes,
cliente(clicod) as cliente,
(select i.interno from ingresos i where i.active is true and  i.id=operacionid limit 1) operacion
from contenes where estado in (7) and wkfl=21 and active is true group by 1,4,5 "


#echo $QUERY|$STRCONN
#exit
export QUERY3="update stockxubs set estado=3 where estado=1 and active is true and disponibleenteros(id,3)=0";
psql -q -h $PGHOST -U $PGUSER    $PGDATABASE  -c "\COPY ($QUERY) TO STDOUT DELIMITER ',' CSV HEADER" > $OUTFILE
echo "update ubicaciones set ubivolactual=getvolxub(id); "|$STRCONN

export QUERY2=" update ingresos set ingrestado=60  where id not in (select stocinghid 
 from stockxubs where 
disponibleenteros(id,3)>0 and estado=1 and active is true
union
select c.operacionid from egresos e,contenes c where e.conteneid=c.id and c.wkfl=21 and e.egreestado=90
and e.active is true  and c.active is true) 
and active is true and ingrestado between 2 and 59"

echo $QUERY2|psql -q -h $PGHOST -U $PGUSER    $PGDATABASE



export QUERY3="update stockxubs set estado=5 where estado=1 and active is true and disponibleenteros(id,3)=0";
echo $QUERY3|psql -q -h $PGHOST -U $PGUSER    $PGDATABASE

else
echo "Falta usuario"
fi

# Corrije la descripcion de los items
echo "update ingresoitems set descmerca=(select c.descmerca from contenes c where c.id= ingitecontene) where ingitearticulo=0 "|psql -q -h $PGHOST -U $PGUSER    $PGDATABASE



exit