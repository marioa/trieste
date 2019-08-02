## 1. Introduction

* 1.1 Which of the following are valid R-names?
    * `min_height` - valid.
    * `max.height` - valid.
    * `_age` - not valid, must starts with either a letter or a dot not followed by a number.
    * `.mass` - valid.
    * `MaxLength` - valid.
    * `min-length` - valid.
    * `2widths` - not valid, starts with a number.
    * `celsius2kelvin` - valid.

* 1.2 What will be the value of each variable after each statement in the following program?
    * `mass <- 47.5` - 47.5
    * `age <- 122` - 122.
    * `mass <- mass * 2.3` - 109.25
    * `age <- age - 20` - 102.

* 1.3 Calculate the Body Mass Index (BMI for a person)

```
height <- 1.72               # height in metres
weight <- 82                 # weight in kg
bmi    <-  weight/height^2   # bmi is the weight divided by the square of the height.
# or
bmi <- weight/(height*height)
```
## 12. Split-Apply-Combine

* 1.1 Calculate the average life expectancy per continent. 
      Which has the longest? Which had the shortest?
```
ddply(.data=gapminder,
      .variables="continent",
      .fun=function(x){c(mean=mean(x$lifeExp))}
)
```

* 1.2 Calculate the average life expectancy per continent and year. 
  Which had the longest and shortest in 2007? Which had the greatest change in between 1952 and 2007?

```
gap_year_cont<- ddply(.data=gapminder,
                      .variables = c("continent","year"),
                      .fun=function(x){c(mean=mean(x$lifeExp))})
```
* 1.3 Calculate the difference in mean life expectancy between the years 1952 and 2007 from the output of challenge 2 using one of the `plyr` functions.

```
ddply(.data=gap_year_cont,
.variables = "continent",
.fun=function(x){c(lifexpDiff=x$mean[x$year==2007]-x$mean[x$year==1952])})
```

## 2. Project Management

* 2.1.3 Modify your Readme.md

 Modify your Readme.md file (add/remove content as you like).
 Save the file, commit the file (go to the Git panel select the file
 and then click on Commit). A window will come up where you need to put
 in a sensible commit message. Once this is done click on the Push button
 and that should push the contents to GitHub - do you see those changes?

* 2.1.4 Remotely modify your Readme.md

 On GitHub click on the Readme.md file. Select Edit (the pencil), modify the content
 and save (add a sensible commit message there as well).

 In Rstudio click on the Pull button. Do you see the changes you made being ported back to your local Readme.md version?

* 2.1.5 Ignoring files

 1. Create a directory within your project called graphs (in the files
    view click on the "New Folder" item).
 2. Modify the `.gitignore` file to contain graphs/ so that this 
    disposable output isn’t versioned.
 3. Commit your `.gitignore` file.
 4. Push the content.

 If you have managed to do all these steps you should now be in a position to  use Rstudio with GitHub (or any other remote git repository).

## 3. Getting help

* 3.1.1 what does the `c` function do?
 What do the following give you?
```
c(1, 2, 3)
c('d', 'e', 'f')
c(1, 2, 'f')
```
These are called vectors, more about these later.

* 3.1.2 what does the paste function do?
```
x <- c("fred","john")               Create a vector 
paste(x,"one","two","three")
```
 What do the optional arguments "sep" and "collapse" do?
 i.e. `paste(x,"one","two","three", sep="-")`
What is the difference between `paste` and `paste0`?

*  3.1.3: how would you read a comma separated values (csv)
      type file that is tab (\t) delimited instead?<br\>
 **Hint**: use `??csv` to see what is available

## 10. functions

* 10.2.1 Test the GDP function by calculating the GDP for New Zealand in 1987. How does this differ from New Zealand’s GDP in 1952?

* 10.2.2 The paste function can be used to combine text together, e.g:
```
best_practice <- c("Write", "programs", "for", "people", "not", "computers")
paste(best_practice, collapse=" ")
```
 Write a function called `fence` that takes two vectors as arguments,  called text and wrapper, and prints out the text wrapped with the wrapper:
````
  fence(text=best_practice, wrapper="***")
````
Note: the paste function has an argument called `sep`, which specifies the separator between text. The default is a space: “ “. The default for `paste0` is no space “”.

## 11. split apply combine

