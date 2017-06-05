---

theme: sky
revealOptions:
    slideNumber: true

---

# Managing your projects with R studio

Note: The default keyboard shortcuts are:

* Up, Down, Left, Right: Navigation
* f: Full-screen
* s: Show slide notes
* o: Toggle overview
* . (Period or b: Turn screen black
* Esc: Escape from full-screen, or toggle overview

---

# Summary

---

## Base types 

<img src="imgs/types.png" alt="R atomic types" style="background:none; border:none; box-shadow:none;">

---

## Querying the data type

* Can query the data type using:
  * `typeof()`
  * `class()`
  * `mode()`
* Slightly different perspectives of the same thing

---

## Type coercion

<img src="imgs/coercion.png" alt="R type coercion" style="background:none; border:none; box-shadow:none;">

---

## R Data structures

* **vector** - 1d data must all be of the same type
* **matrix** - 2d data must all be of the same type
* **data.frame** - columns must be of the same type
* **factor** - stores categorical data
* **list** - generic data
* ...

---

## Vectors

* There are no scalars in R
   * A scalar is a vector of length 1
* All elements in a vector are of the same type
   * Be careful with type coercion

<img src="imgs/vector.png" alt="R vector" style="background:none; border:none; box-shadow:none;">

---

## Matrix

* Table of numbers all of the same type

<img src="imgs/matrix.png" alt="R matrix" style="background:none; border:none; box-shadow:none;">

---

## Data frame

* All the columns must be of the same type

<img src="imgs/df.png" alt="R data frame" style="background:none; border:none; box-shadow:none;">

---

## Lists

* Most generic data structure

<img src="imgs/list.png" alt="R list" style="background:none; border:none; box-shadow:none;">

* Types are preserved across the row

---

## Factors

* Used for categorial data.

<img src="imgs/factor.png" alt="An R factor" style="background:none; border:none; box-shadow:none;">

* We examine factors in more detail later on

