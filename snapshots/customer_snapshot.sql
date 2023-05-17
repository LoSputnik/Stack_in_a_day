{% snapshot customers %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
        target_database = target.database, 
        target_schema = new_schema,
        unique_key = 'CUSTOMER_CUST_KEY', 

        strategy = 'check',
        check_cols = 'all',
    )
}}

SELECT * FROM {{ ref('customer') }}
{% endsnapshot %} 