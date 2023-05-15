{#
/*
    stg_jaffle_shop__orders.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A view model of order data with basic cleaning and transformation applied,
    one row per order.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/sql-models
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/how-we-structure/2-staging
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    6. https://github.com/dbt-labs/jaffle_shop/blob/main/models/staging/stg_orders.sql
    7. https://github.com/dbt-labs/jaffle_shop_metrics/blob/main/models/staging/stg_orders.sql
    8. https://github.com/dbt-labs/jaffle-shop-template/blob/main/models/staging/stg_orders.sql
    9. https://about.gitlab.com/handbook/business-technology/data-team/platform/dbt-guide
    noqa: enable=all
*/
#}


with


-- Import CTEs

source as (

    {#-
    Normally, we would select from the table here, but we are using seeds to
    load our data in this project.
    #}
    select * from {{ ref('raw_orders') }}

),


-- Logical CTEs

renamed as (

    select

        -- IDs: Primary Key
        id as order_id,

        -- IDs: Foreign Keys
        user_id as customer_id,

        -- Dates: Logical Data
        order_date,

        -- Strings: Logical Data
        status

    from source

),

final as (

    select

        *,

        -- Booleans: Logical Data
        coalesce(status = 'completed', false) as is_completed_order

    from renamed

)


-- Simple select statement

select * from final
