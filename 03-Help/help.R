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
