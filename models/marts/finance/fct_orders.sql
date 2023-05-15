{#
/*
    fct_orders.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A table model of basic information about orders, as well as some derived
    facts based on payments.

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


with


-- Import CTEs

orders as (

    select * from {{ ref('int_order_payments_pivoted') }}

),


-- Logical CTEs

final as (

    select * from orders

)


-- Simple select statement

select * from final
