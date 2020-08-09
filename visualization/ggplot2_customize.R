### Customizing and Themes

library(tidyverse) 

df <- read_csv("data/BlueJays.csv")
head(df)


# Basic Scatterplot
ggplot(df, aes(x=Mass, y=Head) ) + geom_point()


ggplot(df, aes(x=Mass, y=Head) )  +
  geom_point() 


# Change the x-axis title
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  xlab("Mass in grams")


# Change the y-axis title
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  ylab("Head Size in mm")


# You can modify both at the same time
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  xlab("Mass in grams") +
  ylab("Head Size in mm")
  



# Add a title
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  ggtitle("Body Mass against Head Size in Blue Jays")


# Putting it all together
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  ggtitle("Body Mass against Head Size in Blue Jays") +
  xlab("Mass in grams") +
  ylab("Head Size in mm")


## You can also change default themes

# Changing default background themes
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  theme_minimal()

# Another option
ggplot(df, aes(x=Mass, y=Head) ) + 
  geom_point() +
  theme_classic()




