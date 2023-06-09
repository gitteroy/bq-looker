# The name of this view in Looker is "T10"
view: t10 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t10`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Company" in Explore.

  dimension: company {
    type: string
    sql: ${TABLE}.Company ;;
  }

  dimension: free_space {
    type: number
    sql: ${TABLE}.Free_Space ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: server {
    type: string
    sql: ${TABLE}.Server ;;
    html: {{rendered_value}} | {{company}} ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.Target ;;
  }

  dimension: usage {
    type: number
    sql: ${TABLE}.Usage ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_free_space {
    type: sum
    sql: ${free_space} ;;
  }

  measure: total_usage {
    type: sum
    sql: ${usage} ;;
  }

  measure: total_target {
    type: sum
    sql: ${target} ;;
  }
}
