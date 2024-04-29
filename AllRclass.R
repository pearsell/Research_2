

# STEP@CCP2019 ------------------------------------------------------------
# # Vincent Porretta (porretta@uwindsor.ca)
# # Aki-Juhani Kyröläinen (akkyro@gmail.com)


# Introductory slides -----------------------------------------------------

# Installing R and RStudio
# Installing necessary packages
# Downloading scripts and data


# Preparing the workspace -------------------------------------------------

# First we need to get our workspace ready
# Once Rstudio is open, click on the file tab to the right.
# Navigate to your working folder using the '...' button to the right
# Then click 'More' and select 'Set as working directory'
# Alternatively, you can do this directly in the R Console with code such as:
setwd("~/Dropbox/STEP/STEP2019/IntroR")
# And check it with 
getwd()


# Creating a project ------------------------------------------------------

# Alternatively, we can create a "Project" that will be unique to all we here
# It will always associate the folder with the files and set the working directory
# # when you open the project!
# File > New Project > Existing Directory > Browse > Create Project


# R Basics ----------------------------------------------------------------

# Try some simple arithmetic
2+2
100/5
(3+4)^2
# What happens when you put one of the expressions in quotes?

# Making an object assignment using <-
x <- 2
y <- 3
x <- 4

# Retreiving objects
x
y

# What happens when you put the object name in quotes?

# What happens when you add x and y together?
# What happens when you add x and Y together?

# Making a different kind of assignment
z <- "number"
z
# Can you retreive the object?
# Can you subtract z from x? Why?

# Other objects (Vectors)
V1 <- c(1,2,3,4,5)
V2 <- c("one", "two", "three")
V3 <- c(TRUE, FALSE, TRUE, FALSE)
# Retreive each object

# What happens when you try to assign V4, mixing the data types?
V4 <- c(1, "one", TRUE)

# Let's get some information about our vector objects

# Use the function str() 
str(V1)
str(V2)
str(V3)

# Use the function length()
length(V1)

# Operating on vectors
# What happens when you add V1 and 5 together?
V1 + 5
# Can you do the same for V2 and V3? Why?

# What if you use the logical operator == instead of +?
V1 == 5


# Saving your script and environment --------------------------------------

# When you close Rstudio, to should prompt you to save your Rscript (if you
# # have made unsaved changes) as well as your global environment.
# The script will be saved as a .R file (just a special kind of text file).
# The environment will be saved as a .Rdata file.
# Next time you open your project, both will be available to you as when 
# # you closed the project!

# Give it try!


# Functions/Files/Variables slides ----------------------------------------

# Important functions/arguments
# Where to find help
# Data files 
# Understanding variables


# Functions and Arguments -------------------------------------------------

# We've already used 2 functions in R - c() and str()
# Take a moment and explore the help documentation related to these
# # Access this from both the RStudio help tab and the console

?c
?str

# Now look at the help for a new function head() 
?head
# What does it do?
# What does the argument n do? 

# Create this numeric vector of random numbers
random <- c(rnorm(100, 0))

# Use the function head and it's argument n to examine the data in the vector
head(random, n=10)


# Getting started with real data ------------------------------------------

# First we will work with "baldey_expdata.csv"

# Before working with your data, get a sense for them
# # What's the file format?
# # Where did the data come from?
# # What does the file contain?

# Let's take a peek in the spreadsheet program of your choice
# # Take note of the file type

# Now let's try to read in the data (not a trivial matter!)

# Use the read.table function
baldey_exp <- read.table("baldey_expdata.csv")
# Did it read in appropriately?  
# Use head to examine it
head(baldey_exp)

# What's wrong? We need to tell R how to separate the data into columns!
baldey_exp <- read.table("baldey_expdata.csv", sep=",")
# If you had a space delimited file you would need " "
# If you had a tab delimited file you would need "\t"

# Did the data come in appropriately?
head(baldey_exp)

# What's wrong? We need to tell R that the first row contains the column names
baldey_exp <- read.table("baldey_expdata.csv", sep=",", header = T)

# Did the data come in appropriately?
head(baldey_exp)


# Now let's read in the item information contained in "baldey_itemdata.txt"
# # Note that this is a tab delimited file!
baldey_item <- read.table("baldey_itemdata.txt", sep="\t", header = T)

# Did the data come in appropriately?
head(baldey_item)

# Now take a look at the structure of the data frame using str()
str(baldey_item)
# Look carefully at the structure
# # Information is given about each column (The type of data R thinks it contains)

# Look carefully at columns <regularity> and <lip.ms>
# # What do you notice about them?

# We actually need to deal with the "-" character
# # In this dataset it marks missing values...something we normally want to 
# # mark with NA

# The most straightforward way to deal with this is when we read in the data!
baldey_item <- read.table("baldey_itemdata.txt", sep="\t", header = T, na.strings = "-")

# Examine the data again
head(baldey_item)
str(baldey_item)
# How are <regularity> and <lip.ms> encoded now?

# Other possibly important arguments when reading in data:
# # dec = ","
# # quote = """
# # fileEncoding = "UTF8"


# YOUR TURN! --------------------------------------------------------------

# Using what you know:
# # 1) read in the file called "baldey_partdata.txt". Assign it to object baldey_part.
# # 2) examine its structure. Does the encoding make sense?



# The data frame ----------------------------------------------------------

# Now to begin examining the structure of the data frame using other functions
# # For the time being we will be examining baldey_exp

# Data frames are made up of columns and rows

# To get the size of the data frame
dim(baldey_exp)

# To get the number of rows
nrow(baldey_exp)
# To get the number of columns
ncol(baldey_exp)

# To get the names of the columns
colnames(baldey_exp)
# To get the names of the rows (though this isn't usually that informative)
rownames(baldey_exp)
# The output is rather long

# This next step is CRUCIAL!!!
str(baldey_exp)

# These are the columns in the data frame and indicate the type of information each contains
# # Does this make sense?
# # R is pretty good at determining these; however, sometimes it gets fooled, Or, 
# # we simply desire to change the type because of the way we have 
# # operationalized a particular variable ... more on this below

# Dataframes slides -------------------------------------------------------

# Understanding data structures
# Accessing the data

# Columns/vectors and data modes ------------------------------------------

# Individual columns can be access by specifying the data frame name and the 
# # column name (dataframe$column)  

head(baldey_exp$RT)

length(baldey_exp$RT)

# Each column has a specific mode associated with the data it contains.
# # The most common ones are: integer, numeric, factor, logical, character
# # integer: whole numbers
# # numeric: real numbers
# # factor: a repeated (and limited) set of identifiers
# # logical: TRUE or FALSE; R also treats these as 1 and 0, respectively
# # character: strings or text values

# We already got a taste for this when we loaded the data the first time

# Let's re-examine the structure of the data

str(baldey_exp)

# It looks like session is currently set as an integer
# # However, we might in fact want this to be a factor with many levels (that 
# # happen to be named with numbers)

# We can change the mode of a particular column with the functions like as.factor()
# It's often a good idea to assign this to a new column, as not to 
# # overwrite something incorrectly

baldey_exp$session_fac <- as.factor(baldey_exp$session)
str(baldey_exp$session_fac)

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


# YOUR TURN! --------------------------------------------------------------

# Using what you know:
# # 1) create a new column called transcription_char that is a character version
# # # # of the factor <transcription> in baldey_item.
# # 2) create a new column called Nphonemes_fac that is a factor version
# # # # of the integer Nphonemes in baldey_item.


# Indexing the dataframe --------------------------------------------------

# Sometimes you want to access a specific value or set of values in your data
# This can be done visually for small datasets, but is nearly impossible for
# # large dataframes!
# Indexing gives us a way to get at the data we want/need

# This can be done using row and column numbers
baldey_exp[1,1]
baldey_exp[30,3]

# If you do not specify a column, it will retrun all the columns of that row
baldey_exp[28,]
# Conversely, if you do not specify a row, it will retrun all the rows for that column
baldey_exp[,4]

# You can also use column names instead of numbers
baldey_exp[30,"RT"]

# You can use multple column names in c() to access more than one at a time
baldey_exp[100, c("subject", "RT")]

# Similarly, we can use c() to access multiple rows at one time
baldey_exp[c(30,40,50),"RT"]
baldey_exp[c(30:50),"RT"]


# Indexing a vector/column ------------------------------------------------

# Indexing also works for vectors and columns within dataframes
# The only difference is that you only need the element/row number

# If we use V2
V2[3]

# If we use the RT column of baldey_exp
baldey_exp$RT[250]

# c() also works here!
baldey_exp$RT[c(1,100,1000)]
baldey_exp$RT[c(100:110)]


# YOUR TURN! --------------------------------------------------------------

# Using data frame indexing on baldey_exp, find the value(s):
# # 1) in the 10000th row of the column named "response"
# # 2) in the 30451st through 30460th rows of the column named "word"
# # 3) in the 1533rd row of the columns "Subject", "RT", "word", and "word_status"
# # 4) in the 9th, 101st, and 452nd rows of "Subject", "RT", and "response"



# Getting your data the way you need it -----------------------------------

# One of the most important parts of an analysis is getting the data the 
# # way you need it.

# Often we want to change column names to make life easier later

# For this we use the colnames() function
colnames(baldey_exp)[colnames(baldey_exp)=="response"] <- "ACC"
colnames(baldey_exp)
# Sometimes we want to create new columns in the dataframe 

# # Defining a new column is done by specifying the name of the new column and 
# # assigning something to it using <-

baldey_exp$NewColumn1 <- 5
# # Notice the number of variables increased

# # Lets look at our new column
str(baldey_exp$NewColumn1)
baldey_exp$random <- rnorm(nrow(baldey_exp), 5)
str(baldey_exp$random)
# Usually we want to make the new column from an existing column
baldey_exp$NewColumn2 <- baldey_exp$word

# # Lets look at our new column
str(baldey_exp$NewColumn2)

# We can also create new columns by operating on other existing columns
# # Importantly, this operation is done rowwise (i.e., row by row)
baldey_exp$NewColumn3 <- baldey_exp$RT-baldey_exp$RTprev

# # Lets examine our new column
str(baldey_exp$NewColumn3)
head(baldey_exp$NewColumn3)
# # Summary gives us a quick glimpse at the data
summary(baldey_exp$NewColumn3)

# # Looks good!

# Last, but not least, sometimes you want to remove a column altogether
# # WARNING: THIS CAN NOT BE UNDONE!!!!
baldey_exp$NewColumn1 <- NULL


# YOUR TURN! --------------------------------------------------------------

# Using baldey_exp:
# # 1) create a new column (Subj_copy) that is a copy of the subject column
# # 2) rename Subj_copy to REMOVE
# # 3) remove REMOVE
# # 4) create a new column (RT_sec) that represents the RT in seconds
# # 5) use summary to examine RT_sec


# Subsetting the data

# Sometimes you want to work with only a portion of your data set (e.g., the
# # data from a single participant)

# In order to do this, we need to understand logical operators.
# In R, the most common logical operators are:
# # > (greater than)
# # < (less than)
# # >= (greater than or equal to)
# # <= (less than or equal to)
# # == (equal to) 
# # != (not equal to)

# # For subsetting we have two options.

# 1) We can use subscripting as we have already seen
baldey_exp_sub1 <- baldey_exp[baldey_exp$RT >= 150,]

# # Have a quick look at the RT values in the new dataframe
summary(baldey_exp_sub1$RT)

# 2) We can use the subset() function
baldey_exp_sub2 <- subset(baldey_exp, subject == "s1")

# # Take a closer look at the new subject column
summary(baldey_exp_sub2$subject)
str(baldey_exp_sub2)
# # What do we notice about the dataframe?

# IMPORTANT - Whenever you subset based on a factor, it's a good idea to use droplevels()
# # If you subset, R will still think that the irrelevant levels of the factor 
# # are still possible/present

unique(levels(baldey_exp_sub2$subject))

# This can cause problems later in an analysis
# # So dropping levels will alleviate this

baldey_exp_sub2 <- droplevels(baldey_exp_sub2)
unique(levels(baldey_exp_sub2$subject))

# Subsetting based on multiple criteria
# # For this we need two additional logical operators:
# # & (and)
# # | (or)

# 1) Using subscripting
baldey_exp_sub3 <- baldey_exp[baldey_exp$RT >= 150 & baldey_exp$RT <= 2000,]
summary(baldey_exp_sub3$RT)

# 1) Using subset()
baldey_exp_sub4 <- subset(baldey_exp, subject == "s1" | subject == "s10")
summary(baldey_exp_sub4$subject)

baldey_exp_sub5 <- subset(baldey_exp, subject %in% c("s1", "s20", "s17", "s3", "s5"))
summary(baldey_exp_sub5$subject)

baldey_exp_sub5 <- baldey_exp[baldey_exp$subject %in% c("s1", "s20", "s17", "s3", "s5"),"RT"]
str(baldey_exp_sub5)
# Ordering the data

# Sometimes, it is beneficial to have the data in a particular order
baldey_exp_sort <- baldey_exp[order(baldey_exp$subject, -baldey_exp$RT),]
head(baldey_exp_sort)

baldey_exp_sort2 <- baldey_exp[,order(colnames(baldey_exp))]

# YOUR TURN! --------------------------------------------------------------

# Using baldey_item:
# # 1) create a subset (baldey_item_sub1) representing only real words
# # 2) create a subset (baldey_item_sub2) representing only adjectives with a 
# # #  CELEX_form_freq greater than or equal to 100
# Using baldey_part:
# # 3) create a new dataframe (baldey_part_sort) ordered by gender and age
# # 4) examine baldey_part_sort, reverse the order of age, and re-examine


# Bringing dataframes together

# Often times we have two dataframes with related information that we would like
# # to have in a single dataframe.
# For this, we need the merge() function which combines two dataframes into a
# # new one by some value

# Now to merge the participant data with the experimental data
# # Define a new data frame

baldey_exp_part <- merge(baldey_exp, baldey_part, by="subject")

# Look to the right, baldey_exp_part should now have 6 more columns than 
# # baldey_exp, and then should have the same number of rows
dim(baldey_exp)
dim(baldey_exp_part)
ncol(baldey_part)
str(baldey_exp_part)
## check the data
nrow(baldey_exp) == nrow(baldey_exp_part)
table(baldey_exp$subject %in% baldey_exp_part$subject)
# Looks good!
# Looks like it appropriately assigned the data modes!

# IMPORTANT - If you have lost rows, that means that the column on which you are 
# # matching do not have the same unique values in the two dataframes!
# Again, this can cause problems for later analysis!



