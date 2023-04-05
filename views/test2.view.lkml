# The name of this view in Looker is "Test2"
view: test2 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `shiok-381601.test.test2`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amt" in Explore.

  dimension: amt {
    type: number
    sql: ${TABLE}.amt ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amt {
    type: sum
    sql: ${amt} ;;
  }

  measure: average_amt {
    type: average
    sql: ${amt} ;;
  }

  dimension: d1 {
    type: string
    sql: ${TABLE}.d1 ;;
  }

  dimension: d2 {
    type: string
    sql: ${TABLE}.d2 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
