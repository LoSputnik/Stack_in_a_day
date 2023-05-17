--Implement incremental model updates using dbt's built-in change tracking functionality to only process and load new or modified records from a source table.

{{config(
    materialized = 'incremental',
    unique_key = 'CUSTOMER_CUST_KEY'
)
}}

SELECT * FROM {{ source('Snap source', 'CUSTOMERS') }}

WHERE 1 = 1 

{% if is_incremental() %}
 AND DBT_VALID_FROM > (SELECT max(DBT_VALID_FROM) FROM {{this}} )
 {% endif %}