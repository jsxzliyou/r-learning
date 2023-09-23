# 第二课

# 第三章
library(nycflights13)
library(tidyverse)
View(flights)
flights

filter(flights, month == 1, day == 1)
(dec25 <- filter(flights, month == 12, day == 25))
(nov_dec <- filter(flights, month == 11 | month ==12))
(nov_dec <- filter(flights, month %in% c(11,12)))

filter(flights, dest == "IAH" | dest == "HOU")
filter(flights, arr_delay > 2 & dep_delay <= 0)

arrange(flights, year, month, day)
View(arrange(flights, desc(arr_delay)))

select(flights, year, month, day)

select(flights, year:dep_time)
select(flights, -(year:dep_time))
# 对列重命名
rename(flights, dt = dep_time)
# 选出几列放在前面
View(select(flights, day, time_hour, air_time, everything()))

View(flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time))
# 继承上面的列，然后增加新的列
View(mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60))
# 新创建的列可以继续用来计算
View(mutate(flights_sml,
            gain = arr_delay - dep_delay,
            hours = air_time / 60,
            gain_per_hour = gain / hours))
# 只保留新的列
transmute(flights,
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours)
# 求均值，排除掉NA
summarise(flights, delay = mean(dep_delay, na.rm = T))
summarise(flights, delay = mean(dep_delay))
# 分组求均值
by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = T))
# 分组统计
by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm =TRUE))
View(delay)
View(arrange(delay, desc(count)))
delay <- filter(delay, count > 20, dest != "HNL")
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) + 
  geom_smooth(se = FALSE)
  
# 通过管道重构分组统计，管道快捷键 ctl+shift+M
delays <- flights %>%
  group_by(dest) %>%
  summarise(
    count = n(),
    dist = mean(distance, na.rm = T),
    delay = mean(arr_delay, na.rm = T)
  ) %>%
  filter(count > 20, dest != "HNL") %>%
  arrange(desc(count))

View(delays)

# 取消航班数据源
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay)
  )
ggplot(data = delays, mapping = aes(x = delay)) + 
  geom_freqpoly(binwidth = 10)

View(not_cancelled)
# 每天最早和最晚的航班何时出发
not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(min(dep_time), max(dep_time))

View(flights %>% filter((month == 7 & day == 4) | (month == 12 & day == 25), 
                        dest %in% c("DCA","IAD","BWI")))

flights %>% filter((month == 7 & day == 4) | (month == 12 & day == 25), 
                   dest %in% c("DCA","IAD","BWI")) %>% 
  group_by(month, day, dest) %>% 
  summarise(first = min(arr_delay, na.rm = T), 
            last = max(arr_delay, na.rm = T), 
            avg_delay = mean(arr_delay, na.rm = T), 
            sd_delay = sd(arr_delay, na.rm = T),
            avg_air = mean(arr_time, na.rm = T))
  
### module C  关系数据
library(nycflights13)
library(tidyverse)
View(flights)
View(airlines)

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)
left_join(x, y, by = "key")
x %>% left_join(y, by = "key")

flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)

# flights2 %>% 
#   select(-origin, -dest) %>% 
#   left_join(airlines, by = "carrier")

flights2 %>%  
  select(-origin, -dest) %>% 
  mutate(name = airlines$name[match(carrier, airlines$carrier)])

flights2 %>% 
  left_join(weather)
flights2 %>% 
  left_join(planes, by = "tailnum")
View(weather)
View(airports)

flights2 %>% 
  left_join(airports, c("dest" = "faa"))
flights2 %>% 
  left_join(airports, c("origin" = "faa"))

top_dest <- flights %>% 
  count(dest, sort = TRUE) %>% 
  head(10)
View(top_dest)

flights %>% 
  filter(dest %in% top_dest$dest)
flights %>% 
  semi_join(top_dest)

flights %>% 
  anti_join(planes, by = "tailnum") %>% 
  count(tailnum, sort = TRUE)



# first function
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x -rng[1]) / (rng[2] - rng[1])
}
rescale01(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))

range(c(0,1,2,3,4,5,6,7,8,9,10), na.rm = T)

cal <- function(x) {
  sqr <- x * x
  #sqr[1] + sqr[2] + sqr[3] 
  sum(sqr, na.rm = TRUE)
}
cal(c(1,3,4))

