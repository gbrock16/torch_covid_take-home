--Top 10 states for positivity rate
SELECT
	state,
	printf("%.4f", (CAST(positive AS REAL) / CAST(totalTestResults AS REAL))) AS positive_rate
FROM covid
WHERE date BETWEEN date('now', '-30 day') AND date('now', '-1 day')
	AND state NOT IN ('AS', 'DC', 'FM', 'GU', 'MH', 'MP', 'PW', 'PR', 'VI')
GROUP BY state
ORDER BY positive_rate DESC
LIMIT 10;