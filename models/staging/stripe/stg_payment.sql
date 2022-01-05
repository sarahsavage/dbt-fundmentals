with payment as
    (select 
        orderid as order_id,
        paymentmethod as payment_method,
        amount,
        status,
        created as date_created,
     _batched_at as date_batched
    from raw.stripe.payment)

select * from payment