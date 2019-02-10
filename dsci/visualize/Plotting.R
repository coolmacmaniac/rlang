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
# viz_lyr <- aes(x = displ, y = hwy)
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


# geometric objects
viz_lyr <- aes(x = displ, y = hwy)
viz_lyr <- aes(x = displ, y = hwy, linetype = drv)
plt + geom_smooth(mapping = viz_lyr)

plt +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

plt +
  geom_smooth(mapping = aes(x = displ, y = hwy))

plt +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

plt +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, colour = drv),
    show.legend = F
    )

plt +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
  ) +
  geom_smooth(show.legend = F) +
  geom_point(show.legend = F)

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy),
  show.legend = F
  ) +
  geom_smooth(show.legend = F) +
  geom_point(mapping = aes(colour = class), show.legend = F)

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
  ) +
  geom_smooth(
    data = filter(mpg, class == 'subcompact'),
    se = FALSE
  ) +
  geom_point(mapping = aes(colour = class))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  # geom_boxplot()
  # geom_histogram(stat = 'identity')
  # geom_line()
  geom_smooth(se = FALSE)
  # geom_area()
  # geom_bar(stat = 'identity')

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
  ) +
  geom_point() +
  geom_smooth(se = FALSE)

####

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = F)

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(mapping = aes(group = drv), se = F)

ggplot(mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(se = F)

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(se = F)

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv)) +
  geom_smooth(mapping = aes(linetype = drv), se = F)

ggplot(mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(
    shape = 21,
    size = 5,
    stroke = 4,
    color = "white"
  ) +
  geom_point(
    mapping = aes(color = drv),
    size = 4
  )

####

