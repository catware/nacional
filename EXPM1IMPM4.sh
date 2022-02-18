export PGORIGEN="megadev"
export PGDESTINO="nacional"
#export PGHOST="10.176.132.205"
export PGHOST="10.176.5.153"
export PGPORT="5432"
export PGUSER="megatom"
export PGSCHEMA="public"
#export STRCONN="psql --log-file=demo.log -q -h "$PGHOST" "$PGDATABASE" "$PGUSER

export ORIGEN="/usr/bin/psql --log-file=demo.log -q -h "$PGHOST" "$PGORIGEN" "$PGUSER
export DESTINO="/usr/bin/psql --log-file=demo.log -q -h "$PGHOST" "$PGDESTINO" "$PGUSER

#for t in `echo playas calles sectors filas ubicaciones`
#do
#pg_dump  -a -t $t --column-inserts   $PGORIGEN |grep INSERT > 'Mega3'$t.sql
#done



export PGORIGEN="mega4"
export ORIGEN="/usr/bin/psql --log-file=demo.log -q -h "$PGHOST" "$PGORIGEN" "$PGUSER


for t in `echo ingresos contenes  ingresoitems ingresoitems_tally stockxubs`
do
pg_dump  -a -t $t --column-inserts   $PGORIGEN |grep INSERT > 'Mega3'$t.sql
done
