# TODO: Add comment
# 
# Author: pawelc
###############################################################################
library(tseries)
library(PerformanceAnalytics)
library(zoo)
risky.assets=c("vpacx","vbltx","veiex")
tbills.mean=.0008
prices=data.frame()
dum = lapply(risky.assets, function(asset){
			prices.v = get.hist.quote(instrument=asset, start="2004-09-01",
					end="2009-09-30", quote="AdjClose",
					provider="yahoo", origin="1970-01-01",
					compression="m", retclass="zoo")
			index(prices.v) = as.yearmon(index(prices.v))	
			prices.v
		})

prices.vfinx = get.hist.quote(instrument="vfinx", start="2004-09-01",
		end="2009-09-30", quote="AdjClose",
		provider="yahoo", origin="1970-01-01",
		compression="m", retclass="zoo")
index(prices.vfinx) = as.yearmon(index(prices.vfinx))

prices = data.frame(do.call("cbind", dum)) 
colnames(prices) = risky.assets
returns = apply(prices,2,function(asset){
			diff(log(asset))	
		})

class(returns)

returns.vfinx = coredata(diff(log(prices.vfinx )))
colnames(returns.vfinx) = c("vfinx")
index(returns.vfinx ) = as.yearmon(index(returns))

means.v = apply(returns,2,mean)
sd.v = apply(returns,2,sd)
cov.matrix = var(returns)

#1
vpacx.mean=.0043
vpacx.mean.ann=vpacx.mean*12

#2
vpacx.sd=.0559
vpacx.sd.ann=vpacx.sd*sqrt(12)

#3
tbills.mean.ann=12*tbills.mean
vpacx.sharpe.ann=(vpacx.mean.ann-tbills.mean.ann)/vpacx.sd.ann

#4
vbltx.mean=.0049
vbltx.mean.ann=vbltx.mean*12

#5
vbltx.sd=.029
vbltx.sd.ann=vbltx.sd*sqrt(12)

#6
vbltx.sharpe.ann=(vbltx.mean.ann-tbills.mean.ann)/vbltx.sd.ann

#7
veiex.mean=.0128
veiex.mean.ann=veiex.mean*12

#8
veiex.sd=.0845
veiex.sd.ann=veiex.sd*sqrt(12)

#9
veiex.sharpe.ann=(veiex.mean.ann-tbills.mean.ann)/veiex.sd.ann

#10
source("week8/portfolio.r")
er=c(vpacx.mean,vpacx.mean,vpacx.mean)
names(er)=risky.assets
port.ret.1 = efficient.portfolio(means.v, cov.matrix, 0.01)

#11
tg.portfolio = tangency.portfolio(means.v, cov.matrix,tbills.mean)
names(tg.portfolio)
tg.w=(.01-tbills.mean)/(tg.portfolio$er-tbills.mean)

#12
eff.sd=tg.w*tg.portfolio$sd

#13
eff.w=tg.w*tg.portfolio$weights

#14
g.min.port=globalMin.portfolio(means.v, cov.matrix)
names(g.min.port)
w0=100e3
var.5=w0*(exp(qnorm(0.05,g.min.port$er,g.min.port$sd))-1)

#15
returns.with.vfinx = as.data.frame(cbind(returns,returns.vfinx))
vpacx.fit=lm(vpacx~vfinx, returns.with.vfinx)
summary(vpacx.fit)

#19
vbltx.fit=lm(vbltx~vfinx, returns.with.vfinx)
summary(vbltx.fit)

#23
veiex.fit=lm(veiex~vfinx, returns.with.vfinx)
summary(veiex.fit)
(1.5262-1)/0.1214