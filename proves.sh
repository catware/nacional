#export IFS=$'|
cat ./PROVEEDORES.csv | sed 's|^|@|g' | tr "\015" "@" |awk -F "@" '{
	printf("insert into proves(name)values(\"%s\");\n",$2);
	}' 