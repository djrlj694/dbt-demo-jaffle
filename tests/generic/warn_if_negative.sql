{#
/*
    warn_if_negative.sql
    Dbt Demo: COVID-19

    Copyright © 2023 djrlj694.dev. All rights reserved.

    A macro to test if a column's values are all positive. Warns if not so.

    REFERENCES:
    noqa: disable=all
    1. https://docs.getdbt.com/docs/build/tests
    2. https://docs.getdbt.com/docs/quickstarts/dbt-core/quickstart
    3. https://docs.getdbt.com/guides/advanced/using-jinja
    4. https://docs.getdbt.com/guides/best-practices/writing-custom-generic-tests
    5. https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md
    noqa: enable=all
*/
#}


{% test warn_if_negative(model, column_name) %}

with validation as (

    {{ config(severity = 'warn') }}

    select
        {{ column_name }} as positive_field

    from {{ model }}

),

validation_errors as (

    select
        positive_field

    from validation
    -- if this is true, then positive_field is actually negative!
    where positive_field < 0

)

select *
from validation_errors

{% endtest %}
