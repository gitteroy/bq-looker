# The name of this view in Looker is "T11"
view: t11 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `elroy-demo.lookerset.t11`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Delivery Time" in Explore.

  dimension: delivery_time {
    type: number
    sql: ${TABLE}.delivery_time ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_delivery_time {
    type: sum
    sql: ${delivery_time} ;;
  }

  measure: average_delivery_time {
    type: average
    sql: ${delivery_time} ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: from_city {
    type: string
    sql: ${TABLE}.from_city ;;
  }

  dimension: route {
    type: string
    sql: ${TABLE}.route ;;
  }

  dimension: to_city {
    type: string
    sql: ${TABLE}.to_city ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
