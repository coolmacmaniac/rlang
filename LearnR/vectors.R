# vectors
x <- c(1.1, 2.2)
x <- c(1L, 2L)
x <- c('a', 'b', 'c')
x <- c('aaa', 'bbb', 'ccc')
x <- c(TRUE, FALSE)
x <- c(T, F)
x <- c(1+0i, 2+1i)

x <- vector(mode = "complex", length = 10)
print(x)

# implicit coercion
y <- c(2.2, 3L)       # num
y <- c(2.2, 'pqr')    # chr
y <- c(2.2, T)        # num
y <- c(2.2, 2+2i)     # cplx
y <- c(3L, 'pqr')     # chr
y <- c(3L, T)         # int
y <- c(3L, 2+2i)      # cplx
y <- c('pqr', T)      # chr
y <- c('pqr', 2+2i)   # chr
y <- c(T, 2+2i)       # cplx

# explicit coercion
z <- 10
class(z)        # numeric
z <- 0:9
class(z)        # integer
as.numeric(z)
as.logical(z)
as.complex(z)
as.character(z)
z <- c('p', 'q', 'r')
as.integer(z)   # NA generated
as.numeric(z)   # NA generated
as.logical(z)   # NA generated
as.complex(z)   # NA generated

# checking NA and NaN values
v1 <- c(1, 3, 5, NA, 9)
is.na(v1)         # NA is NA
is.nan(v1)        # NA is not NaN
v2 <- c(1, 3, 5, NA, NaN, 9)
is.na(v2)         # NA is NA, NaN is NA
is.nan(v2)        # NA is not NaN, NaN is NaN

# named elements
x <- 1:3
names(x)
names(x) <- c("Berlin", "Paris", "London")
x
x[1]
x["London"]
names(x)
