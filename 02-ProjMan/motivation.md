# Managing your projects with R studio

---

## Typical scenario

![Bad layout](imgs/bad_layout.png)

---

## Projects can rapidly become unwieldly

* Hard to tell which data is:
   * original data;
   * modified data;
* Mixing files with different extensions is messy;
* Can take a lot of time to find things;
* Difficult to relate figures to the generating code;

---

## Good project layout

* Will help you preserve the integrity of your data;
* Make it easier to share your code with:
   * a lab-mate, 
   * a collaborator, 
   * a supervisor;
* Facilitates uploading code with a paper submission;
* Makes it easier to resume a project after a break.

----

## Best practice

* Treat original data as read-only.
* Make cleaned data read-only too.
* Treat derived data as disposable.
   * Code can regenerate this data.

----

## Good enough practice

* Put each project in its own directory
  * Name the directory after the project.
* Put documentation in a `doc` directory.
* Put raw data and metadata in a `data` directory.
* Derived data goes in a `results` directory.
* Sources for scripts/programs go in a `src` directory. 
* External programs/compiled binaries go in a `bin` directory.
* Name all files to reflect their content or function.

