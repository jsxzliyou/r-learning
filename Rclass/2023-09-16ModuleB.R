# 图形化处理
#install.packages("tidyverse")
library(tidyverse)
mpg
View(mpg)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = drv))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = drv))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = drv))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = drv))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "green")

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid( drv ~ cyl)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(.~class)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv~.)

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) + 
  facet_wrap(~class, nrow = 2)
  
#练习(6) p1
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE, show.legend = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy))

# p2
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE, show.legend = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy))

# p3
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))


#p4
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy), se = FALSE,) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# p5
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# p6
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

View(diamonds)


# 直方图
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))
# 占比
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop..,group = 1))
# 统计对比图
ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

# 直方图上色
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = clarity),
           position = "dodge")


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),
             position = "jitter")


