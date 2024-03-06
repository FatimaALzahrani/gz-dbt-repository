with 

source as (

    select * from {{ source('raw', 'raw_gz_adwords') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name AS campaing_name,
        cast(ads_cost as float64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed
