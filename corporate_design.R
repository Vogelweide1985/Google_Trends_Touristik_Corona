library(RColorBrewer)
library(magick)
cd_theme <- function(base_size = 11,
                      base_family = "",
                      base_line_size = base_size / 170,
                      base_rect_size = base_size / 170){
      theme_minimal(base_size = base_size, 
                    base_family = base_family,
                    base_line_size = base_line_size) %+replace%
            theme(plot.background = element_rect(
                  fill = "white", 
                  linetype = "blank",
                  ),
                  plot.title = element_text(
                        color = rgb(25, 43, 65, maxColorValue = 255), 
                        face = "bold",
                        hjust = 0.001,
                        vjust = 2),
                  plot.subtitle = element_text(
                        color = rgb(25, 43, 65, maxColorValue = 255), 
                        face = "plain",
                        hjust = 0.005,
                        size = 11,
                        vjust = 1),
                  axis.title = element_text(
                        size = rel(1),
                        face = "bold"),
                  axis.text = element_text(
                        color = rgb(105, 105, 105, maxColorValue = 255),
                        size = rel(1)),
                  axis.line  = element_line(
                        linetype = "solid", 
                        colour = rgb(105, 105, 105, maxColorValue = 255),
                        size = rel(1)
                  ),
                  axis.line.y  = element_line(
                        linetype = "blank", 
                        colour = rgb(105, 105, 105, maxColorValue = 255),
                        size = rel(1)
                  ),
                  panel.grid.major.x = element_line(
                        rgb(105, 105, 105, maxColorValue = 255),
                        linetype = "blank"),   
                  panel.grid.major.y = element_line(
                        rgb(105, 105, 105, maxColorValue = 255),
                        linetype = "dotted", size =0.5),   
                  panel.grid.minor = element_line(
                        rgb(105, 105, 105, maxColorValue = 255),
                        linetype = "blank", 
                        size = rel(4)),
                  legend.position = "top",
                  
                  complete = TRUE
            )
}
cd_name <- "Adson Advanced Analytics"
cd_main <- c( "#080705", "#700548", "#7272AB", "#05204A", "#D1C6AD")
cd_gradient <- c("#770055",  "#8A2377", "#811266", "#943587", "#9E4698", "#A758A9", 
                 "#B169BA", "#BB7BCA", "#C48CDB", "#CE9EEC")
cd_diverging <- "tbd"


cd_logo <- magick::image_read("../logo/logo.png")



### Tests ####
library(cowplot)
p <- ggplot(iris, aes(x= Species, y = Sepal.Length)) + geom_boxplot(fill = cd_main[1:3]) + cd_theme() +
      ggtitle("This is a Title", "This is a subtitle") 



ggplot(iris, aes(x= 1:nrow(iris), y = Sepal.Length)) + geom_point(color = cd_main[1]) + cd_theme() +
      ggtitle("This is a Title", "This is a subtitle") 
