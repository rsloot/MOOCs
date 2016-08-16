library(ggplot2)
data(diamonds)
load(diamonds)
str(diamonds)

levels(diamonds$color)

qplot(x=price, data=diamonds, fill=I('blue'))
summary(diamonds$price)

table(diamonds$price<500, diamonds$price<250,
      diamonds$price>=15000)

##Cheaper Diamonds
qplot(x=diamonds$price, data=diamonds,
      fill=I('orange'), color=I('black')) +
  scale_x_continuous(breaks=seq(0,1500,100), 
                     limits = c(0,1500))
?coord_cartesian

## Price by cut histograms
qplot(x=price, data=diamonds,
      color=price, fill=cut,
      binwidth=100) +
  scale_x_continuous(limits = c(0,5000))

## or
qplot(x = price, data = diamonds,
      color=price, fill=cut) + 
  facet_wrap(~cut, scales = 'free_y')


by(diamonds$price, diamonds$cut, summary)

## Price per Carat by Cut
qplot(x=price/carat, data=diamonds,
      color=price, fill=cut,
      xlab = 'price per carat',
      ylab = 'count') +
  facet_wrap(~cut, scales='free_y') +
  scale_x_log10()
?qplot


## Price Box Plots
qplot(x=cut, y=price, data=diamonds,
      fill=cut, geom = 'boxplot')
qplot(x=clarity, y=price/carat, data=diamonds,
      fill=color, geom='boxplot',
      ylab = 'price per carat') #+

  coord_cartesian(ylim=c(0,10000))
  scale_y_continuous(breaks=seq(0,8000,1000))
ggsave('clarity, cut per carat color.png')

##Interquartile range
by(diamonds$price, diamonds$color, summary)
IQR(diamonds$price[diamonds$color == 'D'])#best
IQR(diamonds$price[diamonds$color == 'J'])#worst


## price per Carat box plots across colors
qplot(x=color, y=price/carat,
       data=diamonds, geom='boxplot',
       fill=color) +
  scale_y_continuous(breaks=seq(0,10000,1000),
                     limits = c(0,10000))
ggsave('price-carat color boxplots.png')


## Carat Frequency Polygon
qplot(x=carat, data=diamonds,
      geom = 'freqpoly', binwidth=0.1) +
  geom_abline(intercept = 2000, color='red')


## Gapminder data (xlsx)
library(gdata)

?read.xls

dat = read.csv("https://spreadsheets.google.com/pub?key=pyj6tScZqmEfH89V6UQhpZA&output=csv",
               header=TRUE, check.names = FALSE)
dat %>% summary
us = dat['United States',]

dat1 = tidyr::gather(dat, 'Year', 
                   'Urban_Pop', na.rm = T, 2:53)
colnames(dat1) = c('country', 'year', 'urban_pop')

dat1$year = as.Date(dat1$year, '%Y', origin = '1960')

?as.Date

str(dat1)

?Date


dat1 %>% 
  group_by(country, year)

x = dat1 %>% filter(country==c('China','United States',
                               'United Kingdom', 'Japan',
                               'Canada','Mexico',
                               'Germany','India'))

qplot(x=year, y=urban_pop, data = x,
      xlab = 'Year',
      ylab = 'Urban Population in 1000s',
      main = 'Urban Population Growth from 1960'
      # color=country
      ) +
  scale_x_discrete(breaks=seq(1960, 2011, 5)) +
  facet_wrap(~country, scales = 'free_y')


##############
## Facebook birthday exploration
fb = read.csv('birthdaysExample.csv')
str(fb)
fb$dates = as.Date(fb$dates, '%m/%d/%y')
?as.Date()
View(fb)

fb = tidyr::separate(fb, dates, c('year','month','day'))

qplot(x=month, data=fb, 
      fill=day)

geom_

fb$con = ((abs(as.numeric(fb$month)+3) %% 12))
fb$con = ifelse(fb$con==0, 12, fb$con)


?tidyr::unbind
?dplyr::mutate
?scale_x_date







