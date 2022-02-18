echo "select logstipo,
	    (select name from tiplogs where id=logstipo),
	    (select tiplprefact from tiplogs where id=logstipo),
	    count(*) 
    from 
	    logs group by 1,2,3 order by 1;"|$STRCONN