# YOUR TURN! --------------------------------------------------------------

# Using baldey_exp_part:
# # 1) create a new dataframe (baldey_full) that combines baldey_exp_part 
# # #  with baldey_item 
# # 2) double check that you have not lost any data
# # 3) look at the column names of the new dataframe; what do you notice?
# # 4) how would you fix the issue?


# Two important points about merging data frames

# First, matching column named differently in each dataframe
# # If the matching column is called something different in your two dataframes
# # you can still merge them

# Either rename the column in either dataframe, as we did above:
# # colnames(dfr)[colnames(dfr)=="OldName"] <- "NewName"

# Or specify the two different column names in the merge function:
# # newdfr <- merge(dfrx, dfry, by.x="dfrxcolname", by.y="dfrycolname")

# Second, you may have to CREATE a matching column
# # For example:
# # dfrx$MatchingKey <- paste(dfrx$Col1, dfrx$Col2, sep="_")
# # dfry$MatchingKey <- paste(dfry$Col1, dfry$Col2, sep="_")
# # Then simply merge as above:
# # newdfr <- merge(dfrx, dfry, by="MatchingKey")


# Saving ------------------------------------------------------------------

# You've done a lot so far, so you probably want to save what you've done
# There are a couple of things to know about saving in R/RStudio

# As we have seen, an RStudio project will save your entire workspace as an 
# # image (.RData) as well as your R script file (.R) when you close
# If you don't have a project, RStudio will prompt you to save both 

# You can also save individual objects from your workspace (this is handy for 
# # sharing a data set with someone).
# For saving objects you have a few options:
# # 1) Save as an R object (.rda)
# # 2) Save as a text file (.txt, .csv, etc.)

# Saving an R object 
save(baldey_full, file = "baldey_full.rda", compress = "xz")
# # .rda files retain the encoding of the data, but can only be read by R.
# # FYI, to load a .rda file, simply use the load("filename.rda")!

# Saving a data frame as a text file
write.table(baldey_full, file="baldey_full.txt", sep="\t", quote=F, row.names=F)
# # Text files can easily be shared, but do not retain the encoding of the data.


# YOUR TURN! --------------------------------------------------------------

# Using baldey_exp_sub3:
# # 1) save a .txt file 
# Using baldey_item:
# # 2) save a .rda file



# Basic descriptive stats -------------------------------------------------

# Now that your data is exactly as you want them, you can start your analysis!

# One of the first things we want to do is calculate descriptive statistics
# # Mean, Standard Deviation, Median, Range, etc.

# We have already seen that the summary() function can return some of this 
# # basic info for numeric variables
summary(baldey_full$RT)

# Sometimes we would like additional or more fine-grain info
# For this we can use base functions in R

# # First perhaps we want to calculate the grand mean of RT
# # For this we use the function mean() and simply specify the column we want
# # It's important to specify that you want NAs removed.
mean(baldey_full$RT, na.rm = T)
# # We can do the same for median
median(baldey_full$RT, na.rm = T)

# # and for standard deviation
sd(baldey_full$RT, na.rm = T)

# # and also the range of values
range(baldey_full$RT, na.rm = T)

# # to obtain the individual values of the range
range(baldey_full$RT, na.rm = T)[1]
min(baldey_full$RT, na.rm = T)
range(baldey_full$RT, na.rm = T)[2]
max(baldey_full$RT, na.rm = T)

# # to get the number of observations
length(baldey_full$RT)
nrow(baldey_full)
# However, we often care about conditional means (i.e., means for different groups)
# To do this, we need to use subscripting!

# # Imagine that we want to see separate means for female and male participants
mean(baldey_full[baldey_full$gender=="female",]$RT, na.rm = T)
mean(baldey_full[baldey_full$gender=="male",]$RT, na.rm = T)
# N.B. - We could of course create two subsets and then calculate the means from
# # each of the two subset dataframes...but that is more typing!


# YOUR TURN! --------------------------------------------------------------

# Using baldey_full:
# # 1) calculate the conditional descriptive stats (mean, SD, median, range) 
# # #  of RT for both words and nonwords


# Basic plots of the raw data ---------------------------------------------

# You often want to visualize/explore your data before analysis to get a 
# # sense for what is going on.
# R has basic plotting functions for this purpose

# Let's try to plot RT 
# # To make a plot of a particular variable

plot(baldey_full$RT)

# # This is plotted against the index (observation) of the data points
# # This type of plot is called an index plot (often not that informative)

# Plot RT across Trials

plot(RT~trial, data=baldey_full)

# # The formula is always Y~X
# # This type of plot is called a scatter plot

# Perhaps we want to view a particular swath of data
# # Let's add limits to the axes 

plot(RT~trial, data=baldey_full, ylim=c(150, 3000), xlim=c(1, 50))

# Maybe we want to get handle on a particular variable
# # Let's plot the density (distribution) of RT

plot(density(baldey_full$RT, na.rm=T))

# Let's make a proportional plot

plot(ACC~subject, data=baldey_full)

# Now let's make a box plot of this continuous variable by a factor (ACC)

plot(RT~ACC, data=baldey_full)

# This isn't so pretty
# # Let's add axis labels and a main title

plot(RT~ACC, data=baldey_full, ylab="RT", xlab="Response accuracy", main="RT by Accuracy")



# YOUR TURN! --------------------------------------------------------------

# Using baldey_full:
# # 1) make a plot proportional plot of accuracy by word_status
# # 2) make a scatterplot of RT by RTprev 
# # 3) make a boxplot of RT by session


# Saving plots ------------------------------------------------------------


# You can use the RStudio buttons above the plot to enlarge the plot (Zoom) and save the plot (Export) 
# # N.B. - When the plot is saved using RStudio, the resolution is very low.
# # R support multiple different file formats
# # To create a tiff image we can do the following

tiff(file = "myboxplot.tiff", width = 8, height = 8, units = "in", pointsize = 12, 
     res = 600, compression = "lzw")
plot(RT~ACC, data=baldey_full, ylab="RT", xlab="Accuracy", main="RT by Accuracy")
dev.off()
# # Always remember to close the graphics device after plotting with dev.off()!!!!



# Basic Inferential Stats -------------------------------------------------

# Correlation
# # What is it?
# # Any statistical relationship between two sets of data involving a degree of dependence
# # The extent to which changes in one variable’s values are reflected systematically 
# # as changes in another variable’s values
# # N.B. - correlation does not (necessarily) imply causality

# # As a general rule of thumb for interpreting r
# # 0.00-0.19 (very weak)
# # 0.20-0.39 (weak)
# # 0.40-0.59 (moderate)
# # 0.60-0.79 (strong)
# # 0.80-1.0 (very strong)

plot(RT~RTprev, data=baldey_full)
# What kind of relationship do we think might exist?
cor.test(baldey_full$RT, baldey_full$RTprev)
# What does this mean?

plot(RT~log(CELEX_form_freq), data=baldey_full)
# What kind of relationship do we think might exist?
cor.test(baldey_full$RT, log(baldey_full$CELEX_form_freq+1))
# What does this mean?


# Two sample t-test
# # What is it?
# # Can be used to determine if two independent sets of data (samples) are 
# # significantly different from each other or not.
# # There are various kinds of t-tests with different assumptions about the data

# May be want to know whether RTs are different between males and females
t.test(baldey_full[baldey_full$gender=="male",]$RT, baldey_full[baldey_full$gender=="female",]$RT)
# What does this mean?

# May be want to know whether RTs for lefties are faster than righties
t.test(baldey_full[baldey_full$hand=="left",]$RT, baldey_full[baldey_full$hand=="right",]$RT)
# What does this mean?

# Are RTs different from RTPrevs?
t.test(baldey_full$RT, baldey_full$RTprev, paired = T)
# What does this mean?
mean(baldey_full$RT)
mean(baldey_full$RTprev)
mean(baldey_full$RT)-mean(baldey_full$RTprev)
# Why do we indicate that this is a paired t-test?



# YOUR TURN! --------------------------------------------------------------

# Using baldey_full:
# # 1) calculate the correlation between RT and age. What's the relationship?
# # Then determine if RTs are different between words with initial stress or not types are different.




# R package slides --------------------------------------------------------

# What they are and what they do
# How to get them and how to use them

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

# Once a package is installed you have to make it available in your session
library(dplyr)
# # N.B. - You have to do this every time you open R 

# Example with dplyr

# dplyr has a lot of functions that mimic the base functions we have just 
# # learned. However, dplyr function extend the functionality and make them 
# # more user friendly.

# We learned to change column names by finding the column name in the 
# # vector and writing in a new name
# # Let's "un-do" this change so we can do it the new way!
colnames(baldey_exp)[colnames(baldey_exp)=="ACC"] <- "response"
colnames(baldey_exp)
# With dplyr
baldey_exp_dplyr1 <- rename(baldey_exp, ACC = response)
colnames(baldey_exp_dplyr1)
# We learned to subset
baldey_exp_sub3 <- baldey_exp[baldey_exp$RT >= 150 & baldey_exp$RT <= 2000,]
baldey_exp_sub3 <- subset(baldey_exp, RT >= 150 & RT <= 2000)
# With dplyr
baldey_exp_dplyr2 <- filter(baldey_exp, RT >= 150 & RT <= 2000)

# We learned to select columns
baldey_exp_tmp <- baldey_exp[, c("subject", "RT")]
# With dplyr
baldey_exp_dplyr3 <- select(baldey_exp, subject, RT)
colnames(baldey_exp_dplyr3)
# Also, to remove columns
baldey_exp_dplyr3a <- select(baldey_exp, -subject, -RT)
colnames(baldey_exp_dplyr3a)
# We learned to order the data
baldey_exp_sort <- baldey_exp[order(baldey_exp$subject, -baldey_exp$RT), ]
# With dplyr
baldey_exp_dplyr4 <- arrange(baldey_exp, subject, desc(RT))
head(baldey_exp_dplyr4)

# The wonderful thing about dplyr functions is that these operations can be 
# # chained, i.e., piped, together to pass the result of one to another so that they are 
# # carried out in one fell swoop!

mysubset <- baldey_full %>% filter(RT >= 500, gender=="female") %>%
  select(subject, RT, gender, word) %>% arrange(desc(subject), desc(RT)) %>% 
  droplevels()
head(mysubset)

# Also, sometimes we have different conditions and we'd like to know the means 
# # of these respectively
# For this we can use the functions group_by() and summarise() in dplyr

# # Sometimes you want the grand mean
avgdat1 <- baldey_full %>% summarise(MeanRT = mean(RT, na.rm = T))
avgdat1

# # Sometimes you want to aggregate for a particular variable
avgdat2 <- baldey_full %>% 
  group_by(word_class) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
avgdat2

# # And sometimes you want to aggregate for multiple variables
avgdat3 <- baldey_full %>% 
  group_by(gender, word_class) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
avgdat3

# # And sometimes you want multiple summary variables
avgdat4 <- baldey_full %>% 
  group_by(gender, word_class) %>% 
  summarise(MeanRT = mean(RT, na.rm = T), SD = sd(RT, na.rm = T), 
            MedRT = median(RT, na.rm = T), MinRT = min(RT),
            MaxRT = max(RT), N = n())
avgdat4

# These summary dataframes can also be easily plotted

avgdat5 <- baldey_full %>% 
  group_by(gender) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
plot(MeanRT ~ gender, data = avgdat5)

avgdat6 <- baldey_full %>% 
  group_by(session) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
plot(MeanRT ~ session, data = avgdat6)

avgdat7 <- baldey_full %>% 
  filter(word_status == "word") %>% 
  group_by(subject, ACC) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
plot(MeanRT ~ subject, data = avgdat7)


# YOUR TURN! --------------------------------------------------------------

# Using dplyr and baldey_part:
# # subset for participants with a diploma other than "havo",
# # find the average age of participants grouped by handedness,
# # include the number of participants in each group,
# # and save it to a dataframe called handage


# Sometimes we need to do slighty more complex things

# Slightly more complex description of ACC
# # Don't worry if this is over your head...I just put it here for you to see
# # how it could be done.

avgdat8 <- baldey_full %>% 
  group_by(subject) %>% 
  mutate(SubjN =  n()) %>% # mutate() creates a new column
  filter(ACC == "correct") %>% 
  summarise(Prop = n()/SubjN[1]) # n() counts
plot(Prop ~ subject, data = avgdat8)



# Reproducibility and R Notebooks (if time) -------------------------------



# The End! ----------------------------------------------------------------


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

# Week 4

# STEP@CCP2019 ------------------------------------------------------------
# # Vincent Porretta (porretta@uwindsor.ca)
# # Aki-Juhani Kyröläinen (akkyro@gmail.com)


# Introductory slides -----------------------------------------------------

# Installing R and RStudio
# Installing necessary packages
# Downloading scripts and data


# Preparing the workspace -------------------------------------------------

# First we need to get our workspace ready
# Once Rstudio is open, click on the file tab to the right.
# Navigate to your working folder using the '...' button to the right
# Then click 'More' and select 'Set as working directory'
# Alternatively, you can do this directly in the R Console with code such as:
setwd("~/Dropbox/STEP/STEP2019/IntroR")
# And check it with 
getwd()


# Creating a project ------------------------------------------------------

# Alternatively, we can create a "Project" that will be unique to all we here
# It will always associate the folder with the files and set the working directory
# # when you open the project!
# File > New Project > Existing Directory > Browse > Create Project


# R Basics ----------------------------------------------------------------

# Try some simple arithmetic
2+2
100/5
(3+4)^2
# What happens when you put one of the expressions in quotes?

# Making an object assignment using <-
x <- 2
y <- 3
x <- 4

# Retreiving objects
x
y

# What happens when you put the object name in quotes?

# What happens when you add x and y together?
# What happens when you add x and Y together?

# Making a different kind of assignment
z <- "number"
z
# Can you retreive the object?
# Can you subtract z from x? Why?

# Other objects (Vectors)
V1 <- c(1,2,3,4,5)
V2 <- c("one", "two", "three")
V3 <- c(TRUE, FALSE, TRUE, FALSE)
# Retreive each object

# What happens when you try to assign V4, mixing the data types?
V4 <- c(1, "one", TRUE)

# Let's get some information about our vector objects

# Use the function str() 
str(V1)
str(V2)
str(V3)

# Use the function length()
length(V1)

# Operating on vectors
# What happens when you add V1 and 5 together?
V1 + 5
# Can you do the same for V2 and V3? Why?

# What if you use the logical operator == instead of +?
V1 == 5


