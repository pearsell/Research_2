Week 2
# LING 4D03 Week 2 - R Review ---------------------------------------------


# Preparing the workspace -------------------------------------------------

# First we need to get our workspace ready
# Once Rstudio is open, click on the file tab to the right.
# Navigate to your working folder using the '...' button to the right
# Then click 'More' and select 'Set as working directory'
# Alternatively, you can do this directly in the R Console with code such as:
# setwd("~/Dropbox/Teaching/McMaster/4D03_6D03/Week2/Demo")
# And check it with: 
# getwd()


# Creating a project ------------------------------------------------------

# Alternatively, we can create a "Project" that will be unique to all we here
# It will always associate the folder with the files and set the working directory
# # when you open the project!
# File > New Project > Existing Directory > Browse > Create Project


# R Basics ----------------------------------------------------------------

# R as a calculator
2+2
100/5
(3+4)^2
# What happens when you put one of the expressions in quotes?
# quotes are text, not number so nothing gets done with it

# R objects (they are just created things that are held in memory, like variables. Use assignment marker <-)
# Making an object assignment using <-
x <- 2
y <- 3
x <- 4
z <- "number"

# Retrieving objects
x
y
z

# What happens when you put the object name in quotes?

# Using objects
# What happens when you add x and y together?
# What happens when you add x and Y together?
# Can you subtract z from x? Why?


# Functions and Arguments -------------------------------------------------

# Functions carry out some specific operation
# r norm randomly generates numbers in a normal distribution
rnorm(10)

# Functions take specific arguments
# Arguments change how that operation is done
rnorm(10, mean = 100)
rnorm(10, mean = 100, sd = 50)
# Arguments are function-specific
# Some arguments are set by default (so be careful)

# Functions are usually well-documented
# Searchable through help menu in RStudio
# Accessible from console using ?FunctionName
?rnorm


# Objects - Vectors -------------------------------------------------------

# The vector is the simplest type to store multiple values in R
# 1-dimensional and has some specific length
# The information inside it is either numeric, character, logical, or factor

V1 <- c(1,2,3,4,5)
V2 <- c("one", "two", "three")
V3 <- c(TRUE, FALSE, TRUE, FALSE)
# Retrieve each object

# What happens when you try to assign V4, mixing the data types?
V4 <- c(1, "one", TRUE)

# All the data in a vector must be encoded as the same type (all numbers, all 
# # character strings, etc.)
# If a vector contains one character element, all other elements of this vector 
# # are converted to characters
# If a vector contains one logical element in combination with numeric element, 
# # logical element is converted to numeric one (TRUE → 1 and FALSE → 0)

# Let's get some information about our vector objects

# Use the function str() 
str(V1)


# Use the function length()
length(V1)

# Operating on vectors
# What happens when you add V1 and 5 together?
V1 + 5
# Can you do the same for V2 and V3? Why?


# The data frame ----------------------------------------------------------

# Data frames are 2-dimensional and have some specific length (rows) and 
# # width (columns)
# Effectively a collection of vectors
# There are no restrictions on the data mode of the columns
# The length of the columns elements must be the same

# Let's use a data frame already existing in R
data("ToothGrowth")

# To get the size of the data frame
dim(ToothGrowth)
# To get the number of rows
nrow(ToothGrowth)
# To get the number of columns
ncol(ToothGrowth)
# ALWAYS row then column 

# To get the names of the columns
colnames(ToothGrowth)
# To get the names/numbers of the rows
rownames(ToothGrowth)

# This next step is CRUCIAL!!!
str(ToothGrowth)


# Columns/vectors and data modes ------------------------------------------

# Individual columns can be access by specifying the data frame name and the 
# # column name (dataframe$column)  

ToothGrowth$len

length(ToothGrowth$len)

# Each column has a specific mode associated with the data it contains.
# # The most common ones are: integer, numeric, factor, logical, character
# # integer: whole numbers
# # numeric: real numbers
# # factor: a repeated (and limited) set of identifiers
# # logical: TRUE or FALSE; R also treats these as 1 and 0, respectively
# # character: strings or text values

# Let's re-examine the structure of the data
str(ToothGrowth)

# We can change the mode of a particular column with the functions like 
# # as.factor(), as.numeric(), as.character(), as.logical()
# It's often a good idea to assign this to a new column, as not to 
# # overwrite something incorrectly

ToothGrowth$dose_fac <- as.factor(ToothGrowth$dose)
str(ToothGrowth$dose_fac)

# Be careful going the other way around from factors to numbers!!!!
# # When converting factors into numeric values, R uses the underlying indices 
# # rather than the overt label values (one of R's tricky underlying properties)
# # For example:

V5 <- factor(c(1,2,10,"na"))
as.numeric(V5)
# [1] 1 3 2 4

# This is not what you want!

# If you absolutely need to do this you have to define the factor as a character 
# # string before converting it to numeric
# # For example: 

as.numeric(as.character(V5))
# [1]  1  2 10 NA
# Warning message:
#   NAs introduced by coercion 

# Many first analyses have been wrecked by this. 
# # It always pays to inspect one's data!


# Indexing the dataframe --------------------------------------------------

