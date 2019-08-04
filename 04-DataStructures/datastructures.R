##############################
# Use of data structures in R
##############################

# Reading in Data ---------------------------------------------------------

# Have a file on cat data in ../data/feline-data.csv.
# We want to read this data into R.
# Make sure you set the current working directory to where we this 
# file is located. Point to this file in the "Files" tab, click on 
# the gear wheel with "More" and choose "Set As Working Directory"
cats <- read.csv(file="../data/feline-data.csv")
cats    # Use this to view the contents on the console

# or navigate to the Environment tab and click on the cats variable
# or (gives a nicer layout)
View(cats)

# Can look at the names of the columns
names(cats)

# Can look at a column of data
cats$weight

cats$coat

# Can perform operations on columns
cats$weight + 2

paste("My cat is", cats$coat)

# What do you think the following will give?
cats$weight + cats$coat


# R data types ------------------------------------------------------------

# R variables have an implicit type. There are 5 basic types:
#
# 1. double, numbers with a decimal point
# 2. integer, counting numbers or whole numbers
# 3. complex, numbers that have real and imaginary parts
# 4. logical, TRUE or FALSE also know as booleans
# 5. character, letters and numerals
#
# Can find the type by using:

typeof(cats$weight)

typeof(3.14)

typeof(1)

# If you want a number to be an integer then you need to 
# append an L:

typeof(1L)

typeof(1+1i)    # i is the imaginary part, i=sqrt(-1), NB in order not to get 
                # an error in R to show this you have to use sqrt(-1+0i)

typeof(TRUE)

typeof("banana")

# A line has been modified and a new line has been added to 
# the the feline csv file.
# Set the working directory for this to work (paths are relative)
file.show("../data/feline-data_v2.csv") # If it does not work use shell.

# Lets read this file
cats <- read.csv(file="../data/feline-data_v2.csv")
typeof(cats$weight)

# What happes if we do?
cats$weight+2

# R reads data into something called a data.frame (or tibble).
# In a data.frame all columns must be of the same type.
# New row means that you cannot have numerical results (character vector).
# Default behaviour though is to create a factor (hence it reports it as integers).
# More on factors later.

# You can find out what type of data structure we have
class(cats)

# And - more on factors later...
class(cats$weight)

# Let's re-read the feline data, to use later
cats <- read.csv(file="../data/feline-data.csv")

# Another data structure that is used in R is vectors
my_vector <- vector(length = 3)
my_vector

# Note the default is a vector
# Short cut for assigning and displaying
(my_vector <- vector(length=3))

# Explicitly specifying the type
another_vector <- vector(mode='character', length=3)
another_vector

# You can check if something is a vector
str(another_vector)

# chr   -> character
# [1:3] -> has 1 to 3 elements

str(cats$weight)

# Explicitly creating your own vector (using c for combine)
combine_vector <- c(2,6,3)
combine_vector

# What do you think the following will produce?
quiz_vector <- c(2,6,'3')

# This is an example of type coercion
# Good to understand what is going on so you are not surprised
coercion_vector <- c('a', TRUE)
coercion_vector

another_coercion_vector <- c(0, TRUE)
another_coercion_vector

# Coercion rules go:
#
#  logical -> integer -> numeric -> complex -> character
#

# You can force coercion using as.

character_vector_example <- c('0','2','4')
character_vector_example

character_coerced_to_numeric <- as.numeric(character_vector_example)
character_coerced_to_numeric

# Check
typeof(character_coerced_to_numeric)

# Challenge 4.1 -------------------------------------------------------------

# 4.1.1 Coerce character_coerced_to_numeric to integers.

# Type coercion -----------------------------------------------------------

# Moving on...
numeric_coerced_to_logical <- as.logical(character_coerced_to_numeric)
numeric_coerced_to_logical

# Let's go back to our cats data frame
cats$likes_string

# Want to convert this to logicals
cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string

# The combine function allows you to append to a vector:
ab_vector <- c('a', 'b')
ab_vector

# appending
combine_example <- c(ab_vector, 'SWC')
combine_example

# prepending
combine_example <- c("hello",combine_example)
combine_example

# Creating a sequence of numbers
mySeries <- 1:10
mySeries

# Can also use
seq(10)

# Can associate a start and an increment step
seq(1,10, by=0.1)

# Selecting what data to view
sequence_example <- seq(1000)
sequence_example              # Too much data

# Looking at the head of the list (default is n=6)
head(sequence_example, n=2)

# Looking at the tail of the list (default is n=6)
tail(sequence_example, n=4)

# Find out how long the sequence is
length(sequence_example)

# Query the type of the data
class(sequence_example)       # Different views of the same thing
typeof(sequence_example)     
mode(sequence_example)        # integers and doubles are numeric

# You can name your vector elements
my_example <- 5:8
names(my_example) <- c("a", "b", "c", "d")
my_example

# Just see the names
names(my_example)

# Challenge 4.2 -------------------------------------------------------------

# 4.2.1 Do the following:
#
# 1. Make a vector with the numbers 1 to 26.
# 2. Multiply these by 2.
# 3. Name the elements (there is a built in vector called letters for small 
#    case letters LETTERS for capitals).

# 4.2.2 What do you think the following will give you?
x <- seq(1,4)
x+1
# So what do you think the following will give you?
y <- seq(1,2)
x+y
# What about:
x*y


