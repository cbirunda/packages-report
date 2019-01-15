#Load Libraries
library(tidyverse)
library(janitor)
library(data.table)
library(magrittr)


lib_df<-as.data.frame(installed.packages())

lib_df%<>%
  clean_names()

lib_df%<>%
  select(package, lib_path, version, priority, built)

apt_freqtable <- apt %>%
  count(built) %>%
  mutate(percent = scales::percent(n / sum(n)))

ggplot(apt_freqtable, aes(x = built, y = n)) +
  geom_col()


rmarkdown::render(test.R)