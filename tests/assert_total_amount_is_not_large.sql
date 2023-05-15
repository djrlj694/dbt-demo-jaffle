{#
/*
    assert_total_amount_is_positive.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A test that asserts a record's total amount is not large.
    * PASS: All orders have a total amount < 50
    * FAIL: At least 1 order has a total amount >= 50

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/tests
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    5. https://github.com/dbt-labs/jaffle_shop_lleon_grose/blob/main/tests/assert_max_average_order_amount.sql
    noqa: enable=all
*/
#}


{{ config
    (
    severity = 'warn'
    )
}}

with


-- Import CTEs

orders as (

    select * from {{ ref('fct_orders') }}

),


-- Logical CTEs

summarized as (

    select
        order_id,
        sum(amount) as total_amount
    from orders
    group by 1

),

test as (

    select *
    from summarized
    where total_amount >= 50

)


-- Simple select statement

select * from test
