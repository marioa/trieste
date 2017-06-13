
# Control flow ------------------------------------------------------------

condition <- TRUE

# if
if (condition) {
  # perform action
}

# if ... else
if (condition) {
  # perform action
} else {  # that is, if the condition is false,
  # perform alternative action
}

# sample a random number from a Poisson distribution
# with a mean (lambda) of 8
x <- rpois(1, lambda=8)

if (x >= 10) {
  print("x is greater than or equal to 10")
}

x

# Set a seed so we get the same sequence of random numbers
set.seed(10)
x <- rpois(1, lambda=8)

if (x >= 10) {
  print("x is greater than or equal to 10")
} else if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is less than 5")
}
x

# Challenge 1 -------------------------------------------------------------

# 1.1 Change the code below to print the value of x
# Hint: remember the paste function?
if (x >= 10) {
  print("x is greater than or equal to 10")
} else if (x > 5) {
  print("x is greater than 5")
} else {
  print("x is less than 5")
}
# In reality you would use the sprintf function, use help to
# see if you can work out how to use it. 

# 1.2 Use an if() statement to print a suitable message reporting whether 
#     there are any records from 2002 in the gapminder dataset. Now do the 
#     same for 2012.


# Repeating operations ----------------------------------------------------

# Iterating over values
for(i in 1:10){
  print(i)
}

# You can nest loops:
for(i in 1:5){
  for(j in c('a', 'b', 'c', 'd', 'e')){
    print(paste(i,j))
  }
}

# Or we could put into a vector:
output_vector <- c()
for(i in 1:5){
  for(j in c('a', 'b', 'c', 'd', 'e')){
    temp_output <- paste(i, j)
    output_vector <- c(output_vector, temp_output) # Append to the end of vector
  }
}
output_vector

# Best not to let things grow this way. It rapidly becomes very
# inefficient. A better approach would be:

output_matrix <- matrix(nrow=5, ncol=5)
j_vector <- c('a', 'b', 'c', 'd', 'e')
for(i in 1:5){
  for(j in 1:5){
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i, j] <- temp_output
  }
}
output_vector2 <- as.vector(output_matrix)
output_vector2

# Repeat a loop until some condition is met
while(condition){
  # do things
}

# runif() generates random numbers from a uniform distribution between 0 and 1
z <- 1
while(z > 0.1){
  z <- runif(1)
  print(z)
}

# Challenge 2 -------------------------------------------------------------

# 2.1 Compare the objects output_vector and output_vector2. 
#     Are they the same? If not, why not? How would you change the last block 
#     of code to make output_vector2 the same as output_vector?
output_vector
output_vector2

output_matrix <- matrix(nrow=5, ncol=5)
j_vector <- c('a', 'b', 'c', 'd', 'e')
for(i in 1:5){
  for(j in 1:5){
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i, j] <- temp_output
  }
}
output_vector2 <- as.vector(output_matrix)
output_vector2

# 2.2 Write a script that loops through the gapminder data by continent and 
#     prints out whether the mean life expectancy is smaller or larger than 50 
#     years.
#
#  File->New File ->Rscript
#  This will create a new script file for you.
#
#  Read in the data (read.csv)
#  Find the unique continents (hint look up unique())
#  Loop over the unique continents
#      Subset the data according to the continent you are using
#      Find the mean() life expectancy
#      If the life expectancy is greater than 50
#          Print out the result
#

# 2.3 Modify the script from Challenge 2.2 to loop over each country. 
#     This time print out whether the life expectancy is smaller than 50, 
#     between 50 and 70, or greater than 70.

# 2.4 
