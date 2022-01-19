SELECT '09' 
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 100 ) as varchar)
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 10 ) as nchar(1) )
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 10 ) as nchar(1) )
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 10 ) as nchar(1) )
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 10 ) as nchar(1) )
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 10 ) as nchar(1) )
	+ CAST( FLOOR( ROUND(((1) * RAND(CHECKSUM(NEWID()))), 9) * 10 ) as nchar(1) )
	as phonenumber
