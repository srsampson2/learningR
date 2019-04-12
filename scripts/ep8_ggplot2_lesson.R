#practice lesson
#episode 8 creating publication-quality graphics with ggplot2
#software carpentry
#april 12 2019
#author sarah sampson

#open ggplot2 library, we installed this morning
library(ggplot2)
#initiate new variable called gapminder, to read gapminder file in
#data folder
gapminder <- read.csv("data/gapminder_data.csv")

#visually inspect gapminder

#DATA SUBSETTING
#looking at row 1, column 1
gapminder[1,1]
#look at row 1

#preview top few lines
head(gapminder)

#preview bottom limes
tail(gapminder)
#lets look at middle
gapminder[900:905, ]

#call ggplot function to create new plot, GLOBAL otpion, applies to all LAYERS
#aes - aesthetic properties, x and y locations, looks for column headings nice
#geom - this layer tells how we want to visually represent data

#(geom_point - scatterplot)
#lets plot gdPercap vs lifeExp
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

#easy CHALLENGE
#MODIFY the line above to show how life expectancy has changed over time
ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_point()

#medium CHALLENGE 2
#aesthetic property of color
#modify code to color the points by continent column
#what trends do you see? are they what you expected?
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour=continent)) +
  geom_point()

####LAYERS
#scatterplot is hard to visualize change over time through line plot instead
#line plot instead
#add geom_line layer instead of geom_point
#by aesthetic draws line for each country
#added by=country within aes()
ggplot(data = gapminder, aes(x = year, y = lifeExp,by = country, colour=continent)) +
  geom_line()

#try plot for line for each continent
#added geom_line() and geom_point()
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour=continent)) +
  geom_line() + #second line layer
  geom_point()  #scatter plot

#visualize line and points
#add another layer
#what if? side note: changed background to gray
ggplot(data = gapminder, aes(x = year, y = lifeExp, colour=continent)) + #baselayer
  geom_line() + #second line layer
  geom_point()  #scatter plot
theme_bw()

#draw points on top of lines, black color for points
#added aes parameter within geom_line
#not global! notice our points are now black

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour=continent)) + #baselayer
  geom_line() + #second line layer
  #geom_point()  #scatter plot
theme_bw()

#draw points on top of lines, black color for points
#added aes parameter within geom_line
#Not global! notice our points are now black

ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #baselayer
  geom_line(aes(col = continent)) + #second line layer
  geom_point()  #scatter plot

#TIP
#CHANGE COLOR OF ALL LINES TO PURPLE
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #baselayer
  geom_line(color = "purple") + #second line layer
  geom_point()  #scatter plot

#CHANGE COLOR OF ALL LINES TO BLUE
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #baselayer
  geom_line(color = "blue1") + #second line layer
  geom_point()  #scatter plot

#parameters within aes are looking for vaiables withing your dataset
#set specific colors outside of aes

##easy challenge 3
#switch order of point and line layers from prev example
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country)) + #baselayer
  geom_point() +#second line layer()  #scatter plot
  geom_line(color = "PINK")

#TRANSFORMATION AND STATISTICS
#OVERLAY STATISTICAL MODELS OVER DATA 
#going back to scatterplot, similar to first plot
#color by continent
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point()

#currently its hard to see relationship between points due to strong outliers in GDP
#lets change scale of units on x axis using scale function
#log 10 function applies transformation to values of gdpPercap column
#using alpha function (transparency)


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #baselayer
  geom_point(alpha = 0.5) +
scale_x_log10()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) + #baselayer
  geom_point(aes(alpha = continent)) +
  scale_x_log10()

#geom_smooth, adding another layer here
#geom_smooth method = "lm"
#lm = fit linear models


ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #baselayer
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = "lm") #geom smooth layer - linear model


#make line thicker
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #baselayer
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = "lm", col = "red", size = 1.5) #geom smooth layer - linear model


#CHALLENGE 4a 
#modify color and size of points on the point layer
#in the preious example
#hint do not use the aes function
#also changed aes(shape=continent) to have different symbols per continent

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + #baselayer
  geom_point(col = "blue", size = 1.3, aes(shape=continent)) +
  scale_x_log10() +
  geom_smooth(method = "lm", col = "red", size = 1.5) #geom smooth layer - linear model



#MULTIPLE PANEL FIGURES
#LOOK AT LIFE EXPECTANCY OVER TIME ACROSS ALL COUNtries
#Split into multiple graphs side by side



#start by subsetting data
#use substr funciton to pull out part of character string
#letters that occur in position start through stop
#in this case, looking at first letter of A or Z
#create new subset or substring called starts.with


startsWith <- substr(gapminder$country, start=1, stop=1)

#operator %in% allows us to make multiple comparisons
#create new subset called az.countries
az.countries <- gapminder[startsWith %in% c("A","Z"),]
gapminder[1,1]

#initiate ggplot
#adding line plot layer
#facet wrap took the above formula as its argument, denoted by ~
#this tells R to draw panel for each unique value
#in country column of gapminder dataset

ggplot(data = az.countries, aes(x=year, y=lifeExp, color=continent)) +
  geom_line() +
  facet_wrap( ~ country) #facet wrap

