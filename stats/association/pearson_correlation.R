#### Pearson Correlation Introduction


### loading libraries ----

library(tidyverse)


### loading data ----

jays <- read_csv("data/BlueJays.csv")

jayM <- jays %>% filter(KnownSex == "M") # we'll just look at Males

nrow(jayM) # 63 observations

head(jayM)



## First let's make Scatterplots ----

# e.g. Body Mass against Head Size

ggplot(jayM, aes(x=Mass, y=Head)) + 
  geom_point(shape = 21, color = "navy", fill = "dodgerblue")


# it looks like there is an association.
# we can directly measure the Pearson's 'r' with "cor"


# remember that df$colname gives you all the data in that column

jayM$Mass

cor(jayM$Mass, jayM$Head)  # r = 0.58,  a strong positive correlation.


# and of course it doesn't matter which way round you write it

cor(jayM$Head, jayM$Mass)   # same result.



# just a note - if you have missing data NA... use this instead...

cor(jayM$Head, jayM$Mass, use = "everything") 





# If you wish to you can add a line of best fit to your data like this:

ggplot(jayM, aes(x=Mass, y=Head)) + 
  geom_point(shape = 21, colour = "navy", fill = "dodgerblue") +
  stat_smooth(method="lm", se=F)



## To do a Pearson Correlation, the data should be approximately normal
# this can be tested using various tests e.g.


## Test for normality using Shapiro-Wilks tests and QQ Plots ----

shapiro.test(jayM$Mass)  # P > 0.05, therefore cannot reject null that data is not normal
shapiro.test(jayM$Head)  # P > 0.05, therefore cannot reject null that data is not normal

qqnorm(jayM$Mass)
qqline(jayM$Mass, col = "steelblue", lwd = 2)

qqnorm(jayM$Head)
qqline(jayM$Head, col = "steelblue", lwd = 2)





### Significance testing----

# the default is to run a 2-tailed test.

cor.test(jayM$Head, jayM$Mass)  

cor.test(jayM$Head, jayM$Mass, conf.level = 0.99)  #note that you can specify confidence intervals




## you can do 1-tailed tests also...

# testing null hypothesis that r is not greater than 0
# i.e. is my correlation meaningfully positive ?

cor.test(jayM$Head, jayM$Mass, alternative = "greater") 



# testing null hypothesis that r is not smaller than 0
# i.e. is my correlation meaningfully negative ?

cor.test(jayM$Head, jayM$Mass, alternative = "less") 









