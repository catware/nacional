export PGORIGEN="mega1"
export PGDESTINO="nacional"
#export PGHOST="10.176.132.205"
export PGHOST="10.176.5.153"
export PGPORT="5432"
export PGUSER="megatom"
export PGSCHEMA="public"
#export STRCONN="psql --log-file=demo.log -q -h "$PGHOST" "$PGDATABASE" "$PGUSER

export PGORIGEN="nacional"
export ORIGEN="/usr/bin/psql --log-file=demo.log -q -h "$PGHOST" "$PGORIGEN" "$PGUSER
if [ $# -eq 1 ]
then
echo "select * from ingresos i,contenes c where c.id=$1  and i.id=c.operacionid"|$ORIGEN|grep -v "ingrcliente"|grep -v "+"|grep -v "row" >/tmp/KKPOI
cat /tmp/KKPOI|/usr/bin/awk -F"|" -f /home/$PGORIGEN/ExportINGCONT3.awk
fi
exit
rm -f /tmp/KKPOI
export ORIGEN="/usr/bin/psql --log-file=demo.log -q -h "$PGHOST" "$PGORIGEN" "$PGUSER
export DESTINO="/usr/bin/psql --log-file=demo.log -q -h "$PGHOST" "$PGDESTINO" "$PGUSER
#echo "select * from ingresos i,contenes c where  c.destino=16 and c.modifiedat::date=(now() + interval '0' day)::date and i.id=c.operacionid"|$ORIGEN|grep -v "ingrcliente"|grep -v "+"|grep -v "row" >/tmp/KKPOI
echo "select * from ingresos i,contenes c where  c.id in (182783,182782,182781,182778,182785,182788,182787,182796,182797,182784)  and i.id=c.operacionid"|$ORIGEN|grep -v "ingrcliente"|grep -v "+"|grep -v "row" >/tmp/KKPOI
cat /tmp/KKPOI|/usr/bin/awk -F"|" -f /home/$PGORIGEN/ExportINGCONT3.awk
# |$DESTINO
#rm -f /tmp/KKPOI
#cat /tmp/KKPOI
exit
