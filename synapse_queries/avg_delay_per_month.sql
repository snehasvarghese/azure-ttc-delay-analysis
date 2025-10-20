SELECT 
    FORMAT(CAST(Date AS DATE), 'yyyy-MM') AS YearMonth,
    AVG(CAST(Min_Delay AS INT)) AS AvgDelayMinutes,
    COUNT(*) AS Records
FROM OPENROWSET(
    BULK 'silver/',
    DATA_SOURCE = 'ds_ttc',
    FORMAT = 'PARQUET'
) AS rows
GROUP BY FORMAT(CAST(Date AS DATE), 'yyyy-MM')
ORDER BY YearMonth;
