
# Introduction ------------------------------------------------------------

# Researchers often want to manipulate their data from the ‘wide’ to the ‘long’ 
# format, or vice-versa. ‘long’ format has:
# 
#  * each column is a variable
#  * each row is an observation
#
# For ‘wide’ format:
#  
# * each row is often a site/subject/patient
# * you have multiple observation variables containing the same type of data. 
# 
# Wide format is often more intuitive for humans as we can often see 
# more of the data on the screen due to it’s shape.
#
#            treatmenta treatmentb
# John Smith          —          2
# Jane Doe           16         11
# Mary Johnson        3          1
#
# Long format is more machine readable and is closer to the formatting of 
# databases. 
#
# person      treatment result
# John Smith          a      —
# Jane Doe            a     16
# Mary Johnson        a      3
# John Smith          b      2
# Jane Doe            b     11
# Mary Johnson        b      1
#


# Challenge 1 -------------------------------------------------------------

# 1.1 Is gapminder a purely long, purely wide, or some intermediate format?
str(gapminder)

# Getting started ---------------------------------------------------------

# You will need:
library(tidyr)
library(dplyr)
# If you do not have the tidyr package you will have to install it:
install.packages("tidy")


# From wide to long format with gather() ----------------------------------

# Read in a wide format of the gapminder data set
gap_wide <- read.csv("../data/gapminder_wide.csv", stringsAsFactors = FALSE)
str(gap_wide)
names(gap_wide)