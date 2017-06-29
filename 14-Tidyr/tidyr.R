
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

# First task is to gather - we can use with dplyr.
# Checkout tidyverse: http://tidyverse.org/ for a collection
# of packages that work well together.

# Gather  observation variables into a single variable.
(gap_long <- gap_wide %>%
  gather(obstype_year,              # New column with the gathered observations
         obs_values,                # New column with the values of each observation
         starts_with('pop'),        # What we will put in the observation, 
         starts_with('gdpPercap'),  
         starts_with('lifeExp')     # start_with() will grabe th right dat.
         )
  )
str(gap_long)
names(gap_long)

# Can exclude cols using a "-" to signify which variables to exclude from the
# gather
(gap_long2 <- gap_wide %>% gather(obstype_year,obs_values,-continent,-country))
str(gap_long2)
names(gap_long2)

# obstype_year contains 2 pieces of information:
#
# * the observation type (pop,lifeExp, or gdpPercap)
# * the year
#
# Can use the separate() function to split the character strings into multiple 
# variables.

# separate() turns a single character column into multiple columns
(df <- data.frame(x = c("a.m", "a.b", "a.d", "b.c")))
df %>% separate(x, into=c("A", "B"))


# So...break obstype_year -> c("obs_type","year")
(gap_long <- gap_long %>% separate(obstype_year,into=c('obs_type','year'),sep="_"))
head(gap_long)
typeof(gap_long$year)
gap_long$year <- as.integer(gap_long$year)
typeof(gap_long$year)


# Challenge 2 -------------------------------------------------------------

# 2.2 Using gap_long, calculate the mean life expectancy, population, and gdpPercap 
#     for each continent. 
#
#     Hint: use the group_by() and summarize() functions we learned in the dplyr lesson.




# From long to intermediate format with spread() --------------------------




