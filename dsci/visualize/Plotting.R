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
viz_lyr <- aes(x = displ, y = hwy)
# viz_lyr <- aes(x = hwy, y = cyl)
# viz_lyr <- aes(x = class, y = drv)

# viz_lyr <- aes(x = displ, y = hwy, colour = class)    # unordered = unordered
# viz_lyr <- aes(x = displ, y = hwy, size = class)      # ordered = unordered
# viz_lyr <- aes(x = displ, y = hwy, alpha = class)     # ordered = unordered
# viz_lyr <- aes(x = displ, y = hwy, shape = class)     # unordered = unordered

# viz_lyr <- aes(x = displ, y = hwy, colour = cty)      # scaled = ordered
# viz_lyr <- aes(x = displ, y = hwy, size = cty)        # scaled = ordered
# viz_lyr <- aes(x = displ, y = hwy, alpha = cty)       # scaled = ordered
# viz_lyr <- aes(x = displ, y = hwy, shape = cty)       # error

# viz_lyr <- aes(x = displ, y = hwy, colour = cty, size = cty)
# viz_lyr <- aes(x = displ, y = hwy, alpha = cty, size = cty)
# viz_lyr <- aes(x = displ, y = hwy, alpha = cty, colour = cty)
# viz_lyr <- aes(x = displ, y = hwy, colour = hwy, size = displ)
# viz_lyr <- aes(x = displ, y = hwy, colour = displ, size = hwy)
# viz_lyr <- aes(x = displ, y = hwy, colour = cty, size = year)
# viz_lyr <- aes(x = displ, y = hwy, colour = year, size = cty)
# viz_lyr <- aes(x = displ, y = hwy, alpha = cty, size = year)
# viz_lyr <- aes(x = displ, y = hwy, alpha = year, size = cty)

# viz_lyr <- aes(x = displ, y = hwy, color = displ < 5 | hwy <= 20)
# viz_lyr <- aes(x = displ, y = hwy, color = displ > 5 & hwy > 20)

# do the plotting
# plt + geom_point(mapping = viz_lyr)
# plt + geom_point(mapping = viz_lyr, color = "#1068B5")
# plt + geom_point(
#   mapping = viz_lyr,
#   shape = 23, color = 'blue', fill = 'green', size = 2, stroke = 1
#   )
# plt + geom_count(mapping = viz_lyr)

count(mpg, drv)
count(mpg, cyl)
count(mpg, drv, cyl)

# facets for categorical variables
# one variable at a time
plt + geom_point(mapping = viz_lyr) + facet_wrap(~ class, nrow = 1)
plt + geom_point(mapping = viz_lyr) + facet_wrap(~ class, ncol = 1)
plt + geom_point(mapping = viz_lyr) + facet_wrap(~ class, nrow = 2)
plt + geom_point(mapping = viz_lyr) + facet_wrap(~ class)
plt + geom_point(mapping = viz_lyr) + facet_wrap(drv ~ cyl, labeller = labeller(drv = label_both, cyl = label_both))
# two variables at a time
plt + geom_point(mapping = viz_lyr) + facet_grid(. ~ class)
plt + geom_point(mapping = viz_lyr) + facet_grid(class ~ .)
plt + geom_point(mapping = viz_lyr) + facet_grid(drv ~ cyl, labeller = labeller(drv = label_both, cyl = label_both))
plt + geom_point(mapping = viz_lyr) + facet_grid(. ~ cyl)
plt + geom_point(mapping = viz_lyr) + facet_grid(drv ~ .)

