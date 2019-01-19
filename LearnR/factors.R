# factors are like enums, they are groups of named integer values
# the used values are the names, underlying values are int equivalents
# total unique mappings are called levels
outcomes <- c("yes", "yes", "no", "yes", "no")
x <- factor(outcomes)
x

# grouped frequencies
table(x)

# underlying representation
unclass(x)

# levels are in alphabetical order by default but their order can be set using
# the levels argument to factor().
# This can be important in linear modelling because the first level is used as
# the baseline level.
y <- factor(outcomes, levels = c("yes", "no"))
y
