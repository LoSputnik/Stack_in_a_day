SELECT
CUSTOMER_ACCOUNT_BALANCE FROM {{ ref('customer') }}
having CUSTOMER_ACCOUNT_BALANCE < 0 

