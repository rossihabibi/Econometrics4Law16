rm(list = ls())

library(AER)
library(foreign) 
library(sandwich) # for all sorts of robust standard erros
library(lmtest)
library(dplyr) #install.packages("dplyr") if you do you not have it

download.file("http://fmwww.bc.edu/ec-p/data/wooldridge2k/401ksubs.dta", "data/retir.dta", mode="wb")
retir <- read.dta("data/retir.dta")
head(retir)

retir <- mutate(retir, inc2 = inc^2)
retir <- mutate(retir, age2 = age^2)

## a)
ols_a <- lm(pira ~ p401k + inc + inc2 + age + age2, data = retir)
summary(ols_a)

## d) REDUCED FORM EQUATION
ols_d <- lm(p401k ~ e401k + inc + inc2 + age + age2, data = retir)
summary(ols_d)
coeftest(ols_d, vcov = vcovHC(ols_d, "HC0")) 

## e) IV 2SLS
iv_e <- ivreg(pira ~ p401k + inc + inc2 + age + age2 | e401k + inc + inc2 + age + age2, data = retir)
summary(iv_e)
coeftest(iv_e, vcov = vcovHC(iv_e, "HC0")) 


## f)
retir$resid <- ols_d$residuals
ols_f <- lm(pira ~ p401k + inc + inc2 + age + age2 + resid, data = retir)
coeftest(ols_f, vcov = vcovHC(ols_f, "HC0")) 
