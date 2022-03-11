## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(ordinalbayes)

## -----------------------------------------------------------------------------
library("DESeq2")
reducedSet

## ----args---------------------------------------------------------------------
args(ordinalbayes)

## ----colData------------------------------------------------------------------
head(colData(reducedSet))

## ----assay--------------------------------------------------------------------
head(assay(reducedSet))[,1:2]

## ---- model-------------------------------------------------------------------
fit<-ordinalbayes(Stage~cigarettes_per_day+age_at_index, data=colData(reducedSet),x=t(assay(reducedSet)), model="regressvi", gamma.ind="fixed", pi.fixed=0.05, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ---- lasso, eval=FALSE-------------------------------------------------------
#  fit.lasso<-ordinalbayes(Stage~cigarettes_per_day+age_at_index, data=colData(reducedSet),x=t(assay(reducedSet)), model="lasso", adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ---- rvifixed, eval=FALSE----------------------------------------------------
#  fit.regressvi.fixed<-ordinalbayes(Stage~1, data=colData(reducedSet),x=t(assay(reducedSet)), model="regressvi", gamma.ind="fixed", pi.fixed=0.05, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ---- rvirandom, eval=FALSE---------------------------------------------------
#  fit.regressvi.random<-ordinalbayes(Stage~1, data=colData(reducedSet),x=t(assay(reducedSet)), model="regressvi", gamma.ind="random", c.gamma=0.01, d.gamma=0.19, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ---- nssfixed, eval=FALSE----------------------------------------------------
#  fit.normalss.fixed<-ordinalbayes(Stage~1, data=colData(reducedSet),x=t(assay(reducedSet)), model="normalss", gamma.ind="fixed", pi.fixed = 0.05, sigma2.0=0.01, sigma2.1=10, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ---- nssrandom, eval=FALSE---------------------------------------------------
#  fitted.normalss.random<-ordinalbayes(Stage~1, data=colData(reducedSet),x=t(assay(reducedSet)), model="normalss", gamma.ind="random", c.gamma = 0.01, d.gamma=0.19, sigma2.0=0.01, sigma2.1=10, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ---- dessfixed, eval=FALSE---------------------------------------------------
#  fit.dess.fixed<-ordinalbayes(Stage~1, data=colData(reducedSet),x=t(assay(reducedSet)), model="dess", gamma.ind="fixed", pi.fixed = 0.05, lambda0=20, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ----dessrandom, eval=FALSE---------------------------------------------------
#  fit.dess.random<-ordinalbayes(Stage~1, data=colData(reducedSet),x=t(assay(reducedSet)), model="dess", gamma.ind="random", c.gamma = 0.01, d.gamma=0.19, lambda0=20, adaptSteps=500, burnInSteps=500,  numSavedSteps=999)

## ----print--------------------------------------------------------------------
head(print(fit))

## ----summary------------------------------------------------------------------
summary.fit<-summary(fit)
names(summary.fit)
head(summary.fit$gammamatrix)

## ----usesummary---------------------------------------------------------------
names(which(summary.fit$Beta.BayesFactor>5))

## ----usesummary2--------------------------------------------------------------
names(which(summary.fit$gamma.BayesFactor>5))

## ----usesummary3--------------------------------------------------------------
names(which(summary.fit$gammamean>0.5))

## ----coef---------------------------------------------------------------------
coefficients<-coef(fit)
coefficients$gamma[which(summary.fit$gamma.BayesFactor>5)]
coefficients$gamma[which(summary.fit$Beta.BayesFactor>5)]

## ----pred---------------------------------------------------------------------
phat<-predict(fit)
table(phat$class, colData(finalSet)$Stage)

## ----plot, eval=FALSE---------------------------------------------------------
#  plot(fit)

