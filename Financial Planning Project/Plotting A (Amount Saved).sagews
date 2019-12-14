#50% confidence value for r+1
t,A=var('t,A')
r = 1.10954510118909 - 1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)
#1.35% confidence value for r+1
t,A=var('t,A')
r = 1.18525750332828 - 1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)
#25% confidence value for r+1
t,A=var('t,A')
r = 1.14031900582799 - 1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)
#75% confidence value for r+1
t,A=var('t,A')
r = 1.07776507665079 - 1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)
#98.65% confidence value for r+1
t,A=var('t,A')
r = 1.02833854264591 - 1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)
# Average value for r+1
t,A=var('t,A')
r = 1.10848542403483 - 1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)
#Comparison for Stochasity
t,A=var('t,A')
r = 0.1
f(t,A)=(-1200/r)+(1200/(r*e^(-r*t)))
plota = plot(f(t,A),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)









