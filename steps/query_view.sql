
USE ROLE HOL_ROLE;
USE WAREHOUSE HOL_WH;


select * from harmonized.POS_FLATTENED_V_STREAM;

SELECT ANALYTICS.FAHRENHEIT_TO_CELSIUS_UDF(35);

CALL HARMONIZED.ORDERS_UPDATE_SP();

CALL ANALYTICS.DAILY_CITY_METRICS_UPDATE_SP();


SELECT *
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY(
    DATEADD('HOURS',-1,CURRENT_TIMESTAMP()),CURRENT_TIMESTAMP()))
ORDER BY START_TIME DESC
LIMIT 100;