library(tidyverse)

tail(mpg)
head(mpg)
nrow(mpg)
ncol(mpg)

count(mpg, class, drv)
count(mpg, drv, class)

nrow(mtcars)
ncol(mtcars)
glimpse(mtcars)

# initialize the plot
plt <- ggplot(data = mpg)

# define the x-y mapping aesthetics
# viz_lyr <- aes(x = displ, y = hwy, colour = class)
# viz_lyr <- aes(x = displ, y = hwy, size = class)
viz_lyr <- aes(x = displ, y = hwy, alpha = class)
# viz_lyr <- aes(x = displ, y = hwy, shape = class)
# viz_lyr <- aes(x = hwy, y = cyl)
# viz_lyr <- aes(x = class, y = drv)

# do the plotting
# plt + geom_point(mapping = viz_lyr)
plt + geom_point(mapping = viz_lyr, color = "blue")
# plt + geom_count(mapping = viz_lyr)
