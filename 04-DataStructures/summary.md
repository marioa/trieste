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

## Type coercion

<img src="imgs/coercion.png" alt="R type coercion" style="background:none; border:none; box-shadow:none;">

---

## R Data structures

* **vector** - 1d data must all be of the same type
* **matrix** - 2d data must all be of the same type
* **data.frame** - columns must be of the same type
* **factor** - sotres categorical data
* **list** - generic data

---

## Vectors

* There are no scalars
   * A scalar is a vector of length 1
* Be careful with type coercion

x <- c(1L,TRUE,3+i,'4',5.0)

