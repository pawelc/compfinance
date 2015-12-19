# TODO: Add comment
# 
# Author: pawelc
###############################################################################


library("PerformanceAnalytics")
library("mvtnorm")

PVFINXt0=105.06
PVEIEXt0=28.64
PVFINXt1=109.04
PVEIEXt1=29.49

RVFINX=(PVFINXt1-PVFINXt0)/PVFINXt0
RVEIEX=(PVEIEXt1-PVEIEXt0)/PVEIEXt0

rVFINX=log(1+RVFINX)
rVEIEX=log(1+RVEIEX)

RVFINX.an=(1+RVFINX)^12-1
RVEIEX.an=(1+RVEIEX)^12-1

rVFINX.an=12*rVFINX
rVEIEX.an=12*rVEIEX

i=10e3
fvVFINX=i*(1+RVFINX)^12
fvVEIEX=i*(1+RVEIEX)^12

VFINX.i=2e3
VEIEX.i=i-VFINX.i
wVFINX=VFINX.i/i
wVEIEX=VEIEX.i/i

R.p=wVFINX*RVFINX+wVEIEX*RVEIEX
r.p=log(1+R.p)

rVFINX.mu=0.001
rVFINX.sd=0.05
rVFINX.var=rVFINX.sd^2


rVEIEX.mu=0.01
rVEIEX.sd=0.09
rVEIEX.var=rVEIEX.sd^2

w0=100e3
var.05.VFINX=w0*(exp(qnorm(.05,rVFINX.mu,rVFINX.sd))-1)
var.05.VEIEX=w0*(exp(qnorm(.05,rVEIEX.mu,rVEIEX.sd))-1)


rVFINX.mu.an=12*rVFINX.mu
rVFINX.sd.an=sqrt(12)*rVFINX.sd
rVFINX.var.an=rVFINX.sd.an^2


rVEIEX.mu.an=12*rVEIEX.mu
rVEIEX.sd.an=sqrt(12)*rVEIEX.sd
rVEIEX.var.an=rVEIEX.sd.an^2

var.05.VFINX.an=w0*(exp(qnorm(.05,rVFINX.mu.an,rVFINX.sd.an))-1)
var.05.VEIEX.an=w0*(exp(qnorm(.05,rVEIEX.mu.an,rVEIEX.sd.an))-1)


mu=3/.55 
var=1.5^2/(1-.45^2)
cov=var*.45
