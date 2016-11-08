rm(list = ls())

getwd()
#setwd("/Users/rossi/Dropbox/Econometrics4Law16")

library(AER)
library(foreign) 

options(digits = 2)

download.file('http://fmwww.bc.edu/ec-p/data/wooldridge/wage2.dta', 'data/wage2.dta', mode="wb")
wage2 <- read.dta("data/wage2.dta")

## 1
m0 <- lm(formula = lwage ~ educ, data = wage2) 
s_m0 <- summary(m0) 

upperbound <-  (s_m0$coefficients[2,1] + 1.96*s_m0$coefficients[2,2])*100
lowerbound <-  (s_m0$coefficients[2,1] - 1.96*s_m0$coefficients[2,2])*100


## 2
iv1 <- ivreg(lwage ~ educ | sibs, data = wage2)
s_iv1 <- summary(iv1)


## 3
iv4stage1 <- lm(educ ~ brthord, data = wage2)
s_iv4stage1 <- summary(iv4stage1)

predicted_educ_1stborn <-  s_iv4stage1$coefficients[1,1] + s_iv4stage1$coefficients[2,1]*1
predicted_educ_3rdborn <-  s_iv4stage1$coefficients[1,1] + s_iv4stage1$coefficients[2,1]*3
predicted_educ_3rdborn - predicted_educ_1stborn # 0.56 years of education less

## 4
iv4 <- ivreg(lwage ~ educ | brthord, data = wage2)
s_iv4 <- summary(iv4)

## 5
iv6stage1 <- lm(educ ~ sibs + brthord, data = wage2)
s_iv6stage1 <- summary(iv6stage1)

## 6
iv6 <- ivreg(lwage ~ educ + sibs | brthord + sibs, data = wage2)
s_iv6 <- summary(iv6)

upperbound6 <- (s_iv6$coefficients[2,1] + 1.96*s_iv6$coefficients[2,2])*100
lowerbound6 <- (s_iv6$coefficients[2,1] - 1.96*s_iv6$coefficients[2,2])*100

## 7 
index.omitted <- as.numeric(iv6stage1$na.action)
cor_iv6 <- cor(iv6stage1$fitted.values, wage2$sibs[-index.omitted]) 

## 8a
iv8 <- ivreg(lwage ~ educ + exper + tenure + black | sibs + exper + tenure + black, data = wage2)
s_iv8 <- summary(iv8)

## 8b 
iv8stage1 <- lm(educ ~ sibs + exper + tenure + black, data = wage2)
wage2$educ_fitted8b <- iv8stage1$fitted.values 
iv8stage2 <- lm(lwage ~ educ_fitted8b + exper + tenure + black, data = wage2)

## 8c
iv8cstage1 <- lm(educ ~ sibs, data = wage2)
wage2$educ_fitted8c <- iv8cstage1$fitted.values 
iv8cstage2 <- lm(lwage ~ educ_fitted8c + exper + tenure + black, data = wage2)