# Factors -------------------------------------------------------------

# Back to cats - str lets you look at the structure of an R object
str(cats$weight)
str(cats$likes_string)
# But
str(cats$coat) 

# Factors are indexed entries used for categorical data
# which is why you get integer when you are looking at 
# the type - that is the index.
typeof(cats$coat)

# Let's create a factor - start with a character array.
coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby')
coats

# Look at the structure
str(coats)

# Make a factor thus:-
CATegories <- factor(coats)
class(CATegories)

# Look at the structure
str(CATegories)

# You get the levels
levels(CATegories)

# Indexing at play
CATegories
as.integer(CATegories)

# Levels occur in alphabetical order, sometimes 
# you want to control the ordering:
mydata <- c("case", "control", "control", "case")

default_factor <- factor(mydata)
default_factor

factor_ordering_example <- factor(mydata, levels = c("control", "case"))
str(factor_ordering_example)

levels(default_factor) <- c("control","case")
default_factor


# Challenge 4.3 -------------------------------------------------------------

# 4.3.1 The default behaviour for read.csv is to read strings as factors. Look up the 
#       documentation to find ways of not reading strings as factors.

# Create a new vector that recovers the values from factor_of_myvals.
# Remember if you just use as.integer you get the index of the factor
# and not the values. Hint: think of as.character but we do not want 
# characters.
myvals <- c(1,2,3,3,2,1,10,2,5)
factor_of_myvals <- factor(myvals)

# 4.3.2 factors are good for doing quick plots:
animals <- factor(c("dog","cat","dog","cow","dog","dog","dog","rabbit"))
plot(animals)
# Look up the documentation for plot and to this diagram do the following:
#
# 1. Add a plot title "Farm yard animals"
# 2. Add an x-axis title "Animals"
# 3. Add a y-axis title "Numbers"
# 4. Change the colour of the bars to "red"
# 5. Reverse the ordering of the labels (this are coming from the levels)
#    so you get "rabbit","dog","cow", "cat".

# Lists -------------------------------------------------------------------

# Lists can have anything and preserve their data type. Data frames are a
# special type of lists.
list_example <- list(1, "a", TRUE, 1+4i)
list_example

another_list <- list(title = "Numbers", numbers = 1:10, data = TRUE )
another_list

# So
typeof(cats)

# But
class(cats)
class(list_example)

# A data frame is a set of vectors/factors that are all
# of the same lenght. A data frame is a special case of
# a list.

# Accessing columns.
cats$coat
cats[,1]        # First column

typeof(cats$coat)
class(cats$coat)
str(cats$coat)

# Note though:
cats["coat"]
typeof(cats["coat"])
class(cats["coat"])

# look at rows:
cats[1,]           # Have different types
typeof(cats[1,])
class(cats[1,])    # Note a one row data frame

str(cats[1,])      # Look at the internals


# Challenge 4.4 -------------------------------------------------------------

# 4.4.1 What do the following give you and what types do they return? Use 
#       typeof(), class() and str()
cats[1]
cats[[1]]
cats$coat
cats["coat"]
cats[1, 1]
cats[, 1]
cats[1, ]

# Matrices ----------------------------------------------------------------
#
# Think of a matrix as a row of vectors all of the same length and of the 
# same type.

matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example

matrix_example2 <- matrix(data=seq(1,16), nrow=4)
matrix_example2

matrix_example3 <- matrix(data=seq(1,16), nrow=8)
matrix_example3

# What can we find out about the data types/structure
class(matrix_example)

typeof(matrix_example)

str(matrix_example)

# Can get the dimensions
dim(matrix_example)

# or individual dimensions
nrow(matrix_example)
ncol(matrix_example)



# Challenge 4.5 -------------------------------------------------------------

# 4.5.1 What do you think will be the result of length(matrix_example)? 
length(matrix_example)

# 4.5.2 Make another matrix, this time containing the numbers 1:50, 
#       with 5 columns and 10 rows. Did the matrix function fill your 
#       matrix by column, or by row, as its default behaviour?
#       Can you get it to fill the matrix the other way round?

# 4.5.3 Create a list of length two containing a character vector for each of 
#     the sections in this part of the workshop:
#
# Data types:
#                  'double', 'complex', 'integer', 'character', 'logical'
# Data structures:
#                  'data.frame', 'vector', 'factor', 'list', 'matrix'
#
# Populate each character vector with the names of the data types and data 
# structures we’ve seen so far.
# 

# Challenge 5.4 -------------------------------------------------------------
# 5.4 Consider the R output of the matrix below:
#   
#   [,1] [,2]
# [1,]    4    1
# [2,]    9    5
# [3,]   10    7
#
# What was the correct command used to write this matrix? 
# Examine each command and try to figure out the correct one before running them. 
# Think about what matrices the other commands will produce.
matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)
matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)
matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)
matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)

# Challenge 5.5 -------------------------------------------------------------
# 5.5 Consider:
m1 <- matrix(seq(1,16),ncol=4,nrow=4)
m2 <- matrix(seq(16,1,-1),ncol=4,nrow=4)
#
# If you multiply these you get an elementwise multiplication:
#
m1*m2
# How would you get a proper get a proper matrix-matrix product?
# This is a question about using help (you don't have to understand
# matrix multiplication), remember "??" ?
