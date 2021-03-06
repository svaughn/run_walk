library(lubridate)
library(dplyr)
library(stringr)
library(ggplot2)


run_walk <- read.csv('c:/users/steve/Desktop/run_walk/run_walk.csv')

run_walk %>%
  mutate(Date = dmy(paste(Date,"-2020", sep = "")), Activity = str_trim(Activity)) %>%
  group_by(Date, Activity) %>%
  summarize(Miles =  ifelse(str_trim(Activity[1]) == 'Run', sum(Steps)/ 1850, sum(Steps)/ 2450)) %>%
  arrange(Date) %>%
  ggplot(aes(Date, Miles, colour=Activity)) +
    geom_point() +
    geom_smooth(method = "loess", se=F)

