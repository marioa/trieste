
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


# The following SQL query returns the first 10 rows from surveys
# The "--" is a comment in SQL:
#
# SELECT *           -- select all rows
#   FROM `surveys`   -- from the table surveys
# LIMIT 10           -- limit output to 10 rows
#
# dplyr:
#   
# 1. translates your R code into SQL
# 2. submits it to the database
# 3. translates the database’s response into an R data frame. 
#
# To see what is going on under the bonnet use explain()":
explain(head(surveys, n = 10))

# First part matches (more or lessthe query to be sent to the database.
# It sends the query to the database which does the subsetting of the data.
# dplyr does NOT see the whole data set, ergo it cannot tell how many rows 
# are present.


# Simple database queries -------------------------------------------------

surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

# Why are only 10 rows being shown?

# When working with databases, dplyr tries to be as lazy as possible:
#   
# * It never pulls data into R unless you explicitly ask for it.
# * It delays doing any work until the last possible moment - it collects together 
#   everything you want to do and then sends it to the database in one step.
#
#                                          - dbplyr vignette

data_subset <- surveys %>%
  filter(weight < 5)   %>%
  select(species_id, sex, weight)

# Note that the query has still not been executed
explain(data_subset)

# It is only when you try to retrieve the data that it is
data_subset

# or by removing the "sex" column
data_subset %>% select(-sex)

# Note that the work for this is done AT the database, data
# is exported to (or materialised in) R at the very end.
explain(data_subset %>% select(-sex))

# If you do want your query to import the actual data into
# R add the collect() statement at the end of your query:
(data_subset <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>%
  collect())

# You can run nrow() now because you actually have the data.
nrow(data_subset)


# Complex database queries ------------------------------------------------

# You can also do queries over multiple databases and/or tables usind dplyr.
# We saw that we had 3 tables in mammals
mammals

# We are going to perform a join between surveys and plots.
# Get the plots table:
(plots <- tbl(mammals, "plots"))

# We have a plot_id column.
# We also have plot_id column in surveys.
surveys

# We are going to match records based on this column
# for where plot_id == 1:
plots                  %>%
  filter(plot_id == 1) %>%
  inner_join(surveys)  %>%
  collect()                # Remember this materialises all the data, otherwise you
                           # just get the first 10 rows.

# Challenge 1 -------------------------------------------------------------

# 1.1 Write a query that returns the number of rodents observed in each plot in each 
#     year.
#
# Hint: Connect to the species table and write a query that joins the species and 
#       survey tables together to exclude all non-rodents. The query should return 
#       counts of rodents by year.

# 1.2 Write a query that returns the total number of rodents in each genus caught 
#     in the different plot types.
#
# Hint: Write a query that joins the species, plot, and survey tables together. 
#       The query should return counts of genus by plot type.


# More complex database queries ------------------------------------------------

# You have different kinds of joins: x and y are database tables. For:
#
# x %>% *_join(y) or you can use *_join(x,y)
#
# inner_join(): 
#               * returns all rows from x where there is a matching value in y
#               * returns all columns in x and y
#               * if there are multiple matches in x and y all combinations are returned.
# left_join():
#               * returns all rows from x
#               * returns all columnd from x and y
#               * rows in x that do not have a match in y will have an NA in any new 
#                 columns from y.
#               * all combinations are returned where there are multiple matches
# right_join():
#               * returns all rows from y
#               * returns all columns from x and y
#               * rows in y that have no match in x will have NAs inserted in any
#                 new columns
#               * all combinations in multiple matches are returned
# semi_join():
#               * returns all rows in x where there are matching values in y.
#               * only columns in x are returned
#               * only one row for each matching row of y is returned


# Exercise 1.2 is useful if we are interested in estimating the number of individuals 
# belonging to each genus found in each plot type. 
#
# What if we were interested in the number of genera found in each plot type? 
# Using tally() gives the number of individuals, instead we need to use  n_distinct() 
# to count the number of unique values found in a column.
(
unique_genera <- left_join(surveys, plots)  %>%
                 left_join(species)         %>%
                 group_by(plot_type)        %>%
                 summarize(
                   n_genera = n_distinct(genus)
                 )                          %>%
                 collect()
)


# Creating a new SQLite database ------------------------------------------

# We are now going to create an Sqlite database from the corresponding data
# from csv files.
myspecies <- read.csv("../data/species.csv")
mysurveys <- read.csv("../data/surveys.csv")
myplots   <- read.csv("../data/plots.csv")

# Can use src_sqlite() command we used to read the data with the argument
# create = TRUE, note that if there an existing database of the same name
# that will be silently over written.
my_db_file <- "portal-database.sqlite"              # filename
my_db     <- src_sqlite(my_db_file, create = TRUE)  # create the database

# Current database is empty and has no tables
my_db

# To add tables, we copy the existing data.frames into the database one by one:
# Using temporary=FALSE otherwise it will create a temporary cache (local copy)
# and will not write to the file.
copy_to(my_db, mysurveys,temporary = FALSE)
copy_to(my_db, myplots,temporary = FALSE)
my_db

# The sqlite_stat1 and sqlite_stat4 tables (if you see these) are tables
# to optimise queries, see:
#
# https://sqlite.org/fileformat2.html#stat1tab 
#
# and below if you are interested in the details.

# Challenge 2 -------------------------------------------------------------

# 2.1 Add the remaining species table to the my_db database and run some of your 
#     queries from earlier in the lesson to verify that you have faithfully recreated 
#     the mammals database.
