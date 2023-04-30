# The name of this view in Looker is "T5"
view: t5 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t5`
    ;;

  dimension_group: month {
    type: time
    timeframes: [
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Month_date ;;
  }

  dimension: actual {
    type: number
    sql: ${TABLE}.Actual ;;
  }

  dimension: cumulative {
    type: number
    sql: ${TABLE}.Cumulative ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_actual {
    type: sum
    sql: ${actual} ;;
  }

  measure: total_cumulative {
    type: sum
    sql: ${cumulative} ;;
  }

}
