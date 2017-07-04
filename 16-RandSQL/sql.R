
# Introduction ------------------------------------------------------------

# dplyr supports connecting to the widely-used open source databases (though you 
# will need dbplyr and the corresponding back end database engine as well):
#
# * sqlite (RSQLite), 
# * mysql and mariadb (RMySQL)
# * postgresql and redshift (RPostgreSQL)
# * Google’s bigquery (bigrquery )
# * ODBC (odbc)
#
# and it can also be extended to other database types 
# (a vignette in the dplyr package explains how to do it).

# This is particularly useful in two types of scenarios:
#
# * Your data is already in a database.
# * You have so much data that it does not all fit into memory simultaneously 
#   and you need to use some external storage engine.
#

# To interact with databases you will usually use SQL, the Structured Query Language. 
# SQL is over 40 years old, and is used by pretty much every database in existence. 
# The goal of dbplyr is to automatically generate SQL for you so that you’re not forced 
# to use it. However, SQL is a very large language and dbplyr doesn’t do everything. 
# It focusses on SELECT statements, the SQL you write most often as an analyst.
#                                                        - dbplyr vignette
# To learn more about SQL(ite):
#
# * https://blog.jooq.org/2016/03/17/10-easy-steps-to-a-complete-understanding-of-sql/
# * http://www.sqlite.org/queryplanner.html
#
#
# We will not address SQL in detail for this lesson.
#
# Aside: sometimes you need to specify a username and password to connect to a database.
#        NEVER EVER put your password under revision control!!
#

# dplyr allows you to access databases but not modify them
# for that you need RSQLite, RMySQL, etc.

# Connecting to databases with dbplyr --------------------------------------

# We will need to install some packages - RSQLite *should* be installed when 
# dbplyr is installed.
install.packages("dbplyr","RSQLite")

# For more information do: vignette("dbplyr")  and vignette("RSQLite")

# Make sure we have dplyr loaded
library(dplyr)

# Connect to the database
mammals <- src_sqlite("../data/portal_mammals.sqlite")

# Does not load the data to R
mammals

# This tells you the version of sqlite and 
# the tables available within the database:
#
# * plots
# * species
# * surveys
#

# Querying the database with the SQL syntax -------------------------------

# To query the database use the tbl() function:
# sql() - converts an SQL query to an SQL R object.
# The SQL query is selecting 3 columns from the surveys table.
tbl(mammals, sql("SELECT year, species_id, plot_id FROM surveys"))


# Querying the database with the dplyr syntax -----------------------------

# Can perform the same operation without knowing any SQL syntax using the
# dplyr syntax
surveys <- tbl(mammals, "surveys")
str(surveys)

# Data is materialised when you try to use it:
surveys %>%
  select(year, species_id, plot_id)

# Very similar to a dataframe:
head(surveys,10)

# But not all functions operate as expected
nrow(surveys)

# Note that we saw this earlier too:
head(surveys,5)

# SQL translation ---------------------------------------------------------


