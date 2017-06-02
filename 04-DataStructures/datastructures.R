# Use of data structures in R

# Have a file on cat data in ../data/feline-data.csv.
# We want to read this data into R.
# Make sure you set the current working directory to where we this 
# file is located. Point to this file in the "Files" tab, click on 
# the gear wheel with "More" and choose "Set As Working Directory"
cats <- read.csv(file="../data/feline-data.csv")
cats    # Use this to view the contents on the console

# or navigate to the Environment tab and click on the cats variable
# or (gives a nicer layout)
View(cats)
