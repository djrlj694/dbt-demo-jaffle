{#
/*
    get_payment_methods.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A macro to return a list of payment methods.

    REFERENCES:
    1. https://docs.getdbt.com/docs/build/jinja-macros#macros
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
*/
#}


{% macro get_payment_methods() -%}
    {{
        return(
            dbt_utils.get_column_values(
                table=ref('raw_payments'),
                column='payment_method'
            )
        )
    }}
{%- endmacro %}
