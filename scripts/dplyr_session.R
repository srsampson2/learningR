#Learning dplyr

library(dplyr)

gapminder <- read.csv("data/gapminder_data.csv")
str(gapminder)

#using select FUNCTION to pick certain columns, which makes new dataframe
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)

#using the filter function to pick rows
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>% +
  select(year,country,gdpPercap)

#using dplyr for grouping variables, group by continent and summarize the mean GDP
gdp_by_continent <- gapminder %>%
  group_by(continent) %>% 
  summarize(mean_gdp = mean(gdpPercap))
gdp_by_continent

#CHALLENGE 2: CALCULATE LIFE EXPECTANCY PER COUNTRY. 

lifeExp_per_continent <- gapminder %>%   #MESSED UP HERE AND SAID BY CONTINENT
  group_by(country) %>%
  summarise(mean_lifeExp = mean(lifeExp))
str(lifeExp_per_continent)

#this one is better, properly named 
#now find which one has the longest average life expectancy
lifeExp_byCountry <- gapminder %>%
  group_by(country) %>% 
  summarise(mean_lifeExp = mean(lifeExp))
str(lifeExp_byCountry)

max(lifeExp_byCountry$mean_lifeExp) #still dont know which country

lifeExp_byCountry %>% filter (mean_lifeExp == max(mean_lifeExp))

#now find which one has the shortest average life expectancy

#integrating ggplot and dplyr
gapminder %>% 
  group_by(country,year) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  ggplot(aes(x=year,y=mean_lifeExp,color=country)) + geom_point()
 
