# matrices
m <- matrix(nrow = 5, ncol = 5)
m
dim(m)
attributes(m)

# column-wise value assignment, matrices are column major
m <- matrix(1:6, nrow = 2, ncol = 3)
m

# reshape
m <- 1:10
m
dim(m) <- c(2, 5)
m
dim(m) <- c(5, 2)
m

# column or row binding
a_vals <- 1:5       # number of elements should be same as in b_vals
b_vals <- 11:15     # number of elements should be same as in a_vals
m <- cbind(a_vals, b_vals)    # fill the values col-wise, across rows
m
m <- rbind(a_vals, b_vals)    # fill the values row-wise, across cols
m
