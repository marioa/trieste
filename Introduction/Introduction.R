# Introduction to R
#
# This is a comment, anything that follows a hash to the end of the line will be ignored.
#
# To switch between windows on rStudio
#
# Cntr-1 - the source window
# Cntr-2 - the console
#
# To execute commands type:
#
# Cntr-Enter on Windows and Linux
# Cmd-Enter on Macs


##########################
# Using R as a calculator
##########################

1+100

# What follows is an incomplete command - to complete the command either complete it
# or type Esc to abort
1+

# Order of precendence:
#
# Parentheses: ( ... )
# Exponents: ^ or **
# Divide: /
# Multiply: *
# Add: +
# Subtract: -

3 + 5 * 2
(3 + 5) * 2

(3 + (5 * (2 ^ 2))) # hard to read
3 + 5 * 2 ^ 2       # clear, if you remember the rules
3 + 5 * (2 ^ 2)     # if you forget some rules, this might help

# Really small or large numbers get a scientific notation:
2/10000

# You can write numbers in scientific notation too:
5e3  # Note the lack of minus here

# Mathematical functions

sin(1)    # trigonometry functions
log(1)    # natural logarithm
log10(10) # base-10 logarithm
exp(0.5)  # e^(1/2)

# Use of tab completion to get a function
# Use of `?` to get help

###################
# Comparing things
###################

1 == 1  # equality (note two equals signs, read as "is equal to")

1 != 2  # inequality (read as "is not equal to")

1 < 2  # less than

1 <= 1  # less than or equal to

1 > 0  # greater than

1 >= -9 # greater than or equal to

# Note
1 == 1.00001 # Take care with non-integers
all.equal(1,1.000001,tolerance=0.001) # Could use

###########################
# Variables and assignment
##########################

# Assignment (note in R studio you can get the <- by typing Alt-)
x <- 1/40

# To see the value, also look at your Environment pane on R-studio
x

# You can use this variable with functions
log(x)

# You can reassigne
x<-100

# Operate on 
x <- x+1   # See how it changes on the Environment pane

# You can also use
x = 100 # Not so common in the R community

# Can also use:
200 -> x  # Not so common but convenient sometimes
