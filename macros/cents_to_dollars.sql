{#
/*
    cents_to_dollars.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A macro to convert cents to dollars.

    REFERENCES:
    1. https://docs.getdbt.com/docs/build/jinja-macros#macros
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    5. https://github.com/dbt-labs/jaffle-shop-template/blob/main/macros/cents_to_dollars.sql
    6. https://github.com/dbt-labs/jaffle_shop_lleon_grose/blob/main/macros/cents_to_dollars.sql
*/
#}


{% macro cents_to_dollars(column_name, precision=2) -%}
    round({{ column_name }} / 100.0, {{ precision }})
{%- endmacro %}
