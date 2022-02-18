
opderiv="1";
opcliente="|*|";
echo "select s.id, s.name,
        s.stocingiteid stocingiteid,
        ubiname(stockubicaid) as ubicacion,
        contenedesc(i.ingitecontene) contename,
        s.name as conocimiento,
        i.ingresoid  as operacion,
        s.stocartiid  as stocartiid,
        tipemb(s.stoctipeid) as stoctipeid,
        s.unidades  as unidades,
        disponibleenteros(s.id,3) as disponibles,
        s.stockubicaid  as stockubicaid,
        s.id idstockxubs,
        cliente(stocconsignatario)as stocconsignatario,
        i.descmerca as stocname,
        i.ingitecontene as conteneid,
        s.stocnroorden,
        s.unidades - disponibleenteros(s.id,3) as pedidos,
        s.malac as mala,
        ii.interno as interno,
        s.imo as imo
from stockxubs s,ingresoitems i ,ingresos ii where s.stocingiteid=i.id and        i.ingresoid=ii.id and        s.active=true and      ("$opderiv" > 0  or  notificar('"$opcliente"',s.stocconsignatario)>0 );"|$STRCONN




exit



        disponibleenteros(s.id,2) as kilos,

        disponiblevolumen(s.id) as volumen,

        chktramite(s.id,11) as entramite1, 
        chktramite(s.id,17) as entramite2,
        chktramite(s.id,-1) as entramite3,
        tieneretiros(s.id,100)  as tieneretiros,
        cuentoservicios(s.id) as servicios,




        getreminder(s.id) as reminder

        cuentatally(ii.id,s.conteneid,0,1) as f1,
        cuentatally(ii.id,s.conteneid,s.stocingiteid,12) as f2,

getimoonu(1,s.id) as cuantosimos, 
getimoonu(4,s.id) as cuantosprod, 
getimodesc(1,s.id) as imodesc, 
