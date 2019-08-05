
# Introduction ------------------------------------------------------------

# Allow dynamic reports to be created using R markdown.
# Can mix code and documentation.


# Creating an R Markdown file ---------------------------------------------

# Make sure you have set your working directory to be this directory.
# Create an R markdown document: File → New File → R Markdown


# Markdown ----------------------------------------------------------------

#   <--- Level 1 header in Markdown
##  <--- Level 2 header
### <---- Level 3 header, and so on ...

# * or - at the beginning of the line gives you an unordered list
# * bullet
#    * nested bullet list (4 spaces in)
# 1. At the beginning of the line gives you a numbered list, can also
# 1. use 1. 2. 3. ... or any number
# 1.

# *italics* or _italic_
# **bold** or __bold__
# ***bold with italics***


# Challenge 15.1 -------------------------------------------------------------

# 15.1 Remove the sections in your own markdown document and try some of the
#      markdown objects described above or in RStudio 
# `Help -> Markdown Quick Reference`.


# More markdown -----------------------------------------------------------

# Hyperlinkds [linked text](URL)
# Including an image ![caption](URL or directory of image)
# Subscripts x~1
# Superscripts c^2
# If you know how to use Latex you can put Latex equations using $ $ or $$ $$ 


# R code chunks -----------------------------------------------------------

# You can add bits of code

# ```{r load_data}
# gapminder <- read.csv("~/Desktop/gapminder.csv")
# ```

# load_data is the code chunk name, must be unique within the document


# Challenge 15.2 -------------------------------------------------------------

# 15.2 Add code chunks to your existing document that:
# 
# * Load the ggplot2 package
# * Reads the gapminder data
# * Creates a plot


# How things get compiled -------------------------------------------------

#                     +-- .md --+
#                    /           \
# .Rmd ---- knitr --+             +-- pandoc --> html/pdf/word
#                    \           /
#                     +-- figs--+
#
# More on pandoc http://pandoc.org/


# Chunk options -----------------------------------------------------------

# * Use echo=FALSE to avoid having the code itself shown.
# * Use results="hide" to avoid having any results printed.
# * Use eval=FALSE to have the code shown but not evaluated.
# * Use warning=FALSE and message=FALSE to hide any warnings or messages produced.
# * Use fig.height and fig.width to control the size of the figures produced (in inches).

# ```{r load_libraries, echo=FALSE, message=FALSE}
# library("dplyr")
# library("ggplot2")
#```

# Can set global options
# ```{r global_options, echo=FALSE}
# knitr::opts_chunk$set(fig.path="Figs/", message=FALSE, warning=FALSE,
#                       echo=FALSE, results="hide", fig.width=11)
# ```

# The fig.path option defines where the figures will be saved. 
# The / here is really important; without it, the figures would be saved in the 
# standard place but just with names that being with Figs.

# If you have multiple R Markdown files in a common directory, you might want to 
# use fig.path to define separate prefixes for the figure file names, like 
# fig.path="Figs/cleaning-" and fig.path="Figs/analysis-".


# Challenge 15.3 -------------------------------------------------------------

# 15.3 Use chunk options to control the size of a figure and to hide the code.


# Inline R code -----------------------------------------------------------

# You can inline R code by using `r and ` for an in-line code chunk, 
# like so: `r round(some_value, 2)`

# Must not let quoted lines be split across lines.


# Challenge 15.4 -------------------------------------------------------------

# 15.4  Try out a bit of in-line R code.


# Other output options ----------------------------------------------------

# You can also convert R Markdown to a PDF or a Word document. 
# Click the little triangle next to the “Knit HTML” button to get a drop-down menu. 
# Or you could put pdf_document or word_document in the header of the file.


