CREATE VIEW dbo.vw_avg_delay_per_line AS
SELECT 
    Line,
    AVG(TRY_CONVERT(INT, [Min_Delay])) AS AvgDelayMinutes,
    COUNT(*) AS Records
FROM dbo.gold_fact_delay
GROUP BY Line;
