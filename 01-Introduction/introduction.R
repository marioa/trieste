
# Introduction to R -------------------------------------------------------
#
# This is a comment, anything that follows a hash to the end of the line will be ignored.
#
# To switch between windows in RStudio:
#
# Cntr-1 - the source window*
# Cntr-2 - the console
# Cntr-3 - the help window
# Cntr-4 - the history window*
# Cntr-5 - the files window*
# Cntr-6 - the plots window*
# Cntr-7 - the packages window*
# Cntr-8 - the environment window*
# Cntr-9 - the Git/SVN window*
# Cntr-0 - show build
#
# If you click Cntr-Shift you maximise that windows functions with a * above. 
# Repeat command to minimise again.
#
# To execute commands type in the Source window (this window):
#
# Cntr-Enter on Windows and Linux
# Cmd-Enter on Macs
#

print("Hello World!")

#
# You can use the up arrow to cycle through previous commands (history) and edit
# these as opposed to having to type the whole command again.
#
# Using Code sections (Code->Insert Section....)
# or you can do it by hand: hash text followed by at least 3 dashes.
#
# Allows you to navigate through code nicely (top right of the source window
# gives you a table of contents).
# 
# Can fold source:
#                     Windows       Mac
# Fold All            Alt-O         Cmd-Option-O
# Unfold All          Shift-Alt-O   Shift-Cmd-Option-O
#
# Can also open/close sections by clicking on the small triangles next to the 
# line numbers.
#
# Nice cheat sheet on Rstudio:
#
#   https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf
#

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
1.0 == 1.00001   # Take care with non-integers
1.0 == 3.0/3
0.1 == 0.3/3
0.3/3-0.1
all.equal(0.1,0.3/3,tolerance=0.001) # Could use this instead


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


# Challenge 1.1 -------------------------------------------------------------

# 1.1 Which of the following are valid R-names?
min_height 
max.height
_age 
.mass
MaxLength
min-length
2widths
celsius2kelvin

# 1.2 What will be the value of each variable after each statement 
# in the following program?
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20

# 1.3 Calculate your Body Mass Index (BMI for a person)
height <-     # height in metres
weight <-     # weight in kg
bmi    <-     # bmi is the weight divided by the square of the height.

# 1.4 Install or make sure the following packages are installed:
#
#     ggplot2, dplyr, ProjectTemplate,dplyr, tidyr, dbplyr, RSQLite
#
# You will need these for future lessons
# install.packages(c("ggplot2", "ProjectTemplate","dplyr", "tidyr", "dbplyr", "RSQLite"))
# tidyverse includes ggplot2, dplyr, tidyr and others

install.packages(c("tidyverse","ProjectTemplate","dbplyr","RSQLite"))

# You can test that this has worked by running each of the following lines:
library(PhoneyLibrary) # This will give you the error will see if it has not worked.
#library(ggplot2)
#library(dplyr)
#library(tidyr)
library(tidyverse)
library(ProjectTemplate)
library(dbplyr)
library(RSQLite)
