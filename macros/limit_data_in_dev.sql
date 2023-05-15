{#
/*
    limit_data_in_dev.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A macro to limit the number of rows returned in a development environment.

    REFERENCES:
    1. https://docs.getdbt.com/docs/build/jinja-macros#macros
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    5. https://github.com/dbt-labs/jaffle-shop-template/blob/main/macros/cents_to_dollars.sql
    6. https://github.com/dbt-labs/jaffle_shop_lleon_grose/blob/main/macros/limit_data_in_dev.sql
*/
#}


{% macro limit_data_in_dev(number_of_rows_to_return=500) %}

    {% if target.name == 'dev' %}

        limit {{ number_of_rows_to_return }}

    {% endif %}

{% endmacro %}
