
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
  
  # add the new coulmn - note multiple calls to this function will 
  # add the column multiple times if you assign to the same data frame. 
  # Better (same column will be overwritten):
  # dat$gdp <- dat$pop * dat$gdpPercap
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

# Aside: apply( x, MARGIN, Function)
#               ^   ^       ^
#               |   |       +- Function to be applied across the margins
#               |   +--------- MARGIN - 1 for rows, 2 for columns
#               +------------- vector, array, matrix data
#
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

# For our purposes we could use:
by(withGDP[,"pop"],withGDP[,"continent"],mean)
# or
tapply(withGDP$gdp,withGDP$continent,mean)

# The plyr package --------------------------------------------------------

# The plyr offers a more user friendly way of performing such operations.
# Plyr has functions for operating on lists, data.frames and arrays 
# (matrices, or n-dimensional vectors). Each function performs:
# 
#    * A splitting operation
#    * Apply a function on each split in turn.
#    * Recombine output data as a single data object.
#
# The functions are named based on the data structure they expect as input, 
# and the data structure you want returned as output: 
# 
#    * [a]rray, 
#    * [l]ist, or 
#    * [d]ata.frame. 
#
# The first letter corresponds to the input data structure, the second letter 
# to the output data structure, and then the rest of the function is named “ply”.
#
# There are an additional three functions which will only perform the split 
# and apply steps, and not any combine step. They’re named by their input data 
# type and represent null output by a "_".
#
#                       array     data frame   list    nothing
#                     +======================================
# array               |  aaply     adply        alply   a_ply
# data frame          |  daply     ddply        dlply   d_ply
# list                |  laply     ldply        llply   l_ply
# n replicates        |  raply     rdply        rlply   r_ply
# function arguments  |  maply     mdply        mlpy    m_ply
#
# Functions have the arguments:
#
#             xxply(.data, .variables, .fun)
#
# where:
#
# * The first letter of the function name gives the input type
# * The second gives the output type.
# * .data - gives the data object to be processed
# * .variables - identifies the splitting variables
# * .fun - gives the function to be called on each piece
#

library(plyr)

# Calculating the mean GDP per continent
ddply(                              # Give it a data frame, returns a data frame
  .data = calcGDP(gapminder),       # Data we will operate on (add the gdp to the data frame)
  .variables = "continent",         # What we are splitting across
  .fun = function(x) mean(x$gdp)    # The function we are applying
)

# If you want to label the final column
ddply(                              
  .data = calcGDP(gapminder), 
  .variables = "continent", 
  .fun = function(x) c(mean=mean(x$gdp))
)

# We could return items as a list by changing the second letter:
# "d"->"l".
dlply(
  .data = calcGDP(gapminder),
  .variables = "continent",
  .fun = function(x) mean(x$gdp)
)

# Could group by mulitple columns:
ddply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
)

# return it as a list
daply(
  .data = calcGDP(gapminder),
  .variables = c("continent", "year"),
  .fun = function(x) mean(x$gdp)
)

d_ply(
  .data=gapminder,
  .variables = "continent",
  .fun = function(x) {
    meanGDPperCap <- mean(x$gdpPercap)
    print(paste(
      "The mean GDP per capita for", unique(x$continent),
      "is", format(meanGDPperCap, big.mark=",")
    ))
  }
)


# Challenge 11 -------------------------------------------------------------

# 11.1.1 Calculate the average life expectancy per continent. 
#        Which has the longest? Which had the shortest?

# 11.1.2 Calculate the average life expectancy per continent and year. 
#        Which had the longest and shortest in 2007? Which had the greatest 
#        change in between 1952 and 2007?

# 11.1.3 Calculate the difference in mean life expectancy between the years 
#        1952 and 2007 from the output of challenge 2 using one of the plyr 
#       functions.