
library(AER)
library(foreign) 
library(sandwich) # for all sorts of robust standard erros
library(lmtest)
library(dplyr) #install.packages("dplyr") if you do you not have it

download.file("http://wps.pearsoned.co.uk/wps/media/objects/12401/12699039/empirical/empex_tb/Smoking.dta", "data/smoking.dta", mode="wb")
smoking <- read.dta("data/smoking.dta")
head(smoking)

## a
smoking %>% select(smoker) %>% summarise(probsmoking_all = mean(smoker, na.rm = NA)) # how do the %>% work, what does select do, what does summarise/ze do
smoking %>% filter(smkban == 0) %>% select(smoker) %>% summarise(probsmoking_NOsmkban = mean(smoker, na.rm = NA)) # what does filter do
smoking %>% filter(smkban == 1) %>% select(smoker) %>% summarise(probsmoking_WITHsmkban = mean(smoker, na.rm = NA))

## b
lpm1 <- lm(smoker ~ smkban, data = smoking)
summary(lpm1)

coeftest(lpm1, vcovHC(lpm1,"HC1"))

## c

smoking <- smoking %>% mutate(age2 = age^2) # what does mutate do?
# notice here i saved the result of the manipulation back in smoking, before i didn't. that's because before I only wanted to see the result
lpm2 <- lm(smoker ~ smkban + female + age + age2 + hsdrop + hsgrad + colsome + colgrad + black+ hispanic, data = smoking)
summary(lpm2)

coeftest(lpm2, vcovHC(lpm2, "HC1"))

## e

linearHypothesis(lpm2, c("hsdrop=0","hsgrad=0","colsome=0", "colgrad=0"), vcov=vcovHC(lpm2, "HC1"))

## f

new <- data.frame(smkban=0,
                  female=0,
                  black=0,
                  hispanic=0,
                  hsdrop=0, hsgrad=0, colsome=0, colgrad=1,
                  age = seq(from=18, to=65, by=1),
                  age2 = seq(from=18, to=65, by=1)^2)
pred <- predict(lpm2, new)
plot(new$age, pred, type = "l", xlab="Age", ylab="Probability of Smoking", ylim=c(0,0.22))


## g
probit2 <- glm(smoker ~ smkban + female + age + age2 + hsdrop + hsgrad + colsome + colgrad + black+ hispanic, family = binomial(link = "probit"), data = smoking)
summary(probit2)

coeftest(probit2, vcovHC(probit2, "HC1"))

## i
linearHypothesis(probit2, c("hsdrop=0","hsgrad=0","colsome=0", "colgrad=0"), vcov=vcovHC(probit2, "HC1"))

## j
mrA <- data.frame(smkban=c(0,1),
                  female=0,
                  black=0,
                  hispanic=0,
                  hsdrop=1, hsgrad=0, colsome=0, colgrad=0,
                  age = 20,
                  age2 = 20^2)
pred_mrA <- predict(probit2, mrA, type = "response")
pred_mrA

## k
lakisha <- data.frame(smkban=c(0,1),
                  female=1,
                  black=1,
                  hispanic=0,
                  hsdrop=0, hsgrad=0, colsome=0, colgrad=1,
                  age = 40,
                  age2 = 40^2)
pred_lakisha <- predict(probit2, lakisha, type = "response")
pred_lakisha

## l
pred_mrA_lpm <- predict(lpm2, mrA) # does it matter if i do not put type = "response" the lpm? try it with response = TRUE
pred_mrA_lpm

pred_lakisha_lpm <- predict(lpm2, lakisha)
pred_lakisha_lpm

##

predicted <- rbind(pred_mrA, pred_mrA_lpm, pred_lakisha, pred_lakisha_lpm)
colnames(predicted) <- c("w/o smoking ban", "w/ smoking ban")
rownames(predicted) <- c("Allan, probit", "Allan, lpm", "Lakisha, probit", "Lakisha, lpm")
predicted
