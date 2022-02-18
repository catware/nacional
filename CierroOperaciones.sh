
#STRCONN='psql --log-file=demo.log -q -h 10.176.5.153 mega4 megatom'
#echo $STRCONN
#exit


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


export QUERY="select stocinghid operacion  from stockxubs where disponibleenteros(id,3)>0 and active is true"


#
export QUERY=" update ingresos set ingrestado=60  where id not in (select stocinghid 
 from stockxubs where disponibleenteros(id,3)>0 and estado=1 and active is true
union
select operacionid from contenes where estado in (7) and wkfl=21 and active is true) and active is true and ingrestado between 2 and 59 "


echo $QUERY|$STRCONN
#exit


else
echo "Falta usuario"
fi

exit