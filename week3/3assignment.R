library("mvtnorm")
ux=.05
uy=.025
stdx=.1
stdy=.05
corxy=.9
covxy=corxy*stdx*stdy
sigMat=matrix(c(stdx^2,covxy,covxy,stdy^2),nrow=2)
#(a) Using R package mvtnorm function rmvnorm(), simulate 100 observations from the bivariate distribution with corXY=0.9. 
#Using the plot() function create a scatterplot of the observations and comment on the direction and strength of the linear association. 
# Using the function pmvnorm(), compute the joint probability Pr(X ² 0,Y ² 0).

obs=rmvnorm(100,mean=c(ux,uy),sigma=sigMat)
plot(obs)
pmvnorm(upper=c(0,0),mean=c(ux,uy),sigma=sigMat)

#(b) Using R package mvtnorm function rmvnorm(), simulate 100 observations from the bivariate distribution with corXY=-0.9
#Using the plot() function create a scatterplot of the observations and comment on the direction and strength of the linear association. 
#Using the function pmvnorm(), compute the joint probability Pr(X ²0,Y ²0).
corxy=-.9
covxy=corxy*stdx*stdy
sigMat=matrix(c(stdx^2,covxy,covxy,stdy^2),nrow=2)
obs=rmvnorm(100,mean=c(ux,uy),sigma=sigMat)
plot(obs)
pmvnorm(upper=c(0,0),mean=c(ux,uy),sigma=sigMat)

#(c) Using R package mvtnorm function rmvnorm(), simulate 100 observations from the bivariate distribution with corXY=0. 
#Using the plot() function create a scatterplot of the observations and comment on the direction and strength of the linear association. 
#Using the function pmvnorm(), compute the joint probability Pr(X ² 0,Y ² 0).
corxy=0
covxy=corxy*stdx*stdy
sigMat=matrix(c(stdx^2,covxy,covxy,stdy^2),nrow=2)
obs=rmvnorm(100,mean=c(ux,uy),sigma=sigMat)
plot(obs)
pmvnorm(upper=c(0,0),mean=c(ux,uy),sigma=sigMat)