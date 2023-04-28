# The name of this view in Looker is "T8"
view: t8 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `elroy-demo.lookerset.t8`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: month {
    type: time
    timeframes: [
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Month ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Steaming Time" in Explore.

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
}
