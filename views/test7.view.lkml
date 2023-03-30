# The name of this view in Looker is "Test7"
view: test7 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `shiok-381601.test.test7`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.Brand ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }

  dimension: np_liter_in_rupiah {
    type: number
    sql: ${TABLE}.NP_liter_In_Rupiah ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_np_liter_in_rupiah {
    type: sum
    sql: ${np_liter_in_rupiah} ;;
  }

  measure: average_np_liter_in_rupiah {
    type: average
    sql: ${np_liter_in_rupiah} ;;
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}.Quantity ;;
  }

  dimension: volume_in_kl {
    type: number
    sql: ${TABLE}.Volume_in_KL ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
