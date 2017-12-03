##### Crash course in R (# comments out line)
rm(list = ls()) #clear memory...can be important!

### Help in R

#gets help on the "lm" command
help(lm)
#another way to get help on the "lm" command
?lm
#searches for help on functions related to logarithm
??logarithm 

###Creating vectors using c
c(1, 2, 5.3, 6, -2, 4)
c("one", "two", "three")
c(TRUE, TRUE, FALSE, TRUE)

###Creating vectors using seq

#sequence from 1 to 10 in increments of 1
seq(1, 10)
#same as seq(1,10)
1:10
#sequence of numbers from 1 to 20 in increments of 2
seq(1, 20, by = 2)
#sequence of numbers from 10 to 20 of length 100
seq(10, 20, len = 100)

###Creating vectors using rep
#repeat the vector 1:3 three times
rep(1:3, times = 3)
#trt1 once, trt2 twice, trt3 thrice
rep(c("trt1", "trt2", "trt3"), times = 1:3)
# repeat 1, 2, 3 3 times each
rep(1:3, each = 3)


###Assigning and accessing objects
#assign 1, 2, 3, 4, 5 to the variable v1
v1 = 1:5;
#accessing data stored in variable v1
v1
#create two vectors, then join them together in a new vector
v2 = c(9, 10, 1)
new = c(v1, v2)
new

###Creating factors (categorical variables)
f1 <- factor(rep(1:6,3))
f1
f2 <- factor(c("a",7,"blue", "blue"))
f2


##Commonly Used Functions
x <- rnorm(50, mean=5, sd=1) #generates 50 random numbers from a gaussian with mean 5 and sd 1. Don't worry...you'll know what this means soon!
hist(x, density = 20)
length(x) #return the length of x
sum(x) #sum the numbers in x
mean(x) #calculate the mean of the numbers in x
var(x) #calculate the variance of the numbers in x
sd(x) #calculate the standard deviation of x
median(x) #calculate the median of x
range(x) #calculate the range of x
log(x) #calculate the natural log of x
summary(x) #return 5-number summary of x

hist(x, density = 20, freq = FALSE) #histogram of those random numbers; freq = FALSE makes x a 'density' (integrates to 1); density shades the boxes
curve(dnorm(x,mean = mean(x),sd = sd(x)),from = min(x), to = max(x), add = TRUE) #overlay of normal density

##SKIP ##
#Functions related to statistical distributions:
# pnorm(1.96, mean = 0, sd = 1) #cumulative distribution function for normal dist. Returns the probability that a normal random variable with mean 0 and standard deviation 1 is less than or equal to 1.96.

# qunif(0.6, min = 0, max = 1) #Quantile function for uniform distribution. Returns the value x such that P(X≤x)=0.6 for which a uniform random variable on the interval [0, 1]
# dbinom(2, size = 20, prob = .2) #Density/mass function for binomial. Returns the probability that Pra(X=2) for X∼Binom(n=20, p = 0.2).

# dexp(1, rate = 2) #returns the density of an exponential random variable with mean = 1/2.

# rchisq(100, df = 5)#returns a sample of 100 observations from a chi-squared random 
# #variable with 5 df

##########


###Creating data frames
#create a few vectors
d <- c(1, 2, 3, 4)
e <- c("red", "white", "blue", NA)
f <- c(TRUE, TRUE, TRUE, FALSE)
#creates dataframe and assigns it to mydataframe
mydataframe = data.frame(d,e,f) 
mydataframe
#rename columns of data frame
names(mydataframe) <- c("ID", "Color", "Passed")
mydataframe

#name columns while creating data frame
dataframe2 <- data.frame(ID=d, Color=e, Passed=f)
dataframe2

###Accessing data in dataframes
#access Color column
mydataframe$Color #dataframe$nameofcol
#access first row
mydataframe[1,]
#access third column
mydataframe[,3]
#access ID column of dataframe2 and store it in newID
newID <- dataframe2$ID
newID

