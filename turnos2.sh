
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
export PGDATABASE=`grep "dbName"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export PGHOST=`grep "dbHost"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export PGUSER=`grep "dbUsername"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export PGUSERPWD=`grep "dbUserPassword"  database.php|grep -v "#" | grep "private"|cut -d "=" -f 2 |cut -d "'" -f 2`
export OUTFILE="FACTURACION.html"
export PGPORT=5432
export PGSCHEMA=public
export STRCONN="psql -q  -U $PGUSER  -h  $PGHOST $PGDATABASE "
export STRCONNH="psql -q -H  -U $PGUSER  -h $PGHOST $PGDATABASE "


# 36,51,70,94,117

export FILE=/home/nacional/$OUTFILE
x="Datos del dia "`date +"%a %d/%m/%Y %H:%M"|sed "s|Fri|Viernes|g"|sed "s|Mon|Lunes|g"|sed "s|Wed|Miercoles|g"|sed "s|Tue|Martes|g"|sed "s|Thu|Jueves|g" `
#export x=`date +"%a"` 
rm -f $FILE
echo "<html>" > $FILE
echo "<center><H2>" >> $FILE
echo $x >> $FILE
echo "</h2></center>" >> $FILE
#echo "select log.fecha,log.name Caso ,tipl.name Evento,wkfl.name Proceso
echo "select log.id ,to_char(log.fecha,'dd/mm/YYYY') fecha,
case
when log.logstipo =36 then (select cliente(clicod) from contenes where id=log.logscomp)
when log.logstipo =51 then (select cliente(egrecliente) from egresos where id=log.logscomp)
when log.logstipo =70 then (select cliente(movhclieid) from movints where id=log.logscomp)
when log.logstipo =94 then (select cliente(clicod) from contenes where id=log.logscomp)
when log.logstipo =117 then (select cliente(clicod) from contenes where id=log.logscomp)
else
'otro'
end
Cliente ,log.name Operacion,wkfl.name Proceso
 FROM logs log left join tiplogs tipl on log.logstipo=tipl.id left join workflow wkfl  on tipl.tipltipo=wkfl.id where tipl.tiplprefact is true order by 1 desc"|$STRCONNH >> $FILE
echo "</html>">> $FILE


#     LEFT JOIN egresoitems egreitem ON egreitem.egresoid = egreso.id
#     LEFT JOIN stockxubs s ON egreitem.egrbstocid = s.id
#     LEFT JOIN contenes conte ON s.conteneid = conte.id
#     LEFT JOIN ingresos opera ON s.stocinghid = opera.id
#     LEFT JOIN ingresoitems item ON s.stocingiteid = item.id
#     LEFT JOIN ingresoitems_tally itemtally ON s.stocingiteid = itemtally.id
#     LEFT JOIN media attach ON s.stocingiteid = attach.foreignid AND attach.entidad::text ~~ '%ingresoitems%'::text
#     LEFT JOIN series ser ON opera.serie = ser.id
#     LEFT JOIN anillo ani ON egreso.id = ani.egresoid
#  WHERE egreso.active IS TRUE;