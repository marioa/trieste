# Exploring data frames

# Adding columns and rows -------------------------------------------------

# Want to add a new column of ages
age <- c(2,3,5,12)
cats

# Add a column using cbind
cats <- cbind(cats, age)   # Oops!
 
# All columns (vectors) must be of the same length!
age  <- c(4,5,8)
cats <- cbind(cats, age)
cats

# Now try to add a new row.
# Need to use a list as they are mised data types.
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)         # Oops!

# coat is a factor
str(cats)

# Has a set of allowed entries (levels), otherwise it will insert an NA.
levels(cats$coat)

# We need to add "toritoseshell" to the allowed entries
levels(cats$coat) <- c(levels(cats$coat), 'tortoiseshell')
levels(cats$coat)

# Now we should be able to add the entry
cats <- rbind(cats, list("tortoiseshell", 3.3, TRUE, 9))

# Check
str(cats)    # Oops!

# Change the factor entry
cats$coat <- as.character(cats$coat)
str(cats)

# We could fix this by accessing inidivdual elements 
# (we shall use cats later on so make a copy)
cats2 <- cats
cats2
cats[4,1]
cats2[4,1] <- "tortoishell"
cats2

# You can also add a new column using
cats2["Colour"] <- c("green","red","blue","white","pink")

# Removing a column
cats2
names(cats2)
cats2[c("coat","weight","likes_string","age")]
cats2 <- cats2[c("coat","weight","likes_string","age")]
cats2

# You could also use the column indices
cats2[,1]
cats2[,c(1,2)]
cats2[,c(2,1)]

# We don't need this data frame any more
rm(cats2)

# Removing rows -----------------------------------------------------------

# Going back to cats we still have an NA ("Not available"/Missing value)
cats

# We can print out the results minus the 4th row by using:
cats[-4,]

# If we wanted to ignore more than one row we could use:
cats[c(-4,-5),]

# Another way to do it is to omit rows that have an NA
na.omit(cats)

# Lets reassign to cats
cats <- na.omit(cats)
cats

# Rownames still not quite right (no row 4)
rownames(cats) <- 1:nrow(cats)
cats

# We do not have to use numbers
rownames(cats) <- letters[1:nrow(cats)]
cats

# Reset, by setting to NULL
rownames(cats) <- NULL
cats

# Appending to a data frame -----------------------------------------------

# When adding data to a data frame:
#
#     columns are vectors or factors
#     rows are lists.
#

# Can also glue data frames together
cats <- rbind(cats, cats)
cats

# or a single row
cats <- rbind(cats,list("Cheshire",0,TRUE,152))
cats

# Challenge 5.1 -------------------------------------------------------------

# 5.1.1
# Remove the duplicated lines we added to the data frame

# 5.1.2
# You can create a data frame using:
df <- data.frame(id = c('a', 'b', 'c'),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)
# Create your own data frame that contains your:
#
#   first name
#   last name
#   lucky number
#
# Use rbind to add information for the people next to you.
#
# Use cbind to add an extra column specifying whether they prefer
# "tea", "coffee","juice" or "water"

# 5.1.3
# Create a cats2 data frame that re-arranges the order of the 
# columns of cats to have "weight", "coat", "likes_string", "age"
# data frame. Rename the columns of cats2 to use the capital
# LETTERS starting from N and use every second letter, i.e. 
# N (letter 14),P,R and T.

# Realistic example -------------------------------------------------------

# Make sure that you have the current directory set as your working 
# directory.
# You can find out what your current working directory is set by 
# doing:
getwd()

# We will load up some data that has been pre-downloaded:
gapminder <- read.csv("../data/gapminder-FiveYearData.csv")

# You could have downloaded this directly to your system using:
# 
# download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", 
#               destfile = "../data/gapminder-FiveYearData.csv")
# gapminder <- read.csv("../data/gapminder-FiveYearData.csv")
#
# For tab-separated value files (.tsv). 
# To specify a tab as a separator, use "\\t" or read.delim().
#
# You could read the file directly to your own R instance:
#
# gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv")
#
# You can use the readxl to read excel spreadsheets.
#

# Let's look at the gapminder data
View(gapminder)

# Or you could use
head(gapminder)

# Look at the structure
str(gapminder)

# Also look at the data types
typeof(gapminder$year)

typeof(gapminder$country)
class(gapminder$country)
str(gapminder$country)

# If we do:
length(gapminder) # Why not 1704?

# Clue
typeof(gapminder)

# To find the actual length
length(gapminder$country)

# Or more simply
nrow(gapminder)

# and
ncol(gapminder)

# or both at the same time
dim(gapminder)

# Can get the names of the columns
colnames(gapminder)

# or (same for data frames but not matrices and other data types)
names(gapminder)

# Challenge 5.2 -------------------------------------------------------------

# 5.2.1
# 
# Go to File -> New file -> R script, and write an R script to load in the 
# gapminder dataset. Put it in the scripts/ directory and add it to version 
# control.
#
# Run the script using the source function, using the file path as its argument 
# (or by pressing the “source” button in RStudio).

# 5.2.2
#
# Read the output of str(gapminder) again; this time, use what you’ve learned about 
# factors, lists and vectors, as well as the output of functions like colnames and 
# dim to explain what everything that str prints out for gapminder means. If there 
# are any parts you can’t interpret, discuss with your neighbors!
