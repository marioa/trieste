# Introduction to R
#
# This is a comment, anything that follows a hash to the end of the line will be ignored.
# To execute commands type:
#
# Cnt-Enter on Windows and Linux
# Cmd-Enter on Macs

# Using R as a calculator.
1+100

# What follows is an incomplete command - to complete the command either complete it
# or type Esc to abort
1+

# Order of precendence:
#
# Parentheses: ( ... )
# Exponents: ^ or **
# Divide: /
# Multiply: *
# Add: +
# Subtract: -

3 + 5 * 2
(3 + 5) * 2

(3 + (5 * (2 ^ 2))) # hard to read
3 + 5 * 2 ^ 2       # clear, if you remember the rules
3 + 5 * (2 ^ 2)     # if you forget some rules, this might help

# Really small or large numbers get a scientific notation:
2/10000

# You can write numbers in scientific notation too:
5e3  # Note the lack of minus here

# Mathematical functions

sin(1)    # trigonometry functions
log(1)    # natural logarithm
log10(10) # base-10 logarithm
exp(0.5)  # e^(1/2)

# Use of tab completion to get a function
# Use of `?` to get help