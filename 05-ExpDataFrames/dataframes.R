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


