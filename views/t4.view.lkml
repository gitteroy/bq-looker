# The name of this view in Looker is "T4"
view: t4 {
  derived_table: {
    sql: SELECT
           Month,
           Actual_Core_Earnings,
           Actual_Revenue,
           AVG(Actual_Core_Earnings) OVER (ORDER BY Month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Cumulative_Avg_Core_Earnings,
           AVG(Actual_Revenue) OVER (ORDER BY Month ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Cumulative_Avg_Revenue
         FROM lookerset.t4 ;;
  }

  dimension: cumulative_avg_core_earnings {
    type: number
    sql: ${TABLE}.Cumulative_Avg_Core_Earnings ;;
  }

  dimension: cumulative_avg_revenue {
    type: number
    sql: ${TABLE}.Cumulative_Avg_Revenue ;;
  }

  dimension: actual_core_earnings {
    type: number
    sql: ${TABLE}.Actual_Core_Earnings ;;
  }

  dimension: actual_revenue {
    type: number
    sql: ${TABLE}.Actual_Revenue ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.Month ;;
  }

  measure: total_actual_revenue {
    type: sum
    sql: ${actual_revenue} ;;
  }

  measure: total_actual_core_earnings {
    type: sum
    sql: ${actual_core_earnings} ;;
    html: {{rendered_value}} | Calculate % HERE ;;
  }

  measure: sum_cumulative_avg_core_earnings {
    type: sum
    sql: ${cumulative_avg_revenue} ;;
  }

  measure: sum_cumulative_avg_revenue {
    type: sum
    sql: ${cumulative_avg_revenue} ;;
  }


  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
