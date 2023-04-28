# The name of this view in Looker is "T9"
view: t9 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `elroy-demo.lookerset.t9`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Delay Rate Monthly" in Explore.

  dimension_group: month {
    type: time
    timeframes: [
      month
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Month ;;
  }

  dimension: delay_rate_monthly {
    type: number
    sql: ${TABLE}.DelayRate_Monthly ;;
  }

  dimension: on_time_delivery_monthly {
    type: number
    sql: ${TABLE}.OnTimeDelivery_Monthly ;;
  }

  dimension: on_time_delivery_ytd {
    type: number
    sql: ${TABLE}.OnTimeDelivery_YTD ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  measure: total_delay_rate_monthly {
    type: sum
    sql: ${delay_rate_monthly} ;;
  }

  measure: total_on_time_delivery_ytd {
    type: sum
    sql: ${on_time_delivery_ytd} ;;
  }

  measure: total_time_delivery_monthly {
    type: sum
    sql: ${on_time_delivery_monthly} ;;
  }
}
