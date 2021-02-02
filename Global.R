library(shiny)
library(shinyjs)
library(shinythemes)
library(igraph)
library(vcd)
library(textdata)
library(MASS)
library(RColorBrewer)
#library(datasets)
library(corrgram)
library(visdat)
library(forecast)
library(tidytext)
library(tidyverse)
library(janeaustenr)
library(stringr)
library(wordcloud2)
library(reshape2)
library(pls)
library(ggplot2)
library(plotly)
library(visNetwork)
library(leaflet)
library(shinycssloaders)
library(car)
library(readxl)
library(lubridate)

suppressWarnings({
  
# To be replaced with new dataset once available
Ass1Data <- read_excel("APA-wx.xlsx", sheet = "APA-old")

#Chosen first 10000 rows as there are missing values in Date column.
Ass1Data <- as.data.frame(Ass1Data)[1:10000,]
Ass1Data$Date<- as.Date(Ass1Data$Date)


})

options(warn=-1)

