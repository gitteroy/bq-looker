# The name of this view in Looker is "T1"
view: t1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t1`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Barge Name" in Explore.

  dimension: barge_name {
    type: string
    sql: ${TABLE}.Barge_Name ;;
  }

  dimension: capacity {
    type: number
    sql: ${TABLE}.Capacity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_capacity {
    type: sum
    sql: ${capacity} ;;
  }

  measure: average_capacity {
    type: average
    sql: ${capacity} ;;
  }

  dimension: capacity__group_stream_ {
    type: number
    sql: ${TABLE}.Capacity__Group_Stream_ ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.Group_Name ;;
  }

  dimension: stream {
    type: string
    sql: ${TABLE}.Stream ;;
  }

  measure: count {
    type: count
    drill_fields: [barge_name, group_name]
  }
}
