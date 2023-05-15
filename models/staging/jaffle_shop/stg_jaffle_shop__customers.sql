{#
/*
    stg_jaffle_shop__customers.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A view model of customer data with basic cleaning and transformation
    applied, one row per customer.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/sql-models
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/how-we-structure/2-staging
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    6. https://github.com/dbt-labs/jaffle_shop/blob/main/models/staging/stg_customers.sql
    7. https://github.com/dbt-labs/jaffle_shop_metrics/blob/main/models/staging/stg_customers.sql
    8. https://github.com/dbt-labs/jaffle-shop-template/blob/main/models/staging/stg_customers.sql
    9. https://about.gitlab.com/handbook/business-technology/data-team/platform/dbt-guide
    noqa: enable=all
*/
#}


with


-- Import CTEs

customers as (

    select * from {{ ref('base_jaffle_shop__customers') }}

),

deleted_customers as (

    select * from {{ ref('base_jaffle_shop__deleted_customers') }}

),


-- Logical CTEs

final as (

    select
        customers.*,
        coalesce(deleted_customers.deleted_at is not null, false) as is_deleted


    from customers

    left join deleted_customers
        on customers.customer_id = deleted_customers.customer_id

)


-- Simple select statement

select * from final
