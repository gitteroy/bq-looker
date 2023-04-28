# The name of this view in Looker is "T8"
view: t8 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t8`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Month" in Explore.

  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: steaming_time {
    type: number
    sql: ${TABLE}.Steaming_Time ;;
  }

  dimension: stoppages {
    type: number
    sql: ${TABLE}.Stoppages ;;
  }

  dimension: waiting_to_discharge {
    type: number
    sql: ${TABLE}.Waiting_to_Discharge ;;
  }

  dimension: waiting_to_load {
    type: number
    sql: ${TABLE}.Waiting_to_Load ;;
  }

  measure: sum_waiting_to_load {
    type: sum
    sql: ${waiting_to_load} ;;
  }

  measure: sum_steaming_time {
    type: sum
    sql: ${steaming_time} ;;
  }

  measure: sum_stoppages {
    type: sum
    sql: ${stoppages} ;;
  }

  measure: sum_waiting_to_discharge {
    type: sum
    sql: ${waiting_to_discharge} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
