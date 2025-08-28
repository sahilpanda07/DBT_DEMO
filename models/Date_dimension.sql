with CTE as(
    Select 
    TO_TIMESTAMP(STARTED_AT),
    DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,
    CASE WHEN
    DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('sat','sun')
    then 'WEEKEND'
    else 'BUSINESSDAY' 
    END as DAY_TYPE,
    CASE WHEN
    MONTH(TO_TIMESTAMP(STARTED_AT)) in (12,1,2)
    then 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (3,4,5)
    then 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) in (6,7,8)
    then 'SUMMER'
    ELSE 'AUTUMN'
    END AS STATION_OF_YEAR
    from {{ source('demo', 'bike') }}
    where STARTED_AT<>'started_at'
)

select * from CTE