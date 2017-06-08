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

# Has a set of allowed entries, otherwise it will insert an NA.
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

# Rownames still not quite right
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

# Challenge 1 -------------------------------------------------------------

# 1.1
# Remove the duplicated lines we added to the data frame

# 1.2
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
# Use rbind to add inforation for the people next to you.
#
# Use cbind to add an extra column specifying whether they prefer
# "tea", "coffee","juice" or "water"

# 1.3
# Create a cats2 data frame that re-arranges the order of the 
# columns of cats to have weight, coat, like_strings, age.

