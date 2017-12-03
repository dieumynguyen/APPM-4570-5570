rm(list = ls())
set.seed(92) #fixes the random number generator


## Example #1: 

#(a) Construct a vector/array that represents a coin. The vector should have two entries, one for heads (H) and ones for tails (T).

coin = c("H","T")


#(b)
n = 500
s = sample(coin, size = n, replace = TRUE)

#(c) cumsum() is a built in function that allows you to avoid a loop
p = matrix(data = NA, nrow = n, ncol = 1)

for (i in 1:n){
	dumb = s[1:i]
	p[i] = length(dumb[dumb == "H"])/i
}

plot(p, type = "l", xlab = "number of draws", ylab = "fraction of H"); abline(0.5,0) #inputs are intercept and slope
length(s[s=="H"])/n

#(d) Repeat this process for a biased coin, where the probability of heads is 0.75.
biased_coin = c("H","H","H","T")
s = sample(coin, size = n, replace = TRUE, prob = c(0.75, 0.25))

p = matrix(data = NA, nrow = n, ncol = 1)

for (i in 1:n){
	dumb = s[1:i]
	p[i] = length(dumb[dumb == "H"])/i
}

plot(p, type = "l", xlab = "number of draws", ylab = "fraction of H"); 

abline(0.75,0)

## Example #2

#Imagine two unmarked bags filled with poker chips. Each bag contains both red poker chips and white poker chips. In bag one, there are 75% red and 25% white; in bag two, there are 75% white and 25% red. Imagine that you pick one bag at random, and, without looking inside, begin to pull chips out, one at a time. 

#(a) Before you start picking out chips, what is the probability that you choose bag one?
0.5

#(b) What is the probability that you chose bag one given that you draw a red chip?

(0.75*0.5)/(0.75*0.5 + 0.25*0.5)

#(c) What is the probability that you have bag one given that your first two draws are red chips? What about three? Is there a pattern?


(0.75*0.75)/(0.75^2+0.25^2)
#Note that the odds ($=\frac{p}{1-p}$) for (b) are 3:1 in favor of R; in (c), they are 9:1. If we got three Rs, the odds would be 27:1. So, the odds increase by a factor of three.





