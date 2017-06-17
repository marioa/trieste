
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


# Challenge 1 -------------------------------------------------------------




# 1.1 Write a function called kelvin_to_celsius that takes a 
#     temperature in Kelvin and returns that temperature in Celsius.
#
# Hint: To convert from Kelvin to Celsius you subtract 273.15


# Combining functions -----------------------------------------------------


