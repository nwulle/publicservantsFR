#Datathon: Do French Public Servants cost too much?
install.packages("eurostat")
library(eurostat)

library(tidyverse)

expenses %>% 
  filter(GEO %in% "Frankreich") %>% 
  filter(COFOG99 %in% "Allgmeine <f6>fffentliche Verwaltung")
expenses<-read_csv("./Data/gov_10a_exp_1_Data.csv")
View(expenses)

library(readxl)
expenses2 <- read_excel("Data/Eurostat_Table_tec00023FlagDesc_d8db5514-87e0-46cf-8103-03fae1c1546d.xls")
View(expenses2)

remuneration <- read_csv("Data/prc_rem_cs_1_Data.csv")
View(remuneration)

View(expenses)

oecd <- read_csv("./Data/oecd.csv")
View(oecd)


expenses %>% 
  select(-UNIT, -NA_ITEM,-`Flag and Footnotes`) %>% 
  mutate(Value = if_else(Value==":", "", Value)) %>% 
  filter(GEO %in% "France") %>% 
  filter(COFOG99 %in% "General public services") %>%
  View()
