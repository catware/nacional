#echo "select table_name, pg_relation_size(quote_ident(table_name)) from information_schema.tables where table_schema = 'public' order by 2"|$STRCONN


for t  in ` echo usergroups coditels conivas aduanas  grupos playas provincias unimeds  tipfacts  zonas  vendedores tipmercas despachantes tipcontes series secuencias marcas comprobantes workflow convenios clacont conceptos  suscripciones balanzas derivador tally_personal_empresas terminales tarifas imocat imoonu movints colores planos transportes tipembalajes rezagos sets excel operadors presart calles factests complemento marconts movintitems choferes paises complementh maritimas patentes pantallas tiplogs  proves menus pesadas sectors buques puertos  media   liqstocks ingresos filas   anillo  contenes  egresos   ubicaciones ingresoitems_tally egresoitems stockxubs ingresoitems clientes articulos tally_personal_maquinistas ingresos_tally_personal  `

do
pg_dump --insert -t $t -a> pgdump.$t.sql
done