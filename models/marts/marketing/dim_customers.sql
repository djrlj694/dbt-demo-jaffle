{#
/*
    dim_customers.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A table model of basic information about a customer, as well as some
    derived facts based on a customer's orders.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/sql-models
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/how-we-structure/4-marts
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    6. https://github.com/dbt-labs/dbt-databricks-demo/blob/master/models/marts/core/dim_customers.sql
    7. https://github.com/dbt-labs/jaffle_shop/blob/main/models/marts/customers.sql
    noqa: enable=all
*/
#}


with


-- Import CTEs

customers as (

    select * from {{ ref('int_customer_order_history_joined') }}

),

orders as (

    select * from {{ ref('fct_orders') }}

),

payments as (

    select * from {{ ref('stg_stripe__payments') }}

),


-- Logical CTEs

customer_payments as (

    select

        orders.customer_id,

        sum(orders.amount) as total_amount

    from payments

    left join orders
        on payments.order_id = orders.order_id

    group by 1

),

final as (

    select

        customers.customer_id,

        customers.first_name,
        customers.last_name,

        customers.first_order,
        customers.most_recent_order,

        customers.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_payments
        on customers.customer_id = customer_payments.customer_id

)


-- Simple select statement

select * from final
