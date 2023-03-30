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
  # This dimension will be called "Apr" in Explore.

  dimension: apr {
    type: number
    sql: ${TABLE}.Apr ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_apr {
    type: sum
    sql: ${apr} ;;
  }

  measure: average_apr {
    type: average
    sql: ${apr} ;;
  }

  dimension: aug {
    type: number
    sql: ${TABLE}.Aug ;;
  }

  dimension: dec {
    type: number
    sql: ${TABLE}.Dec ;;
  }

  dimension: feb {
    type: number
    sql: ${TABLE}.Feb ;;
  }

  dimension: jan {
    type: number
    sql: ${TABLE}.Jan ;;
  }

  dimension: jul {
    type: number
    sql: ${TABLE}.Jul ;;
  }

  dimension: jun {
    type: number
    sql: ${TABLE}.Jun ;;
  }

  dimension: mar {
    type: number
    sql: ${TABLE}.Mar ;;
  }

  dimension: may {
    type: number
    sql: ${TABLE}.May ;;
  }

  dimension: nov {
    type: number
    sql: ${TABLE}.Nov ;;
  }

  dimension: oct {
    type: number
    sql: ${TABLE}.Oct ;;
  }

  dimension: sep {
    type: number
    sql: ${TABLE}.Sep ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
