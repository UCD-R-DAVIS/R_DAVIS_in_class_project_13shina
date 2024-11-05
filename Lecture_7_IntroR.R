library(tidyverse)
library(ggplot2)

ggplot(diamonds, aes(x = carat, y = prices)) + 
  geom_point()

ggplot(diamonds, aes( x = carat, y = prices)) +
  geom_point(color = "red")

ggplot(diamonds, aes(x = carat, y = price, color = clarity))+
  geom_point(alpha = 0.2)

ggplot(diamonds, aes(x = carat, y = price, color = clarity))+
  geom_point(alpha = 0.2) + theme_classic()

ggplot(diamonds, aes(x=carat, y = price, color = clarity))+
  geom_point(alpha = 0.2) + theme_classic()+
  ggtitle("price by Diamond Quality") + ylab("Price in $")

ggplot(diamonds, aes(x=carat, y = price, color = clarity))+
  geom_point(alpha = 0.2) + theme_classic()+
  ggtitle("price by Diamond Quality") + ylab("Price in $")+
  stat_smooth(method = 'lm')

ggplot(diamonds, aes(x=carat, y = price, color = clarity))+
  geom_point(alpha = 0.2) + theme_classic()+
  ggtitle("price by Diamond Quality") + ylab("Price in $")+
  stat_smooth(method = "loess")
 
library("RColorBrewer") 
display.brewer.all(colorblindFriendly = TRUE)  


ggplot(diamonds, aes(x = calrity, y = carat, color = price))+
  geom_point(alpha = 0.2)+ theme_classic()+
  scale_color_virdis_c(option = "C", direction = -1)

ggplot(diamonds, aes (x = clarity, y = carat, color = price))+geom_point(alpha = 0.2)+ theme_classic()+
  scale_color_virdis_c(option = "E", direction = -1)

ggplot(diamonds, aes (x = clarity, y = carat, color = price))+geom_point(alpha = 0.2)+ theme_classic()+
  scale_color_virdis_b(option = "C", direction = -1)

ggplot(diamonds, aes(x = cut, y = carat, fill = color))+
  geom_boxplot()+ theme_classic()+
  ggtitle("Diamond Quality by Cut")+
  scale_fill_virdis_d("color")


ggplot(diamonds, aes(x = cut, y = carat, color = color))+
  geom_boxplot()+ theme_classic()+
  ggtitle("Diamond Quality by Cut")+
  scale_color_virdis_d("color")

ggplot(diamonds, aes(x = clarity, fill = cut))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))+
  scale_fill_viridis_d("cut", option = "B")+
  theme_classic()
 ggplot(diamonds, aes(x = cut, y = carat, fill = color))+
   geom_boxplot()+theme_classic()+
   ggtitle("diamond Quality by Cut")+
   scale_fill_brewer(palette = "PuRd")
 display.brewer.all(colorblindFriendly = TRUE)

ggplot(iris,
       aes(x = Sepal.Length, y = Petal.Lenght, fill = Species))+
  geom+point(shape = 24, color "black", size = 4)+
  theme_clasic()+
  ggtitle("Sepal and Petal Length of Three Iris Species")+
  scale_fill_brewer(palette = "set2")
display.brewer.all(colorblindFriendly = TRUE)

library(ggthemes)
ggplot(iris, aes( x = Sepal.Length, y = Petal.Length, color = Species))+
  geom_point()+theme_classic()+
  ggtitle("Sepal and Petal Length of Three Iris Species")+
  scale_color_colorblind("species")+
  xlab("Sepal Length in cm")+
  ylab("petal length in cm")

https://rdrr.io/github/jlmelville/vizier/man/turbo.html
mybar <- ggplot(diamonds, aes(x = clarity))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))+
  theme_classic()+ ggtitle("Number of Diamonds by Clarity")
mybarplot()

library(BrailleR)  
VI(mybarplot)  

library(sonify)
plot(iris$Petal.Width)
sonify(iris$Petal.Width)  
  
detach("package:BrailleR", unload = TRUE)  
 
library(cowplot)
plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 70, vjust = 0.5))

plot.cars <- ggplot(mpg, aes( x = cty, y = hwy, colour = factor(cyl)))+
  geom_point(size = 2.5)


plot.iris <- ggplot(data = iris, aes ( x = Sepal. Length, y = Petal.Length, fill = ))+
  geom_point(size = 3. alpha = 0.7, shape = 21)


panel_plot <- plot_grid















 
  
  
  
  
  
  
  
  
  
  
  































  
  
  
  
  
  
  