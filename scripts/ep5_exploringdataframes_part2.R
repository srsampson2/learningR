#Exploring Data Frames
#Episode 5 - Exploring data frames continued
#Author: Sarah Sampson
#Date: april 12, 2019
#UC Santa Barbara Library

#explore gapminder dataset
#gapminder was downloaded in ep2 Project Management

#READ in gapminder.csv
gapminder <- read.csv("data/gapminder_data.CSV")

#visually inspect our imported dataset
#click on gapfinder

#STRUCTURE of gapfinder
#rememver data classes: int, num, factor
str(gapminder)


#SUMMARY: Factor columns are summarized by the number of items in each level
#numeric or integer columns are summarized by the descriptive statistics 
#charachter columns are summarized by its length, class, and mode
summary(gapminder)
min(gapminder$year)
max(gapminder$year)
#summary of gapminder, by country column
summary(gapminder$country)

#Object Type
#what is the object type in the year column?
typeof(gapminder$year)

#what is the object type in the county column?
typeof(gapminder$country)

#LENGTH (number of columns)
length(gapminder)

#type of entire gapminder data set
#list of 6 columns
typeof(gapminder)

#NUMBER OF ROWS
nrow(gapminder)

#NUMBER OF COLUMNS 
ncol(gapminder)

#DIMENSIONS
dim(gapminder)

#COLUMN NAMES OR TITLES
colnames(gapminder)

#previewing our dataset
#HEAD (remember from bash?)
#preview first few lines
head(gapminder, n=15)

#CHALLENGE 1:
#medium
#how do you preview the last few lines of gapminder
tail(gapminder, n=12)
mid(gapminder, n=12)

#harder
#how would you preview some lines in the middle?
gapminder[850:870, ]
#below gives me median of population, not middle few lines
median(gapminder$pop)

#how would you preview middle lines if you didn't know dimensions