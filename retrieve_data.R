library(gtrendsR)
library(dplyr)
library(tidyr)
library(lubridate)


country <- c('DE') #set the geographic area: DE = Germany
time <- ("2015-01-01 2020-05-24") #set the time window
channel <- 'web' #set channels
hl <- "de" #set lanaguage

tag <- c("urlaub", "hotel")
keywords <- c("ostsee", "nordsee",
              "schwarzwald", "allgäu",
              "aida","kreuzfahrt",
              "spanien","italien", "griechenland",
              "tunesien","ägypten", "türkei" ) #define the keywords

keywords_tag <- paste(rep(keywords, each = length(tag)), tag, sep = " ")

trends <- list()
for (i in 1: length(keywords_tag)) {
      trends[keywords_tag[i]] <- gtrends(keywords_tag[i], gprop =channel,geo=country, time = time, hl = hl )
}


trends <-  bind_rows(trends)


#Meta Categorien erstellen
trends$metatag <- ifelse(trends$keyword %in% keywords_tag[1:4], "Küste","" )
trends$metatag <- ifelse(trends$keyword %in% keywords_tag[5:8], "Berge",trends$metatag )
trends$metatag <- ifelse(trends$keyword %in% keywords_tag[9:12], "Kreuzfahrt",trends$metatag )
trends$metatag <- ifelse(trends$keyword %in% keywords_tag[13:18], "Nord-Mittelmeer",trends$metatag )
trends$metatag <- ifelse(trends$keyword %in% keywords_tag[19:24], "Süd-Mittelmeer",trends$metatag )
trends$metatag <- as.factor(trends$metatag)

trends$metatag2 <- ifelse(grepl(tag[1], trends$keyword), tag[1],"" )
trends$metatag2 <- ifelse(grepl(tag[2], trends$keyword), tag[2],trends$metatag2 )
#saveRDS(trends <- list(trends_all = trends_all, trends_solo = trends_solo), "trends.RDS")
saveRDS(trends, "trends.RDS")


#### Export for  PPT #

df <- trends %>%
      select(date, keyword, hits) %>%
      spread( keyword, hits)



writexl::write_xlsx(trends, "trends.xlsx")
