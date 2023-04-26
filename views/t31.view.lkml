# The name of this view in Looker is "T31"
view: t31 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `elroy-demo.lookerset.t31`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Actual" in Explore.

  dimension: actual {
    type: number
    sql: ${TABLE}.Actual ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.Budget ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: forecast {
    type: number
    sql: ${TABLE}.Forecast ;;
  }

  dimension: is_budget {
    type: yesno
    sql: ${TABLE}.is_budget ;;
  }

  measure: total_actual {
    type: sum
    sql: ${actual} ;;
  }

  measure: total_budget {
    type: sum
    sql: ${budget} ;;
  }

  measure: total_forecast {
    type: sum
    sql: ${forecast} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
