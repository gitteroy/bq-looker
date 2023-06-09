# The name of this view in Looker is "T13"
view: t13 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t13`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Belt" in Explore.

  dimension: belt {
    type: string
    sql: ${TABLE}.Belt ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.End_Time ;;
  }

  dimension: flight {
    type: string
    sql: ${TABLE}.Flight ;;
    html: {{product_label}} | {{rendered_value}} ;;
  }

  dimension: product_label {
    type: string
    sql: ${TABLE}.Product_Label ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
  }

  measure: average_quantity {
    type: average
    sql: ${quantity} ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Start_Time ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
