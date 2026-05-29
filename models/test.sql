SELECT
    * 
FROM {{ source('demo', 'weather') }}
LIMIT 100;