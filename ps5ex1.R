rm(list = ls())

library(AER)
library(foreign) 

download.file("http://wps.pearsoned.co.uk/wps/media/objects/12401/12699039/empirical/empex_tb/fertility_small.dta", "data/fertil.dta", mode="wb")
fertil <- read.dta("data/fertil.dta")
head(fertil)

## a
ma <- lm(weeksm1 ~ morekids, data = fertil)
summary(ma)

## c
mc <- lm(morekids ~ samesex, data = fertil)
summary(mc)

## f

mf <- ivreg(weeksm1 ~ morekids | samesex, data = fertil)
summary(mf)
summary(mf, diagnostics = TRUE) # Why did I add diagnostics = TRUE

## g

mg <- ivreg(weeksm1 ~ morekids + agem1 + black + hispan + othrace | samesex + agem1 + black + hispan + othrace, data = fertil)
summary(mg, diagnostics = TRUE)
