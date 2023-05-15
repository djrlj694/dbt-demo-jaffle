{#
/*
    revenue.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A model of the total revenue of our jaffle businesss.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/blog/how-to-design-and-structure-metrics
    2. https://docs.getdbt.com/docs/build/metrics
    3. https://docs.getdbt.com/docs/build/sql-models
    4. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    5. https://docs.getdbt.com/guides/advanced/using-jinja
    6. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    7. https://github.com/dbt-labs/jaffle_shop_metrics/blob/main/models/marts/revenue.sql
    noqa: enable=all
*/
#}


select *

from {{
    metrics.calculate(
        metric('revenue'),
        grain='day',
        dimensions=['customer_status']
    )
}}
