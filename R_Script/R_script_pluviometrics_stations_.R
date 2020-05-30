#' ---
#' title: Working with .txt files from Pluviometric FUNCEME stations in R software.
#' author: José Matheus da Rocha Marques (@marquesrmatheus)
#' last update: 2020-05-29
#' ---

rm(list=ls())

#' read packages
library(readr)
library(readxl)
library(dplyr)
library(devtools)
library(data.table)
library(lubridate)
library(writexl)
library(tidyr)
library(stringr)
library(magrittr)

#' set workspace
setwd('C:/scriptsr/R_postos_pluviometricos_FUNCEME')
getwd()


#' reading tables in r
p734 <- read.table("734.txt", #.txt file of station number
                 header = T,
                 sep = ";",
                 stringsAsFactors = FALSE,
                 na.strings = c("999.0","888.0")
                 )

p734
glimpse(p734)

#'replacing NA values
p734[is.na(p734)] = 0
glimpse(p734)

#'fixing characters Municipios column
p734$Municipios = str_replace(p734$Municipios,"IndependÃªncia","Independência")
glimpse(p734)

#' Verify years frequency. All years need to be with 12 observations (months)
freq_years <- table(p734$Anos)
freq_years

#'We want only years with 12 observations. To remove years with <= 11 months, follow the steps:
#'1: create a new data frame (df2). It is because we do not modify nothing of dataframe from pluviometric state.
#' In df2, count number of years by row and filter to those with only 12 (12 months)
df2 <- p734 %>% #df from pluviometric state
  group_by(Anos) %>% 
  count() %>% 
  filter(n == 12)

glimpse(df2)

# create variable with list of years that have exactly 12 rows
v.anos <- df2$Anos

#sel.anos <- c(2009,2012,2013,2015,2015,2020)

#Create a dataframe with list only years that have exactly 12 rows for each year
p734 %>% 
  filter(Anos %in% v.anos)
p734
glimpse(p734)

#Your dataframe already ok for while!
----------------------------------------------------------------------------------------------------

colSums(data$Total)

summary.data.frame(p1)
sum(p1$Total)
plot(p1$Anos,p1$Total)
library(ggplot2)
qplot(Anos,Total,data=p1, 
      geom= "point",
      xlab= expression(" Anos " ~(tempo)),
      ylab= expression(" Totais anuais " ~(mm)),
      size=I(2))+
  theme_bw()
anosp1 <- colSums(p1$Total)
Error
