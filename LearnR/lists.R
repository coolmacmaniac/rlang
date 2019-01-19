# with elements of different class types
x <- list(3.14, 108L, "s", 'xxx', TRUE, F, 6+9i)
x

# list is a vector but it allows to store different typed elements
y <- vector(mode = "list", length = 5)
y

# named elements
x <- list("Berlin" = 1L, Paris = 2L, London = 3L)
x
x['Paris']
x[['Berlin']]
x$London
x$`Berlin`
x$"Paris"
names(x)
