# Define the database connection to be used for this model.
connection: "custom-el-bq"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: custom-el-bq_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: custom-el-bq_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Custom-el-bq"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: t10 {}

explore: t2 {}

explore: t13 {}

explore: t1 {}

explore: t12 {}

explore: t3 {}

explore: t4 {}

explore: t41 {}

explore: t5 {}

explore: t7 {}

explore: t6 {}

explore: t8 {}

explore: t9 {}

explore: t11 {
  join: t112 {
    type: left_outer
    sql_on: ${t11.from_city} = ${t112.city} OR ${t11.to_city} = ${t112.city} ;;
    relationship: many_to_one
  }
}

explore: t112 {}

explore: t32 {}

explore: t31 {}

explore: t21 {}