###Writing data to file
write.table(mydataframe, "~/Google Drive/University of Colorado/Boulder/APPM 4570 Statistical Methods/Lecture/Units/Unit-1-EDA/code/example.txt", sep = "\t")

write.table(InsectSprays, "~/Google Drive/University of Colorado/Boulder/APPM 4570 Statistical Methods/Lecture/Units/Unit-8-Regression/InsectSprays.txt", sep = "\t")

###Importing data from file
data <- read.table("~/Google Drive/University of Colorado/Boulder/APPM 4570 Statistical Methods/Lecture/Units/Unit-1-EDA/code/example.txt", header = TRUE, sep = "\t")
data

data2 <- read.table(file = file.choose(), header = TRUE, sep = "\t")
data2

###Accessing vectors using index vector
a <- seq(2, 16, by = 2)
a


#access the 2nd, 4th, and 6th elements of a
a[c(2, 4, 6)]
#access elements 3 through 6 of a
a[3:6]
#access all elements in a except the 2nd, 4th, and 6th elements
a[-c(2, 4, 6)]
#access all elements in a except elements 3 through 6
a[-(3:6)]

###Logical index vectors and operators
#values greater than 10
a > 10 
#values less than or equal to 4
a <= 4 
#values equal to 10
a == 10 
#values not equal to 10
a != 10 
#values greater than 6 and less than or equal to 10
(a > 6) & (a <= 10)	
#values less than or equal to 4 or greater or equal to 12
(a <= 4)|(a >= 12)
#elements of a less than 6
a[a < 6]
#elements of a equal to 10
a[a == 10]
#elements of a less than 6 or equal to 10
a[(a < 6)|(a == 10)] 	



# Kidney example
#The National Institute of Diabetes and Digestive and Kidney Diseases conducted a study on 768 adult female Pima Indians living near Phoenix. The following variables were recorded: 
#number of times pregnant;
#plasma glucose concentration at 2 hours in an oral glucose tolerance test 
#diastolic blood pressure (mmHg)
#triceps skin fold thickness (mm); 
#2-hour serum insulin (mu U/ml); 
#body mass index (weight in kg/(height in m2));
#diabetes pedigree function (a function that represents how likely they are to get the disease by extrapolating from their ancestor’s history); 
#age (years); and 
#a test whether the patient showed signs of diabetes (coded zero if negative, one if positive). 
#The data may be obtained from the UCI Repository of machine learning databases at archive.ics.uci.edu/ml. In a real consulting situation, one should take time to learn more about how the data were collected.


library(faraway) #load needed package--will need to install...
data(pima) # load data
head(pima) # first six rows of data

summary(pima) #numerical summaries of each variable
sort(pima$diastolic) #ordered blood pressure

# 0 is not a reasonable value here. We might assume that missing values are coded as zeros... change to NA...
pima$diastolic[pima$diastolic == 0]  <- NA
pima$glucose[pima$glucose == 0] <- NA
pima$triceps[pima$triceps == 0]  <- NA
pima$insulin[pima$insulin == 0] <- NA
pima$bmi[pima$bmi == 0] <- NA

# converting test varible to factor, look at summary
pima$test <- factor(pima$test)
summary(pima$test)

# provide more descriptive labels
levels(pima$test) <- c("negative","positive")
summary(pima)

# a histogram of diastolic blood pressure
hist(pima$diastolic,xlab="Diastolic",main="")


# bivariate plots.  scatterplot then parallel boxplot
plot(diabetes ~ diastolic, data = pima)
plot(diabetes ~ test, data = pima)

#  scatterplots

### Heights data
data(Heights, package="alr4") #load data
head(Heights) #first six rows

# scatterplot of data
plot(dheight ~ mheight, data = Heights, xlab = "mother's height (in)", 
     ylab = "daughter's height (in)", xlim = c(55, 75), ylim = c(55, 75))


### Reading data from the web...

site = "http://www1.appstate.edu/~arnholta/PASWR/CD/data/Bodyfat.txt"
bodyfat = read.table(file = site, header = TRUE, sep = "\t")
head(bodyfat)


