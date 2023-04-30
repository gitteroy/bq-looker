# The name of this view in Looker is "T5"
view: t5 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t5`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual" in Explore.
  dimension_group: month_date {
    type: time
    timeframes: [
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Month ;;
  }

  dimension: actual {
    type: number
    sql: ${TABLE}.Actual ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_actual {
    type: sum
    sql: ${actual} ;;
  }

  measure: average_actual {
    type: average
    sql: ${actual} ;;
  }

  dimension: cumulative {
    type: number
    sql: ${TABLE}.Cumulative ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
