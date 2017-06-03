##############################
# Use of data structures in R
##############################
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

# Can look at a column of data
cats$weight

cats$coat

# Can perform operations on columns
cats$weight + 2

paste("My cat is", cats$coat)

# What do you think the following will give?
cats$weight + cats$coat

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
# append an L

typeof(1L)

typeof(1+1i)    # i is the imaginary part, i=sqrt(-1), NB in order not to get 
                # an error in R to show this you have to use sqrt(-1+0i)

typeof(TRUE)

typeof("banana")

# A new line to the the feline csv file
file.show("../data/feline-data_v2.csv")

# Lets read this file
cats <- read.csv(file="../data/feline-data_v2.csv")
typeof(cats$weight)

# What happes if we do?
cats$weight+2

# R reads data into something called a data.frame.
# In a data.frame all columns must be of the same type.
# New row means that you cannot have numerical results (character vector).
# Default behaviour though is to create a factor (hence it reports it as integers).
# More on factors later.

# You can find out what type of data structure
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
