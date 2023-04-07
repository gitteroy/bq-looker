# The name of this view in Looker is "G Columnar Columns"
view: g_columnar_columns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.g_columnar_columns ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avg Dictionary Count" in Explore.

  dimension: avg_dictionary_count {
    type: number
    sql: ${TABLE}."avg_dictionary_count" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_avg_dictionary_count {
    type: sum
    sql: ${avg_dictionary_count} ;;
  }

  measure: average_avg_dictionary_count {
    type: average
    sql: ${avg_dictionary_count} ;;
  }

  dimension: avg_encoded_values_count {
    type: number
    sql: ${TABLE}."avg_encoded_values_count" ;;
  }

  dimension: column_format {
    type: number
    sql: ${TABLE}."column_format" ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}."column_name" ;;
  }

  dimension: compression_level {
    type: number
    sql: ${TABLE}."compression_level" ;;
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}."database_name" ;;
  }

  dimension: dictionary_size_in_bytes {
    type: number
    sql: ${TABLE}."dictionary_size_in_bytes" ;;
  }

  dimension: encoded_values_size_in_bytes {
    type: number
    sql: ${TABLE}."encoded_values_size_in_bytes" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_accessed {
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
    sql: ${TABLE}."last_accessed_time" ;;
  }

  dimension: num_times_accessed {
    type: number
    sql: ${TABLE}."num_times_accessed" ;;
  }

  dimension: relation_name {
    type: string
    sql: ${TABLE}."relation_name" ;;
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}."schema_name" ;;
  }

  dimension: size_in_bytes {
    type: number
    sql: ${TABLE}."size_in_bytes" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: uncompressed_dictionary_size_in_bytes {
    type: number
    sql: ${TABLE}."uncompressed_dictionary_size_in_bytes" ;;
  }

  dimension: uncompressed_encoded_values_size_in_bytes {
    type: number
    sql: ${TABLE}."uncompressed_encoded_values_size_in_bytes" ;;
  }

  dimension: uncompressed_size_in_bytes {
    type: number
    sql: ${TABLE}."uncompressed_size_in_bytes" ;;
  }

  measure: count {
    type: count
    drill_fields: [database_name, schema_name, relation_name, column_name]
  }
}
