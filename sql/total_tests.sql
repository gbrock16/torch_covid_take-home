--Total tests in US through yesterday
SELECT
	SUM(totalTestResults) AS total_test_results
FROM covid
WHERE date = date('now', '-1 day');