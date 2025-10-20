SELECT 
    Station,
    COUNT(*) AS DelayCount,
    AVG(CAST(Min_Delay AS INT)) AS AvgDelayMinutes
FROM OPENROWSET(
    BULK 'silver/',
    DATA_SOURCE = 'ds_ttc',
    FORMAT = 'PARQUET'
) AS rows
GROUP BY Station
ORDER BY DelayCount DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
