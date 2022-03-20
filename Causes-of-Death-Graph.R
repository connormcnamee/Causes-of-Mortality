library(tidyverse)
library(plotly)
library(patchwork)
library(showtext)
font_add_google("Dancing Script", "Dancing Script")
font_add_google("Imperial Script", "Imperial Script")
font_add_google("Lancelot","Lancelot")
font_add_google("Hurricane","Hurricane")
showtext_auto()


blackfill <- rgb(0.33,0.33,0.33, alpha = 1)
redfill <- rgb(1.00,0.77,0.77,alpha = 1)
bluefill <- rgb(0.83,0.96,1.00, alpha = 1)
blackcolor <- rgb(0.10,0.08,0.00, alpha = 1)
redcolor <- rgb(1.00,0.25,0.25, alpha = 1)
bluecolor <- rgb(0.40,0.90,1.00, alpha = 1)
t <- 8
blue <- c(0*t,.1*t,.08*t,.5*t,.8*t,.76*t,.55*t,.7*t,.9*t,1.2*t,1*t,.8*t)
months <- c("a","b","c","d","e","f","g","h","i","j","k","l")
red <- c(0,0,0,0,0,.18*t,.25*t,.35*t,.23*t,.2*t,.16*t,.1*t)
black <- c(.09*t,.07*t,.02*t,.12*t,.13*t,.2*t,.255*t,.23*t,.25*t,.33*t,.35*t,.29*t)
chart1 <- tibble(blue,months,red,black)

plot2 <- ggplot(chart1) +
  geom_col(aes(x = months,y=blue), width = 1, color = bluecolor, fill = bluefill) +
  geom_col(aes(x = months,y=black),width = 1, color = blackcolor,fill = blackfill) + 
  geom_col(aes(x = months,y=red),width = 1, color = redcolor,fill = redfill) + 
  coord_polar(start = -1.6) +
  theme_minimal() +
  labs(subtitle = "1.\n            APRIL 1854 to MARCH 1855") +
  theme(axis.text = element_blank(),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        plot.subtitle = element_text(size= 15, hjust = .6, vjust=-50),
        plot.margin = unit(rep(-7,4), "cm"))


u <- 8
layer1 <- c(.9*u,.88*u,1*u,.6*u,.65*u,.48*u,.3*u,.4*u,.25*u,.14*u,.11*u,.15*u)
layer2 <- c(.25*u,.25*u,.45*u,.35*u,.37*u,.39*u,.18*u,.18*u,.13*u,0,0,.1*u)
layer3 <- c(0*u,.21*u,.203*u,.203*u,.165*u,.13*u,.13*u,.12*u,.03*u,0,0,0)
fill1 <- c(bluefill,bluefill,bluefill,bluefill,bluefill,redfill,bluefill,bluefill,bluefill,blackfill,blackfill,blackfill)
color1 <- c(bluecolor,bluecolor,bluecolor,bluecolor,bluecolor,redcolor,bluecolor,bluecolor,bluecolor,blackcolor,blackcolor,blackcolor)
fill2 <- c(blackfill,redfill,redfill,redfill,redfill,bluefill,redfill,blackfill,blackfill,blackfill,blackfill,bluefill)
color2 <- c(blackcolor,redcolor,redcolor,redcolor,redcolor,bluecolor,redcolor,blackcolor,blackcolor,blackcolor,blackcolor,bluecolor)
fill3 <- c(blackfill,blackfill,blackfill,blackfill,blackfill,blackfill,blackfill,redfill,redfill,blackfill,blackfill,bluefill)
color3 <- c(blackcolor,blackcolor,blackcolor,blackcolor,blackcolor,blackcolor,blackcolor,redcolor,redcolor,blackcolor,blackcolor,bluecolor)
chart2 <- tibble(layer1,layer2,layer3,months)

plot1 <- ggplot(chart2) +
  geom_col(aes(x = months, y = layer1), width = 1, color = color1, fill = fill1) +
  geom_col(aes(x = months, y = layer2), width = 1, color = color2, fill = fill2) +
  geom_col(aes(x = months, y = layer3),width = 1, color = color3, fill = fill3) +
  theme_minimal() +
  coord_polar(start = -1.6) +
  labs(subtitle =  "2.\nAPRIL 1855 to MARCH 1856") +
  theme(axis.text = element_blank(),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        plot.subtitle = element_text(size= 15, hjust = .4, vjust=0),
        plot.margin = unit(rep(-4,-4,-4,-7), "cm"))

layout <- c(
  area(t = 2, l = 0, b = 8, r = 5),
  area(t = 1, l = 5, b = 8, r = 10),
  area(t = 0, l = 0, b = 8, r = 10)
)

png("Causes-of-Death.png", width = 1300, height = 900)
plot1 + plot2 +
  plot_layout(design= layout) +
  plot_annotation(title = "DIAGRAM OF THE CAUSES OF MORTALITY\nin the Army in the East.",
                  theme =   theme(plot.title = element_text(hjust=.5, vjust = -28,size = 20, family = "Lancelot", face = "bold")))
dev.off()


?annotate
