rm(list = ls())

getwd()
#setwd("/Users/rossi/Dropbox/Econometrics4Law16")

library(dplyr) 
library(AER) 
library(foreign)

options(digits = 2)

download.file('http://fmwww.bc.edu/ec-p/data/wooldridge/mroz.dta', 'data/mroz.dta', mode="wb")

mroz <- read.dta("data/mroz.dta")

mroz <- filter(mroz, inlf == 1)


## 1 
iv1 <- ivreg(lwage ~ educ + exper + expersq | fatheduc + motheduc + exper + expersq, data = mroz)

## 2 - 3 - 4
s_iv1 <- summary(iv1, diagnostics = TRUE)
s_iv1$diagnostics

## 2
stage1 <- lm(educ ~ fatheduc + motheduc + exper + expersq, data = mroz)
summary(stage1)