# Saving your script and environment --------------------------------------

# When you close Rstudio, to should prompt you to save your Rscript (if you
# # have made unsaved changes) as well as your global environment.
# The script will be saved as a .R file (just a special kind of text file).
# The environment will be saved as a .Rdata file.
# Next time you open your project, both will be available to you as when 
# # you closed the project!

# Give it try!


# Functions/Files/Variables slides ----------------------------------------

# Important functions/arguments
# Where to find help
# Data files 
# Understanding variables


# Functions and Arguments -------------------------------------------------

# We've already used 2 functions in R - c() and str()
# Take a moment and explore the help documentation related to these
# # Access this from both the RStudio help tab and the console

?c
?str

# Now look at the help for a new function head() 
?head
# What does it do?
# What does the argument n do? 

# Create this numeric vector of random numbers
random <- c(rnorm(100, 0))

# Use the function head and it's argument n to examine the data in the vector
head(random, n=10)


# Getting started with real data ------------------------------------------

# First we will work with "baldey_expdata.csv"

# Before working with your data, get a sense for them
# # What's the file format?
# # Where did the data come from?
# # What does the file contain?

# Let's take a peek in the spreadsheet program of your choice
# # Take note of the file type

# Now let's try to read in the data (not a trivial matter!)

# Use the read.table function
baldey_exp <- read.table("baldey_expdata.csv")
# Did it read in appropriately?  
# Use head to examine it
head(baldey_exp)

# What's wrong? We need to tell R how to separate the data into columns!
baldey_exp <- read.table("baldey_expdata.csv", sep=",")
# If you had a space delimited file you would need " "
# If you had a tab delimited file you would need "\t"

# Did the data come in appropriately?
head(baldey_exp)

# What's wrong? We need to tell R that the first row contains the column names
baldey_exp <- read.table("baldey_expdata.csv", sep=",", header = T)

# Did the data come in appropriately?
head(baldey_exp)


# Now let's read in the item information contained in "baldey_itemdata.txt"
# # Note that this is a tab delimited file!
baldey_item <- read.table("baldey_itemdata.txt", sep="\t", header = T)

# Did the data come in appropriately?
head(baldey_item)

# Now take a look at the structure of the data frame using str()
str(baldey_item)
# Look carefully at the structure
# # Information is given about each column (The type of data R thinks it contains)

# Look carefully at columns <regularity> and <lip.ms>
# # What do you notice about them?

# We actually need to deal with the "-" character
# # In this dataset it marks missing values...something we normally want to 
# # mark with NA

# The most straightforward way to deal with this is when we read in the data!
baldey_item <- read.table("baldey_itemdata.txt", sep="\t", header = T, na.strings = "-")

# Examine the data again
head(baldey_item)
str(baldey_item)
# How are <regularity> and <lip.ms> encoded now?

# Other possibly important arguments when reading in data:
# # dec = ","
# # quote = """
# # fileEncoding = "UTF8"


# YOUR TURN! --------------------------------------------------------------

# Using what you know:
# # 1) read in the file called "baldey_partdata.txt". Assign it to object baldey_part.
# # 2) examine its structure. Does the encoding make sense?



# The data frame ----------------------------------------------------------

# Now to begin examining the structure of the data frame using other functions
# # For the time being we will be examining baldey_exp

# Data frames are made up of columns and rows

# To get the size of the data frame
dim(baldey_exp)

# To get the number of rows
nrow(baldey_exp)
# To get the number of columns
ncol(baldey_exp)

# To get the names of the columns
colnames(baldey_exp)
# To get the names of the rows (though this isn't usually that informative)
rownames(baldey_exp)
# The output is rather long

# This next step is CRUCIAL!!!
str(baldey_exp)

# These are the columns in the data frame and indicate the type of information each contains
# # Does this make sense?
# # R is pretty good at determining these; however, sometimes it gets fooled, Or, 
# # we simply desire to change the type because of the way we have 
# # operationalized a particular variable ... more on this below

# Dataframes slides -------------------------------------------------------

# Understanding data structures
# Accessing the data

# Columns/vectors and data modes ------------------------------------------

# Individual columns can be access by specifying the data frame name and the 
# # column name (dataframe$column)  

head(baldey_exp$RT)

length(baldey_exp$RT)

# Each column has a specific mode associated with the data it contains.
# # The most common ones are: integer, numeric, factor, logical, character
# # integer: whole numbers
# # numeric: real numbers
# # factor: a repeated (and limited) set of identifiers
# # logical: TRUE or FALSE; R also treats these as 1 and 0, respectively
# # character: strings or text values

# We already got a taste for this when we loaded the data the first time

# Let's re-examine the structure of the data

str(baldey_exp)

# It looks like session is currently set as an integer
# # However, we might in fact want this to be a factor with many levels (that 
# # happen to be named with numbers)

# We can change the mode of a particular column with the functions like as.factor()
# It's often a good idea to assign this to a new column, as not to 
# # overwrite something incorrectly

baldey_exp$session_fac <- as.factor(baldey_exp$session)
str(baldey_exp$session_fac)

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


# YOUR TURN! --------------------------------------------------------------

# Using what you know:
# # 1) create a new column called transcription_char that is a character version
# # # # of the factor <transcription> in baldey_item.
# # 2) create a new column called Nphonemes_fac that is a factor version
# # # # of the integer Nphonemes in baldey_item.


# Indexing the dataframe --------------------------------------------------

# Sometimes you want to access a specific value or set of values in your data
# This can be done visually for small datasets, but is nearly impossible for
# # large dataframes!
# Indexing gives us a way to get at the data we want/need

# This can be done using row and column numbers
baldey_exp[1,1]
baldey_exp[30,3]

# If you do not specify a column, it will retrun all the columns of that row
baldey_exp[28,]
# Conversely, if you do not specify a row, it will retrun all the rows for that column
baldey_exp[,4]

# You can also use column names instead of numbers
baldey_exp[30,"RT"]

# You can use multple column names in c() to access more than one at a time
baldey_exp[100, c("subject", "RT")]

# Similarly, we can use c() to access multiple rows at one time
baldey_exp[c(30,40,50),"RT"]
baldey_exp[c(30:50),"RT"]


# Indexing a vector/column ------------------------------------------------

# Indexing also works for vectors and columns within dataframes
# The only difference is that you only need the element/row number

# If we use V2
V2[3]

# If we use the RT column of baldey_exp
baldey_exp$RT[250]

# c() also works here!
baldey_exp$RT[c(1,100,1000)]
baldey_exp$RT[c(100:110)]


# YOUR TURN! --------------------------------------------------------------

# Using data frame indexing on baldey_exp, find the value(s):
# # 1) in the 10000th row of the column named "response"
# # 2) in the 30451st through 30460th rows of the column named "word"
# # 3) in the 1533rd row of the columns "Subject", "RT", "word", and "word_status"
# # 4) in the 9th, 101st, and 452nd rows of "Subject", "RT", and "response"



# Getting your data the way you need it -----------------------------------

# One of the most important parts of an analysis is getting the data the 
# # way you need it.

# Often we want to change column names to make life easier later

# For this we use the colnames() function
colnames(baldey_exp)[colnames(baldey_exp)=="response"] <- "ACC"
colnames(baldey_exp)
# Sometimes we want to create new columns in the dataframe 

# # Defining a new column is done by specifying the name of the new column and 
# # assigning something to it using <-

baldey_exp$NewColumn1 <- 5
# # Notice the number of variables increased

# # Lets look at our new column
str(baldey_exp$NewColumn1)
baldey_exp$random <- rnorm(nrow(baldey_exp), 5)
str(baldey_exp$random)
# Usually we want to make the new column from an existing column
baldey_exp$NewColumn2 <- baldey_exp$word

# # Lets look at our new column
str(baldey_exp$NewColumn2)

# We can also create new columns by operating on other existing columns
# # Importantly, this operation is done rowwise (i.e., row by row)
baldey_exp$NewColumn3 <- baldey_exp$RT-baldey_exp$RTprev

# # Lets examine our new column
str(baldey_exp$NewColumn3)
head(baldey_exp$NewColumn3)
# # Summary gives us a quick glimpse at the data
summary(baldey_exp$NewColumn3)

# # Looks good!

# Last, but not least, sometimes you want to remove a column altogether
# # WARNING: THIS CAN NOT BE UNDONE!!!!
baldey_exp$NewColumn1 <- NULL


# YOUR TURN! --------------------------------------------------------------

# Using baldey_exp:
# # 1) create a new column (Subj_copy) that is a copy of the subject column
# # 2) rename Subj_copy to REMOVE
# # 3) remove REMOVE
# # 4) create a new column (RT_sec) that represents the RT in seconds
# # 5) use summary to examine RT_sec


# Subsetting the data

# Sometimes you want to work with only a portion of your data set (e.g., the
# # data from a single participant)

# In order to do this, we need to understand logical operators.
# In R, the most common logical operators are:
# # > (greater than)
# # < (less than)
# # >= (greater than or equal to)
# # <= (less than or equal to)
# # == (equal to) 
# # != (not equal to)

# # For subsetting we have two options.

# 1) We can use subscripting as we have already seen
baldey_exp_sub1 <- baldey_exp[baldey_exp$RT >= 150,]

# # Have a quick look at the RT values in the new dataframe
summary(baldey_exp_sub1$RT)

# 2) We can use the subset() function
baldey_exp_sub2 <- subset(baldey_exp, subject == "s1")

# # Take a closer look at the new subject column
summary(baldey_exp_sub2$subject)
str(baldey_exp_sub2)
# # What do we notice about the dataframe?

# IMPORTANT - Whenever you subset based on a factor, it's a good idea to use droplevels()
# # If you subset, R will still think that the irrelevant levels of the factor 
# # are still possible/present

unique(levels(baldey_exp_sub2$subject))

# This can cause problems later in an analysis
# # So dropping levels will alleviate this

baldey_exp_sub2 <- droplevels(baldey_exp_sub2)
unique(levels(baldey_exp_sub2$subject))

# Subsetting based on multiple criteria
# # For this we need two additional logical operators:
# # & (and)
# # | (or)

# 1) Using subscripting
baldey_exp_sub3 <- baldey_exp[baldey_exp$RT >= 150 & baldey_exp$RT <= 2000,]
summary(baldey_exp_sub3$RT)

# 1) Using subset()
baldey_exp_sub4 <- subset(baldey_exp, subject == "s1" | subject == "s10")
summary(baldey_exp_sub4$subject)

baldey_exp_sub5 <- subset(baldey_exp, subject %in% c("s1", "s20", "s17", "s3", "s5"))
summary(baldey_exp_sub5$subject)

baldey_exp_sub5 <- baldey_exp[baldey_exp$subject %in% c("s1", "s20", "s17", "s3", "s5"),"RT"]
str(baldey_exp_sub5)
# Ordering the data

# Sometimes, it is beneficial to have the data in a particular order
baldey_exp_sort <- baldey_exp[order(baldey_exp$subject, -baldey_exp$RT),]
head(baldey_exp_sort)

baldey_exp_sort2 <- baldey_exp[,order(colnames(baldey_exp))]

# YOUR TURN! --------------------------------------------------------------

# Using baldey_item:
# # 1) create a subset (baldey_item_sub1) representing only real words
# # 2) create a subset (baldey_item_sub2) representing only adjectives with a 
# # #  CELEX_form_freq greater than or equal to 100
# Using baldey_part:
# # 3) create a new dataframe (baldey_part_sort) ordered by gender and age
# # 4) examine baldey_part_sort, reverse the order of age, and re-examine


# Bringing dataframes together

# Often times we have two dataframes with related information that we would like
# # to have in a single dataframe.
# For this, we need the merge() function which combines two dataframes into a
# # new one by some value

# Now to merge the participant data with the experimental data
# # Define a new data frame

baldey_exp_part <- merge(baldey_exp, baldey_part, by="subject")

# Look to the right, baldey_exp_part should now have 6 more columns than 
# # baldey_exp, and then should have the same number of rows
dim(baldey_exp)
dim(baldey_exp_part)
ncol(baldey_part)
str(baldey_exp_part)
## check the data
nrow(baldey_exp) == nrow(baldey_exp_part)
table(baldey_exp$subject %in% baldey_exp_part$subject)
# Looks good!
# Looks like it appropriately assigned the data modes!

# IMPORTANT - If you have lost rows, that means that the column on which you are 
# # matching do not have the same unique values in the two dataframes!
# Again, this can cause problems for later analysis!



# YOUR TURN! --------------------------------------------------------------

# Using baldey_exp_part:
# # 1) create a new dataframe (baldey_full) that combines baldey_exp_part 
# # #  with baldey_item 
# # 2) double check that you have not lost any data
# # 3) look at the column names of the new dataframe; what do you notice?
# # 4) how would you fix the issue?


# Two important points about merging data frames

# First, matching column named differently in each dataframe
# # If the matching column is called something different in your two dataframes
# # you can still merge them

# Either rename the column in either dataframe, as we did above:
# # colnames(dfr)[colnames(dfr)=="OldName"] <- "NewName"

# Or specify the two different column names in the merge function:
# # newdfr <- merge(dfrx, dfry, by.x="dfrxcolname", by.y="dfrycolname")

# Second, you may have to CREATE a matching column
# # For example:
# # dfrx$MatchingKey <- paste(dfrx$Col1, dfrx$Col2, sep="_")
# # dfry$MatchingKey <- paste(dfry$Col1, dfry$Col2, sep="_")
# # Then simply merge as above:
# # newdfr <- merge(dfrx, dfry, by="MatchingKey")


# Saving ------------------------------------------------------------------

# You've done a lot so far, so you probably want to save what you've done
# There are a couple of things to know about saving in R/RStudio

# As we have seen, an RStudio project will save your entire workspace as an 
# # image (.RData) as well as your R script file (.R) when you close
# If you don't have a project, RStudio will prompt you to save both 

# You can also save individual objects from your workspace (this is handy for 
# # sharing a data set with someone).
# For saving objects you have a few options:
# # 1) Save as an R object (.rda)
# # 2) Save as a text file (.txt, .csv, etc.)

# Saving an R object 
save(baldey_full, file = "baldey_full.rda", compress = "xz")
# # .rda files retain the encoding of the data, but can only be read by R.
# # FYI, to load a .rda file, simply use the load("filename.rda")!

# Saving a data frame as a text file
write.table(baldey_full, file="baldey_full.txt", sep="\t", quote=F, row.names=F)
# # Text files can easily be shared, but do not retain the encoding of the data.


