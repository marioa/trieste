
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
%>% filter(continent=="Europe") 


# Challenge 13.1 -------------------------------------------------------------

# 13.1.1 Write a single command (which can span multiple lines and includes pipes) 
#        that will produce a dataframe that has the African values for lifeExp, 
#        country and year, but not for other Continents. How many rows does your 
#        dataframe have and why?

# Using group_by() and summarize() ----------------------------------------

# Can only filter by one continent at a time. The group_by() allows us to
# aggregate by continents.
gapminder %>% group_by(continent)

# We can then create new columns using summarize() - we can use functions
# within summarize:
(gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarise(mean_gdpPercap=mean(gdpPercap)))

# or we could do the mean life expectancy
gapminder %>%
  group_by(continent) %>%
  summarise(meanLifeExp=mean(lifeExp))

# Can also group by multiple variables - continent and year
(gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap)))

# You can also summarise over multiple variables
(gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop)))

# Challenge 13.2 -------------------------------------------------------------

# 13.2.1 Calculate the average life expectancy per country. Which has the longest 
#        average life expectancy and which has the shortest average life expectancy?

# 13.2.2 Do the same thing but using the arrange() (arrange rows by variable)
#        and desc() (descending order) functions.

# count() and n() ---------------------------------------------------------

# Common is to count observations for each group

# Count the number of countries included in the dataset for the year 2002
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

# If we need to use the number of observations in calculations, 
# the n() function is useful. To get the standard error:
gapminder %>%
  group_by(continent) %>%
  summarize(se_pop = sd(lifeExp)/sqrt(n()))


# Using mutate() ----------------------------------------------------------

# Use mutate to introduce new columns (variables)
(gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion=gdpPercap*pop/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion)))

# Using ifelse
ifelse(TRUE,"Do this","else do this")
ifelse(FALSE,"Do this","else do this")

## keeping all data but "filtering" after a certain condition
# calculate GDP only for people with a life expectation above 25
(gdp_pop_bycontinents_byyear_above25 <- gapminder %>%
  mutate(gdp_billion= ifelse(lifeExp > 25, gdpPercap*pop/10^9, NA)) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion)))

## updating only if certain condition is fullfilled
# for life expectations above 40 years, the gpd to be expected in the future is scaled
(gdp_future_bycontinents_byyear_high_lifeExp <- gapminder %>%
  mutate(gdp_futureExpectation= ifelse(lifeExp > 40, gdpPercap * 1.5, gdpPercap)) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            mean_gdpPercap_expected=mean(gdp_futureExpectation)))


# Combining dplyr and ggplot2 ---------------------------------------------

# We have seen this before:

# Get the start letter of each country
starts.with <- substr(gapminder$country, start = 1, stop = 1)

# Filter countries that start with "A" or "Z"
az.countries <- gapminder[starts.with %in% c("A", "Z"), ]

# Make the plot
ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap( ~ country)

# We can now do this without introducing auxiliary arrays (starts.with and az.countries) :
# (note that the data to be used by ggplot comes from the piping
# as well so you do not have to introduce it)

gapminder %>% 
  # Get the start letter of each country 
  mutate(startsWith = substr(country, start = 1, stop = 1)) %>% 
  # Filter countries that start with "A" or "Z"
  filter(startsWith %in% c("A", "Z")) %>%
  # Make the plot
  ggplot(aes(x = year, y = lifeExp, color = continent)) + 
  geom_line() + 
  facet_wrap( ~ country)


# Can further simplify- combining steps
gapminder %>%
  # Filter countries that start with "A" or "Z"
  filter(substr(country, start = 1, stop = 1) %in% c("A", "Z")) %>%
  # Make the plot
  ggplot(aes(x = year, y = lifeExp, color = continent)) + 
  geom_line() + 
  facet_wrap( ~ country)


# Challenge 13.3 -------------------------------------------------------------

#  13.3.1 Calculate the average life expectancy in 2002 of 2 randomly selected 
#         countries for each continent. Then arrange the continent names in 
#         reverse order.
#         Hint: Use the dplyr functions arrange() and sample_n(), they have 
#         similar syntax to other dplyr functions.


