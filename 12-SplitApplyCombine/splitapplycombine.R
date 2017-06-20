
# Introduction ------------------------------------------------------------

# Previously used funtions to simplify the filtering of data:

# Takes a dataset and multiplies the population column
# with the GDP per capita column.
calcGDP <- function(dat, year=NULL, country=NULL) {
  
  # Filter data by year if set.
  if(!is.null(year)) {
    dat <- dat[dat$year %in% year, ]
  }
  
  # Filter data by country if set.
  if (!is.null(country)) {
    dat <- dat[dat$country %in% country,]
  }
  
  # Calculate the total gdp.
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp=gdp)
  return(new)
}

# Often want to calculate quantities across groups, for example
# the mean across continents:
withGDP <- calcGDP(gapminder)

mean(withGDP[withGDP$continent == "Africa", "gdp"])

mean(withGDP[withGDP$continent == "Americas", "gdp"])

mean(withGDP[withGDP$continent == "Asia", "gdp"])

# But this is not very nice or:

for(continent in unique(withGDP$continent)){
  cat(paste("Mean GDP for",continent," is ",
              mean(withGDP[withGDP$continent == continent, "gdp"]),"\n"))
}

# But this is clunky. You could use a function which might be better
# but there is still a lot of repetition, hence possible bugs.

# We basically want to:
#
# 1. Split the data
# 2. Apply some calculation, like calculating the mean
# 3. Combine the data into one
#
# This is what we shall do.

# Aside: apply
(m <- matrix(data=1:16,ncol=4))

# Sum rows
apply(m,1,sum)

# Sum columns
apply(m,2,sum)

# There is a whole family to play with:
#
# base::apply             Apply Functions Over Array Margins
# base::by                Apply a Function to a Data Frame Split by Factors
# base::eapply            Apply a Function Over Values in an Environment
# base::lapply            Apply a Function over a List or Vector
# base::mapply            Apply a Function to Multiple List or Vector Arguments
# base::rapply            Recursively Apply a Function to a List
# base::tapply            Apply a Function Over a Ragged Array

# The plyr package --------------------------------------------------------