# YOUR TURN! --------------------------------------------------------------

# Using baldey_exp_sub3:
# # 1) save a .txt file 
# Using baldey_item:
# # 2) save a .rda file



# Basic descriptive stats -------------------------------------------------

# Now that your data is exactly as you want them, you can start your analysis!

# One of the first things we want to do is calculate descriptive statistics
# # Mean, Standard Deviation, Median, Range, etc.

# We have already seen that the summary() function can return some of this 
# # basic info for numeric variables
summary(baldey_full$RT)

# Sometimes we would like additional or more fine-grain info
# For this we can use base functions in R

# # First perhaps we want to calculate the grand mean of RT
# # For this we use the function mean() and simply specify the column we want
# # It's important to specify that you want NAs removed.
mean(baldey_full$RT, na.rm = T)
# # We can do the same for median
median(baldey_full$RT, na.rm = T)

# # and for standard deviation
sd(baldey_full$RT, na.rm = T)

# # and also the range of values
range(baldey_full$RT, na.rm = T)

# # to obtain the individual values of the range
range(baldey_full$RT, na.rm = T)[1]
min(baldey_full$RT, na.rm = T)
range(baldey_full$RT, na.rm = T)[2]
max(baldey_full$RT, na.rm = T)

# # to get the number of observations
length(baldey_full$RT)
nrow(baldey_full)
# However, we often care about conditional means (i.e., means for different groups)
# To do this, we need to use subscripting!

# # Imagine that we want to see separate means for female and male participants
mean(baldey_full[baldey_full$gender=="female",]$RT, na.rm = T)
mean(baldey_full[baldey_full$gender=="male",]$RT, na.rm = T)
# N.B. - We could of course create two subsets and then calculate the means from
# # each of the two subset dataframes...but that is more typing!


# YOUR TURN! --------------------------------------------------------------

# Using baldey_full:
# # 1) calculate the conditional descriptive stats (mean, SD, median, range) 
# # #  of RT for both words and nonwords


# Basic plots of the raw data ---------------------------------------------

# You often want to visualize/explore your data before analysis to get a 
# # sense for what is going on.
# R has basic plotting functions for this purpose

# Let's try to plot RT 
# # To make a plot of a particular variable

plot(baldey_full$RT)

# # This is plotted against the index (observation) of the data points
# # This type of plot is called an index plot (often not that informative)

# Plot RT across Trials

plot(RT~trial, data=baldey_full)

# # The formula is always Y~X
# # This type of plot is called a scatter plot

# Perhaps we want to view a particular swath of data
# # Let's add limits to the axes 

plot(RT~trial, data=baldey_full, ylim=c(150, 3000), xlim=c(1, 50))

# Maybe we want to get handle on a particular variable
# # Let's plot the density (distribution) of RT

plot(density(baldey_full$RT, na.rm=T))

# Let's make a proportional plot

plot(ACC~subject, data=baldey_full)

# Now let's make a box plot of this continuous variable by a factor (ACC)

plot(RT~ACC, data=baldey_full)

# This isn't so pretty
# # Let's add axis labels and a main title

plot(RT~ACC, data=baldey_full, ylab="RT", xlab="Response accuracy", main="RT by Accuracy")



# YOUR TURN! --------------------------------------------------------------

# Using baldey_full:
# # 1) make a plot proportional plot of accuracy by word_status
# # 2) make a scatterplot of RT by RTprev 
# # 3) make a boxplot of RT by session


# Saving plots ------------------------------------------------------------


# You can use the RStudio buttons above the plot to enlarge the plot (Zoom) and save the plot (Export) 
# # N.B. - When the plot is saved using RStudio, the resolution is very low.
# # R support multiple different file formats
# # To create a tiff image we can do the following

tiff(file = "myboxplot.tiff", width = 8, height = 8, units = "in", pointsize = 12, 
     res = 600, compression = "lzw")
plot(RT~ACC, data=baldey_full, ylab="RT", xlab="Accuracy", main="RT by Accuracy")
dev.off()
# # Always remember to close the graphics device after plotting with dev.off()!!!!



# Basic Inferential Stats -------------------------------------------------

# Correlation
# # What is it?
# # Any statistical relationship between two sets of data involving a degree of dependence
# # The extent to which changes in one variable’s values are reflected systematically 
# # as changes in another variable’s values
# # N.B. - correlation does not (necessarily) imply causality

# # As a general rule of thumb for interpreting r
# # 0.00-0.19 (very weak)
# # 0.20-0.39 (weak)
# # 0.40-0.59 (moderate)
# # 0.60-0.79 (strong)
# # 0.80-1.0 (very strong)

plot(RT~RTprev, data=baldey_full)
# What kind of relationship do we think might exist?
cor.test(baldey_full$RT, baldey_full$RTprev)
# What does this mean?

plot(RT~log(CELEX_form_freq), data=baldey_full)
# What kind of relationship do we think might exist?
cor.test(baldey_full$RT, log(baldey_full$CELEX_form_freq+1))
# What does this mean?


# Two sample t-test
# # What is it?
# # Can be used to determine if two independent sets of data (samples) are 
# # significantly different from each other or not.
# # There are various kinds of t-tests with different assumptions about the data

# May be want to know whether RTs are different between males and females
t.test(baldey_full[baldey_full$gender=="male",]$RT, baldey_full[baldey_full$gender=="female",]$RT)
# What does this mean?

# May be want to know whether RTs for lefties are faster than righties
t.test(baldey_full[baldey_full$hand=="left",]$RT, baldey_full[baldey_full$hand=="right",]$RT)
# What does this mean?

# Are RTs different from RTPrevs?
t.test(baldey_full$RT, baldey_full$RTprev, paired = T)
# What does this mean?
mean(baldey_full$RT)
mean(baldey_full$RTprev)
mean(baldey_full$RT)-mean(baldey_full$RTprev)
# Why do we indicate that this is a paired t-test?



# YOUR TURN! --------------------------------------------------------------

# Using baldey_full:
# # 1) calculate the correlation between RT and age. What's the relationship?
# # Then determine if RTs are different between words with initial stress or not types are different.




# R package slides --------------------------------------------------------

# What they are and what they do
# How to get them and how to use them

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

# Once a package is installed you have to make it available in your session
library(dplyr)
# # N.B. - You have to do this every time you open R 

# Example with dplyr

# dplyr has a lot of functions that mimic the base functions we have just 
# # learned. However, dplyr function extend the functionality and make them 
# # more user friendly.

# We learned to change column names by finding the column name in the 
# # vector and writing in a new name
# # Let's "un-do" this change so we can do it the new way!
colnames(baldey_exp)[colnames(baldey_exp)=="ACC"] <- "response"
colnames(baldey_exp)
# With dplyr
baldey_exp_dplyr1 <- rename(baldey_exp, ACC = response)
colnames(baldey_exp_dplyr1)
# We learned to subset
baldey_exp_sub3 <- baldey_exp[baldey_exp$RT >= 150 & baldey_exp$RT <= 2000,]
baldey_exp_sub3 <- subset(baldey_exp, RT >= 150 & RT <= 2000)
# With dplyr
baldey_exp_dplyr2 <- filter(baldey_exp, RT >= 150 & RT <= 2000)

# We learned to select columns
baldey_exp_tmp <- baldey_exp[, c("subject", "RT")]
# With dplyr
baldey_exp_dplyr3 <- select(baldey_exp, subject, RT)
colnames(baldey_exp_dplyr3)
# Also, to remove columns
baldey_exp_dplyr3a <- select(baldey_exp, -subject, -RT)
colnames(baldey_exp_dplyr3a)
# We learned to order the data
baldey_exp_sort <- baldey_exp[order(baldey_exp$subject, -baldey_exp$RT), ]
# With dplyr
baldey_exp_dplyr4 <- arrange(baldey_exp, subject, desc(RT))
head(baldey_exp_dplyr4)

# The wonderful thing about dplyr functions is that these operations can be 
# # chained, i.e., piped, together to pass the result of one to another so that they are 
# # carried out in one fell swoop!

mysubset <- baldey_full %>% filter(RT >= 500, gender=="female") %>%
  select(subject, RT, gender, word) %>% arrange(desc(subject), desc(RT)) %>% 
  droplevels()
head(mysubset)

# Also, sometimes we have different conditions and we'd like to know the means 
# # of these respectively
# For this we can use the functions group_by() and summarise() in dplyr

# # Sometimes you want the grand mean
avgdat1 <- baldey_full %>% summarise(MeanRT = mean(RT, na.rm = T))
avgdat1

# # Sometimes you want to aggregate for a particular variable
avgdat2 <- baldey_full %>% 
  group_by(word_class) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
avgdat2

# # And sometimes you want to aggregate for multiple variables
avgdat3 <- baldey_full %>% 
  group_by(gender, word_class) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
avgdat3

# # And sometimes you want multiple summary variables
avgdat4 <- baldey_full %>% 
  group_by(gender, word_class) %>% 
  summarise(MeanRT = mean(RT, na.rm = T), SD = sd(RT, na.rm = T), 
            MedRT = median(RT, na.rm = T), MinRT = min(RT),
            MaxRT = max(RT), N = n())
avgdat4

# These summary dataframes can also be easily plotted

avgdat5 <- baldey_full %>% 
  group_by(gender) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
plot(MeanRT ~ gender, data = avgdat5)

avgdat6 <- baldey_full %>% 
  group_by(session) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
plot(MeanRT ~ session, data = avgdat6)

avgdat7 <- baldey_full %>% 
  filter(word_status == "word") %>% 
  group_by(subject, ACC) %>% 
  summarise(MeanRT = mean(RT, na.rm = T))
plot(MeanRT ~ subject, data = avgdat7)


# YOUR TURN! --------------------------------------------------------------

# Using dplyr and baldey_part:
# # subset for participants with a diploma other than "havo",
# # find the average age of participants grouped by handedness,
# # include the number of participants in each group,
# # and save it to a dataframe called handage


# Sometimes we need to do slighty more complex things

# Slightly more complex description of ACC
# # Don't worry if this is over your head...I just put it here for you to see
# # how it could be done.

avgdat8 <- baldey_full %>% 
  group_by(subject) %>% 
  mutate(SubjN =  n()) %>% # mutate() creates a new column
  filter(ACC == "correct") %>% 
  summarise(Prop = n()/SubjN[1]) # n() counts
plot(Prop ~ subject, data = avgdat8)



# Reproducibility and R Notebooks (if time) -------------------------------



# The End! ----------------------------------------------------------------

# LING 4D03 Week 3 - Working with Text ------------------------------------

# Before working with your data, always try get a sense for them
# # What's the file format? 
# # What's the encoding?
# # Where did the data come from?
# # What does the file contain?


# Reading a dataframe -----------------------------------------------------

# You probably have read in data files before
# The primary/generic function for this is read.table

?read.table

# There are lots of arguments!
# The most important are:
# # header
# # sep
# # na.strings
# # stringsAsFactors
# # dec
# # quote
# # fileEncoding

# The other variants of read.table simply set different defaults!

# Let's try to read in datafile.txt using read.table

# Let's take a peek in the spreadsheet/texteditor program of your choice
# # Take note of the file type

# Try to read in with the defaults
mydat <- read.table("datafile.txt")

# Check the dataframe
str(mydat)

# Based on what we know about the file, what should we set the arguments to?
mydat <- read.table("datafile.txt", sep="\t", header = T, na.strings = "-")

# Examine the data again
str(mydat)

# What would I have to set if:
# # My data file was in csv format? use read.csv or sep=","
# # My data file had traditional NA markers? na.strings="@"
# # The data were collected by European colleague? dec=","
# # I don't want my strings automatically turned into factors? stringsAsFactors=false (tells r not to do that step)


# Reading unformatted text ------------------------------------------------

# Reading in data frames is relatively straightforward, because experimental data  
# # tend to be tabular in nature

# Unformatted text is trickier!

# Let's try to read in doyle.txt

# Let's take a peek in the text editor program of your choice
# # Can we read this using read.table?

# Reading in unformatted text as a vector

# The first option we have is readLines
# # This literally just reads each line as marked by \n

?readLines

# Let's give it a go
text <- readLines("doyle.txt")
head(text)

View(text)

# What if you want more options?

# Enter scan

?scan

# Scan reads text into a vector (or a list)

# There are lots of arguments!
# The most important are:
# # what
# # sep
# # quote
# # skip
# # fileEncoding

text <- scan("doyle.txt", what = character())
# What did this do?
head(text)
View(text)
# Examine the cells  - it chopped it by word (maybe this is what we want, maybe it isn't)

text <- scan("doyle.txt", what = character(), quote = NULL)
# What did this do?
head(text)
View(text)
# Examine the cells

text <- scan("doyle.txt", what = character(), sep = "\n")
# What did this do?
head(text)
View(text)
# Examine the cells

text <- scan("doyle.txt", what = character(), sep = ".")
# What did this do?   - it actually line breaks and a full stop. seperating a text by sentence is very difficult; hence
#why we don't typically do that
head(text)
View(text)

text <- scan("doyle.txt", what = character(), skip = 47) 
# What did this do?
head(text)
View(text)

# What happens if you try to separate by lines AND use the quotes?
text <- scan("doyle.txt", what = character(), quote = "\"", sep = "\n")
# Why?  - seperated by quotes and \n in between my quotes
# The end result depends on the combination of arguments!



# String manipulation -----------------------------------------------------

# Load stringr
library(stringr)

# Let's start with a basic string

mystring <- "Vincent Porretta"
mystring

# Find out the length
str_length(mystring)

# We may want to get specific parts of the string based on position
str_sub(mystring, start = 1, end = 7) 
# Start and end
str_sub(mystring, start = 9)
# Start
str_sub(mystring, start = -8)
# Start (counting backward)
str_sub(mystring, end = 7)
# End
str_sub(mystring, end = -10)
# End (counting backward)


# Let's make a vector of character strings

myvector <- c("This   is", "a", "simple   ", " VECTOR ", "with", "   9 words and", " 2 digits", ".")
myvector

# What are some of the things we notice immediately about these strings?

# Let's remove the whitespace
str_trim(myvector, side = "left")
str_trim(myvector, side = "right")
myvector2 <- str_trim(myvector, side = "both")
myvector2
myvector2 <- str_squish(myvector2)
myvector2

# We might want to collapse the vector
mysent <- str_c(myvector2, collapse = " ")
mysent


# We can convert to lowercase
str_to_lower(mysent)

# We can convert to uppercase
str_to_upper(mysent)

# Maybe we want title case!
mysent2 <- str_to_title(mysent)
mysent2


