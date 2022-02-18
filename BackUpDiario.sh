export PGDATABASE="nacional"
#export PGHOST="10.176.132.205"
export PGHOST="10.176.5.153"
export PGPORT="5432"
export PGUSER="megatom"
export PGSCHEMA="public"
export STRCONN="psql --log-file=demo.log -q -h "$PGHOST" "$PGDATABASE" "$PGUSER
export STRCONH="psql -H --log-file=demo.log -q -h "$PGHOST" "$PGDATABASE" "$PGUSER
cd /home/$PGDATABASE
pg_dump > NACIONAL.sql