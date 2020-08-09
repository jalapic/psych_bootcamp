
### **Very** Brief Mixed-Effect Model Example 

# more info: https://ourcodingclub.github.io/tutorials/mixed-models/

load("data/dragons.Rdata") 

head(dragons)

table(dragons$mountainRange, dragons$site)



# First thing first, visualize your data! 

ggplot(dragons,aes(testScore)) +
  geom_histogram(aes(y =..density..),alpha = .4, color="gray57")+
  geom_density(col="firebrick",size=1)+
  theme_bw()


  ggplot(dragons,aes(x = bodyLength, y = testScore)) +
  geom_point() +
  geom_smooth(method = "lm")+
  theme_bw()


### Linear regression 

basic.lm <- lm(testScore ~ bodyLength, data = dragons)
summary(basic.lm)



# Is your model good looking?

qqnorm(resid(basic.lm))
qqline(resid(basic.lm)) 




## Mixed effects modeling 

library(glue)
dragons <- dragons %>% 
  mutate(sampling_site = glue('{mountainRange}_{site}'))

head(dragons)


library(viridis)
ggplot(dragons,aes(bodyLength,testScore,col=site))+
  geom_point()+
  facet_wrap(~mountainRange,ncol=4)+
  theme_bw()+
  scale_color_viridis(discrete = T, option = "C")



## Accounting for Different Mountains

library(lme4)
library(lmerTest)

mixed.intercept <- lmer(testScore ~ bodyLength + (1|mountainRange), data = dragons)
summary(mixed.intercept) 

#A rough rule-of-thumb that the t is probably significant if it’s greater than 2.


qqnorm(resid(mixed.intercept))
qqline(resid(mixed.intercept)) 

plot(mixed.intercept)


## Nested model

mixed.nested<- lmer(testScore ~ bodyLength + (1|mountainRange)+(1|sampling_site), data = dragons)
summary(mixed.nested)


# lmer function is smart enough to notice that sampling_site is nested under mountainRange,
# but it's always a good practice to write your model like this 

mixed.nested<- lmer(testScore ~ bodyLength + (1|mountainRange/sampling_site), data = dragons)
summary(mixed.nested)

qqnorm(resid(mixed.nested))
qqline(resid(mixed.nested)) 

plot(mixed.nested)





## Plot the model fit

dragons$fit <-predict(mixed.intercept)

dragons %>% 
  mutate(fit=predict(mixed.intercept)) %>% 
  ggplot(.,aes(bodyLength,testScore,group=mountainRange,col=mountainRange))+
  geom_point(alpha = .3,size=1.5)+
  theme_bw()+
  scale_color_viridis(discrete = T,)+
  geom_line(aes(y=fit),size = 1.2)+
  labs(x="How long is that bird",
      y="How smart is that bird",
      color = "Where is that bird from")+
  ggtitle("This is why we need to use mixed effects models")


## what do we make out of these results? 

# So, the conclusion is: 

# - Body length does NOT have an significant effect on test score. 

# - there's something in that mountain varying both body length and test score...! 

