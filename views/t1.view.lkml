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

  measure: barge_name_list {
    type: list
    list_field: barge_name
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

  measure: total_capacity_conditional {
    type: sum
    sql: ${capacity} ;;
    value_format_name: usd
    html: {% if value > 15000 %}
          <p style="color: white; background-color: #FFC20A; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p>
          {% else %}
          <p style="color: white; background-color: #6D7170; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p>
          {% endif %}
          ;;
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

  dimension: group_name_coloured {
    type: string
    sql: ${TABLE}.Group_Name ;;
    html: <p style="color: black; background-color: #afafaf; font-size:100%; text-align:center">{{ rendered_value }}</p> ;;
  }

  dimension: stream {
    type: string
    sql: ${TABLE}.Stream ;;
  }

  dimension: stream_coloured {
    type: string
    sql: ${TABLE}.Stream ;;
    html: {% if value == 'Upstream' %}
          <p style="color: black; background-color: #fc1555; font-size:100%; text-align:center">{{ rendered_value }}</p>
          {% else %}
          <p style="color: white; background-color: #6897bb; margin: 0; border-radius: 5px; text-align:center">{{ rendered_value }}</p>
          {% endif %}
          ;;
  }

  measure: count {
    type: count
    drill_fields: [barge_name, group_name]
  }
}
