# The name of this view in Looker is "T112"
view: t112 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `elroy-demo.lookerset.t112`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_lat {
    type: sum
    sql: ${lat} ;;
  }

  measure: average_lat {
    type: average
    sql: ${lat} ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
