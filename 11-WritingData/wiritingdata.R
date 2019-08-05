
# Saving plots ------------------------------------------------------------

# One of our previous plots:
ggplot(data = az.countries, aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + 
  facet_wrap( ~ country) +
  xlab("Year") +                                # x-axis label
  ylab("Life expectancy") +                     # y-axis label
  ggtitle("Figure 1") +                         # title
  scale_colour_discrete(name="Continent") +     # legend title
  theme(axis.text.x=element_blank(), axis.ticks.x=element_blank())

# We can save this using ggsave - guesses the type from the extension
ggsave("My_most_recent_plot.pdf")

# Can also save from the Rstudio file from the "Export" option in the "Plots"
# window.

# Writing directly to file without going through the plot window, i.e. 
# would be useful for a loop.

# Produce output as a pdf file
pdf("Life_Exp_vs_time.pdf", width=12, height=4)

# Plot the graph. Use az.countries otherwise your graph will be too busy.
ggplot(data=az.countries, aes(x=year, y=lifeExp,colour=country)) +
  geom_line()

# You then have to make sure to turn off the pdf device!
dev.off()


# Challenge 11.1  -------------------------------------------------------------

# 11.1.1 Rewrite your ‘pdf’ command to print a second page in the pdf, showing a 
#        facet plot (hint: use facet_grid) of the same data with one panel per 
#        continent.

# 11.1.2 Produce output to jpeg, use jpeg(). Note you will not do multipaged jpegs.

# 11.1.3 Produce output to png, use png(). Note you will not do multipaged jpegs.

# 11.1.4 Add the flag to your pdf() command "onefile=FALSE" *only* if you are using the pdf() 
#        output command and change the output filename to "Life_Exp_vs_time%03d.ext" 
#        where ext is pdf, png or jpeg depending on the output that you are using. 
#        What do you observe now?


# Writing data ------------------------------------------------------------

# You will also want to output data.
#  Let's only output data from  Australia.
aust_subset <- gapminder[gapminder$country == "Australia",]

write.table(aust_subset,
            file="../cleaned-data/gapminder-aus.csv",
           sep=","
)

# Check that the data looks ok. Need to go to the shell.

# Do not want:
#
# * Row numbers
# * Quoted content
#
?write.table


# Challenge 11.2 -------------------------------------------------------------

# 11.2.1 Modify the write.table command so that:
#
#  1. It does not print the rownames.
#  2. It does not quote the character or factor columns.

# 11.2.2 Write a data-cleaning script file that subsets the gapminder data to 
#     include only data points collected since 1990.
#
# Use this script to write out the new subset to a file in the 
# ../cleaned-data/ directory.


