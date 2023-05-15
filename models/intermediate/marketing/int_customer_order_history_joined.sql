{#
/*
    int_customer_order_history_joined.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    An ephemeral model of basic information about a customer, as well as some
    derived facts based on a customer's orders.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/sql-models
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/how-we-structure/3-intermediate
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    6. https://github.com/dbt-labs/jaffle_shop_metrics/blob/main/models/intermediate/int_customer_order_history_joined.sql
    noqa: enable=all
*/
#}


with


-- Import CTEs

customers as (

    select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as (

    select * from {{ ref('stg_jaffle_shop__orders') }}

),


-- Logical CTEs

customer_orders as (

    select

        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,

        count(order_id) as number_of_orders

    from orders

    group by 1

),

final as (

    select

        customers.customer_id,

        customers.first_name,
        customers.last_name,

        customer_orders.first_order,
        customer_orders.most_recent_order,

        customer_orders.number_of_orders,

        case
            when customer_orders.most_recent_order <= '2018-01-15'
                then 'Churned'
            when customer_orders.most_recent_order <= '2018-03-01'
                then 'Churn Risk'
            else 'Healthy'
        end as customer_status

    from customers

    left join customer_orders
        on customers.customer_id = customer_orders.customer_id

)


-- Simple select statement

select * from final
