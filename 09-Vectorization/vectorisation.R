
# Vectorisation -----------------------------------------------------------

# R code heavily vectorised.Operate on elements in a vector at the same time.
# Good to avoid loops unless you have to, e.g. iterating through values.
x <- 1:4
(x*2)

# Not!
y<- x
for(i in 1:length(x)){y[i] <- y[i]*2 }
y

# You can add vectors together
y <- 6:9
x+y

#   x:  1  2  3  4
#       +  +  +  +
#   y:  6  7  8  9
# ---------------
#       7  9 11 13


# Challenge 1 -------------------------------------------------------------

# 1.1 Create a new column in gapminder called pop_millions that takes the
#     pop population and expresses it in units of a million (you can also
#     use gapmnder$NewColumnName to create a new column).

# 1.2 On a single graph, plot population, in millions, against year, 
#     for all countries. Don’t worry about identifying which country is which.

# 1.3 Repeat the exercise, graphing only for China, India, and Indonesia. Again, don’t worry about 
#     which is which.


# More vectorised functions -----------------------------------------------

# Comparison operators
x > 2

# Logical operators
a <- x > 3  # or, for clarity, a <- (x > 3)

# Remember our old friends
any(x > 2)
all(x > 2)

# Most functions support vectorisation
x <- 1:4
log(x)

# Matrices too
(m <- matrix(1:12, nrow=3, ncol=4))
m * -1



# Challenge 2 -------------------------------------------------------------


# 2.1 For the following matrix

(m <- matrix(1:12, nrow=3, ncol=4))

# Predict what you will get **before** you execute the command"

m^-1
m*c(1,0,-1)
m>c(0,20)
m * c(1, 0, -1, 2)

# How many did you get right? Are there any outputs that you do not
# understand?

# 2.2 We’re interested in looking at the sum of the following sequence of fractions:
#
# x = 1/(1^2) + 1/(2^2) + 1/(3^2) + ... + 1/(n^2)
#
# This would be tedious to type out, and impossible for high values of n. 
# Use vectorisation to compute x when n=100. What is the sum when n=10,000?
# Note: there is a sum() function.
