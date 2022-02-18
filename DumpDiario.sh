
#!/bin/bash
####################################################################################
# ESTE SCRIPT SE CORRE TODOS LOS DIAS a la 1am
####################################################################################

export TERM=xterm
export HOMEM=/home/nacional
export PGPASSWORD="megatom"
export PGDATABASE="nacional"
export PGHOST="10.176.5.153"
#export PGHOST="localhost"
export PGPORT="5432"
export PGUSER="megatom"
export STRCONN="psql --log-file=demo.log -q -h "$PGHOST" "$PGDATABASE" "$PGUSER
export usuario=nacional
export TERM=xterm
export HOMEUSER=/home/$usuario
cd $HOMEUSER

clear


pg_dump  $PGDATABASE > $PGDATABASE.sql