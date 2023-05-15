{#
/*
    orders.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A table model of basic information about orders, as well as some basic
    information about a customer who made a particular order.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/sql-models
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/how-we-structure/4-marts
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    6. https://github.com/dbt-labs/jaffle_shop/blob/main/models/marts/orders.sql
    7. https://github.com/dbt-labs/jaffle_shop_metrics/blob/main/models/marts/orders.sql
    noqa: enable=all
*/
#}


{%- set payment_methods = get_payment_methods() -%}


with


-- Import CTEs

orders as (

    select * from {{ ref('int_order_payments_pivoted') }}

),

customers as (

    select * from {{ ref('int_customer_order_history_joined') }}

),


-- Logical CTEs

final as (

    select

        orders.order_id,
        orders.customer_id,

        orders.order_date,

        orders.status,

        {%- for payment_method in payment_methods %}
            orders.{{ payment_method }}_amount,
            orders.had_{{ payment_method }}_payment,
        {% endfor %}

        orders.amount,

        customers.first_name,
        customers.last_name,


        customers.first_order,
        customers.most_recent_order,

        customers.number_of_orders,

        customers.customer_status

    from orders

    left join customers using (customer_id)

)


-- Simple select statement

select * from final
