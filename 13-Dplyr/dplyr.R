
# Introduction ------------------------------------------------------------

# We often select certain observations (rows) or variables (columns), 
# we often group the data by a certain variable(s), or we even calculate 
# summary statistics. We can do these operations using the normal base R 
# operations:
mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Americas", "gdpPercap"])
mean(gapminder[gapminder$continent == "Asia", "gdpPercap"])

# Potentially error prone


# The dplyr package -------------------------------------------------------

# We will cover:
#
# 1. select() - operates on columns
# 2. filter() - operates on rows
# 3. group_by() - groups data in rows
# 4. summarize() - aggregates data in rows
# 5. mutate() - creates new columns
#
# and ways of combining them using pipes (%>%) like you will have seen for
# the shell (|).

# Try to load the package:
library(dplyr)
# if this does not work you may have to install the package, you 
# will need to run the following (and then the command above again):
install.packages('dplyr')


# Using select() ----------------------------------------------------------

# This selects the variables (columns that you wish to keep):
(year_country_gdp <- select(gapminder,year,country,gdpPercap))

# This can also be done using:
(year_country_gdp <- gapminder %>% select(year,country,gdpPercap))

# Aside this is when I like using the assignment -> as it goes 
# with the sense of flow:
gapminder %>% select(year,country,gdpPercap) -> year_country_gdp


# Using filter() ----------------------------------------------------------

# This allows you to filter the data in rows:
year_country_gdp_euro <- gapminder %>%
                         filter(continent=="Europe") %>%
                         select(year,country,gdpPercap)

# Note that the %>%  must go at the end of the line if you are breaking up
# into multiple lines. The following will give you an error:
year_country_gdp_euro <- gapminder 
%>% filter(continent=="Europe") %>% select(year,country,gdpPercap)


# Challenge 1 -------------------------------------------------------------

# 1.1 Write a single command (which can span multiple lines and includes pipes) 
#     that will produce a dataframe that has the African values for lifeExp, 
#     country and year, but not for other Continents. How many rows does your 
#     dataframe have and why?



