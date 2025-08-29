with Trips as (
    select 
    ride_id as RIDE_ID,
    --rideable_type as RIDEABLE_TYPE,
    date(TO_TIMESTAMP(STARTED_AT)) as TRIP_DATE,
    start_statio_id as START_STATION_ID,
    END_STATION_ID,
    member_csual as MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND,TO_TIMESTAMP(STARTED_AT),TO_TIMESTAMP(ENDED_AT)) as TRIP_DURATION_SEC
    from {{ ref('stg_bike') }}
    where ride_id<>'bikeid'
)

Select * from Trips