# The name of this view in Looker is "T12"
view: t12 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `lookerset.t12`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Breakdown" in Explore.

  dimension: breakdown {
    type: string
    sql: ${TABLE}.Breakdown ;;
  }

  dimension: breakdown_sorted {
    type: string
    sql:  CASE ${breakdown}
          WHEN 'Revenue' THEN '1 Revenue'
          WHEN 'Fixed Cost' THEN '2 Fixed Cost'
          WHEN 'Variable Cost' THEN '3 Variable Cost'
          WHEN 'OPEX' THEN '4 OPEX'
          WHEN 'Depreciation' THEN '4 Depreciation'
          WHEN 'Minority Interest' THEN '5 Minority Interest'
          WHEN 'Tax' THEN '6 Tax'
          WHEN 'Finance Income (cost)' THEN '7 Finance Income (cost)'
          WHEN 'Other Income (exp)' THEN '8 Other Income (exp)'
          END ;;
    label: "Breakdown"
    html: {{ value | remove_first: "1 " | remove_first: "2 " | remove_first: "3 " | remove_first: "4 " | remove_first: "5 " | remove_first: "6 " | remove_first: "7 " | remove_first: "8 " }} ;;
  }

  dimension: ttm {
    type: number
    sql: ${TABLE}.TTM ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ttm {
    type: sum
    sql: ${ttm} ;;
    html: {{total_ttm_M}} ;;
  }

  measure: total_ttm_M {
    type: sum
    sql: ${ttm} ;;
    value_format: "#.0,, M"
  }

}
