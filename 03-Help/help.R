
# Getting help ------------------------------------------------------------

# To get help on any function, use setwd as an example here:

help(setwd)

# equivalent 

?setwd

# Help divided into sections which may consist of (and there may be others):
#
# *Description*: An extended description of what the function does.
# *Usage*: The arguments of the function and their default values.
# *Arguments*: An explanation of the data each argument is expecting.
# *Details*: Any important details to be aware of.
# *Value*: The data the function returns.
# *See Also*: Any related functions you might find useful.
# *Examples*: Some examples for how to use the function.
#

# To look for special operators use quotes
?"+"

# Help on packages. Some packages come with vignettes.
# “vignettes”: tutorials and extended example documentation

# To list what is available
vignette()

# To find out what is available for a specific package:
library(ggplot2)
vignette(package="ggplot2")
vignette("ggplot2-specs")

# Alternatively you can do:
help(ggplot2)

# When you want to perform a search (partially remember a command)
??set

# When you are not sure what packages might be of use to you the if
# you to want to see what is available:
#
# https://cran.r-project.org/web/views/
#

# Other sources of help:
# 
# 1. Google - http://www.google.co.uk
# 2. Stack Overflow - https://stackoverflow.com/
#
# You can search using the the [r] tag.

# If you need to ask a question you may have to provide
# sample data that demonstrates your problem or use

?dput

# And provide information about your environment:

sessionInfo()

# Things to pick out are:
#
#     Version of R you are using
#     Platform
#     Operating System
#     Particular version of a package that you are using

#############################################
# Challenge 1: what does the "c" function do?
#############################################
# What do the following give you?
c(1, 2, 3)
c('d', 'e', 'f')
c(1, 2, 'f')

# These are called vectors, more about this later.

###############################################
# Challenge 2: what does the paste function do?
###############################################
x <- c("fred","john")              # Create a vector 
paste(x,"one","two","three")

# What do the optional arguments "sep" and "collapse" do?

# What is the difference between paste and paste0?

################################################################
# Challenge 3: how would you read a comma separated values (csv)
#              file that are tab (\t) delimited?
################################################################
# Hint: use ??csv to see what is availble

