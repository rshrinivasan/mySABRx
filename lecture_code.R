# setwd("~/Documents/mySABRx")
# load win_estimators.csv file
win_estimators <- read.csv("win_estimators.csv")
summary(win_estimators)
mean(win_estimators$WPct)
sd(win_estimators$WPct)

# x=avgRuns−squareroot(avgRuns2/(1/(.500−1/162)−1))

x = 690.3973 - sqrt(690.3973 ** 2/(1/(.500 - 0.006) − 1))
x = 690.3973 - sqrt(690.3973 ** 2/ (1/(.500 - 0.006) - 1))
x

estimators <- win_estimators[c('RperG', 'RAperG', 'WPct','Cook_WPct',  'Soolman_WPct',  'Kross_WPct', 'Smyth_WPct', 'BJames_Pythag_WPct', 'BJames_Pythag_WPctII')]
require('lattice')
splom(estimators, xlab='Win Estimators')

# we are going to look at just the teams who finished higher than the 95th percentile 
# in win percentage (a.k.a the outlier winners)

wpct_95th_pct = quantile(win_estimators$WPct, .95)
top_winners = win_estimators[win_estimators$WPct >= wpct_95th_pct, ]
summary(top_winners)
splom(top_winners)
