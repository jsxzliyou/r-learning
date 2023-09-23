# 2023-09-16 第一次课程  上午
1 / 200 * 30
(59 + 73 + 2) / 3
sin(pi / 2)
x <- 3 * 4
y <- sin(pi / 2)
x*y

this_is_a_really_long_name <- 2.5
this_is_a_really_long_name <- 3.5

seq(1,10)
x <- seq(1,10)
x
x <- "LiYouYou"
x <- "李游游"
x
y <- seq(1,100, length.out = 5)
y

(y <- seq(1,9))

typeof(letters)


1:10 %% 3 == 1
1 %% 3

x <- c(TRUE, TRUE, FALSE, NA)
is.na(x)
is.nan(x)
is.finite(x)
is.infinite(x)

(x <- sqrt(2) ^ 2)
x

y <- rep(x, 10)
y
pryr::object_size(y)

x <- sample(20, 10000000 , replace = TRUE)
y <- x > 10
y
sum(y)
length(y)
mean(y)


####  下午
#tibble(x = 1:4, y= 1:2)

c(x=1, y=2, z=4)

c(x=1:3, y=2:4, z=4:6)

x <- c("one","two","three","four","five")
x
x[c(1,3,5)]

x <- c(10,3,NA,5,8,1,NA)
!is.na(x)
x[!is.na(x)]
