
# Defining functions ------------------------------------------------------

# Functions gather a sequence of operations into a whole, preserving it 
# for ongoing use. Functions provide:
#   
# * a name we can remember and invoke it by
# * relief from the need to remember the individual operations
# * a defined set of inputs and expected outputs
# * rich connections to the larger programming environment
#
# As the basic building block of most programming languages, 
# user-defined functions constitute “programming” as much as 
# any single abstraction can. If you have written a function, 
# you are a computer programmer.

my_sum <- function(a, b) { # <--- begin code in the function, 
                               # bit between the brackets is called the body of the fuction
  the_sum <- a + b             # <--- a and b are inputs, the_sum is a local variable
  return(the_sum)              # <--- return the value
}                         #  <--- end code in the function

# if you type just the name you get the source code
my_sum

# To invoke it you add brackets and pass values
my_sum(1,2)

# Note that you get an error if you do not specify the inputs
my_sum()

# Note that local variables are not accessible at this level
the_sum

# You could assign defaults
my_sum2 <- function(a=0, b=0) {
  return (a+b)  # return not required but clearer
                # R automatically returns whichever variable is on the last 
                # line of the body of the function.
}

my_sum2()
my_sum2(1)
my_sum2(1,2)

# Let's define another function
fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

# freezing point of water
fahr_to_kelvin(32)

# boiling point of water
fahr_to_kelvin(212)


# Challenge 10.1 -------------------------------------------------------------

# 10.1.1 Write a function called kelvin_to_celsius that takes a 
#        temperature in Kelvin and returns that temperature in Celsius.
#
# Hint: To convert from Kelvin to Celsius you subtract 273.15


# 10.1.2 Combining functions
#        Let's define 2 new functions:

fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

# Use these two functions to create a new fahr_to_celsius function.


# More on functions  ----------------------------------------------------------

# Define a function that calculates the Gross Domestic Product of a nation 
# from the data available in our dataset:

# Takes a dataset and multiplies the population column
# with the GDP per capita column.
calcGDP <- function(dat) {
  gdp <- dat$pop * dat$gdpPercap
  return(gdp)
}

# Lets run the function
calcGDP(head(gapminder))

# Not very informative, let's modify the function.

# Takes a dataset and multiplies the population column
# with the GDP per capita column.
calcGDP <- function(dat, year=NULL, country=NULL) {
  
  if(!is.null(year)) {                # Extract the data for specific year
    dat <- dat[dat$year %in% year, ]
  }
  if (!is.null(country)) {            # Extract data for a specific country
    dat <- dat[dat$country %in% country,]
  }
  
  gdp <- dat$pop * dat$gdpPercap # Calculate the gdp
  
  new <- cbind(dat, gdp=gdp) # Bind data to new column in data frame
  
  return(new)  # Return the new data frame
}

# If you put functions in a different script then you can enable them
# by running:
#
# source(dirToFile/filename.R)
#
# You will then be able to run the files.


# Let's look at the output now.
head(calcGDP(gapminder, year=2007))

# or for a specific country
calcGDP(gapminder, country="Australia")

# Or both:
calcGDP(gapminder, year=2007, country="Australia")

# Functions in R almost always make copies of the data to operate on 
# inside of a function body. When we modify dat inside the function 
# we are modifying the copy of the gapminder dataset stored in dat, 
# not the original variable we gave as the first argument.

# This is called “pass-by-value” and it makes writing code much safer: 
# you can always be sure that whatever changes you make within the body 
# of the function, stay inside the body of the function.


# Challenge 10.2 -------------------------------------------------------------

# 10.2.1 Test the GDP function by calculating the GDP for New Zealand 
#        in 1987. How does this differ from New Zealand’s GDP in 1952?

# 10.2.2 The paste function can be used to combine text together, e.g:

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
paste(best_practice, collapse=" ")

# Write a function called fence that takes two vectors as arguments, 
# called text and wrapper, and prints out the text wrapped with the wrapper:
#  
#  fence(text=best_practice, wrapper="***")
#
# Note: the paste function has an argument called sep, which specifies the 
# separator between text. The default is a space: “ “. The default for 
# paste0 is no space “”.

# Writing R functions:
# When you first start out, your workflow will probably look a lot like this:
#   
# 1. Write a function
# 2. Comment parts of the function to document its behaviour
# 3. Load in the source file
# 4. Experiment with it in the console to make sure it behaves as you expect
# 5. Make any necessary bug fixes
# 6. Rinse and repeat.
#
