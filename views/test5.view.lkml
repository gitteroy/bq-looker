# The name of this view in Looker is "Test5"
view: test5 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `shiok-381601.test.test5`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual" in Explore.

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

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  dimension: month_formatted {
    type: string
    sql: FORMAT_DATE('%b', PARSE_DATE('%b', ${TABLE}.Month)) ;;
    convert_tz: no
  }

  dimension: month_datetime {
    type: date
    sql: PARSE_DATE('%b', ${month_formatted}) ;;
    convert_tz: no
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
