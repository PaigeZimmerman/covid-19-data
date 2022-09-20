rm(list=ls(all=TRUE))
cat("\014")
library(tidyverse)

url <- "us-states.csv"
cases <- read.csv(file = url)

cases <- filter(cases, state=="Pennsylvania")
view(cases)

n <- length(cases$date)
cases$incr_cases <- 2
cases$incr_deaths <- 0

for (i in 2:n) {
  cases$incr_cases[i] <- (cases$cases[i]-cases$cases[i-1])
}
for (i in 2:n) {
  cases$incr_deaths[i] <- (cases$deaths[i]-cases$deaths[i-1])
}
view(cases)

sd(cases$incr_cases)