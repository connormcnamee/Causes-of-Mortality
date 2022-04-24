library(tidyverse)
library(plotly)
library(patchwork)
library(showtext)
library(magick)

font_add_google("Dancing Script", "Dancing Script")
font_add_google("Imperial Script", "Imperial Script")
font_add_google("Lancelot","Lancelot")
font_add_google("Hurricane","Hurricane")
font_add_google("Six Caps", "Six Caps")
font_add_google("Charm","Charm")
font_add_google("Oswald","Oswald")
showtext_auto()

# Assign color values, and lengths of bars for plot2
blackfill <- rgb(0.33,0.33,0.33, alpha = 1)
redfill <- rgb(1.00,0.77,0.77,alpha = 1)
bluefill <- rgb(0.83,0.96,1.00, alpha = 1)
blackcolor <- rgb(0.10,0.08,0.00, alpha = 1)
redcolor <- rgb(1.00,0.25,0.25, alpha = 1)
bluecolor <- rgb(0.40,0.90,1.00, alpha = 1)
blue <- c(0,.1,.08,.5,.8,.76,.55,.7,.9,1.2,1,.8)
months <- c("a","b","c","d","e","f","g","h","i","j","k","l")
red <- c(0,0,0,0,0,.18,.25,.35,.23,.2,.16,.1)
black <- c(.09,.07,.02,.12,.13,.2,.255,.23,.25,.33,.35,.29)
chart1 <- tibble(blue,months,red,black)

# Right Plot
plot2 <- ggplot(chart1) +
  geom_col(aes(x = months,y=blue), width = 1, color = bluecolor, fill = bluefill) +
  geom_col(aes(x = months,y=black),width = 1, color = blackcolor,fill = blackfill) + 
  geom_col(aes(x = months,y=red),width = 1, color = redcolor,fill = redfill) +
  annotate("text",x=c(seq(1,6,1),7.1,seq(8,12,1)), y=c(.4,.4,.4,.55,.85,.81,.6,.75,.95,1.25,1.05,.85),label=c("APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER","JANUARY 1855","FEBRUARY","MARCH 1855."),size=4, fontface="bold.italic",
           angle=c(80,40,10,-15,-45,-75,-105,-135,-165,165,140,110)) +
  annotate("text",x=c(1,3.2,6.6),y=c(.35,.25,.7),label=c("1854","BULGARIA","CRIMEA"),size=4,fontface="bold.italic",angle=c(80,90,0)) +
  coord_polar(start = -1.58) +
  theme_minimal() +
  labs(subtitle = "1.\n            APRIL 1854 to MARCH 1855") +
  theme(axis.text = element_blank(),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        plot.subtitle = element_text(size= 15, hjust = .6, vjust=-61.5, family="Oswald"),
        plot.margin = unit(rep(-2,4), "cm"))

# assign colors and length of bars for plot1
layer1 <- c(.9,.88,1,.6,.65,.48,.3,.4,.25,.14,.11,.15)
layer2 <- c(.25,.25,.45,.35,.37,.39,.18,.18,.13,0,0,.1)
layer3 <- c(0,.21,.203,.203,.165,.13,.13,.12,.03,0,0,0)
fill1 <- c(bluefill,bluefill,bluefill,bluefill,bluefill,redfill,bluefill,bluefill,bluefill,blackfill,blackfill,blackfill)
color1 <- c(bluecolor,bluecolor,bluecolor,bluecolor,bluecolor,redcolor,bluecolor,bluecolor,bluecolor,blackcolor,blackcolor,blackcolor)
fill2 <- c(blackfill,redfill,redfill,redfill,redfill,bluefill,redfill,blackfill,blackfill,blackfill,blackfill,bluefill)
color2 <- c(blackcolor,redcolor,redcolor,redcolor,redcolor,bluecolor,redcolor,blackcolor,blackcolor,blackcolor,blackcolor,bluecolor)
fill3 <- c(blackfill,blackfill,blackfill,blackfill,blackfill,blackfill,blackfill,redfill,redfill,blackfill,blackfill,bluefill)
color3 <- c(blackcolor,blackcolor,blackcolor,blackcolor,blackcolor,blackcolor,blackcolor,redcolor,redcolor,blackcolor,blackcolor,bluecolor)
chart2 <- tibble(layer1,layer2,layer3,months)


