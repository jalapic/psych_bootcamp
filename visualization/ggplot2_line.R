## Line graph - connecting values (y-axis) over time (x-axis)

library(tidyverse)

jennifer <- read_csv("data/jennifer.csv")


head(jennifer)
tail(jennifer)


# Let's build up a line graph
ggplot()

ggplot(jennifer) 

ggplot(jennifer, aes() ) 

ggplot(jennifer, aes(x=year, y=n) ) 

ggplot(jennifer, aes(x=year, y=n) ) + geom_point() # look at data as points

ggplot(jennifer, aes(x=year, y=n) ) + geom_line() # instead use a line

# Can add point and line
ggplot(jennifer, aes(x=year, y=n) ) + 
  geom_point() +  
  geom_line() 


# Can Change Color of Line
ggplot(jennifer, aes(x=year, y=n) ) + 
  geom_line(color = "purple")

# this doesn't color points though
ggplot(jennifer, aes(x=year, y=n) ) + 
  geom_point() +
  geom_line(color = "purple") 


# change both colors
ggplot(jennifer, aes(x=year, y=n) ) + 
  geom_point(color = "violet") +
  geom_line(color = "purple") 



# Customize axis labels and title
ggplot(jennifer, aes(x=year, y=n) ) + 
  geom_line(color = "purple") +
  xlab("Year") +
  ylab("Number of Children Born") +
  ggtitle("Popularity of Name Jennifer in USA")


# Change width of lines
ggplot(jennifer, aes(x=year, y=n) ) + geom_line()

ggplot(jennifer, aes(x=year, y=n) ) + geom_line(lwd=2)

ggplot(jennifer, aes(x=year, y=n) ) + 
  geom_line(color = 'purple', lwd=2)


# Change style of lines

ggplot(jennifer, aes(x=year, y=n) ) + geom_line()

ggplot(jennifer, aes(x=year, y=n) ) + geom_line(lty=1)
ggplot(jennifer, aes(x=year, y=n) ) + geom_line(lty=2)
ggplot(jennifer, aes(x=year, y=n) ) + geom_line(lty=3)
ggplot(jennifer, aes(x=year, y=n) ) + geom_line(lty=4)



## Plotting multiple lines on same graph

jenlinda <- read_csv("data/jenlinda.csv")

head(jenlinda)
tail(jenlinda)

ggplot(jenlinda, aes(x=year, y=n, color=name)) + geom_line()


ggplot(jenlinda, aes(x=year, y=n, color=name)) + 
  geom_line()+
  xlab("Year") +
  ylab("Number of Children Born") +
  ggtitle("Popularity of Names Jennifer & Linda in USA")



#### Example 2


covid.county <- read_csv("data/countycovid.csv")

head(covid.county)
tail(covid.county)


# plot a line graph of date (x-axis) against total (y-axis), and make separate lines for each county.

ggplot(covid.county, aes(x= date, y= value, color = county)) + 
  geom_line() 