# We can also split the string up
str_split(mysent2, pattern = " ")
# Note that this returns a list!
# # If you want a vector back you must unlist it
myvector3 <- unlist(str_split(mysent2, pattern = " "))
myvector3


# Perhaps we have a vector of strings we need to sort
str_sort(myvector3)
str_sort(myvector3, decreasing = TRUE)


# Putting the commands together with %>% (pipe)
myvector %>% str_trim(side = "both") %>% 
  str_squish() %>% 
  str_to_lower() %>% str_split(pattern = " ") %>% 
  unlist() %>% str_sort()


# Regular Expressions -----------------------------------------------------


# We will cover the basic (most useful) regular expressions as well as 
# # how to combine them

# One function that will help us to see how regex works is str_view_all
# Let's use myvector again

# Finding any literal strings
str_view_all(myvector, pattern = "This", match = T)
# However
str_view_all(myvector, pattern = "this", match = T)

# Finding using OR
str_view_all(myvector, pattern = "r|R", match = T)


# Finding using an anchor
# Beginning a string
str_view_all(myvector, pattern = "^s", match = T)
# End of a string
str_view_all(myvector, pattern = "h$", match = T)

# Finding any character
str_view_all(myvector, pattern = ".", match = T)

# Finding using classes
# Lower case
str_view_all(myvector, pattern = "[:lower:]", match = T)
# Upper case
str_view_all(myvector, pattern = "[:upper:]", match = T)
# Numerals
str_view_all(myvector, pattern = "[:digit:]", match = T)
# Punctuation
str_view_all(myvector, pattern = "[:punct:]", match = T)
# Arbitrary set  - this defines a class (one you create)
str_view_all(myvector, pattern = "[Vi9g]", match = T)


# Let's create a more complex (and messy) set of strings

messystrings <- c("This $h!t is bananas, B-A-N-A-N-A-S", 
                  "867-5309",
                  "Na na na na-na-na na, na-na-na na, hey Jude",
                  "But I would walk 500 miles, And I would walk 500 more")
messystrings

# Finding metacharacters
# Characters such as . ? ( are reserved for formulating the regex syntax
# In order to find their literal instance in a string, they must be "escaped"
# # using a double backslash
str_view_all(messystrings, pattern = "\\$", match = T)
# Compare with 
str_view_all(messystrings, pattern = "$", match = T)

# Finding using grouping
str_view_all(messystrings, pattern = "w(ou|a)l(d|k)", match = T)

# Finding using quantifiers
# Zero or One times
str_view_all(messystrings, pattern = "50?", match = T)
# Zero or more times
str_view_all(messystrings, pattern = "50*", match = T)
# One or more times
str_view_all(messystrings, pattern = "50+", match = T)
# Specific number of times
str_view_all(messystrings, pattern = "(na){2}", match = T)
# Compare with
str_view_all(messystrings, pattern = "(na){1}", match = T)


# Using regex to remove, replace, or extract ------------------------------

# We can now use regex to remove, replace, or extract text!

# Perhaps we want to remove all puntuation from our song strings
str_remove_all(messystrings, pattern = "[:punct:]")

# Perhaps I want to remove all instances of "na" regardless of case or what follows it, but 
# # but not the na in bananas
str_remove_all(messystrings, pattern = "[Nn]a[,\\s-]+")

# Now lets replace all digits with X
str_replace_all(messystrings, pattern = "[:digit:]", replacement = "X")

# We can also replace all vowels with V
str_replace_all(messystrings, pattern = "[aeiouAEIOU]", replacement = "V")

# Maybe we need to extract all words, i.e., alphabetic strings
str_extract_all(messystrings, pattern = "^[:alpha:]+")
# Note that this returns a list!
# # If you want a vector back you should unlist it
firstword <- unlist(str_extract_all(messystrings, pattern = "^[:alpha:]+"))
firstword

# LING 4D03 Week 4 - Working with Data ------------------------------------


# Load necessary packages -------------------------------------------------

library(dplyr)
library(stringr)

# Load some data ----------------------------------------------------------

FrasierDat <- read.csv("FrasierScripts.csv", header = T, stringsAsFactors = F)

# Take a look at it

str(FrasierDat)

# Filter ------------------------------------------------------------------

# Filtering is equivalent to subsetting in base R
# # We use it to select specific rows from our data

# Generally it follows the form:
# # filter(COLUMNNAME, LOGICAL CRITERION)

# # For this we need logical operators


# Remember, the most common logical operators are:
# # > (greater than)
# # < (less than)
# # >= (greater than or equal to)
# # <= (less than or equal to)
# # == (equal to) 
# # != (not equal to)
# # & (and)
# # | (or)
# # %in% (in a set)
# # !( %in% ) (not in a set)

# Note: All logical operators can be used for numeric data, but only the last 5 
# # can be used for string data

# Suppose we only want the lines spoken by Frasier

Sub1 <- FrasierDat %>% filter(cast == "Frasier")

unique(Sub1$cast)

# Suppose we want every line except those by Frasier

Sub2 <- FrasierDat %>% filter(cast != "Frasier")

unique(Sub2$cast)

# We can ask for lines by either Frasier or by Niles

Sub3 <- FrasierDat %>% filter(cast == "Frasier" | cast == "Niles")

unique(Sub3$cast)

# We can ask for lines by any cast member in a set

Sub4 <- FrasierDat %>% filter(cast %in% c("Frasier", "Niles", "Daphne", "Martin", "Roz"))

unique(Sub4$cast)

# We can also get the inverse of this, lines by any cast member NOT in a set

Sub5 <- FrasierDat %>% filter(!(cast %in% c("Frasier", "Niles", "Daphne", "Martin", "Roz")))

unique(Sub5$cast)


# Regex

# Now that we also know regex, we can use it for filtering based on a pattern!

# Suppose we want to subset for only the first 3 seasons
# # This information is only contained in the url column
# # Season information is given /season_#(#)/

Sub6 <- FrasierDat %>% filter(str_detect(url, "season_[123]{1}/"))

unique(Sub6$url)

# Or maybe we want to subset for dialog lines containing a particular pattern
# # Something like, (no, no, ), (No, no ), or (no no )

Sub7 <- FrasierDat %>% filter(str_detect(dialog, "((N|n)o,?\\s){2}"))

head(Sub7$dialog)



# Mutate ------------------------------------------------------------------

# Mutate allows us to create new columns in the data, similar to how we would
# # use the assignment operator <- to make a new dataframe column in base R

# Generally it follows the form:
# # mutate(NEWCOLUMNNAME = FUNCTION(COLUMN))

# Let's use what we know to make a season number column and an episode number column

View(FrasierDat$url)

FrasierDat <- FrasierDat %>% mutate(season = str_extract(url, "season_[0-9]+"),
                                    episode = str_extract(url, "episode_[0-9]+"))

head(FrasierDat[,c("season", "episode")])
tail(FrasierDat[,c("season", "episode")])

# Or maybe we want to remove [stage directions] from the dialog

View(FrasierDat$dialog)

FrasierDat <- FrasierDat %>% 
  mutate(dialog_clean = str_remove_all(dialog, "\\[[A-Za-z\\s(;|,|\\.|\\-)]+\\]")) %>% 
  mutate(dialog_clean = str_trim(dialog_clean, side = "both")) %>% 
  mutate(dialog_clean = str_squish(dialog_clean))

View(FrasierDat[,c("dialog", "dialog_clean")])

# Now that the dialogs are cleaner, we can create a column that contains 
# # information about the number of words per line
# # We could come up with a fancy regular expression, but let's just count the
# # number of spaces and add 1!

FrasierDat <- FrasierDat %>% 
  mutate(N_words = str_count(dialog_clean, " ") + 1)

View(FrasierDat[,c("dialog_clean", "N_words")])



# Arrange -----------------------------------------------------------------

# Arrange is a way to sort the data, similar to order() in base R

# Generally it follows the form:
# # arrange(COLUMNNAME1, COLUMNNAME2, ...)
# # By default it arranges from smallest to largest

# Suppose we want to arrange the data by cast member

Arr1 <- FrasierDat %>% arrange(cast)

# Remember that when working with strings, it will sort alphanumerically

head(Arr1$cast)
tail(Arr1$cast)

# If we want to reverse the order (descending values), we wrap the column name in desc()

Arr2 <- FrasierDat %>% arrange(desc(cast))

head(Arr2$cast)
tail(Arr2$cast)

# We can also arrange my multiple columns at once

# Maybe we want to arrange first by cast member and then by season

Arr3 <- FrasierDat %>% arrange(cast, season)

Arr3 %>% filter(cast %in% c("Frasier", "Daphne")) %>% 
  View()


# Count -------------------------------------------------------------------

# Count allows us to easily count/tally the number of observations in a 
# # column, similar to table() in base R

# We can use this to find out how many lines of dialog each character had
# # throughout the show

FrasierDat %>% count(cast)

# We can even pipe this forward to arrange!
FrasierDat %>% count(cast) %>% arrange(desc(n))



# Summarize ---------------------------------------------------------------

# Summarize performs some operation/calculation over rows
# # It returns a new dataframe containing the summary info

# Generally it follows the form:
# # summarize(SUMMARYCOLUMNNAME = FUNCTION(COLUMN))

# Maybe we want to know the average number of words in each line of dialog

Sum1 <- FrasierDat %>% summarise(MeanLineLength = mean(N_words))

head(Sum1)

# We can also get multiple summaries at once

Sum2 <- FrasierDat %>% summarise(MeanLineLength = mean(N_words),
                                 MinLineLength = min(N_words),
                                 MaxLineLength = max(N_words))

head(Sum2)


# Group_By ----------------------------------------------------------------

# Group_by allows us to group a dataframe based on a variable
# # before carrying out operations/calculations

# Imagine that we want to count the number of lines per character for each season

Cnt1 <- FrasierDat %>% group_by(season) %>% count(cast)

View(Cnt1)

# Now maybe we want to create a new column (aka mutate) that is the running 
# # index of the line number, but we want to have this for each episode in each season

Mut1 <- FrasierDat %>% group_by(season, episode) %>% 
  mutate(line_num = 1:n())

View(Mut1)

# Lastly, perhaps we want to summarize the data by calculating the longest line
# # by the cast members

Sum3 <- FrasierDat %>% group_by(cast) %>% 
  summarise(MaxLineLength = max(N_words))

View(Sum3)



# Piping ------------------------------------------------------------------

# Dplyr allows us to pipe/chain operations together using %>% 
# # We have already seen some examples of this

# Basically each operation is completed before passing the dataframe to the next

# Here is a complex example
# # Starting from our initial import of data, I can calculate the average number
# # of words per line of dialog for the principle characters and order them from 
# # greatest to smallest in about 8 lines of code! 

MyData <- FrasierDat %>% 
  mutate(dialog_clean = str_remove_all(dialog, "\\[[A-Za-z\\s(;|,|\\.|\\-)]+\\]")) %>% 
  mutate(dialog_clean = str_trim(dialog_clean, side = "both")) %>% 
  mutate(dialog_clean = str_squish(dialog_clean)) %>% 
  mutate(N_words = str_count(dialog_clean, " ") + 1) %>% 
  group_by(cast) %>% 
  summarise(MeanLineLength = mean(N_words)) %>% 
  filter(cast %in% c("Frasier", "Niles", "Daphne", "Martin", "Roz")) %>% 
  arrange(desc(MeanLineLength))

MyData


# Joining -----------------------------------------------------------------

# Joining allows us to bring two data frame together, similar to merge() in 
# # base R

# The important thing to remember is that this requires a matching column, i.e., key
# # That is a column in each data frame that contains "the same" information

# In the example below we have our Dialog lines from FrasierDat, and we want 
# # to bring in the episode titles from another data frame 

# Let's read in the episode data

Titles <- read.csv("FrasierEpisodes.csv", stringsAsFactors = F)

str(Titles)

# How to match?
# # We need a unique identifier for each title that also exists in FrasierDat

# Let's create one
FrasierDat <- FrasierDat %>% mutate(ID = str_c(season, episode, sep = "_"))

head(FrasierDat$ID)

Titles <- Titles %>% mutate(ID = str_c(season_num, episode_num, sep = "_"))

head(Titles$ID)


# Let's bring them together using inner_join() 
# # It returns all rows from x where there are matching values in y, 
# # and all columns from x and y. If there are multiple matches between x and 
# # y, all combination of the matches are returned.

FullDat <- left_join(FrasierDat, Titles, by = "ID")

str(FullDat)

# NOTES: 
# # If you lose rows, that means it found less matches than you expected 
# # If you gain rows, that means it found duplicates (which you probably didn't expect)

# dplyr has other types of joins, but inner_join() is the most similar to merge

#H HOMEWORK 5
# load in packages

library(dplyr)
library(stringr)

# 1. Read in and rename
Meta <- read.csv("FakeNewsMeta.csv", header = T, stringsAsFactors = FALSE)

# 2. Create new column...
View(Meta$published) 
Meta <- Meta %>% mutate(date_published = str_extract(published, "[:digit:]{4}\\-[:digit:]{2}\\-[:digit:]{2}"))

# 3. Find the average number of shares
Sum1 <- Meta %>%
  group_by(type) %>%
  summarise(Average_shares = mean(shares)) %>%
  ungroup() %>%
  arrange(desc(mean_shares))

View(Sum1)
# the highest was Bias

# 4. Find number of articles per author

Meta %>% count(author) %>% arrange(desc(n))

#   1 ""(no author)    1943
#   2 admin            247
#   3 Alex Ansary      100
#   4 Eddy Lavine      100
#   5 Editor           100
#   6 Gillian          100
#   7 Pakalert         100s
#   8 Starkman         100
#   9 BareNakedIslam   99
#   10 Dave Hodges     99

# 5. Find each author's number of posts per day...

PPD <- Meta %>%
  mutate(author_clean = str_extract(author, ".+")) %>%
  filter(!is.na(author_clean)) %>%
  filter(!author %in% c("-NO AUTHOR-")) %>%
  group_by(date_published, author_clean) %>%
  count(author_clean, date_published) %>% 
  arrange(desc(n))
View(PPD)
# I wasn't sure if you wanted the top 10 posters within the PPD output (i.e. the most frequent numbers according
# to total number, seperated by date; as in, admin, for example, is top 10 for frequency twice due to the date 
# categorization or if you wanted dates to be irrespective of their posting frequency... so I left my results in
# the format of PPD object)

