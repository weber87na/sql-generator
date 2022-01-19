--https://stackoverflow.com/questions/7878287/generate-random-int-value-from-3-to-6
DECLARE @maxlat DECIMAL(10 , 8), @minlat DECIMAL(10 , 8)
SELECT @maxlat=22.68575,@minlat=22.593361

DECLARE @maxlon DECIMAL(11 , 8), @minlon DECIMAL(11 , 8)
SELECT @maxlon=120.520868,@minlon=120.461685

--SELECT CAST(((@maxlat ) - @minlat) *
--    RAND(CHECKSUM(NEWID())) + @minlat AS decimal(10 , 8))  as lat,
--	CAST(((@maxlon ) - @minlon) *
--		RAND(CHECKSUM(NEWID())) + @minlon AS decimal(11 , 8)) as lon

--產生限定時間
--https://stackoverflow.com/questions/33978254/random-datetime-in-given-datetime-range
DECLARE @FromDate DATETIME2(0)
DECLARE @ToDate   DATETIME2(0)

SET @FromDate = '2022-01-10 08:22:13'
SET @ToDate = '2022-01-10 17:56:31'

DECLARE @Seconds INT = DATEDIFF(SECOND, @FromDate, @ToDate)
DECLARE @Random INT = ROUND(((@Seconds-1) * RAND()), 0)

--使用遞迴(RECURSIVE)
;WITH TALLY(N) AS (
    SELECT  1 N
    UNION ALL
    SELECT 1 + N
    FROM Tally
    WHERE N < 10
)
SELECT '001' ID ,
	DATEADD(SECOND, ROUND(((@Seconds-1) * RAND(CHECKSUM(NEWID()))), 0), @FromDate) DateTime,
	CAST(((@maxlon ) - @minlon) *
		RAND(CHECKSUM(NEWID())) + @minlon AS decimal(11 , 8)) as X ,
	CAST(((@maxlat ) - @minlat) *
		RAND(CHECKSUM(NEWID())) + @minlat AS decimal(10 , 8))  as Y
FROM Tally A
CROSS JOIN Tally B
ORDER BY DateTime
OPTION (MAXRECURSION 0);
