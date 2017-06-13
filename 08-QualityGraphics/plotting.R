
# Plotting with ggplot ----------------------------------------------------

# ggplot2 is (one of) the most popular plotting packages in R
#
# ggplot2 is built on the grammar of graphics, the idea that any plot can be 
# expressed from the same set of components: 
#
# * a data set, 
# * a coordinate system, and 
# * a set of geoms–the visual representation of data points.
#
# Think that we are building a graph in layers.
#

# Load the ggplot2 package
library(ggplot2)

# Plotting the lifeExp against  the gdpPercap 
# Note: the "+" must always be at the end of the line.
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Breaking this down"
# Base layer
(g <-  ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)))
# Data is the gapminder dataframe
# Aestethics are give in the aes term. These apply globally.
# x and y point to column names in the data frame.

# Next stage is to add a geom. Use points in this case,
# to produce a scatter plot.
g + geom_point()


# Challenge 1 -------------------------------------------------------------

# 1.1 Modify the example so that the figure shows how life expectancy has 
#     changed over time:

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point()

# Hint: the gapminder dataset has a column called “year”, which should 
#       appear on the x-axis.

# 1.2 In the previous examples and challenge we’ve used the aes function to 
#     tell the scatterplot geom about the x and y locations of each point. 
#     Another aesthetic property we can modify is the point colour. Modify 
#     the code from the previous challenge to color the points by the 
#     “continent” column. What trends do you see in the data? 
#     Are they what you expected?

# NB ggplot2 will accept either British or American spelling, e.g. colour vs color.

# Layers ------------------------------------------------------------------

# Using a line plot
# Notethat we have added a "by=country" this tells ggplot to plot a line by
# country.
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, colour=continent)) +
  geom_line()

# Using both lines and points
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country, colour=continent)) +
       geom_line() + 
      geom_point()  # Points drawn on top of lines

# Show this by taking the colour out of the global to a local option
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
       geom_line(aes(colour=continent)) + 
       geom_point()

# Using aesthetic as a mapping to a variable in the data, e.g. colour
# or geom_line(aes(colour=continent)), ggplot will give a different color 
# to each continent. If you wanted to do a change to all lines you would
# use geom_line(colour="blue")
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_line(color="blue") + 
  geom_point()

# or just for the points
ggplot(data = gapminder, aes(x=year, y=lifeExp, by=country)) +
  geom_line(aes(colour=continent)) + 
  geom_point(colour="blue")

# Challenge 2 -------------------------------------------------------------