# Top 10 posters with highest positing frequency
#   Date - Poster (Author) - N (frequency)
#1	2016-10-27	admin	  98
#2	2016-10-27	IWB	    89
#3	2016-10-28	admin	  86
#4	2016-10-26	beforeitsnews.com	47
#5	2016-10-28	Editor	38
#6	2016-11-02	Eddy Lavine	38
#7	2016-10-27	Editor	31
#8	2016-10-29	stevew	24
#9	2016-10-30	Madeline	20
#10	2016-10-28	Dave Hodges	19

# 6. Eddy Lavine.. frequency over time...
EddyLavine <- PPD %>% filter(author_clean == "Eddy Lavine")
View(EddyLavine)

# His peak posting frequency occured 2016-11-02 (November 2nd, 2016)

# 7. Using th information in Meta find the country Eddy was posting from
Meta %>% filter(author == "Eddy Lavine") %>% count(country)

#Eddy was posting from TV (Tuvalu)

# 8.KNowing what we know about Eddy's posting frequency... 
# Due to Tuvalu's relationship with the US and the time of the presidental election with all the scandal
# and buzz regarding Donald Trump and Hilary Clinton, it's likely Lavine's submissions are related to the
# U.S. presidental election

#TEXT

#  9. Read in FakeNewsTitles.txt
Titles <- readLines("FakeNewsTitles.txt")
head(Titles)
View(Titles)

Titles <- scan("FakeNewsTitles.txt", what = character(), sep = "\n")
str(Titles)
head(Titles)
options(max.print = 99999)

# 10. Remove the following using regex
# a. 
str_remove_all(Titles, pattern = "^(\\||»).*$")

# b.
str_remove_all(Titles, pattern = "(\\[|\\()[a-zA-Z\\s]*(\\]|\\))")

# c.
str_remove_all(Titles, pattern = "\\s[a-zA-Z0-9]*\\.com$")
View(Titles)

# 11. Complete the following:
#a) Convert to lowercase
str_to_lower(Titles)
Titles

#b) Replace all instances of ... with a space (note that this is a single UTF8 character, not three periods!)
str_replace_all(Titles, pattern = "\\.", replacement = "\\s" )

#c) Remove all punctuation
str_remove_all(Titles, pattern = "[:punct:]")
View(Titles)

#d) Remove excess whitespace (both around and within strings)
Titles %>% str_trim(side = "both") %>% 
  str_squish()

# 12. Split Titles to a vector of individual words called Titles_words
str_split(Titles, pattern = " ")
Titles_words <- unlist(str_split(Titles, pattern = " "))
View(Titles_words)

# WEEK 4 IN CLASS
# 1. Read in Oscar Speech data oscar_speech_db.csv to an object called speeches.
speeches <- read.csv("oscar_speech_db.csv", stringsAsFactors = FALSE)

# 2. Create a subset that contains only awards to an actor or actress. HINT: regex "Act(or|ress)".
speeches <- speeches %>% filter(str_detect(Category, "Act(or|ress)"))


# 3. Create new column (N_Thanks) that contains a number indicating the number of times
# a recipient said Thank you or thank you. HINT: regex "[Tt]hank you".
speeches <- speeches %>% mutate(N_Thanks = str_count(Speech, "[Tt]hank you"))

# 4. Create new column (Winner_Clean) that contains only the name of the winner 
# (removing all other information). HINT: regex "\\s\\([[:alpha:][:punct:]\\s]*\\)".
speeches <- speeches %>%
  mutate(Winner_Clean = str_remove_all(Winner, "\\s\\([[:alpha:][:punct:]\\s]*\\)"))

# PART 2
# 1. Arrange the data so that the award recipients with the greatest number of 
# thank-yous are at the top. Who said thank you the most?
speeches <- speeches %>% arrange(desc(N_Thanks)) head(speeches)
# Halle berry

# Use count() to determine who has won the most times.
speeches %>% count(Winner_Clean) %>% arrange(desc(n))

#  Determine whether actors or actresses say more thank-yous on average. 
# HINT: Create a column called Gender from the column called Category using the 
# regex in Part 1, Step 2.
speeches %>% mutate(Gender = str_extract(Category, "Act(or|ress)")) %>% group_by(Gender) %>%
  summarise(Mean_Thank = mean(N_Thanks),
            SD_Thank = sd(N_Thanks))
# on average Actresses say more thank-yous


# WEEK 4 IN CLASS: STRINGS
# 1. Create the following character vector. Using str_view_all, define a regex 
# expression using the or operator (|) that will find “I love dogs” and “I love cats”, 
# but not “I love logs”, “I love cogs”.
S1 <- c("I love dogs", "I love cats", "I love logs", "I love cogs")
str_view_all(S1, pattern = "I love (dogs|cats)") # () provides grouping
# | provides the or

# 2. Create the following character vector. Using str_view_all, define a 
# regex expression that will find all the numbers.
S2 <- c("abc123xyz", "define 97x", "var g = 3421", "12 animals", "yo")
str_view_all(S2, pattern = "[:digit:]+")
# [:digit:] finds any digit
# + finds the previous expression one or more times


# 3. Create the following character vector. Using str_view_all, define a regex expression
# that will find the full stop (.).
S3 <- c("!", "%", "*", "^", ".", "@")
str_view_all(S3, pattern = "\\.")
# . is a special/reserved character that finds anything
# \\ before it tells the search to find the literal fullstop

# 4. Create the following character vector. Using str_view_all, define a regex 
# expression that will only find “wassup” and “wazzup”. HINT: you can use (), |, and {}.
S4 <- c("wassup", "wazup", "wazzup", "wazzzzup", "wasup", "wazzzup")
str_view_all(S4, pattern = "wa(z|s){2}up")

# 5. Create the following character vector. Using str_view_all, define a regex 
# expression that will only find entries that contain an initial capital letter. 
# HINT: you can use ˆ, [], ., and +.
S5 <- c("Ana", "Bob", "Cpc", "aAx", "bbY", "cCZ")
str_view_all(S5, pattern = "^[ABC].+")
# ^ finds the beginning of a string/line
# [ABC] finds any of the characters in the set
# . finds any other caracter
# + finds the previous expression one or more times


# PART 2 - real text
# 1. Read practicetext.txt by lines using scan into a vector called mytxt. 
# Examine the text using print().
mytxt <- scan("practicetext.txt", what = character(), sep = "\n") print(mytxt)

# 2. Remove excess whitespace (around and within).
mytxt <- str_trim(mytxt, side = "both") mytxt <- str_squish(mytxt)

# 3. Remove the telephone numbers (and the space before it). HINT: extend the
# regex "\\s[:digit:]{3}" command to get the 10 digit pattern.
mytxt <- str_remove_all(mytxt, pattern = "\\s[:digit:]{3}-[:digit:]{3}-[:digit:]{4}")


# 4. Extract all the twitter handles and save them to a vector called handles. HINT: use regex
# "ˆ@[a-zA-Z0-9]+$".
handles <- unlist(str_extract_all(mytxt, pattern = "^@[a-zA-Z0-9]+$"))

#5. Anonymize the twitter handles by replacing them with @private.
mytxt <- str_replace_all(mytxt, pattern = "^@[a-zA-Z0-9]+$", replacement = "@private")

#6. Convert all text to lower case.
mytxt <- str_to_lower(mytxt)


# LING 4D03 Week 6 - Corpus Linguistics in R ------------------------------


# Load necessary packages -------------------------------------------------

library(dplyr)
library(stringr)


# Load some data ----------------------------------------------------------

# Let's load the doyle text we prepared previously and check it

doyle <- scan("doyle_text.txt", what = character(), sep = "\n")

str(doyle)
head(doyle)


# Frequency ---------------------------------------------------------------

# Calculate frequency
# # Calculating frequency is really just counting! We know how to do this
# # with dplyr, we just have to make sure our vector is in a dataframe

doyledf <- tibble(Word = doyle)
freq <- doyledf %>% count(Word, name = "Freq")

head(freq, 20)
tail(freq, 20)

# Rank sort
# # We also know how to sort these data from largest to smallest

freq_sorted <- freq %>% arrange(desc(Freq))

head(freq_sorted, 20)
tail(freq_sorted, 20)

# Calculating lexical diversity - TTR
# # Lexical diversity is measured by Type-Token Ratio
# # Types are all the unique words in the corpus and Tokens are all instance 
# # in the corpus

types <- length(freq_sorted$Word)
tokens <- length(doyle)
types/tokens

# Filter (Removing stop list)
# # A stop list is a list of words not to be included in the frequency list
# # These are usually highly frequent function words

# Let's load and examine a stop list

stoplist <- scan("stoplist.txt", what = character(), sep = "\n")
View(stoplist)

# Now we can remove these using filter

freq_sorted_clean <- freq_sorted %>% filter(!(Word %in% stoplist))

head(freq_sorted_clean, 20)

# Plot the rank frequency distribution
plot(freq_sorted_clean$Freq)
# # This looks exactly as one would expect!


# Collocates --------------------------------------------------------------

# N-grams - pairs and triplets, frequency

bigrams <- doyledf %>% mutate(Bigram = str_c(lag(Word), Word, sep = " "))

trigrams <- doyledf %>% mutate(Trigram = str_c(lag(Word), Word, lead(Word), sep = " "))

# We can then get N-gram frequencies by counting and arranging

bigram_freq <- bigrams %>% 
  count(Bigram, name = "Freq") %>% 
  filter(!is.na(Bigram)) %>% 
  arrange(desc(Freq))

head(bigram_freq)

trigram_freq <- trigrams %>% 
  count(Trigram, name = "Freq") %>% 
  filter(!is.na(Trigram)) %>% 
  arrange(desc(Freq))

head(trigram_freq)

# Specific collocates
# # Suppose we want to find all the words that end in -ful along with their
# # collocates in the text

ful_collocates <- doyledf %>% 
  mutate(Previous = lag(Word),
         Following = lead(Word)) %>%
  filter(str_detect(Word, pattern = "ful$")) %>% 
  select(Previous, Word, Following) %>% 
  arrange(Following)

head(ful_collocates)


# Concordances ------------------------------------------------------------

# Generate concordances
# # In a similar way to collocates we can also generate concordance lines
# # For a particular word, pattern, or set

# Perhaps we want concordance lines for words that start with un-
conc1 <- doyledf %>% 
  mutate(Left = str_c(lag(Word, n = 3),
                      lag(Word, n = 2),
                      lag(Word, n = 1),
                      sep = " "),
         Right = str_c(lead(Word, n = 1),
                       lead(Word, n = 2),
                       lead(Word, n = 3),
                       sep = " ")) %>%
  filter(str_detect(Word, pattern = "^im")) %>% 
  select(Left, Word, Right)

head(conc1)

# Or maybe we would like concordances for the lemma "be"
# # For this we should define a set of lexemes
lemma_be <- c("am", "are", "is", "was", "were", "be", "being", "been")

conc2 <- doyledf %>% 
  mutate(Left = str_c(lag(Word, n = 3),
                      lag(Word, n = 2),
                      lag(Word, n = 1),
                      sep = " "),
         Right = str_c(lead(Word, n = 1),
                       lead(Word, n = 2),
                       lead(Word, n = 3),
                       sep = " ")) %>%
  filter(Word %in% lemma_be) %>% 
  select(Left, Word, Right) %>% 
  arrange(Word)

head(conc2)


# Dispersion --------------------------------------------------------------

# We can plot the dispersion of a word in various sections of a text/corpus
# # For this we need to know the sections so we can count.
# # In this single text, we do not have defined sections, so we can create an
# # example by defining groups of 10000 words

sections <- doyledf %>% mutate(Section = rep(1:11, each = 10000, len = n()))

# We would like to know the dispersion of the word "Watson" across the text
# # So, we have to count the instances by section

sec_freq <- sections %>% 
  filter(Word == "watson") %>% 
  group_by(Section) %>% 
  count(Word)

# Now we can make a barplot
barplot(n~Section, data = sec_freq)


# Perhaps we are interested not in sections by in running index throughout
# # the text

# We have to create a column showing where Watson occurs and an index of the 
# # rows in the file

text_disp <- doyledf %>% 
  mutate(Watson = str_detect(Word, "watson"),
         Index = row_number())

# Now we can make a barplot that looks like a barcode
barplot(Watson~Index, text_disp)

# WEEK 6 In class
# 1. Using scan, read in the word vector for Melville’s Moby Dick to an object called 
#melville. 
melville <- scan("melville.txt", what = character(), sep = "\n")
#2. Create a dataframe from the vector (using tibble) and then make a frequency list 
#(using count). What are the top 10 most frequent words?
meldf <- tibble(Word = melville)
freq <- meldf %>% count(Word, name = "Freq") %>% arrange(desc(Freq)) head(freq, 10)
#3. Calculate the lexical diversity (Type-Token Ratio) of the novel.
nrow(freq)/nrow(meldf)
# 4. Load the stopword list (using scan). Remove stop words from the frequency list 
# (using filter). Save the frequency list to a text file using write.table()
stoplist <- scan("stoplist.txt", what = character(), sep = "\n")
freq_nostop <- freq %>% filter(!(Word %in% stoplist))
write.table(freq_nostop, file = "Melville_freq.txt", row.names = F, sep = "\t")
# 5. Plot the frequency distribution using the frequency list you just saved. What does it 
# look like?
plot(freq_nostop$Freq)
# As expected!
# 1. Use mutate to generate trigrams and then count them to find the frequencies. What 
# are the 5 most frequent trigrams?
triplets <- meldf %>% 
  mutate(Triplet = str_c(lag(Word), Word, lead(Word), sep = " ")) triplets_freq <- triplets %>%
  count(Triplet, name = "Freq") %>% filter(!is.na(Triplet)) %>% arrange(desc(Freq))
head(triplets_freq, 5)
# 2. Use mutate to generate concordance lines for the word sea with 3 words on either side. 
# Display the head.
conc <- meldf %>%
  mutate(Left = str_c(lag(Word, n = 3),
                      lag(Word, n = 2), lag(Word, n = 1), sep = " "),
         Right = str_c(lead(Word, n = 1), lead(Word, n = 2), lead(Word, n = 3),
                       sep = " ")) %>% filter(Word == "sea") %>%
  select(Left, Word, Right) %>% arrange(Word)
head(conc, 25)
# 3. Use mutate, in conjunction with str_detect and row_number to create the necessary data 
# for a dispersion plot that shows where Moby OR Dick appears throughout the text. What does 
# this tell you about the title character in the story?
text_disp <- meldf %>%
  mutate(Moby = str_detect(Word, "moby|dick"),
         Index = row_number()) barplot(Moby~Index, text_disp)
