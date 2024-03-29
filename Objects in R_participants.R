#VECTORS
# Let's create a few objects 

x <- 1:10
#Print the result of x----

# What type of vector is x?----


#What is the lenght of x?----


#What is the max, min and mean of x?----


#ask help to know more about integer----

#Let's create the object y ----
y <- c('1,2,3,4,five')
y

#What type of object is y?----


#What is the max, min and mean of y?----

#lenght?----


#Let's update y to have a length of 5----
y <- c("1","2","3","4","five")
#lenght?----

#What is the max, min and mean of y?----


#How is calculate the max and min of character!?----


#Let's create the object z?----
z <- x > 5
z
#What type of object is z?----

#What is the max, min and mean of z?----


#LeT's create the object z1
z1 <- c(1,2,3,4,5,6,7,8,9,10)
z1

#What type of object is z1?----


#What is the max, min and mean of z?----


#what is the difference between the integer class and the numeric class in R?----
#Ask in stackoverflow!

#library(pryr)
#object_size(x)
#object_size(z1)

#Operations with vectors
#Let's add a integer vector with an character vector----

# Add a integer with an numeric vector----

# Add an integer with an logical vector----

#Can we add vectors with different lenght?----


############################################################

#MATRIX----
?matrix

#Create a matrix with 2 row and 2 columns from 1 to 4---- 
mat1 <- matrix(1:4, nrow = 2, ncol = 2)
mat1
mat2 <- matrix(4:7, nrow = 2, ncol = 2)
mat2

#Extract elements from the matrix
#mat[row,column]
#Matrix 1 row 1 column 2

#Matrix2 row 2 colum 1


#What about the entire row or column?
#Matrix 1 row 1

#Matrix 2 column 2


# transpose of mat1


#Operations with matrix
mat <- mat1 * mat2
mat

#Create matrix 3
mat3 <- matrix(4:7, nrow = 100, ncol = 10)
mat3

# show first 4 rows of matrix mat3


# show last 4 rows of matrix mat3


# descriptive statistics of variables in mat3


# sum of elements by rows


# sum of elements by columns


# mean of elements by rows


# mean of elements by columns


####################################################

#ARRAY----
a <- c(2,9,3)
b <- c(10,16,17,13,18)
result <- array(c(a,b),dim = c(3,3,2))
result

#Let's give names to columns, rows and matrices----
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

result <-
  array(
    c(a, b),
    dim = c(3, 3, 2),
    dimnames = list(row.names, column.names,
                    matrix.names)
  )
result

# Print the third row of the second matrix of the array.----

#Print the element in the 1st row and 3rd column of the 1st matrix.----

#Print the 2nd Matrix.----


#LISTS----

data_list <- list(c("Jan","Feb","Mar"), matrix(c(1,2,3,4,-1,9), nrow = 2),list("Red",12.3))
names(data_list) <- c("Monat", "Matrix", "Misc")
print(data_list)

#Access the first element of the list.----
  

#Access the third element. As it is also a list, all its elements will print.----



#By using the name of the element access the list elements.----



#Add an element at the end of the list.----

data_list[4] <- "New element"
print(data_list[4])

#Remove the last element.----

data_list[4] <- NULL
print(data_list[4])

#Update the 3rd Element.----

data_list[3] <- "updated element"
data_list

#DATAFRAME
#Let's upload your first dataframe
#   load script and define file paths
main_dir <- "Define your working directory"
main_dir <- "C:/Users/Eduardo/Desktop/R_course"
setwd(main_dir)

#Load coordinates points
BOT <-
  read.xlsx(
    '03-06-2019_netcdf_coords_to_extract.xlsx',
    sheet = 1,
    startRow = 1,
    colNames = TRUE
  )
#In which package is the function read.xlsx?----

#Load the data again
#Prepare a data frame
BOT1 <-
  data.frame(
    id = BOT$id,
    genus = BOT$genus,
    sp = BOT$sp,
    lat = BOT$lat,
    lon = BOT$lon
  )

#Clean data
BOT1 <- BOT1[complete.cases(BOT1), ] # remove NA cells

#Select only the Diplodia rows 
Diplodia <- BOT1[BOT1$genus == 'Diplodia',]

#Explore the function subset and extract all the Diplodia spp. with latitude higher than 41----


#Load year file----


#bind the dataframe year with Diplodia
Diplodia <- cbind(Diplodia,year)
Diplodia

#Whats is the difference between rbind and cbind ?----
#Ask google!

#Load the collector data----

#Now lets merge the collector dataframe with the diplodia dataframe by id
Diplodia1 <- merge(x = Diplodia, y = collector, all.x = TRUE)
Diplodia2 <- merge(x = Diplodia, y = collector, all.y = TRUE)

#How to join (merge) data frames (inner, outer, left, right)?----
#https://stackoverflow.com/questions/1299871/how-to-join-merge-data-frames-inner-outer-left-right

#Save the Diplodia file
setwd(main_dir)
write.xlsx(Diplodia, file = "Diplodia.xlsx")

