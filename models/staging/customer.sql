WITH REGION AS (
    SELECT *
    FROM {{ source('Geographical source', 'region') }}
),
NATION  AS (
    SELECT *
    FROM {{ source('Geographical source', 'nation') }}
),
CUSTOMER AS (
    SELECT * 
    FROM {{ source('Customer  source', 'customer') }}
),
FINAL AS (
    SELECT C_ADDRESS                                AS      CUSTOMER_ADDRESS
            , C_COMMENT                             AS      CUSTOMER_COMMENT
            , NATION.N_NAME                         AS      NATION_NAME
            , REGION.R_NAME                         AS      REGION_NAME
            , C_NAME                                AS      CUSTOMER_NAME
            , C_CUSTKEY                             AS      CUSTOMER_CUST_KEY
            , C_PHONE                               AS      CUSTOMER_PHONE
            , C_ACCTBAL                             AS      CUSTOMER_ACCOUNT_BALANCE
            , C_MKTSEGMENT                          AS      CUSTOMER_MARKET_SEGMENT
    FROM CUSTOMER
    INNER JOIN NATION
        ON CUSTOMER.C_NATIONKEY = NATION.N_NATIONKEY
    INNER JOIN REGION
        ON REGION.R_REGIONKEY = NATION.N_REGIONKEY
)

SELECT * FROM FINAL
