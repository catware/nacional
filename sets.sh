#export IFS=$'|
cat ./INFOSETS.csv | sed 's|^|@|g' | tr "\015" "@" |awk -F "@" '{
	printf("insert into sets(name,ean,eanhijo,cantidad)values(\"%s\",\"%s\",\"%s\",%s);\n",$4,$2,$3,$5);
	}' 