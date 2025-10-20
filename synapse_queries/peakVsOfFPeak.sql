SELECT
  CASE
    WHEN DATEPART(hour, TRY_CONVERT(time(0), [Time])) BETWEEN 7 AND 9  THEN 'Morning Peak'
    WHEN DATEPART(hour, TRY_CONVERT(time(0), [Time])) BETWEEN 16 AND 18 THEN 'Evening Peak'
    ELSE 'Off-Peak'
  END AS TimePeriod,
  AVG(TRY_CONVERT(INT, [Min_Delay])) AS AvgDelayMinutes,
  COUNT(*) AS Records
FROM OPENROWSET(
  BULK 'silver/',
  DATA_SOURCE = 'ds_ttc',
  FORMAT = 'PARQUET'
) AS rows
GROUP BY
  CASE
    WHEN DATEPART(hour, TRY_CONVERT(time(0), [Time])) BETWEEN 7 AND 9  THEN 'Morning Peak'
    WHEN DATEPART(hour, TRY_CONVERT(time(0), [Time])) BETWEEN 16 AND 18 THEN 'Evening Peak'
    ELSE 'Off-Peak'
  END;
