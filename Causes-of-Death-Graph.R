library(tidyverse)
library(plotly)



blue <- c(0,.1,.08,.5,.8,.76,.55,.7,.9,1.2,1,.8)
months <- c("a","b","c","d","e","f","g","h","i","j","k","l")
red <- c(0,0,0,0,0,.18,.25,.35,.23,.2,.16,.1)
black <- c(.09,.07,.02,.12,.13,.2,.255,.23,.25,.33,.35,.29)
chart <- tibble(blue,months,red,black)
png("Causes-of-Death.png")
ggplot(chart) +
  geom_col(aes(x = months,y=blue), width = 1, color = rgb(0.40,0.90,1.00, alpha = 1), fill = rgb(0.83,0.96,1.00, alpha = .6)) +
  geom_col(aes(x = months,y=black),width = 1, color = rgb(0.10,0.08,0.00, alpha = 1),fill = rgb(0.33,0.33,0.33, alpha = .4)) + 
  geom_col(aes(x = months,y=red),width = 1, color = rgb(1.00,0.25,0.25, alpha = 1),fill = rgb(1.00,0.77,0.77,alpha = 1)) + 
  coord_polar(start = -1.6) +
  theme_minimal() +
  theme(axis.text = element_blank(),
        panel.grid = element_blank(),
        axis.title = element_blank())
dev.off()
  ?coord_polar
  