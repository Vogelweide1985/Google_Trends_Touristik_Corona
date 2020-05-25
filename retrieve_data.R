library(gtrendsR)
library(dplyr)



country <- c('DE') #set the geographic area: DE = Germany
time <- ("2015-01-01 2020-05-24") #set the time window
channel <- 'web' #set channels
hl <- "de" #set lanaguage

tag <- "urlaub"
keywords <- c("ostsee", "nordsee",
              "schwarzwald", "allgäu",
              "aida","kreuzfahrt",
              "spanien","italien", "griechenland",
              "tunesien","ägypten", "türkei" ) #define the keywords

keywords <- paste(keywords, tag, sep= " ")


trends <- list()
for (i in 1: length(keywords)) {
      trends[keywords[i]] <- gtrends(keywords[i], gprop =channel,geo=country, time = time, hl = hl )
}

trends <-  bind_rows(trends)

#Meta Categorien erstellen
trends$metatag <- ifelse(trends$keyword %in% keywords[1:2], "Küste","" )
trends$metatag <- ifelse(trends$keyword %in% keywords[3:4], "Berge",trends$metatag )
trends$metatag <- ifelse(trends$keyword %in% keywords[5:6], "Kreuzfahrt",trends$metatag )
trends$metatag <- ifelse(trends$keyword %in% keywords[7:9], "Nord-Mittelmeer",trends$metatag )
trends$metatag <- ifelse(trends$keyword %in% keywords[10:12], "Süd-Mittelmeer",trends$metatag )
trends$metatag <- as.factor(trends$metatag)


#saveRDS(trends <- list(trends_all = trends_all, trends_solo = trends_solo), "trends.RDS")
saveRDS(trends, "trends.RDS")


