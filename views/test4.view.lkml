# # The name of this view in Looker is "Test4"
# view: test4 {
#   # The sql_table_name parameter indicates the underlying database table
#   # to be used for all fields in this view.
#   sql_table_name: `shiok-381601.test.test4`
#     ;;
#   # No primary key is defined for this view. In order to join this view in an Explore,
#   # define primary_key: yes on a dimension that has no repeated values.

#   # Here's what a typical dimension looks like in LookML.
#   # A dimension is a groupable field that can be used to filter query results.
#   # This dimension will be called "Actual Core Earnings" in Explore.

#   dimension: actual_core_earnings {
#     type: number
#     sql: ${TABLE}.Actual_Core_Earnings ;;
#   }

#   dimension: actual_revenue {
#     type: number
#     sql: ${TABLE}.Actual_Revenue ;;
#   }

#   # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
#   # measures for this dimension, but you can also add measures of many different aggregates.
#   # Click on the type parameter to see all the options in the Quick Help panel on the right.

#   measure: total_actual_revenue {
#     type: sum
#     sql: ${actual_revenue} ;;
#   }

#   measure: average_actual_revenue {
#     type: average
#     sql: ${actual_revenue} ;;
#   }

#   dimension: month {
#     type: string
#     sql: ${TABLE}.Month ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: []
#   }
# }

view: test4 {
  sql_table_name: `shiok-381601.test.test4` ;;

  dimension: actual_core_earnings {
    type: number
    sql: ${TABLE}.Actual_Core_Earnings ;;
  }

  dimension: actual_revenue {
    type: number
    sql: ${TABLE}.Actual_Revenue ;;
  }

  measure: total_actual_revenue {
    type: sum
    sql: ${actual_revenue} ;;
  }

  measure: average_actual_revenue {
    type: average
    sql: ${actual_revenue} ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: month_formatted {
    type: string
    sql: FORMAT_DATE('%b', PARSE_DATE('%b', ${TABLE}.Month)) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
