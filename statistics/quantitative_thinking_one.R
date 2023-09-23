# 商业数据统计，第一课 2023-09-23 上午
library(tidyverse)
library(e1071)
library(jiebaR)
library(wordcloud2)
library(rstatix)

load("/Users/liyou/class/r-learning/data/lj_sh_2019.RData")

lj %>%
  ggplot(aes(price_sqm)) + 
  geom_histogram(binwidth = 100) +
  stat_function(fun = ~dnorm(.x) * 100 * 6527, color = "red")

lj %>%
  ggplot(aes(price_sqm)) + 
  geom_histogram() 

table(lj$line)
names(which.max(table(lj$line)))
names(which.max(table(lj$station)))
View(lj)
library(jiebaR)
library(wordcloud2)
segment(lj$property_name,worker())
wordcloud2(freq(segment(lj$property_name,worker())))

lj %>% 
  ggplot(aes(x = bedrooms)) + 
  geom_histogram() +
  scale_x_continuous(breaks = seq(1,9, by = 1))


library(rstatix)
rstatix::get_mode(lj$decoration)
rstatix::get_summary_stats(lj)
glimpse(lj)
get_mode(lj$decoration)

quantile(lj$price_ttl,seq(0,1,0.01))

range(lj$price_ttl)
IQR(lj$price_ttl)
quantile(lj$price_ttl,0.75) - quantile(lj$price_ttl,0.25)

# 相对离散程度
sd(lj$price_sqm)/mean(lj$price_sqm)
sd(lj$price_ttl)/mean(lj$price_ttl)
sd(lj$building_area)/mean(lj$building_area)


# 五种基本图形
## 分类型数据