# The title character does not appear until about a third of the way into the story!

#PART 2

# LING 4D03 Week 8 - Annotated Corpus Demo --------------------------------

# Working with annotated text ---------------------------------------------

# For this we will be using one file from the BNC, BNC_K1B.xml
# # Before we begin, let's take a look at it again in a text editor

# Things to accomplish:
# Create a subset of the corpus only containing sentences with indefinite pronouns
# Compare frequency of "that" when used as a conjunction and as a determiner
# Create a frequency list of part-of-speech using tags
# Find all forms following the lemma be

# Load necessary packages -------------------------------------------------

library(dplyr)
library(stringr)


# Load some data ----------------------------------------------------------

# Let's load the text and check it

BNC <- scan("BNC_K1B.xml", what = character(), sep = "\n")

str(BNC)
head(BNC)


# Clean the text ----------------------------------------------------------

# Get only the sentences (lines starting with tag <s >)
Sentences <- tibble(Text = BNC) %>% filter(str_detect(Text, pattern = "^<s"))

head(Sentences$Text)

# Create a vector/dataframe of tagged word
Words <- unlist(str_extract_all(BNC$Text, pattern = "\\<w [[:alnum:][:punct:][:blank:]\\=]*\\>[:alnum:]*\\s\\</w\\>"))

head(Words)

Words <- tibble(Text = Words) 


# Sentences containing indef. pron. ---------------------------------------

# PNI 	indefinite pronoun (e.g. NONE, EVERYTHING)
Indef_Pron <- Sentences %>% filter(str_detect(Text, pattern = "c5=\"PNI\"\\s"))

head(Indef_Pron)


# That --------------------------------------------------------------------

# Find instances of T/that
That <- Words %>% filter(str_detect(Text, pattern = "(T|t)hat\\s"))

# Extract the tags CJT and DT0 
That <- That %>% 
  mutate(Tag = str_extract_all(Text, pattern = "c5=\"[A-Z0-9]+\"\\s", simplify = T))

# Find freq
That_freq <- That %>% count(Tag)

head(That_freq)


# POS Frequency -----------------------------------------------------------

# Extract the tags CJT and DT0 
POS <- Words %>% 
  mutate(Tag = str_extract_all(Text, pattern = "pos=\"[A-Z]+\"", simplify = T))

# Find freq
POS_freq <- POS %>% count(Tag) %>% arrange(desc(n))
POS_freq




# Forms following lemma be ------------------------------------------------

BE <- Words %>% 
  mutate(Following = lead(Text)) %>% 
  filter(str_detect(Text, pattern = "hw=\"be\"")) %>% 
  arrange(Following)

head(BE)



# LING 4D03 Week 8 - Quantitative Methods ---------------------------------


# Load datasets -----------------------------------------------------------

load("Quant_methods (1).Rdata")
library(dplyr)

# Goodness-of-fit ---------------------------------------------------------

# Imagine we are interested in knowing if the frequency distribution of 
# # of the passive is equal across the text genres, i.e., is it a uniform 
# # distribution?  We can test this with frequencies obtained from COCA.

# Passive dataset
str(passive)

# We will use the Chi-squared goodness-of-fit test
# # For this we need a vector of the frequencies

freqs <- passive$FREQ
freqs

# We then specify the test and turn off the Yates correction for continuity 
# # That last bit is somewhat complicated, but there are good reasons not to use it.

chisq.test(freqs, correct = FALSE)

# The null hypothesis is that the frequencies are the same across the genres

# We can examine the expected frequencies
goodness <- chisq.test(freqs, correct = FALSE)
goodness$expected

# We can now say that the distribution of the observed values differs 
# # significantly from the expected values


# Association -------------------------------------------------------------

# Imagine we are interested in knowing if the frequency distribution of 
# # 'different from' and 'different to' is the same in both British and 
# # Canadian English. We can test this with frequencies obtained from GloWbE.

# Frequency dataset (matrix)
diffmat

# We specify the test and again turn off the Yates correction for continuity 

chisq.test(diffmat, correct = FALSE)

# The null hypothesis is that the frequency distributions are the same for 
# # both varieties

# What is the effect size, phi?

# We first have to get the numerator, the chi-sq value
num <- chisq.test(diffmat, correct = FALSE)$statistic

# Then the denominator, total freq times the smallest dimension minus 1
denom <- sum(diffmat)*(min(dim(diffmat))-1)

# Phi is then the square root of the ratio
phi <- sqrt(num/denom)
phi

# This appears to be a pretty small, but significant effect

# We can also examine and visualize the direction of the effect

chisq.test(diffmat, correct = FALSE)$residual

# 'different to' is less frequent than expected in Canadian English and more
# # frequent than expected in British English

assocplot(diffmat)

# While sample size is not really an issue here, we could opt for Fisher's
# # exact test

fisher.test(diffmat)



# Keyness -----------------------------------------------------------------

# Imagine we are interested in knowing if certain words are keywords in Jane
# # Austen's Pride and Prejudice.
# # In order to test keyness we need both a target corpus and a reference 
# # corpus. For our reference we will use Sir Arthur Conan Doyle's Adventures
# # of Sherlock Holmes

# Frequency data for the two novels
str(keydata)

# We want to test if 'love' is key.
# # For this we can again use the Chi-squared test

# We need the freq of Darcy in both novels
pp_love <- keydata[keydata$Word=="love","austen"]
sh_love <- keydata[keydata$Word=="love","doyle"]

# We also need the number of words in each novel
pp_total <- sum(keydata$austen)
sh_total <- sum(keydata$doyle)

# We then create a matrix of the values
key_love <- matrix(c(pp_love, pp_total, sh_love, sh_total), 2, 2,
                   dimnames = list(c("observed", "total"),c("austen", "doyle")))
key_love

# We then specify the test and again turn off the Yates correction for continuity 

chisq.test(key_love, correct = FALSE)

# The Chi-squared value indicates that Darcy is indeed key in Pride and Prejudice


# Another way to test keyness is with log likelihood

# We want to test if 'street' is key in Sherlock Holmes

# We need the freq of street in both novels
sh_street <- keydata[keydata$Word=="street","doyle"]
pp_street <- keydata[keydata$Word=="street","austen"]

# We also need the number of words in each novel
# We can reuse sh_total and pp_total

# We have to calculate the expected values ourselves  
sh_expected <- sh_total*(sh_street+pp_street) / (sh_total+pp_total)
pp_expected <- pp_total*(sh_street+pp_street) / (sh_total+pp_total)

# Now we can make the calculation
G2 <- 2*((sh_street*log(sh_street/sh_expected)) + (pp_street*log(pp_street/pp_expected)))
G2

# The log likelihood value indicates that street is indeed key in Sherlock Holmes


# Mutual information ------------------------------------------------------

# Imagine we are interested in the mutual information of word pairs in  
# # Jane Austen's Pride and Prejudice 
# # For this example let's take the bigram 'mr darcy'
# We want to know the collocation strength of the two words

# For this we will need the frequency of the individual words of the pair 
# # as well as the frequency of the pair and the overall corpus size

# We already have frequency information loaded
w1 <- keydata[keydata$Word=="mr","austen"]
w2 <- keydata[keydata$Word=="darcy","austen"]

# And we already know the size of pride and prejudice
pp_total <- sum(keydata$austen)

# We need to get the bigram frequency of 'mr_darcy'
str(bigramdata)
wdpr <- bigramdata[bigramdata$Bigram=="mr_darcy","austen"]

# Calculate mutual information
pmi_mr_darcy <- log2((wdpr/pp_total)/((w1/pp_total)*(w2/pp_total)))
pmi_mr_darcy

# This pair has a reasonably strong mutual information value


# Correlation -------------------------------------------------------------

# Imagine we are interested in the correlation between the frequency of 
# # 'different from' and time, and the correlation between 'different to' and time

# Frequency data over time
str(difftofromdata)

# Let's take just 'different from'
diff_from <- difftofromdata %>% filter(PHRASE == "different from")

# We can plot the relationship
plot(PER.MIL~SECTION, data = diff_from)
# It appears to be decreasing

# Let's test this using a Spearman's rho
cor.test(diff_from$SECTION, diff_from$PER.MIL, method = "spearman")
# We have a significant correlation of -1
# # This indicates to us that for every half decade, the usage consistently drops!

# If we use Kendall's tau...
cor.test(diff_from$SECTION, diff_from$PER.MIL, method = "kendall")
# We get a very similar result!

# Now let's turn to 'different to'
diff_to <- difftofromdata %>% filter(PHRASE == "different to")

# We can plot the relationship
plot(PER.MIL~SECTION, data = diff_to)
# It appears to be increasing but there is a dip

# Let's test this using a Spearman's rho
cor.test(diff_to$SECTION, diff_to$PER.MIL, method = "spearman")
# We have a correlation of 0.83, but it is only marginally significant
# This would likely be significant if we had more data

# If we use Kendall's tau...
cor.test(diff_to$SECTION, diff_to$PER.MIL, method = "kendall")
# We get a very similar result, but the tau is lower (which is typical/normal)


# WEEK 8 IN CLASS
# Load the data required for the following activity.
load("Inclass_quant.Rdata") Part 1
# 1. . Use Color_US_GB to perform a chi-squared test of association between country 
# and spelling variant. Report the result and tell what it means.
chisq.test(colormat, correct = FALSE)
##
## Pearson's Chi-squared test ##
## data: colormat
##
## ##
# X-squared = 34545, df = 1, p-value < 2.2e-16
# 2. Calculate the effect size (phi) for the chi-squared test.
# X-squared 0.7178456
#3. Make a plot of the association. What does this tell us about the relationship?
# Highly significant result. The distribution of usage is not the same between # # the two countries
num <- chisq.test(colormat, correct = FALSE)$statistic denom <- sum(colormat)*(min(dim(colormat))-1)
phi <- sqrt(num/denom)
phi
assocplot(colormat)

# In the US 'color' is used more than expected and 'colour' is used less than # # expected.
# The reverse is true in the UK

# PART 2
# 1. Use ColorColour_COHA to create a plot of the usage of ‘colour’ over time. What 
# relationship appears to emerge?
plot(COLOUR~DECADE, data = ColorColour_COHA)

# The usage appears to drop over time
# 2. Now perform a Spearman’s correlation test to determine if the relationship 
# is statistically significant. Report the result.
cor.test(ColorColour_COHA$DECADE, ColorColour_COHA$COLOUR, method = "spearman")
##
##  Spearman's rank correlation rho
##
## data: ColorColour_COHA$DECADE and ColorColour_COHA$COLOUR
## S = 2464, p-value < 2.2e-16
## alternative hypothesis: true rho is not equal to 0 ## sample estimates:
## rho
## -0.8526316
# There is a strong and significant decrease in the use of 'colour'
# 1. Using the frequency information provided below, calculate the keyness (using log likelihood)
# of the word “case” in Sherlock Holmes, using Pride and Prejudice as the reference corpus.
# Report the result.
# Sherlock Holmes case 110 TOTAL 46391 Pride and Prejudice 32 54932

sh_case <- 110 pp_case <- 32
sh_total <- 46391 pp_total <- 54932
sh_expected <- sh_total*(sh_case+pp_case) / (sh_total+pp_total) pp_expected <- pp_total*(sh_case+pp_case) / (sh_total+pp_total)
G2 <- 2*((sh_case*log(sh_case/sh_expected)) + (pp_case*log(pp_case/pp_expected))) G2
## [1] 59.50556
# At 59.5, the word 'case' is very key to Sherlock Holmes

# PART 4
# 1. Using the frequency information provided below, calculate the mutual information of 
# “baker street” in Sherlock Holmes. Report the result.
#Count
# baker 42 street 83 baker street 29
#  TOTAL 46391
pmi_baker_street <- log2((29/46391)/((42/46391)*(83/46391))) 
pmi_baker_street
## [1] 8.592181
# At 8.6, the collocation strength between 'baker' and 'street' is reasonably high

#IN CLASS WORK AND ANSWERS


#WEEK 11; IN CLASS; QUANTEDA
# LING 4D03 Week 11 - Quanteda --------------------------------------------

# We need to install the package and additional example corpora
install.packages("quanteda")
# install.packages("devtools")
devtools::install_github("quanteda/quanteda.corpora")
install.packages('htmlwidgets')

library(quanteda)
library(quanteda.corpora)


# The corpus object in quanteda -------------------------------------------

# # Saves character strings and variables in a data frame
# # Combines texts with document-level variables

# The function corpus() construct a corpus object
# # Here we can use a character vector to make the corpus
# # This is a named vector provided in the package

View(data_char_ukimmig2010)


# When creating the corpus, we can give it variables associated
# # with each text!  Here we want to create a variable that is
# # the name of the political party

corp_immig <- corpus(data_char_ukimmig2010, 
                     docvars = data.frame(Party = names(data_char_ukimmig2010)))
summary(corp_immig)

# Notice all the info it already gives you when you inspect the corpus


# Understanding the corpus object 
str(corp_immig)


# The actual texts are stored in a dataframe
View(corp_immig$documents)


# There is metadata associated with the corpus
# # This can be modified or added to
View(corp_immig$metadata)


# There are settings that can be modified related to how the data are handled
View(corp_immig$settings)


# There is a special place to store the tokens (i.e., a vector of 
# # individual words).  This is currently empty...we get to fill it
View(corp_immig$tokens)


# We can view and/or modify the variables associated with each text
docvars(corp_immig)
docvars(corp_immig, "Year") <- 2010

# if you want to remove you add NULL 
# EXAMPLE: docvars(corp_immig, "Year") <- NULL

# Functions that utilize the corpus object --------------------------------


# We can create a subset of a corpus using the docvars
corp_immig_labour <- corpus_subset(corp_immig, Party == "Labour")
summary(corp_immig_labour)


# We can also easily extract just texts from the corpus
immigtexts <- texts(corp_immig)
immigtexts

# Counting types and tokens; gives by document (not cumulative)
ntype(corp_immig)
ntoken(corp_immig)


# Quanteda also has many handy functions for calulating/producing a variety of things

# The function kwic will provide concordance lines for a word/phrase/pattern 
# (key words in context) - produces concordance lines based on what you want to look at
# pattern: what you're wanting to find
# value type "fixed" stays the same; window is the words around it; iinside head just shwos
# the first lines
# dy default, it ignores case

head(kwic(corp_immig, pattern = "immigrant", valuetype = "fixed", window = 2))
head(kwic(corp_immig, pattern = "immigra[a-z]+", valuetype = "regex", window = 3))

