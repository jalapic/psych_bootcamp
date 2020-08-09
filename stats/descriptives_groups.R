### Descriptives for Groups...


### Often in a dataset you have groups

# you might want to get means/standard deviations for each group


library(tidyverse)

# Read in the Data
wheels <- read_csv("data/wheels1.csv")

head(wheels)  # notice that this has a group column - strain

wheels$strain

table(wheels$strain)



# Getting overall summaries do not work.
# they just summarize over the whole column, not by groups.


summary(wheels) 

library(psych)

describe(wheels)


# this just gives the overall summary of data in each column, regardless of group

wheels$day1 #e.g. some of these numbers come from different strains.





### Summary stats by Group ---


#describeBy comes from 'psych' package

describeBy(wheels, group="strain")

# this is very quick and easy, but a bit annoying to look at.
# it also ignores missing data which is helpful



#### We can also write some custom code using 'dplyr'/'tidyverse'

head(wheels)


wheels %>%
  group_by(strain) %>%
  summarise(mean1 = mean(day1))




# as.data.frame just helps us see decimal places
wheels %>%
  group_by(strain) %>%
  summarise(mean1 = mean(day1)) %>%
  as.data.frame()



# if you had missing data, you'd do it like this
wheels %>%
  group_by(strain) %>%
  summarise(mean4 = mean(day4, na.rm=T)) %>%
  as.data.frame()


# you can do several summaries at once:
wheels %>%
  group_by(strain) %>%
  summarise(mean1 = mean(day1),
            sd1 = sd(day1),
            mean2 = mean(day2),
            sd2 = sd(day2)
            ) %>%
  as.data.frame()




### Or you can tell it to just do all numeric columns, e.g.

wheels %>%
  group_by(strain) %>%
  summarise_if(is.numeric, mean, na.rm = T) %>%
  as.data.frame()


wheels %>%
  group_by(strain) %>%
  summarise_if(is.numeric, sd, na.rm = TRUE) %>%
  as.data.frame()




