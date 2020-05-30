#' ---
#' title: how to read csv files in r. Example: Pluviometric FUNCEME stations
#' author: matheus marques
#' date: 2020-05-29
#' ---

rm(list=ls())

# preparate r -------------------------------------------------------------
# read packages
#install.packages("magrittr")

library(readr)
library(readxl)
library(dplyr)
library(animation)
library(gganimate)
library(ggplot2)
library(ggimage)
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
p734 <- read.table("734.txt",
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

#' Verificando a frequencia dos anos. Todos precisam estar com 12 para avaliação anual completa (12 meses)
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

#
sel.anos <- c(2009,2012,2013,2015,2015,2020)

#Create a dataframe with list only years that have exactly 12 rows for each year
p734 %>% 
  filter(Anos %in% v.anos)
p734

#Your dataframe already ok!!!

glimpse()

  filter(p734) <- doze_anos == TRUE

  
# filtering
freq_anos <- table(p734$Anos)

freq_anos

doze_anos <- table(p734$Anos) == 12

v.anos <- filter(doze_anos == TRUE)
doze_anos <- freq_anos == 12

new_var <- doze_anos["TRUE"]
new_var


  
filter(function(p734) p734, doze_anos = TRUE)

p1 <- p734[,doze_anos=TRUE]

glimpse(p734) %>% 
  filter(doze_anos==TRUE)

p734 %>% 
  filter(doze_anos==TRUE)
p734

for (doze_anos in p734$Anos) {
}

doze_anos <- table(p734$Anos) == 12


filter(p734,doze_anos==TRUE)

table(p734)[count(p734$Anos)=12]

select(p734,Anos,table(Anos=12))



new.ind.data <- p734 %>%
  group_by(Anos) %>%
  filter(n() = 12) %>%
  ungroup()

%>% 
  filter(table(Anos) >= 12)
  

filter(p734,table(Anos) = 12))

#' Verificando a frequencia dos anos. Todos precisam estar com 12 para avaliação anual completa (12 meses)
table(p734$Anos)

select(p734)

colSums(data$Total)
#' Verificando a frequÃªncia dos anos. Todos precisam estar com 12 para avaliaÃ§Ã£o anual completa (12 meses)
table(p734$Anos)

#' Deleting only rows that contains the year 2020 
p1 <- p1[p1$Anos!="2020",]
p1 <- p1[p1$Anos!=2019, ]
table(p1$Anos)

#' deleting rows that contains two or more years
table(p1$Anos)
p1 <- p1[ !(p1$Anos %in% c("2020","2019")), ]
table(p1$Anos)

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
# keeping columns that you would like to keep
#keepcols <- c("ID","Anos", "Latitude", "Longitude")
#p1 <- p1[ , keepcols ]

# to remove just one column
#p1[ , "Meses" ] <- NULL
#p1

# to remove two or more columns. You need to set a combine in a object.
#colstodelete <- c("Latitude", "Longitude", "Meses")

#and write these lines
#names(p1) %in% colstodelete
#!(names(p1) %in% colstodelete)
#p1 <- p1[, !(names(p1) %in% colstodelete)]
#p1

# to remove two or more lines. You need to set a combine in a object.
rowstodelete <- c("2020","2019")
names(p1) %in% rowstodelete
!(names(p1) %in% rowstodelete)
p1 <- ~p1[, !(names(p1) %in% rowstodelete)]
p1
p1$Anos
