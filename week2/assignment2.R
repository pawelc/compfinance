#Question 1
#Hint: you can use the R functions pnorm and qnorm to answer these questions. 

#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 
#a) Pr(X>.10)

1-pnorm(.1,.05,.1)

#Question 2
#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 
#b) Pr(X< -.10)
pnorm(-.1,.05,.1)

#Question 3
#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 

#c) Pr(-0.05<X<0.15)
pnorm(.15,.05,.1)-pnorm(-.05,.05,.1)

#Question 4
#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 

#d) 1% quantile, q.01
qnorm(0.01,.05,.1)

#Question 5
#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 

#e) 5% quantile, q.05
qnorm(0.05,.05,.1)

#Question 6
#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 
#f) 95% quantile, q.95
qnorm(0.95,.05,.1)

#Question 7
#(5) Suppose X is a normally distributed random variable with mean 0.05 and variance (0.10)2. Compute the following. 
#g) 99% quantile, q.99
qnorm(0.99,.05,.1)

#Question 8
#Let X denote the monthly return on Microsoft Stock and let Y denote the monthly return on Starbucks stock. Assume that XN(0.05,(0.10)2) and YN(0.025,(0.05)2). 

#Using a grid of values between Ð0.25 and 0.35, plot the normal curves for X and Y. Make sure that both normal curves are on the same plot.
#(5) Which stock has the higher risk
r=seq(from=-.25,to=.35,length.out=200)
plot(r,dnorm(r,.05,.1),type="l",)
lines(r,dnorm(r,.025,.05))

#9
qnorm(.01,.04,.09)*100000
qnorm(.05,.04,.09)*100000

#Question 10
100000*(exp(qnorm(.01,.04,.09))-1)
100000*(exp(qnorm(.05,.04,.09))-1)

#Question 11
R1=(41.29-38.23)/38.23
R2=(41.74-41.11)/41.11

#Question 12
log(1+R1)
log(1+R2)

#13
(41.29-38.23+.1)/38.23
(.1)/38.23

#Question 14
(1+R1)^12-1
log((1+R1)^12)

#16
.8*R1+.2*R2