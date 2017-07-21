library(pdftools)    # Package to download pdf content and convert to text
library(rworldmap)   # Package to plot a map.

# Get the attendees file
pages <- pdf_text("http://indico.ictp.it/event/7974/material/2/0.pdf")

# First 4 pages contain directors/tutors/lecturers
# Double [[]] to get at the contents and not more paginated text.
attendees <- paste(pages[[5]],pages[[6]],pages[[7]])

# Use cat(attendees) to view the contents
# cat(attendees)

# Split text into separate lines
lines <- strsplit(attendees,"\\n")
l <- as.vector(lines[[1]])

# Remove the first row, e.g. Participants
l <- l[-1]

# Remove lines that start with more than 4 spaces
l2 <- l[!grepl("^    ",l,perl=TRUE)]

# Amend Venezuela entry - problematic
l2 <- gsub(" \\(the Bolivarian Republic of\\)","",l2)

# Remove Ayele Eyuel as they have no affiliation
l2 <- l2[!grepl("Ayele Eyuel",l2)]

# Caputre most of the countries - could hone in the regular
# expression but easier to clean up the entries that are still
# wrong. Regular expression: "(\\w+\\s){0,3}[\\w']+$"
# (\\w+\\s){0,3} - zero or up to 3 instances of words separated by a single space
# [\\w']+$ - a word at the end of the line, the "'" is for Cote d'Ivoire.
m <- gregexpr("(\\w+\\s){0,3}[\\w']+$", l2, perl=TRUE)
(countries <- as.vector(unlist(regmatches(l2, m))))

# Fix remaining problematic entries:
# "Science Education and India"
countries <- gsub("Science Education and India","India",countries)
# "s Republic of China"
countries <- gsub("s Republic of China","China",countries)
# "Mathematics and Cuba"
countries <- gsub("Mathematics and Cuba","Cuba",countries)
# "the Republic of Sudan"
countries <- gsub("the Republic of Sudan","Sudan",countries)
# "College of Philippines"
countries <- gsub("College of Philippines","Philippines",countries)

# Tabulate frequency of attendees from different countries
#countrytab <- table(countries)
countrytab <- table(c(countries[-5],"Costa Rica"))

# Create a data frame from the tabulated data
cc <- data.frame(countries=names(countrytab),
                 Freq=as.numeric(countrytab),
                 stringsAsFactors = FALSE)

# Join the country codes to the data - using stack overflow 24136868
spdf <- joinCountryData2Map(cc,joinCode="NAME", nameJoinColumn="countries")

# Plot the resulting map
mapCountryData(spdf, nameColumnToPlot="Freq", 
               catMethod="fixedWidth",mapTitle="Origin of Participants")

