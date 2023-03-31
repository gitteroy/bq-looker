view: sql_runner_test12 {
  derived_table: {
    sql: SELECT
          test12.TTM  AS test12_ttm,
          test12.Breakdown  AS test12_breakdown
      FROM `shiok-381601.test.test12`
           AS test12
      GROUP BY
          1,
          2
      ORDER BY CASE WHEN test12_breakdown = 'Revenue' THEN 1
                    WHEN test12_breakdown = 'Fixed Cost' THEN 2
                    WHEN test12_breakdown = 'Variable Cost' THEN 3
                    WHEN test12_breakdown = 'OPEX' THEN 4
                    WHEN test12_breakdown = 'Depreciation' THEN 5
                    WHEN test12_breakdown = 'Minority Interest' THEN 6
                    WHEN test12_breakdown = 'Tax' THEN 7
                    WHEN test12_breakdown = 'Finance Income' THEN 8
                    WHEN test12_breakdown = 'Other Income (exp)' THEN 9
                    ELSE 10 END
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: test12_ttm {
    type: number
    sql: ${TABLE}.test12_ttm ;;
  }

  dimension: test12_breakdown {
    type: string
    sql: ${TABLE}.test12_breakdown ;;
  }

  set: detail {
    fields: [test12_ttm, test12_breakdown]
  }
}
