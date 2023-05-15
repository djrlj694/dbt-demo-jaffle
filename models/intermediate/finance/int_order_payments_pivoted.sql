{#
/*
    int_order_payments_pivoted.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    An ephemeral model of basic information about orders, as well as some
    derived facts based on payments.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/sql-models
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/how-we-structure/3-intermediate
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    6. https://github.com/dbt-labs/jaffle_shop_metrics/blob/main/models/intermediate/int_order_payments_pivoted.sql
    noqa: enable=all
*/
#}


{%- set payment_methods = get_payment_methods() -%}


with


-- Import CTEs

orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payments as (

    select * from {{ ref('stg_stripe__payments') }}

),


-- Logical CTEs

order_payments as (

    select

        order_id,

        {%- for payment_method in payment_methods %}
            sum(
                case
                    when payment_method = '{{ payment_method }}'
                        then amount
                    else 0
                end
            ) as {{ payment_method }}_amount,
        {% endfor %}

        sum(amount) as total_amount

    from payments

    group by 1

),

final as (

    select

        orders.order_id,
        orders.customer_id,

        orders.order_date,

        orders.status,

        {%- for payment_method in payment_methods %}
            order_payments.{{ payment_method }}_amount,
            coalesce(
                order_payments.{{ payment_method }}_amount is not null, false
            ) as had_{{ payment_method }}_payment,
        {% endfor %}

        order_payments.total_amount as amount

    from orders

    left join order_payments
        on orders.order_id = order_payments.order_id

)


-- Simple select statement

select * from final
