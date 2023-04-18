# The name of this view in Looker is "T9"
view: t9 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t9`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Delay Rate Monthly" in Explore.

  dimension: delay_rate_monthly {
    type: number
    sql: ${TABLE}.DelayRate_Monthly ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_delay_rate_monthly {
    type: sum
    sql: ${delay_rate_monthly} ;;
  }

  measure: average_delay_rate_monthly {
    type: average
    sql: ${delay_rate_monthly} ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: on_time_delivery_monthly {
    type: number
    sql: ${TABLE}.OnTimeDelivery_Monthly ;;
  }

  dimension: on_time_delivery_ytd {
    type: number
    sql: ${TABLE}.OnTimeDelivery_YTD ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
