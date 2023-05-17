{{ config(
materialize = 'table'
) }}

SELECT EMPLOYEE_ID
        , TO_DATE(DATE_1, 'DD-MM-YYYY')                      AS START_DATE
        , TO_DATE(DATE_2, 'DD-MM-YYYY')                      AS END_DATE
        , TEAM
        , TIME_STAMP
FROM {{ source('Employees source', 'employees') }}