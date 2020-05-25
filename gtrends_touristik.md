---
title: "Warum Sie jetzt Reiseanzeigen schalten sollten"
author: "Thomas Halamuda"
date: "24 5 2020"
output:
  html_document: 
    code_folding: hide
    df_print: kable
    fig_width: 10
    keep_md: yes
  word_document: default
---







Für den Reisemarkt ist es Zeit aus der Corona Schockstarre zu erwachen. Nach Wochen der Unsicherheit und eingeschränkten Bewegungsfreiheit sind die Deutschen wieder bereit Ihren Urlaub zu planen. Die folgende Google Trends Analyse zeigt, dass nach dem katastrophalen Absturz des Reisemarktes das Interesse für innerdeutsche Urlaubsorte wiedererwacht. Analysiert wurden sechs beispielhafte Suchbegriffe: "Nordsee Urlaub", "Ostsee Urlaub","Allgäu Urlaub","Schwarzwald Urlaub", "Aida Urlaub" und "Ägypten Urlaub", welche als grobe Indikatoren für das aktuelle Informationsbedürfnis und Interesse an Urlaub der Deutschen dienen soll. Untersucht wurde der Zeitraum Januar 2017 - 24.05.2020.
Wichtig: alle Werte sind normiert, d.h. die Suchbegriffe dürfen in ihren absoluten Werten nicht verglichen werden!



```r
#trends$date <- lubridate::ymd(trends$date)
```



```r
trends %>%
      filter(keyword %in% keywords[1:2]) %>%
      ggplot( (aes(x= as.Date(date), y= hits, color = keyword))) + geom_line(size = 1.5)  +
      cd_theme() + theme(axis.text.x=element_text(angle=60, hjust=1)) +
      scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
      scale_color_manual(values = cd_main) +
      labs(title ="Suchinteresse im Zeitverlauf",
           caption = "Datenquelle: Google Trends (https://www.google.com/trends)",
           y = "Suchinteresse indexiert",
           x = "Datum")
```

![](gtrends_touristik_files/figure-html/gesamt-1.png)<!-- -->

```r
trends %>%
      filter(keyword %in% keywords[3:4]) %>%
      ggplot( (aes(x= as.Date(date), y= hits, color = keyword))) + geom_line(size = 1.5)  +
      cd_theme() + theme(axis.text.x=element_text(angle=60, hjust=1)) +
      scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
      scale_color_manual(values = cd_main[3:4]) +
      labs(title ="Suchinteresse im Zeitverlauf",
           caption = "Datenquelle: Google Trends (https://www.google.com/trends)",
           y = "Suchinteresse indexiert",
           x = "Datum")
```

![](gtrends_touristik_files/figure-html/gesamt-2.png)<!-- -->

Nach historischen Tiefs im März/April steuern die Indizes für deutsche Urlaubsorte in diesem Monat auf einen neuen Höchstwert zu!
Die obenstehenden Grfaik zeigt, dass das Suchinteresse für Urlaub innerhalb Deutschlands so hoch wie noch nie in den letzten Jahren ist. 
Man beachte, dass die Suchbegriffe "nordsee urlaub" und "ostsee urlaub" für gewöhnlich erst im Juni/Juli Ihren Höchststand erreichen. Ein erster Hinweis darau, welch enormes Potenzial für Nord- und Ostsee Urlaube in diesem Jahr steckt. Aber auch das Interesse für die südlichen Gebiete Deutschlands für Berg- und Wanderurlaube steigt an. 




```r
trends %>%
      filter(keyword %in% keywords[5:6]) %>%
      ggplot( (aes(x= as.Date(date), y= hits, color = keyword))) + geom_line(size = 1.5)   +
      cd_theme() + theme(axis.text.x=element_text(angle=60, hjust=1)) +
      scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
      scale_color_manual(values = cd_main [5:6]) +
      labs(title ="Suchinteresse im Zeitverlauf",
           caption = "Datenquelle: Google Trends (https://www.google.com/trends)",
           y = "Suchinteresse indexiert",
           x = "Datum")
```

![](gtrends_touristik_files/figure-html/gesamt_ausserhalb-1.png)<!-- -->


Dieser Trend gilt allerdings nur für Urlaubsorte innerhalb Deutschlands. Das Interesse für Kreuzfahrten als auch Fernreisen am Mittelmeer bleiben unterdurchschnittlich.


```r
trends %>%
      group_by(keyword, month) %>%
      mutate(hits_sum = sum(hits),
                hits_mean = mean(hits)) %>%
      ungroup() %>%
      mutate(INDEX = hits/hits_mean * 100) %>%
      filter(date >= "2020-01-01") %>%
      ggplot(aes(x=date, y= INDEX, fill = keyword)) + geom_col()  + facet_wrap(~keyword, nrow =1) + cd_theme() + scale_fill_manual(values = cd_main) +
      labs(title ="Suchinteresse im Zeitverlauf",
           caption = "Datenquelle: Google Trends (https://www.google.com/trends)",
           y = "Suchinteresse indexiert auf mittleren Monatswert",
           x = "Datum")
```

![](gtrends_touristik_files/figure-html/geom_col by mean month-1.png)<!-- -->



Index: Suchinteresse im aktuellen Monat vs. höchstes monatliches Suchinteresse in den Jahren (2017-heute)

```r
trends %>%
      group_by(keyword) %>%
      mutate(hits_sum = sum(hits),
                hits_max = max(hits)) %>%
      ungroup() %>%
      mutate(INDEX = hits/hits_max * 100) %>%
      filter(date >= "2020-01-01") %>%
      ggplot(aes(x=date, y= INDEX, fill = keyword)) + geom_col()  + facet_wrap(~keyword, nrow =1) + cd_theme() + scale_fill_manual(values = cd_main) +
      labs(title ="Suchinteresse im Zeitverlauf",
           caption = "Datenquelle: Google Trends (https://www.google.com/trends)",
           y = "Suchinteresse indexiert auf Maximalwert",
           x = "Datum")
```

![](gtrends_touristik_files/figure-html/geom_col by max year-1.png)<!-- -->