*  11.1.1 Calculate the average life expectancy per continent.
        Which has the longest? Which had the shortest?

 * 11.1.2 Calculate the average life expectancy per continent and year.
        Which had the longest and shortest in 2007? Which had the greatest
        change in between 1952 and 2007?

 * 11.1.3 Calculate the difference in mean life expectancy between the years
        1952 and 2007 from the output of challenge 2 using one of the `plyr`
       functions.

## 13. dplyr

* 31.1.1 Write a single command (which can span multiple lines and includes pipes)
             that will produce a dataframe that has the African values for `lifeExp`, 
            `country` and `year`, but not for other Continents. How many rows does 
            your dataframe have and why?

```
gapminder                   %>%
filter(continent=="Africa") %>%
select(year,country,lifeExp) -> lcy

nrow(gapminder)   # 1704
nrow(lcy)         #  624
```

* 13.2.1 Calculate the average life expectancy per country.
             Which has the longest average life expectancy and 
            which has the shortest average life expectancy?

```
gapminder                            %>%
group_by(country)                    %>%
summarize(AverageLife=mean(lifeExp)) %>%
filter(AverageLife==min(AverageLife)|AverageLife == max(AverageLife))
```

* 13.2.2 Do the same thing but using the arrange() and desc() functions.

```
# For the min
gapminder                            %>%
group_by(country)                    %>%
summarize(AverageLife=mean(lifeExp)) %>%
arrange(AverageLife)

# For the max
gapminder                            %>%
group_by(country)                    %>%
summarize(AverageLife=mean(lifeExp)) %>%
arrange(desc(AverageLife))
```

* 13.3.1 Calculate the average life expectancy in 2002 of 2 randomly selected 
      countries for each continent. Then arrange the continent names in 
      reverse order.<br>
      **Hint**: Use the dplyr functions arrange() and sample_n(), they have 
      similar syntax to other dplyr functions.

```
gapminder                                %>%
   filter(year==2002)                    %>%
   group_by(continent)                   %>%
   sample_n(2)                           %>%            # sample 2 rows per continent
   summarize(mean_lifeExp=mean(lifeExp)) %>%
   arrange(desc(mean_lifeExp))
```

## 14. tidyr

* 14.1.1 Is gapminder a purely long, purely wide, or some intermediate format?

* 14.1.2 Using `gap_long`, calculate the mean life expectancy, population, and `gdpPercap` 
     for each continent. Hint: use the `group_by()` and `summarize()` functions we l
     earned in the `dplyr` lesson

```
gap_long %>% group_by(continent,obs_type) %>% summarise(mean=mean(obs_values))

```

## 16. R and SQL

* 16.1.1 Write a query that returns the number of rodents observed in each plot in each
             year.<br>
    **Hint**: Connect to the species table and write a query that joins the species and
      survey tables together to exclude all non-rodents. The query should return
      counts of rodents by year.
```      
(species <- tbl(mammals,"species"))
(species %>% 
       filter(taxa == "Rodent") %>%
        inner_join(surveys) %>%
        group_by(species,year) %>%
        tally() %>%
        collect() -> rodents)
```

* 16.1.2 Write a query that returns the total number of rodents in each genus caught
      in the different plot types.<br>
      **Hint**: Write a query that joins the species, plot, and survey tables together.
            The query should return counts of genus by plot type.

```
# There is nothing in species that we can join with plots so we must perform
# a preliminary join between surveys and plots.
surveys %>% inner_join(plots) %>% select(species_id,plot_type)-> surveys_plots

(
species                           %>% 
       filter(taxa=="Rodent")     %>% 
       inner_join(surveys_plots)  %>%
       group_by(genus,plot_type)  %>%
       tally()                    %>%
       collect() -> rodentcount
)
# or
(
surveys_plots                    %>%
       inner_join(species)       %>%
       group_by(genus,plot_type) %>%
       tally()                   %>%
       collect() -> rodentcount
)

# The whole thing can be made more compact
(
inner_join(surveys,plots)              %>%   # Do the inner join
          select(species_id,plot_type) %>%   # Reduce the amount of output
          inner_join(species)          %>%   # Join with species
          group_by(genus,plot_type)    %>% 
          tally()                      %>%
          collect() -> rodentcount
)
```

* 16.2.1 Add the remaining species table to the my_db database and run some of your queries from earlier in the lesson to verify that you have faithfully recreated the mammals database.

```
copy_to(my_db, myspecies,temporary = FALSE)
```