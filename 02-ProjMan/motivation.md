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

## Typical project scenario

![Bad layout](imgs/bad_layout.png)

---

## Projects can rapidly become unwieldly

* Hard to tell which data is:
   * original data.
   * modified data.
* Mixing files with different extensions is messy.
* Can take a lot of time to find things.
* Difficult to relate figures to the generating code.

---

## Good project layout

* Will help you preserve the integrity of your data.
* Make it easier to share your code with:
   * a lab-mate. 
   * a collaborator. 
   * a supervisor.
* Facilitates association of code with publications.
* Makes it easier to resume a project after a break.

----

## Best practice

* Treat original data as read-only.
* Make cleaned data read-only too.
* Treat derived data as disposable.
   * Code can regenerate this data.

----

## Good enough practice

* Each project goes in its own directory.
  * Name the directory after the project.
* Documentation goes in a `doc` directory.
* Raw data/metadata goes in a `data` directory.
* Derived data goes in a `results` directory.
* Script/program sources go in a `src` directory. 
* Compiled code goes in a `bin` directory.
* Files are named to reflect their content/function.

