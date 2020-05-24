library(gtrendsR)
library(dplyr)



country <- c('DE') #set the geographic area: DE = Germany
time <- ("2015-01-01 2020-05-24") #set the time window
channel <- 'web' #set channels
hl <- "de"
keywords <- c("ostsee urlaub", "nordsee urlaub", "schwarzwald urlaub", "allgäu urlaub",
              "aida urlaub", "ägypten urlaub" ) #define the keywords




trends <- list()
for (i in 1: length(keywords)) {
      trends[keywords[i]] <- gtrends(keywords[i], gprop =channel,geo=country, time = time, hl = hl )
}

trends <-  bind_rows(trends)

#saveRDS(trends <- list(trends_all = trends_all, trends_solo = trends_solo), "trends.RDS")
saveRDS(trends, "trends.RDS")
