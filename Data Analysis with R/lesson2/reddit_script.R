reddit = read.csv('reddit.csv')
str(reddit)
library(ggplot2)
levels(reddit$age.range) = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above")
levels(reddit$age.range)

plot(x=reddit$age.range)

?qqplot
