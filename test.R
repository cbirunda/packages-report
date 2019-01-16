#' ---
#' output: github_document
#' ---


#Load Libraries
library(tidyverse)
library(janitor)
library(data.table)
library(magrittr)
library(here)


lib_df<-as.data.frame(installed.packages())

lib_df%<>%
  clean_names()

lib_df%<>%
  select(package, lib_path, version, priority, built)

apt <- lib_df %>%
  filter(is.na(priority)) %>%
  select(package, built)

apt_freqtable <- apt %>%
  count(built) %>%
  mutate(percent = scales::percent(n / sum(n)))

ggplot(apt_freqtable, aes(x = built, y = n)) +
  geom_col()


Learning git is great!
  