# Sometimes you want to access a specific value or set of values in your data
# This can be done visually for small datasets, but is nearly impossible for
# # large dataframes!
# Indexing gives us a way to get at the data we want/need

# This can be done using row and column numbers
ToothGrowth[1,1]
ToothGrowth[30,3]

# If you do not specify a column, it will retrun all the columns of that row
ToothGrowth[28,]
# Conversely, if you do not specify a row, it will retrun all the rows for that column
ToothGrowth[,3]

# You can also use column names instead of numbers
ToothGrowth[30,"supp"]

# You can use multiple column names in c() to access more than one at a time
ToothGrowth[30, c("supp", "dose")]

# Similarly, we can use c() to access multiple rows at one time
ToothGrowth[c(30,40,50),"supp"]
ToothGrowth[c(30:50),"supp"]


# Indexing a vector/column ------------------------------------------------

# Indexing also works for vectors and columns within dataframes
# The only difference is that you only need the element/row number

# If we use V2
V2[3]

# If we use the RT column of ToothGrowth
ToothGrowth$len[25]

# c() also works here!
ToothGrowth$len[c(1,30,60)]
ToothGrowth$len[c(1:10)]


# Getting your data the way you need it -----------------------------------

# One of the most important parts of an analysis is getting the data the 
# # way you need it.

# Often we want to change column names to make life easier later
# Defining a new column is done by specifying the name of the new column and 
# # assigning something to it using <- as we did when changing data modes
ToothGrowth$NewColumn1 <- 5

# We can create new columns by operating on other existing columns
# # Importantly, this operation is done rowwise (i.e., row by row)
ToothGrowth$NewColumn2 <- ToothGrowth$len-mean(ToothGrowth$len)

# # Lets examine our new column
str(ToothGrowth$NewColumn2)
# # Summary gives us a quick glimpse at the data
summary(ToothGrowth$NewColumn2)
# # Looks good!

# We can also combine information from two columns
ToothGrowth$NewColumn3 <- paste(ToothGrowth$supp, ToothGrowth$dose, sep = "_")

unique(ToothGrowth$NewColumn3)

# Sometimes you want to remove a column altogether
# # WARNING: THIS CAN NOT BE UNDONE!!!!
ToothGrowth$NewColumn1 <- NULL



# Basic plotting ----------------------------------------------------------

# You often want to visualize/explore your data before analysis to get a 
# # sense for what is going on.
# R has basic plotting functions for this purpose

plot(len~dose, data=ToothGrowth)
# # The formula is always Y~X
# # This type of plot is called a scatter plot

# Perhaps we want to change how we view the data
# # Let's add limits to the axes 
plot(len~dose, data=ToothGrowth, ylim=c(0, 45), xlim=c(0, 2.5))

# Perhaps we want to make it prettier
# # Let's add axis labels and a main title
plot(len~dose, data=ToothGrowth, ylim=c(0, 45), xlim=c(0, 2.5),
     xlab = "Dose", ylab = "Length", main = "Effect of Dose on Length")

# Maybe we want to get handle on a particular variable
# # Let's plot the density (distribution)
plot(density(ToothGrowth$len, na.rm=T))

# Now let's make a box plot of this continuous variable by a categorical one
boxplot(len~NewColumn3, data=ToothGrowth)


# Accessing a specific part of your data ----------------------------------

# Sometimes you want to work with only a portion of your data set

# In order to do this, we need to understand the basic logical operators.
# In R, the most common logical operators are:
# # > (greater than)
# # < (less than)
# # >= (greater than or equal to)
# # <= (less than or equal to)
# # == (equal to) 
# # != (not equal to)
# # & (and)
# # | (or)
# # %in% (in a set)

# Subscripting - setting restrictions on rows
ToothGrowth[ToothGrowth$dose >= 1,]

ToothGrowth[ToothGrowth$supp == "VC" & ToothGrowth$dose == 2,]

ToothGrowth[ToothGrowth$NewColumn3 %in% c("VC_0.5", "OJ_2"),]

# Subscripting and accessing a column
ToothGrowth[ToothGrowth$supp == "VC",]$len

mean(ToothGrowth[ToothGrowth$supp == "VC",]$len)


# R packages --------------------------------------------------------------

# To install an R package from CRAN, you can use RStudio or the console

# Click on the packages tab to the right.
# Click on the install button.
# Ensure CRAN is selected.
# Type the name of the package you want and select it.
# Ensure Install Dependencies is ticked.
# Click install
# Alternatively, you can do this directly in the R Console with code such as:
# # install.packages("packagename", dependencies = T)

# Try this for the package called dplyr
install.packages("dplyr", dependencies = T)
# # N.B. - You DO NOT have to do this every time you open R 

# Once a package is installed you have to make it available in your session
library(dplyr)
# # N.B. - You have to do this every time you open R 



# Saving your script and environment --------------------------------------

# When you close Rstudio, to should prompt you to save your Rscript (if you
# # have made unsaved changes) as well as your global environment.
# The script will be saved as a .R file (just a special kind of text file).
# The environment will be saved as a .Rdata file.
# The files will be saved into your working directory
# Next time you open your project, both will be available to you as when 
# # you closed the project!

# Give it try!

