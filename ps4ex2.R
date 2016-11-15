rm(list = ls())

library(tidyr)
library(dplyr) # for easy data manipulation
library(AER) # ivreg
library(foreign) # to use stata data formats

options(digits = 2)

download.file('http://fmwww.bc.edu/ec-p/data/wooldridge/mroz.dta', 'data/mroz.dta', mode="wb")


mroz <- read.dta("data/mroz.dta")
head(mroz)
dim(mroz) #17 variables, 935 observations

# We want to study only the intensive margin, so keep only women who are in the labour force at the time of the study
mroz <- filter(mroz, inlf == 1)


## 1 
iv1 <- ivreg(lwage ~ educ + exper + expersq | fatheduc + motheduc + exper + expersq, data = mroz)
summary(iv1)

# The effect of 1 extra year of education is 6% increase in wage, on average. Statistically different than 0, at the 10% level. Effect of experience is much more pronounced and estimated more precisely (Why is that? In the data, there is enough variation in exper and wage to (statistically) identify precisely the coefficient.) 

# Effect of 1 more year of experience : a1 + 2*a2

## 2 - 3 - 4 Tests
s_iv1 <- summary(iv1, diagnostics = TRUE)
s_iv1$diagnostics

## 2 - same test as weak instruments, alternatively, run the first stage regression and (jointly or not) test nullity of coefficients of instruments
stage1 <- lm(educ ~ fatheduc + motheduc + exper + expersq, data = mroz)
summary(stage1)
