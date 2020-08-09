
### Introduction to ggplot2 


## Load libraries and data

library(tidyverse) 


df <- read_csv("data/BlueJays.csv")
head(df)


## Making a ggplot2 graph

ggplot()  #blank canvas

ggplot(df)   #just adding the datset to the blank canvas, but nothing plotted yet

ggplot(df, aes() )   #inside aes() we'll put what our x and y axis will be


ggplot(df, aes(x=Mass, y=Head) )   #we say what the x and y are, and it creates scales on each axis, but we didn't tell it what to plot yet


ggplot(df, aes(x=Mass, y=Head) ) + geom_point()


#What if we want to change the color of the points?
ggplot(df, aes(x=Mass, y=Head) ) + geom_point(color='red')



#What if we want to color the points based on another variable
ggplot(df, aes(x=Mass, y=Head, color = KnownSex) ) + geom_point() 






#####  Let's build up another example......

films <- read_csv("data/films.csv")


ggplot()

ggplot(films)

ggplot(films, aes() )

ggplot(films, aes(x=imdb, y=metacritic) )

ggplot(films, aes(x=imdb, y=metacritic) ) + geom_point()

ggplot(films, aes(x=imdb, y=metacritic) ) + geom_point(color='brown')







