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


# Challenge 2 -------------------------------------------------------------




# 2.1 Given the following code:
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)
# What do you expext the following give you?
x[-which(names(x) == "g")]

# Did this match your expectation? 
# Why did we get this result? 
# Tip: test out each part of the command on it’s own - this 
# is a useful debugging strategy).

# 2.1 Which of the following are true:
# 
# A) if there are no TRUE values passed to which, an empty vector is returned
# B) if there are no TRUE values passed to which, an error message is shown
# C) integer() is an empty vector
# D) making an empty vector negative produces an “everything” vector
# E) x[] gives the same result as x[integer()]
#


# Tips --------------------------------------------------------------------

# Column names can have the same name, same for data frames (row names must
# be unique).
y <- 1:3
names(y) <- c('a', 'a', 'a')
y
y['a']  # only returns first value
y[which(names(y) == 'a')]  # returns all three values

# Remember we can search for operators, you have to quote them
# for this instance
help("%in%")
?"%in%"

# Why could we not do?
names(x) == c("a","b","c")

# Let's create a new vector
y <- c(x,8.0)
y

# Want to add a name to the 6th element.
names(y)[1:3]
names(y)[6] <- "f"
y

# Now try:
names(y) == c("a","b","c")

# What is happening?
# y  ("a" "b" "c"    "d" "e" "f")
#    ( "a" "b" "c")( "a" "b" "c")

# So, it recycles the comparison vector
names(y) == c("a","b","c")

# but
names(y) == c("c","a","b") # Doing an element by element comparison.

# Not the same as
names(y) %in% c("c","a","b")

# Careful with this, you could get some difficult to detect bugs.


# Subsetting through other logical operations -----------------------------

x <- y
x
length(x)

# Can use logical operations to subset data
# Note that the inner vector is recycling
x[c(TRUE, TRUE, FALSE, FALSE)]
x[c(TRUE, FALSE)]

# But
x[c(TRUE, FALSE, TRUE, TRUE)]

#    0     1     2      3     4     5     6      7    
x[c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE)]

# Can use conditions
x[names(x) %in% c("c","d")]

x>6
x[x>6]

# Combining logical operations:
#
# &, the “logical AND” operator: 
#                              returns TRUE if both the left and right are TRUE.
# |, the “logical OR” operator: 
#                              returns TRUE, if either the left or right (or both) are TRUE.

# Recycling applies so:
TRUE & c(TRUE, FALSE)
TRUE | c(TRUE, FALSE)


# Using it to subset our data:
x
6 < x & x<7
x[6<x & x<7]

x<6 | x>7
x[x<6 | x>7]

# Note - these only look at the first element (used in programming)
TRUE && c(TRUE, FALSE)
TRUE || c(TRUE, FALSE)

# !, the “logical NOT” operator: 
#                              converts TRUE to FALSE and FALSE to TRUE. 
#                              It can negate a single logical condition 
#                              (eg !TRUE becomes FALSE), or a whole vector of 
#                              conditions.
!c(TRUE, FALSE)

# You can compare the elements within a single vector using the all function.
all(c(TRUE,TRUE,TRUE,TRUE,TRUE))
all(c(TRUE,TRUE,FALSE,TRUE,TRUE))
all(x>0)
all(x<8)

# Similarly you can see if any condition is TRUE
any(c(FALSE,FALSE,FALSE,FALSE,FALSE))
any(c(FALSE,FALSE,FALSE,TRUE,FALSE))
any(x > 0)
any(x < 8)



# Challenge 3 -------------------------------------------------------------

# 3.1 Write a subsetting command to return the values in x that are greater than 
# 4 and less than 7 for the following code:
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)


# Handling special values -------------------------------------------------

# In R there are some special values. We have already seen:
x[9]   # NA - not available
x[1:9]
is.na(x[1:9])
!is.na(x[1:9])

# Infinite
1/0
is.infinite(1/0)

# NaN -Not a Number
sqrt(-4)  
sqrt(-4+0i)      # To get the square root of -4 you need to present as -4+0i
is.nan(sqrt(-4))

# Array of bads
bads <- c(1/0, sqrt(-4), x[9])
bads

# or directly
bads <- c(NA,NaN,Inf)
is.finite(bads)

# just filter out missing data
z <- na.omit(c(1,2,4,NA,5,6,7,NA,8))


# Factor subsetting -------------------------------------------------------

# Let's now play with factors
f <- factor(c("a", "a", "b", "c", "c", "d"))
f

f[f == "a"]

f[f %in% c("b", "c")]

f[1:3]

# Skipping elements will not remove the level even if no more of that 
# category exists in the factor, e.g.
f[-3]


# Matrix subsetting -------------------------------------------------------

# Create a matrix
set.seed(1)                                 # Reproducible random numbers
m <- matrix(rnorm(6*4), ncol=4, nrow=6)     # random numbers in a normal distribution
m

# Subeset using the [] notation
m[3:4, c(3,1)]

# To get columns
m[, c(3,4)]

# Get an error if you try to go outside the bounds (before you got an NA)
m[,6]

# Rows filtering, returns a vector
m[3,]

# You can have higher dimensional but these are called arrays
m3d <- array(rnorm(3*3*3),dim=c(3,3,3))
m3d

# Can subset with one variable
# Follow column-major format by default
m2 <- matrix(data=1:9,ncol=3)
m2
m2[5]

# Or can populate by row
m2 <- matrix(data=1:9,ncol=3,byrow = TRUE)
m2


# Challenge 4 -------------------------------------------------------------

# 4.1 Given the following code:
m <- matrix(1:18, nrow=3, ncol=6)
print(m)

# Which of the following commands will extract the values 11 and 14?
m[2,4,2,5]  # A.
m[2:5]      # B.
m[4:5,2]    # C.
m[2,c(4,5)] # D.

# 4.2 For the following matrix
m <- matrix(data=1:16,nrow=4)
m
# you can use 
# rownames(m) and colnames(m)
# to inspect/set the rownams/colnames. Also remember the
# built-in arrays:
letters
LETTERS
# Use these to name the rows to use small letters and the
# columns with large letters. Use the row and column names
# to dereference the entry that has the value 16.

# 4.3 For the previous array only print out values that
#     lie between 6 and 10.

# 4.4 Set the values outside 6 to 10 range to 0 and print these
#     - best to work on a copy of the data.
m2 <- m

# List subsetting ---------------------------------------------------------

# Create a new list
xlist <- list(a = "Software Carpentry", b = 1:10, data = head(iris))
xlist

# So what do you think the following will return
xlist[1]
typeof(xlist[1])

# What about
xlist[1:2]

# To access an individual element
xlist[[1]]
typeof(xlist[[1]])

xlist[[1:2]]  # Oops, can only do one element at a time

xlist[[-1]]   # Oops, cannot skip elements

# You can use names to both subset and extract elements:
xlist[["data"]]

# Can short hand this
xlist$data



# Challenge 5 -------------------------------------------------------------

# 5.1 Given the following list:

xlist <- list(a = "Software Carpentry", b = 1:10, data = head(iris))

# Using your knowledge of both list and vector subsetting, extract the 
# number 2 from xlist. Hint: the number 2 is contained within the “b” item 
# in the list.

# 5.2 Given a linear model:

mod <- aov(pop ~ lifeExp, data=gapminder)

# Extract the residual degrees of freedom (hint: attributes() will help you),


# Data frames -------------------------------------------------------------


