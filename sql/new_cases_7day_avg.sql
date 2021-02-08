--Number of new cases 7 day rolling average for last 30 days
WITH dateagg(date, posInc) AS (SELECT date, sum(positiveIncrease) AS posInc
	FROM covid
	GROUP BY date
	ORDER BY date)
SELECT 
	date,
	printf("%.2f", AVG(posInc) OVER(ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)) AS rolling_avg_7day
FROM dateagg
WHERE date BETWEEN date('now', '-30 day') AND date('now', '-1 day');