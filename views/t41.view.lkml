# The name of this view in Looker is "T41"
view: t41 {
  sql_table_name: `elroy-demo.lookerset.t41`
    ;;

  dimension_group: month {
    type: time
    timeframes: [
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Month ;;
  }

  dimension: actual_core_earnings {
    type: number
    sql: ${TABLE}.Actual_Core_Earnings ;;
  }

  dimension: actual_revenue {
    type: number
    sql: ${TABLE}.Actual_Revenue ;;
  }

  dimension: revenue_over_core_earnings_percentage {
    type: number
    sql: ROUND((${TABLE}.Actual_Core_Earnings / ${TABLE}.Actual_Revenue) * 100, 2) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_actual_revenue {
    type: sum
    sql: ${actual_revenue} ;;
  }

  measure: total_actual_core_earnings {
    type: sum
    sql: ${actual_core_earnings} ;;
    html: {{rendered_value}}<br><br>% of core earnings over revenue<br>{{revenue_over_core_earnings_percentage}} ;;
  }

  measure: avg_actual_revenue {
    type: average
    sql: ${actual_revenue} ;;
  }

  measure: avg_actual_core_earnings {
    type: average
    sql: ${actual_core_earnings} ;;
  }

}
