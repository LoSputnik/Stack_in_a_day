{{ config(
materialize = 'table'
) }}

SELECT EMPLOYEE_ID
        , DATE1                 AS START_DATE
        , DATE2                    AS END_DATE
        , TEAM NUMBER
FROM {{ source('Employees source', 'employees') }}