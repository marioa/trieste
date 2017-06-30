
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

# The opposite of gather() to spread our observation variables back out with spread().
set.seed(10)
(df <- data.frame(subject=1:10,
                  gender=sample(c("M","F"),10,replace = TRUE),
                  condition=sample(c("cond1","cond2","cond3","control"),10,replace=TRUE),
                  measurement=round(runif(10)*10,1)))
# The arguments to spread():
# - data: Data object
# - key: Name of column containing the new column names
# - value: Name of column containing values
spread(df,condition,measurement)

# Solet's move from a wide to the original format
gap_normal <- gap_long %>% spread(obs_type,obs_values)
dim(gap_normal)
names(gap_normal)

# Let's re-read the gapminder data (we modified it earlier).
gapminder <- read.csv("../data/gapminder-FiveYearData.csv", stringsAsFactors = FALSE)

# Compared to:
dim(gapminder)
names(gapminder)

# The order of the columns is different - fix this:
gap_normal <- gap_normal[,names(gapminder)]

# Test this has worked
all.equal(gap_normal,gapminder)

# Aside: be careful when comparing floating point values.
# What do you think the following will give?
0.3/3 == 0.1

# If you do:
0.3/3-0.1

# Eyeball inspection
head(gap_normal)
head(gapminder)

# The original was sorted by country, continent, then year.
gap_normal <- gap_normal %>% arrange(country,continent,year)
all.equal(gap_normal,gapminder)

# Finally convert the year to integers
gap_normal$year <- as.integer(gap_normal$year)
all.equal(gap_normal,gapminder)                   # Yay!

# Let's go back to wide. 
# We saw separate() (split columns), unite does the opposite.
(df <- data.frame(x = letters[1:5], y = LETTERS[1:5]))
unite(df,"xy",c("x","y"))

# For the wide format, we will keep country and continent as ID variables 
# and spread the observations across the 3 metrics (pop,lifeExp,gdpPercap) and 
# time (year).
gap_temp <- gap_long %>% unite(var_ID,continent,country,sep="_") # join country and continent columns
str(gap_temp)

# Remember:
unique(gap_temp$obs_type)

gap_temp <- gap_long                      %>%
  unite(ID_var,continent,country,sep="_") %>% # join country and continent columns
  unite(var_names,obs_type,year,sep="_")      # join obs_type and year
str(gap_temp)

gap_wide_new <- gap_long                  %>%
  unite(ID_var,continent,country,sep="_") %>% # join country and continent columns
  unite(var_names,obs_type,year,sep="_")  %>% # join obs_type and year
  spread(var_names,obs_values)                # var_name values become columns
str(gap_wide_new)


