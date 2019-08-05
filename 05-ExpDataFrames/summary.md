---

theme: sky
revealOptions:
    slideNumber: true

---

# Summary

Note: The default keyboard shortcuts are:

* Up, Down, Left, Right: Navigation
* f: Full-screen
* s: Show slide notes
* o: Toggle overview
* . (Period or b: Turn screen black
* Esc: Escape from full-screen, or toggle overview

---

## Creating data frames

* Read in a csv file using `read.csv()`
   * `stringsAsFactors`

---

## Adding/Removing data from a data frame

* Use `cbind()` to add a new column 
* Use `rbind()` to add a new row 
* Remove rows from a data frame.
* Use `na.omit()` to remove rows from a data frame with NA values.
* Use `levels()` and `as.character()` to explore and manipulate factors.

---

## Looking at the structure

* To query the structure of data frames:
   * `str()`, 
   * `nrow()`,
   * `ncol()`, 
   * `dim()`, 
   * `colnames()` or `names()`, 
   * `rownames()`, 
   * `head()` and `tail()` 
   * `typeof()` or `class()` 