# can save it into a data.frame
kwic_immig <- kwic(corp_immig, pattern = "immigra[a-z]+", valuetype = "regex", window = 3)
View(kwic_immig)


# The function textstat_readability will provide readability scores for all 
# # the texts in your corpus! Textstat_ calculates what you input

read_immig <- textstat_readability(corp_immig, measure = "Flesch.Kincaid")
read_immig

# Flesch.Kincaid - if put out "6" - something a grade 6 could read
# Flesch-Kincaid provides a grade level estimate using:
# # Average Sentence Length: number of words / number of sentences
# # Number of syllables
# # Number of words
# There are many other measures in the help!
?textstat_readability


# The tokens object in quanteda -------------------------------------------


# # Stores tokens in a list of vectors
# # More efficient than character strings, but preserves positions of words
# tokens objects removes things like puncutation
# in quantida -> can treat things like a compound word as one token thorugh specification
# example "I love [chili dogs]"


# To create the tokens we have to tokenize the texts in the corpus object
# # There are a lot of potential arguments!
tokens_immig <- tokens(corp_immig)
tokens_immig

# arguments, things wwe can control, all have default values; puncation is one of those
# we have to specify
# The MOST relevant arguments for us are:
# # what = c("word", "sentence", "character", "fastestword", "fasterword"),
# what -> HOW do you want to tokenize; sentences is what ends with period

# # remove_numbers = FALSE, 
# # remove_punct = FALSE,
# # remove_symbols = remove_punct, 
# # remove_separators = TRUE,
# # remove_hyphens = FALSE, 
# # remove_url = FALSE,


# Let's see them in action
tokens_immig <- tokens(corp_immig, remove_numbers = TRUE, remove_punct = TRUE)
tokens_immig



# Functions that utilize the tokens object --------------------------------


# Often we want lowercase or uppercase tokens
tokens_immig <- tokens_tolower(tokens_immig) 
tokens_immig
# tokens_toupper() is the analogue

# Sometimes it makes good sense to turn sequences of words into a single
# # compound token.
tokens_immig_comp <- tokens_compound(tokens_immig, 
                                     phrase(c("human rights", "asylum seekers")),
                                     valuetype = "fixed")
tokens_immig_comp
# Notice that the new token is "human_rights"
# concatinator arugment (to change what seperator)
# you can also regex in c("s[a-z]") etc.

# We can subset our tokens based on our docvars (like a corpus object)
tokens_immig_labour <- tokens_subset(tokens_immig, Party == "Labour")
View(tokens_immig_labour)

# We can also selective keep or remove individual tokens based on some criterion
# like "[chili dog]" SPECIFIC token from all documents not just one
# we can keep or remove specific tokens

# Exact patterns
tokens_gov <- tokens_select(tokens_immig, pattern = "government",
                            valuetype = "fixed", selection = "keep") 
tokens_gov

# Regex patterns
tokens_5char <- tokens_select(tokens_immig, pattern = "^[a-z]{5}$",
                              valuetype = "regex", selection = "keep") 
tokens_5char

# Stopwords
tokens_nostop <- tokens_select(tokens_immig, pattern = stopwords("English"),
                               selection = "remove") 
tokens_nostop

# stopwords("English") will show oyu all the words in English; you can make a vector our this
# modify this and use custom 

# The following work the same way but are more specific
# tokens_remove() 
# tokens_keep() 


# Getting types out 
# all the unique ones TYPE
types_immig <- types(tokens_immig)
types_immig


# Making ngrams
bigrams_immig <- tokens_ngrams(tokens_immig, n = 2, concatenator = "_")
bigrams_immig


#WEEK 11 IN CLASS:

# IN CLASS WORK

#PART 1
#1. 
corpus_sotu <- data_corpus_sotu
summary(corpus_sotu)
# variables like party, first name, presidernt, datat, delivery and type are included

# 2.
head(kwic(corpus_sotu, pattern = "communis[a-z]+", valuetype = "regex", window = 3))
docvars(corpus_sotu)

# 3.
corp_sotu_written <- corpus_subset(corpus_sotu, delivery == "written")
read_sotu_written <- textstat_readability(corp_sotu_written, measure = "Flesch.Kincaid")
read_sotu_written

# nah brah, these ain't for the regellar people.

# PART 2
#1. 
tokens_suto <- tokens(corpus_sotu, remove_punct = TRUE)
tokens_suto <- tokens_tolower(tokens_suto)

# 2. 
tokens_suto <- tokens_compound(tokens_suto, 
                               pattern = "United States" ,
                               valuetype = "fixed")

tokens_suto

# 3.
tokens_suto <- tokens_select(tokens_suto, pattern = stopwords("English"),
                             selection = "remove") 

# 4. Trigrams
bigrams_suto <- tokens_ngrams(tokens_suto, n = 3, concatenator = "_")
bigrams_suto

# WEEK 12
# LING 4D03/6D03 Week 12 - Quanteda 2 --------------------------------------

# We load the packages
library(quanteda)
library(quanteda.corpora)

# Let's work again with our UK government corpus
corp_immig <- corpus(data_char_ukimmig2010, 
                     docvars = data.frame(Party = names(data_char_ukimmig2010)))
# And we will tokenize it, as before
tokens_immig <- tokens(corp_immig, remove_numbers = TRUE, remove_punct = TRUE)
tokens_immig <- tokens_tolower(tokens_immig) 
tokens_immig <- tokens_remove(tokens_immig, pattern = stopwords("English")) 

# Note: quanteda does support piping
tokens_immig <- corp_immig %>% 
  tokens(remove_numbers = TRUE, remove_punct = TRUE) %>%
  tokens_tolower() %>% 
  tokens_remove(pattern = stopwords("English")) 



# More operations on the tokens object ------------------------------------


# We may want to identify and score multi-word expressions
# # This function also works on the corpus object (if you want to account for
# # punctuation, etc.)
textstat_collocations(tokens_immig, 
                      method = "lambda", # This is similar to mutual information
                      size = 2, # The size of the collocation (i.e., 2 words)
                      min_count = 2, # Minimum number of occurances
) 


# Calculate lexical diversity

# # There are functions to get the number types and the tokens out
ntype(tokens_immig)
ntoken(tokens_immig)

# But there is a handy function for calculating lexical diversity
# # Importantly it will calculate this by document for easy comparison
immig_ttr <- textstat_lexdiv(tokens_immig, measure = "TTR")
immig_ttr

# Here we use TTR - Type-Token-Ratio, but there are many others to choose from


# We can also plot the dispersion of key word(s) in each document
# # For this we need a kwic object (which also happens to work on token objects
# # because it preserves positional information)
textplot_xray(kwic(tokens_immig, pattern = "british"),
              scale = "relative", # Normalizes for documents of different length
              sort = T # Sorts documents by name
)



# The document feature matrix object in quanteda --------------------------

# The DFM is a matrix. 
# # The rows are the original documents and the columns are the features (all the 
# # words that appear in the entire corpus).
# # Numbers in the DFM represent how many times a token (i.e., a word) appears 
# # in a given document. 

# Remember that the positional/order information of the words is no longer 
# # preserved in this format

dfm_immig <- dfm(tokens_immig)
View(dfm_immig)

# Note that this also works if you have created bigrams
dfm_immig_bi <- dfm(tokens_ngrams(tokens_immig, n = 2, concatenator = "_"))
View(dfm_immig_bi)


# Functions that utilize the DFM object -----------------------------------


# Perhaps we want the relative frequency (by document)
dfm_immig_rel <- dfm_weight(dfm_immig, scheme = "prop")
View(dfm_immig_rel)


# Extract a subset (document(s)) of a dfm based on docvars
dfm_labour_bnp <- dfm_subset(dfm_immig, Party %in% c("Labour", "BNP")) 
dfm_labour_bnp


# We can also selectively keep or remove individual features (words) of the DFM
# # based on a specific criterion

# Note that this works with exact patterns and regex

dfm_gov <- dfm_select(dfm_immig, pattern = "gov.+$",
                      valuetype = "regex", selection = "keep") 
dfm_gov

# The following functions work the same way but are more specific
# dfm_remove() 
# dfm_keep() 


# We can also trim a dfm using frequency threshold-based feature selection
# # This will determine if a feature occurs within a specific range of frequency and in
# # a critical number of documents
dfm_immig_trim <- dfm_trim(dfm_immig, 
                           min_termfreq = 10, # min freq across all docs
                           max_termfreq = Inf, # max freq across all docs
                           min_docfreq = 1, # in min number of docs
                           max_docfreq = Inf, # in max number of doc
)

# We can find out the top features ()
topfeatures(dfm_immig, n = 10, decreasing = TRUE, 
            scheme = "count", 
            groups = "Party")


# We generally want a word frequency table
# # For this we use the DFM

immig_freq <- textstat_frequency(dfm_immig, 
                                 n = NULL, # Optional for top N frequencies
                                 groups = NULL, # Optional grouping by docvar
)
immig_freq

# Note that this is already ranked by feature frequency

# It also provides document frequency (i.e., how many documents the word 
# # occurs in)


# Sometimes it is nice to have a visual representation of frequency
# # For this there is the function textplot_wordcloud
textplot_wordcloud(dfm_immig, 
                   min_size = 0.5, max_size = 4, # visual sizes
                   min_count = 3, max_words = 500 # frequencies to be considered
)

# It will also let you compare documents (less than 8) via wordcloud
textplot_wordcloud(dfm_labour_bnp, 
                   min_size = 0.5, max_size = 4, # visual sizes
                   min_count = 3, max_words = 500, # frequencies to be considered
                   comparison = TRUE
)


# One thing we are often interested in is Keyness
# # The function textstat_keyness 
immig_labour_key <- textstat_keyness(dfm_immig, 
                                     target = "Labour", 
                                     measure = "lr"
)
# Note that by default it uses all other documents combined to serve as the 
# # reference corpus!

head(immig_labour_key, 10)

# The top "most key" words are at the top


# Often it is best to visualize which words are key
# # for this there is the function textplot_keyness
textplot_keyness(textstat_keyness(dfm_immig, target = "Labour", measure = "lr"),
                 show_reference = TRUE, # Also shows the negative for the reference 
                 show_legend = TRUE, # Adds a legend
                 n = 20, # How many keywords to plot
                 min_count = 2 # Min frequency in order to be added to the plot
)


# WEEK 12 IN CLASS ASSIGNMENT

# Load the following packages and data to complete the activity.
library(dplyr)
library(quanteda)
library(quanteda.corpora)
corpus_sotu <- data_corpus_sotu
tokens_sotu <- tokens(corpus_sotu, remove_punct = T)
tokens_sotu <- tokens_tolower(tokens_sotu)
tokens_sotu_nostop <- tokens_select(tokens_sotu, pattern = stopwords("English"), selection = "remove")


# Part 1
# 1. Calculate the type-token ratio for the speeches contained in the corpus. Who had the highest 
#and who had the lowest?
ttr <- textstat_lexdiv(tokens_sotu_nostop, measure = "TTR") 
ttr %>% arrange(TTR) %>% head()
# The lowest was Carter-1980b

ttr %>% arrange(desc(TTR)) %>% head()
# The highest was Washington-1790b

#2. Which collocation (excluding stopwords) is the strongest in the speeches of George Washington?
tokens_subset(tokens_sotu_nostop, President == "Washington") %>% 
  textstat_collocations(method = "lambda", size = 2, min_count = 2) %>% 
  arrange(desc(lambda)) %>% 
  head()

# United States

# 3. Visually display the dispersion of the word “united” in the speeches of George Washington.
#Lexical dispersion plot
tokens_subset(tokens_sotu_nostop, President == "Washington") %>% kwic("united") %>% textplot_xray()

#Part 2

# 1. Create a DFM of speeches from the republican party.
dfm_sotu <- dfm(tokens_subset(tokens_sotu_nostop, party == "Republican"))

#2. Make a dataframe containing the frequency counts from the weighted DFM. What is the most frequent
#word in this republican subcorpus?

Freq <- textstat_frequency(dfm_sotu) head(Freq)

# Government

# 3. Make a word cloud for subcorpus.
textplot_wordcloud(dfm_sotu,
                   min_size = 0.5, max_size = 3,
                   min_count = 3, max_words = 500 )


# 4. Calculate the keywords for the document “Reagan-1988” and make a visualization. Which are the 
# top 5 most key words for Reagan’s speech compared to all the other republican speeches?

reagan_key <- textstat_keyness(dfm_sotu, target = "Reagan-1988", measure = "lr")
textplot_keyness(reagan_key, show_reference = TRUE, show_legend = TRUE, n = 5,
                 min_count = 2)

# Family, Democratic,Freedom, US, Budget

#5. Weight the republican DFM to reflect relative frequency.
dfm_sotu_rel <- dfm_weight(dfm_sotu, scheme = "prop")


# WEEK 13
# LING 4D03/6D03 Week 13 - Quanteda 3 --------------------------------------

# We load the packages
library(quanteda)
library(quanteda.corpora)

# Let's work again with our UK government corpus
corp_immig <- corpus(data_char_ukimmig2010, 
                     docvars = data.frame(Party = names(data_char_ukimmig2010)))
# And we will tokenize it, as before
tokens_immig <- tokens(corp_immig, remove_numbers = TRUE, remove_punct = TRUE)
tokens_immig <- tokens_tolower(tokens_immig) 
tokens_immig <- tokens_remove(tokens_immig, pattern = stopwords("English")) 


# The feature co-occurence matrix in quanteda -----------------------------

# The FCM is a matrix. 
# # The rows are the features (all the words that appear in the entire corpus).
# # The columns are also all the features.
# # Numbers in the FCM represent how many times the row and the column features
# # co-occur in a given document. 

# Remember that the positional/order information of the words is no longer 
# # preserved in this format

# Let's work with a subset

tokens_bnp <- tokens_subset(tokens_immig, Party=="BNP")


# We can create the FCM

fcmat <- fcm(tokens_bnp,
             context = "window", # how to find coocurrence
             window = 5, # the size of the window in which to get coocurrence
)


# We can find feature (words) with the highest overall frequency

topfeatures(fcmat, 30)

# We can also select features from the FCM

fcmat_top <- fcm_select(fcmat,
                        pattern = names(topfeatures(fcmat, 30)),
                        selection = "keep",
                        valuetype = "fixed")

View(fcmat_top)


# We may want to visualize the contextual relationship among words 
# # Specifically, a semantic network analysis!

textplot_network(fcmat_top, min_freq = 2)

# What can we glean from this plot?
