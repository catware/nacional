#11838 11827 11829 11832 11830 11808 11809 11840 11843 11835
export mini=11835
export maxi=11835
echo "select count(*) from ingresos where active is true and id between $mini and  $maxi;"|$STRCONN
echo "select operacionid,count(*) from contenes where operacionid between $mini and  $maxi and active is true group by 1;"|$STRCONN
echo "select ingresoid,ingitecontene,count(*) from ingresoitems where ingresoid between $mini and  $maxi and active is true group by 1,2;"|$STRCONN
echo "select ingresoid,ingitecontene,count(*) from ingresoitems_tally where ingresoid between $mini and  $maxi and active is true group by 1,2;"|$STRCONN
echo "select stocinghid,conteneid,count(*) from stockxubs where stocinghid between $mini and  $maxi and active is true group by 1,2;"|$STRCONN
echo "select stocinghid,conteneid,sum(bultos),sum(disponibleenteros(id,1)),count(bultos),count(disponibleenteros(id,1)) from stockxubs where stocinghid between $mini and  $maxi and active is true group by 1,2;"|$STRCONN
#echo "select stocinghid,sum(bultos),disponibleenteros(id,1) from stockxubs where  active is true and bultos!=disponibleenteros(id,1) group by 1  ;"|$STRCONN