# Left Plot
plot1 <- ggplot(chart2) +
  geom_col(aes(x = months, y = layer1), width = 1, color = color1, fill = fill1) +
  geom_col(aes(x = months, y = layer2), width = 1, color = color2, fill = fill2) +
  geom_col(aes(x = months, y = layer3),width = 1, color = color3, fill = fill3) +
  annotate("text", x=seq(1,12,1), y=c(1,.98,1.1,.7,.75,.65,.65,.65,.65,.65,.65,.65), label=c("APRIL 1855","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER","JANUARY","FEBRUARY","MARCH"), size=3.6, angle=c(75,45,15,-15,-45,-75,-105,-135,-165,165,135,105),fontface="bold.italic") +
  annotate("text", x=10, y = .57,label="1856",size=3.6,angle=165,fontface="bold.italic") +
  theme_minimal() +
  coord_polar(start = -1.58) +
  labs(subtitle =  "      2.\nAPRIL 1855 to MARCH 1856") +
     #  caption = "The Areas of the blue, red, & black wedges are each measured from\n  the centre as the common vertex.\nThe blue wedges are measured from the centre of the circle represent area\n  for area the deaths from Preventible or Mitigable Zymotic diseases; the\n  red wedges measured from the centre the deaths from wounds; & the\n  black wedges measured from the centre the deaths from all other causes.\nThe black line across the red triangle in Nov. 1854 marks the boundary\n  of the deaths from all other causes during the month\nIn October 1854, & April 1855; the black area coincides with the red;\n  in January & February 1855; the blue coincides with the black\nThe entire areas may be compared by following the blue, the red, & the\n  black lines enclosing them.") +
  theme(axis.text = element_blank(),
        panel.grid = element_blank(),
        axis.title = element_blank(),
        plot.subtitle = element_text(size= 15, hjust = .4, vjust=-9, family = "Oswald", lineheight=1.07),
        plot.margin = unit(c(-5,-5,-8,-5), "cm"),
        plot.caption = element_text(hjust = 0, family = "Charm", face = "italic",size = 12.5, vjust =6, lineheight = 1.25),
        aspect.ratio=1)

#Area for each plot on patchwork
layout <- c(
  area(t = 4, l = 1, b = 20, r = 5),
  area(t = 0, l = 5, b = 25, r = 10),
  area(t = 0, l = 0, b =25, r = 10)
)

# Put plots together and add title
picture <- image_graph(width = 1300, height = 900)
  plot1 + plot2 +
  plot_layout(design= layout) +
  plot_annotation(title = "DIAGRAM OF THE CAUSES OF MORTALITY",
                  subtitle = "in the ARMY in the EAST",
                  theme =   theme(plot.title = element_text(hjust=.5, vjust = -19,size = 26, family = "Lancelot", face = "bold"),
                                  plot.subtitle = element_text(hjust=.5, vjust = -54,size = 14.5, family = "serif", face= "bold",lineheight=1.1)))
dev.off()
print(picture)

# Use magick to add lines and caption at bottom
img <- image_draw(picture)
text(120, 755, "The Areas of the blue, red, & black wedges are each measured from\n  the centre as the common vertex.\nThe blue wedges are measured from the centre of the circle represent area\n  for area the deaths from Preventible or Mitigable Zymotic diseases; the\n  red wedges measured from the centre the deaths from wounds; & the\n  black wedges measured from the centre the deaths from all other causes.\nThe black line across the red triangle in Nov. 1854 marks the boundary\n  of the deaths from all other causes during the month\nIn October 1854, & April 1855; the black area coincides with the red;\n  in January & February 1855; the blue coincides with the black\nThe entire areas may be compared by following the blue, the red, & the\n  black lines enclosing them.", family = "Charm", cex = 1.3, srt = 0, adj=0, lheight=1.2)
# Two dotted segments connecting the graphs
segments(x0=450,y0=572, x1=713,y1=492, lwd = 1, lty = "dotted")
segments(x0=450,y0=572, x1=160,y1=479, lwd = 1, lty = "dotted")
# Line underlining title of left plot
segments(x0=227,y0=244, x1=333,y1=244, lwd = 1, lty = "solid")
# Line underlining title of right plot
segments(x0=936,y0=262, x1=1042,y1=262, lwd = 1, lty = "solid")
#Two lines underlining the main subtitle
segments(x0=587,y0=221, x1=713,y1=221, lwd = 1, lty = "solid")
segments(x0=565,y0=224, x1=732,y1=224, lwd = 1, lty = "solid")
print(img)
dev.off()

image_write(img, path = "Death-Causes.png", format = "png")

