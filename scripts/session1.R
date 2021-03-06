# Learning R 
# Friday April 12
#Initialize cats dataframe
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0,3.2), 
                   likes_string = c(1, 0, 1))
write.csv(x=cats, file="data/feline.csv")

# an intentional error 
cats$weight + cats$coat

#what type of variable
typeof(cats$weight)

#what class is cats
class(cats)

#lets talk about vectors
my_vector 
my_vector <- vector(length = 3)

#another vector: character
another_vector <- vector (mode = "character", length = 3)
another_vector

#another exploratory command
str(anotehr_vector)
str(cats$coat)
str(cats$weight)
str(cats$likes_string)


#make a new vector
quiz_vector <- c(2,6,'3')
quiz_vector

coercion_vector <- c('a', TRUE)
coercion_vector
str(coercion_vector)

coercion_vector <- c(a,'TRUE')
coercion_vector
str(coercion_vector)

coercion_vector <- c('a', TRUE)
coercion_vector
another_coercion_vector <- c('a', TRUE)
typeof(another_coercion_vector)

#forcing example
character_vector_example <- c('0', '2', '4')
character_vector_example

character_coerced_to_numeric <- as.numeric(character_vector_example)
character_coerced_to_numeric

#useful coercion
cats$likes_string
typeof(cats$likes_string)
cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string

#appending 
ab_vector <- c('a', 'b')

#populate quickly
mySeries <- 1:10
mySeries

str(cats$weight)
str(cats$coat)
coats <- c('tabby','tortiseshell','tortiseshell','black')
str(coats)
CATegories <- factor(coats)
str(CATegories)

#age of cats
age <-c(2,NA,5)
cats
cbind(cats, age)

#adding a row
nrow(cats)
newRow <- list("tortoiseshell",3.3,TRUE,9)
cats <- rbind(cats,newRow)
cats
levels(cats$coat)
levels(cats$coat) <- c(levels(cats$coat), 'tortoiseshell')


#ommitting NAS
na.omit(cats)
cats <-na.omit(cats)
cats

cats <-na.omit(cats)
