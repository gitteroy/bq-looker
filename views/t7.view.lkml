view: t7 {

  sql_table_name: `lookerset.t7`;;

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

  measure: total_np_liter_in_rupiah {
    type: sum
    sql: ${np_liter_in_rupiah} ;;
    html: {{rendered_value}} | {{brand_and_model}} ;;
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

  dimension: brand_and_model {
    type: string
    sql: CONCAT(${TABLE}.Brand, ' ', ${TABLE}.Model) ;;
    label: "Brand and Model"
  }

}
