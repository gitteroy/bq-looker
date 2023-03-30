# Define the database connection to be used for this model.
connection: "bq-el"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: custom-el_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: custom-el_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Custom-el"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: test12 {}

explore: test13 {}

explore: test1 {}

explore: test6 {}

explore: test7 {}

explore: test9 {}

explore: test10 {}

explore: test8 {}

explore: test5 {}

explore: test4 {}

explore: test2 {}

explore: test3 {}
