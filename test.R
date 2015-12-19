library("zoo")
install.packages("zoo")
library("PerformanceAnalytics")

pvar<-function(w){
	w^2*3+(1-w)^2*2.5+2*w*(1-w)*.9
}