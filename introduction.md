---

theme: sky
revealOptions:
    slideNumber: true

---

## Introduction

Note: The default keyboard shortcuts are:

* Up, Down, Left, Right: Navigation
* f: Full-screen
* s: Show slide notes
* o: Toggle overview
* . (Period or b: Turn screen black
* Esc: Escape from full-screen, or toggle overview

----

## Who I am

* Mario Antonioletti
   * m.antonioletti@epcc.ed.ac.uk
   * Work for EPCC (University of Edinburgh)
      * Software Sustainability Institute (SSI)
      * I am here with an SSI hat on

----

## Where I am from

<img src="imgs/map.png" alt="European map" style="background:none; border:none; box-shadow:none;">

Notes: 1936km, walking would take 341 hours including a ferry ride.
 
----

## EPCC

* [https://www.epcc.ed.ac.uk](http://www.epcc.ed.ac.uk)

----

## Software Sustainability Institute

<img src="imgs/BetterSoftware.png" alt="Better Software, Better Research" 
     style="background:none; border:none; box-shadow:none;">

* [https://www.software.ac.uk](http://www.software.ac.uk)


----

## The Carpentries

* Have been going since 1998
* Teach basic skills for research computing
* Focus on the basic *principles*
* Cannot teach you to program in 2 days but:
  * Provide you with enough to get started
  * Hopefully, motivate you to learn more
* Typically instructor types and you follow

---


## Postit notes

* You should have a:
  * **<font color="green">Green postit</font>** note: all ok
  * **<font color="red">Red postit</font>** note: trouble here
    * Helper should come along to help
* Consume these for feedback at the end of a topic
  * **<font color="green">Green</font>**: things you liked
  * **<font color="red">Red</font>**: things you did not like
* We shall distribute new postit notes

----

## Etherpad

* Allows us to communicate with you:
  * Post long URLs
  * Code snippets
  * Tips/Comments
* You can share your notes with others
  * http://pad.software-carpentry.org/dataTrieste17


---

## Big Data

> Big data is like teenage sex: everyone talks about it, nobody really knows how to do it, everyone thinks everyone
> else is doing it

<div align="right">
<small>
*Dan Ariely, <br>
Tweet on 6th Jan 2013*
</small>
</div>


---

### Conway data science Venn diagram

<div align="right">
<small>
From: http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram
</small>
</div>

<img src="imgs/Data_Science_VD.png" alt="Data Science Venn diagram." 
     style="background:none; border:none; box-shadow:none;">

---

### Data science process

<img src="imgs/datascience.png" alt="Process" style="background:none; border:none; box-shadow:none;">

From: http://128.148.32.110/courses/cs227/archives/2001/groups/custom/papers/1996-Fayyad.pdf

---

##### CRISP-DM (Cross Industry Standard Process for Data Mining) 

<img src="imgs/CRISP.png" alt="CRISP" style="background:none; border:none; box-shadow:none;">

Diagram from Wikipedia, see http://en.wikipedia.org/wiki/Cross_Industry_Standard_Process_for_Data_Mining

---

### Big data landscape


<img src="imgs/Big-Data-Landscape-2016-v18-FINAL_nobg.png" alt="Big Data Landsape." 
     style="background:none; border:none; box-shadow:none;">

<div align="right">
<small>
http://mattturck.com/big-data-landscape/
</small>
</div>

---

## Why learn R?

<img src="imgs/kdnuggets-survey.png" alt="kdnuggest survey." style="background:none; border:none; box-shadow:none;">

* Survey of 719 responses.

Notes: http://www.kdnuggets.com/2014/08/four-main-languages-analytics-data-mining-data-science.html

---

### Origins of R

* S: language for data analysis developed at Bell Labs circa 1976
   * Licensed by AT&T/Lucent to Insightful Corp. Product name: S-plus.
* R: initially written & released as OSS at U Auckland during 90s 
* Since 1997: international R-core team ~15 people & 1000s of code writers and statisticians

From: http://www.matthewckeller.com/Lecture1.ppt


---

### What we will cover - Day 1

* 14:00 - 14:55 1. Introduction to R and RStudio
* 14:55 - 15:25 2. Project Management w RStudio
* 15:25 - 15:45 3. Seeking Help
* 15:45 - 16:30 4. Data Structures
* 16:30 - 17:00 5. Exploring data frames
* 17:00 - 17:50 6. Subsetting data


---

### What we will cover - Day 2.1

* 08:30 - 09:35 7. Control flow
* 09:35 - 10:55 8. Creating Quality Graphics
* 10:55 - 11:30 9. Vectorisation
* 11:30 - 12:30 10. Functions Explained
* 12:30 - 12:50 11. Writing Data
* 13:00 - 14:00 **Lunch**

---

### What we will cover - Day 2.2

* 14:00 - 15:00 12. Split-Apply-Combine
* 15:00 - 15:55 13. DF Manipulation with dplyr
* 15:55 - 16:40 14. DF Manipulation with tidyr
* 16:40 - 17:55 15. Producing Reports With knitr
* 17:55 -       16. R and databases

---

## Guinea Pigs

<img src="imgs/guineapigs.png" alt="Picture of Guinea Pigs." style="background:none; border:none; box-shadow:none;">

Note: source https://pixabay.com/en/guinea-pig-black-and-white-animals-2121743/

---

#### The ethics of data: algorithm design

* There are increasing concerns that uncritical design of algorithms are
perpetuating cultural stereotypes.
* How can we raise awareness of programmes and algorithms that
perpetuate cultural stereotypes or injustices?
	* Google’s online advertising system, for instance, showed an ad
      for high-income jobs to men much more often than it showed the
      ad to women, as demonstrated by a study by Carnegie Mellon
      University researchers.

See: https://www.theguardian.com/technology/2015/jul/08/women-less-likely-ads-high-paid-jobs-google-study

---

### Getting started

* Start Rstudio
* File > New Project > Version Control > Git
   * **Repository URL**: https://github.com/marioa/trieste.git
   * **Project Directory Name:**
   * ** Create project as subdirectory of:**
* Now we can start ...
