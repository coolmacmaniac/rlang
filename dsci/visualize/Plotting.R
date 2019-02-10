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

# statistical transformations

tail(diamonds)
count(diamonds, cut)
count(diamonds, color)
count(diamonds, cut, color)

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut),
    color = "black",
    fill = "violet",
    alpha = 0.3
    )

ggplot(data = diamonds) +
  stat_count(
    mapping = aes(x = cut),
    color = "blue",
    fill = "violet",
    alpha = 0.3
  )

demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)
ggplot(data = demo) + geom_bar(mapping = aes(x = a))
ggplot(data = demo) + geom_bar(mapping = aes(x = a, y = b), stat = 'identity')

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop..)
  )

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., fill = color)
  )

# If x or y are categorical variables, the rows with the same level form a
# group. This is default grouping. geom_bar has underlying stat as count and it
# counts the rows based on 'x' categories. In this case, the each of the
# categories of 'x' form a separate group, the counted values form 'y' values.
# This is useful when the values on 'y' are not related amout various 'x'
# groups like for count. If we use prop as 'y' values then they are related
# over multiple groups of 'x', i.e., they are proportional to each other.
# So for such cases, we should treat all 'x' categories as one group and we can
# override the default grouping by using group parameter of aes.
# In the following code, the group value can be any constant such as 1 or 'abc'
# After removing the default grouping, geom treats all categories as one group
# so that there is a combined plot taking all categories of 'x' into context.
# We can use any computed variable for 'y' but surrounded by two dots (..)
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 'single-grp-123')
  )
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., fill = color, group = color)
  )

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.ymin = min,
    fun.ymax = max,
    fun.y = mean
  )

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut)
  )

ggplot(data = diamonds) +
  geom_col(
    mapping = aes(x = cut, y = depth)
  )
