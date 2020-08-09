### One-sample t-test

# Dr Zeppo example data.

# Psychology Student scores:

zeppo <- c(50,60,60,64,66,66,67,69,70,74,76,76,77,79,79,79,81,82,82,89)



#### To run a one-sample t-test, comparing to some hypothesized mean

zeppo

t.test(zeppo, mu = 65.0)  # Default is a 2-tailed test.
# use this one to get the 95% CI


# you can do one-tailed test, with a predicted direction 
t.test(zeppo, mu = 65.0, alternative = "greater")  

t.test(zeppo, mu = 65.0, alternative = "less")  


shapiro.test(zeppo) # p>.05, so assume data approx normal





#### Example 2:

# On their second birthday, children know a mean of 50 words, and this is normally distributed.

# Researchers collected data from 12 children who were read to for >two hours per day.

# Did this sample of 12 children have a mean of greater than 50?


x <- c(45, 53, 71, 35, 51, 59, 49, 55, 78, 27, 66, 59)

x

shapiro.test(x) # p>.05, so assume approximately normal data.


t.test(x, mu = 50)  # two sided test

t.test(x, mu = 50, alternative = "greater")  # two sided test




