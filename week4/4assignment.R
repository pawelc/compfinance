A=matrix(c(1,4,7,2,4,8,6,1,3),byrow = T,nrow = 3)
B=matrix(c(4,4,0,5,9,1,2,2,5),byrow = T,nrow = 3)
x=matrix(c(1,2,3))
y=matrix(c(5,2,7))

t(A)
t(B)
t(x)
t(y)
A+B

b=matrix(c(1,2))
A=matrix(c(1,1,2,4),byrow = T, nrow = 2)
z=solve(A)%*%b

u=matrix(c(.01,.04,.02))
sigma=matrix(c(.1,.3,.1,.3,.15,-.2,.1,-.2,.08),byrow = T,nrow = 3)
x=matrix(rep(1/3,3))
t(x)%*%u