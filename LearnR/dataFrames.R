# Data frames are represented as a special type of list where every element of
# the list has to have the same length.
# Each element of the list can be thought of as a column and the length of each
# element of the list is the number of rows.

x <- data.frame(
  rollno = 1:5,
  name = c("AB", "CD", "EF", "GH", "IJ")
  )
x
nrow(x)
ncol(x)

# accessing individual elements
x[1,2]        # 1st row, 2nd column
x[4,1]        # 4th row, 1st column
x[-1]         # last column (2nd column in this case)
x[-1,]        # excluding first row, including all columns
x[,-1]        # including all rows, excluding first column
x[-2]         # second to last column (1st column in this case)
x[-2,]        # excluding second row, including all columns
x[,-2]        # including all rows, excluding second column
x[-1,-1]      # excluding 1st row, excluding 1st column
x[-2,-2]      # excluding 2nd row, excluding 2nd column

# updating individual elements
x[4,1] <- 16
x
x[2] <- c("PQ", "QR", "RS", "ST", "TU")
x
