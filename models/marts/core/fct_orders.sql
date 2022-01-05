{{ config (
    materialized="table"
)}}

with orders as (
    select * from {{ref('stg_orders') }}
),

payments as (
    select * from {{ref('stg_payment') }}
),

order_info as (
    select order_id,
        customer_id
    from orders
),

total_payment as (
    select amount
    from payment
),

total as (
    select 
    orders.order_id,
    orders.customer_id, 
    payment.amount

from orders

left join payment using (customer_id)
)

select * from total