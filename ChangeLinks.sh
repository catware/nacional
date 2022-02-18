#for t in `ls *.php`
#do
#ls -L $t
#done
#find . -type l -ls|cut -d"/" -f 2|cut -d"-" -f1

// busca los links en Sources y si lo encuentra los copia al home
DONDE="Sources/"

for t in `find . -type l -ls|cut -d"/" -f 2|cut -d"-" -f1`
do
x=`echo $DONDE$t|tr -d " "`
echo "x="$x
#ls -l $x

## Busco si existe el verdadero

if  test -f "$x";
then
echo "Sí, sí existe."
echo "t=" $t
echo "x="$x

#Borro el link
#rm -f $t

#Traigo el verdadero
#cp $x .
else
echo "No, no existe"
fi



done