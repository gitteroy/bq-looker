# The name of this view in Looker is "T32"
view: t32 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `elroy-demo.lookerset.t32`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "A1" in Explore.

  dimension: a1 {
    type: number
    sql: ${TABLE}.a1 ;;
  }

  dimension: a2 {
    type: number
    sql: ${TABLE}.a2 ;;
  }

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

  measure: total_a1 {
    type: sum
    sql: ${a1} ;;
  }

  measure: total_a2 {
    type: sum
    sql: ${a2} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
