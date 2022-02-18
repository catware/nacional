d1=`date +%s`
echo "select id,stocinghid,conteneid,active,estado,bultos,unidades   from stockxubs where disponibleenteros(id,3)=bultos  order by id desc "|$STRCONN
h1=`date +%s`
echo $(expr $h1 - $d1)' Seconds'

exit



d2=`date +%s`
echo "select id,stocinghid,conteneid,active,estado,disponibleenteros(id,3),bultos,unidades   from stockxubs order by id desc "|$STRCONN
h2=`date +%s`

echo 'Sin funcion '$(expr $h1 - $d1)' Seconds'

echo 'Con funcion '$(expr $h2 - $d2)' Seconds'
