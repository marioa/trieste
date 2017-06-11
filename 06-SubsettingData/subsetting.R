# Subsetting data
#
# There are six different ways we can subset any kind of object, and 
# three different subsetting operators for the different data structures.


# Access elements using indices -------------------------------------------

# Start with a vector
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x

# Get one element
x[1]

x[4]

# Get multiple elements
x[c(1, 3)]

x[1:4]

1:4 # same as

c(1,2,3,4) # or

seq(1,4)

x[6]

# Numbering starts from 1
x[0]         # returns an empty vector, same as doing
integer(0)


# Skipping and removing elements ------------------------------------------

# A negative number as the index of a vector, 
# will return every element except for the one specified:

x[-2]

# Can skip multiple elements
x[c(-1, -5)]  # or x[-c(1,5)]

# Note however
x[-1:3]       # Why do you think this happens?

# We need to reassign it back to the vector
x <- x[-4]
x


# Challenge 1 -------------------------------------------------------------

# 1.1
#
# Given the following code:
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
# Come up with at least 3 different commands that will produce the following output:
#   
#   b   c   d 
# 6.2 7.1 4.8 
#
# After you find 3 different commands, compare notes with your neighbour. 
# Did you have different strategies?


# Subsetting by name ------------------------------------------------------

# Can extract elements by using their name, instead of index:
x[c("a", "c")]

# Indexes can change but names stay the same.
# Removing a column is a bit more convoluted
x[-which(names(x) == "a")]

# Breaking this down
names(x) == "a"

# which then converts this to an index:
which(names(x) == "a")

# For multiple names we use the %in% operator
"a" %in% c("a","b","c","d")
"z" %in% c("a","b","c","d")

x[-which(names(x) %in% c("a", "c"))]

