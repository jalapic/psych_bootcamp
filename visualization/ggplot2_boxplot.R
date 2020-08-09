#### Boxplots ####


library(tidyverse)



# import and look at data

wheels <- read_csv("data/wheels1.csv")
head(wheels)
tail(wheels)


# we can use the following to get a bit more summary information

table(wheels$strain)

summary(wheels)



## Let's plot the data to examine the data:

# you can just plot the raw data points....

ggplot()

ggplot(wheels)

ggplot(wheels, aes() )

ggplot(wheels, aes(x = strain, y = total))

ggplot(wheels, aes(x = strain, y = total)) + geom_point()


# or instead, you can summarize the data with boxplots:

ggplot(wheels, aes(x = strain, y = total)) + geom_boxplot()  #notice the outlier

# the warning message is ok - it's saying some rows don't have data.



# you can overlay the points on the boxplot

ggplot(wheels, aes(x = strain, y = total)) + geom_boxplot() + geom_point()



# you can change the fill and the color of boxplots

ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(color="navy", fill="dodgerblue") 


# with points

ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(color="navy", fill="dodgerblue") +
  geom_point(color="navy")



### you can also make the points wobble a bit... 
# but careful it goes crazy...

ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(color="navy", fill="dodgerblue") +
  geom_jitter(color="navy")

# you can constrain it by setting a width value of how much wobble...
ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(color="navy", fill="dodgerblue") +
  geom_jitter(color="navy", width = .1) 

# add titles and labels etc.
ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(color="navy", fill="dodgerblue") +
  geom_jitter(color="navy", width = .1) +
  xlab("Mouse Strain") +
  ylab("Total Wheel Revolutions") +
  ggtitle("Wheel Running By Different Mouse Strains") +
  theme_classic()


# again, if you prefer on it's side, you can flip the axes:
ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(color="navy", fill="dodgerblue") +
  geom_jitter(color="navy", width = .1) + 
  coord_flip()



## a couple of other things you might want to try:

## Make the outlier more noticeable
ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot()
  

ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot(outlier.color = "green", outlier.size = 8)


# Some people prefer violin shapes to boxplots...
ggplot(wheels, aes(x = strain, y = total)) +  geom_violin()



## You can also color according to the x-axis category...

ggplot(wheels, aes(x = strain, y = total)) + 
  geom_boxplot()


ggplot(wheels, aes(x = strain, y = total, fill = strain)) + 
  geom_boxplot()


# adding points
ggplot(wheels, aes(x = strain, y = total, fill = strain)) + 
  geom_boxplot() +
  geom_jitter(width=.1)




