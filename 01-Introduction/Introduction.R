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
#
# You can use the up arrow to cycle through previous commands and edit
# these as opposed to having to type the whole command.


# Using R as a calculator -------------------------------------------------

# Generally do this in the console
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

# Comparing things --------------------------------------------------------

1 == 1  # equality (note two equals signs, read as "is equal to")

1 != 2  # inequality (read as "is not equal to")

1 < 2  # less than

1 <= 1  # less than or equal to

1 > 0  # greater than

1 >= -9 # greater than or equal to

# Note
1 == 1.00001 # Take care with non-integers
all.equal(1,1.000001,tolerance=0.001) # Could use


# Variables and assignment ------------------------------------------------

# Assignment (note in R studio you can get the <- by typing Alt-)
x <- 1/40

# To see the value, also look at your Environment pane on R-studio
x

# You can use this variable with functions
log(x)

# Variable names can contain letters, numbers, underscores and periods. 
# They cannot start with a number nor contain spaces at all.

# You can reassign
x<-100

# Operate on 
x <- x+1   # See how it changes on the Environment pane

# You can also use
x = 100 # Not so common in the R community

# Can also use:
200 -> x  # Not so common but convenient sometimes


# Vectorization -----------------------------------------------------------

# R operates very well on vectors
1:5

# What will the following give me?
2^(1:5)

# Using variables
y<-1:5    # Look at the environment tag
2^y


# Managing your environment -----------------------------------------------

# Files stored in the global environment
ls()

# Note
.x <- 5   # Can you see this in the environment pane?

# Variables that begin with a . are hidden
ls(all.names = TRUE)  

# Type ls without the parentheses
ls      # you get the function listing

# You can remove variables (they could be using a lot of resources)
rm(x)    # Note the x has gone from the environment pane

# Can remove all variables
rm(list = ls())

# Check:
ls()
# but:
ls(all.names = TRUE)  

# Remove the variable .x explicitly
rm(.x)

# Check
ls(all.names = TRUE)  


# Packages ----------------------------------------------------------------


# Packages extend the functionality of R.
# There are lots of packages written by developers.
# Have a look at: https://cran.r-project.org/

# Find out what packages are installed:
installed.packages()

# If you want to install a new package:
# install.packages("packagename"), where packagename is the package name, in quotes.
# or in Rstudio
# Tools -> "Install Packages..."

# You can update packages:
# update.packages()
# or in Rstudio
# Tools -> "Check for Package Updates ..."

# Remove packages:
# remove.packages("packagename")

# To use a package you use the library command (without the quotes)
# library(packagename)


# Challenge 1 -------------------------------------------------------------

# 1.1
# Which of the following are valid R-names
min_height 
max.height
_age 
.mass
MaxLength
min-length
2widths
celsius2kelvin

# 1.2
# What will be the value of each variable after each statement 
# in the following program?
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20

# 1.3
# Calculate the Body Mass Index (BMI for a person)
height <-     # height in metres
weight <-     # weight in kg
bmi    <-     # bmi is the mass divided by the square of the height.

# 1.4
# Make sure you have the following packages installed:
# ggplot2, dplyr, gapminder

