rm(list = ls())

library(readr)
library(dplyr)

health_df <- read.csv("Documents/GitHub/DATS6101_Project1_Team2/dataset/PLACES__Local_Data_for_Better_Health__Census_Tract_Data_2022_release.csv")
str(health_df)

# Keep only some variables #
health_df = health_df[,c("Year","StateAbbr","StateDesc","CountyName","CountyFIPS","LocationName","Data_Value","TotalPopulation","MeasureId")]
table(health_df$MeasureId)

# Keep only rows with health measures of interest #
health_df = health_df[(health_df$MeasureId=="DEPRESSION" | health_df$MeasureId=="SLEEP" | health_df$MeasureId=="LPA" | health_df$MeasureId=="MHLTH" | health_df$MeasureId=="PHLTH"),]

# Reshape long to wide #
new_health_df = reshape(health_df, idvar="LocationName", timevar = "MeasureId", v.names="Data_Value", direction = "wide")

nrow(new_health_df)
View(new_health_df)
str(new_health_df)

