︠73341f1b-c682-42e4-986c-0fbc9b61eba7︠
t,A=var('t,A')
r = 0.07776507665079
M=1200
p=2
f(t,A,M,p)=(-(M+(M*t*p))/r)+((M+(M*t*p))/(r*e^(-r*t)))
plota = plot(f(t,A,1200,0),(0,20))
plota.show(xmax=20,xmin=0,ymax=75000)
f(18)values_at_A18 = []
M = 1200
#This loop uses the equation above to calculate the deterministic case for each p value listed below
for p in [0.0,0.01,0.03,0.05,0.075,0.1]:
    result = 706.961477579041*M*p + 39.2756376432801*M
    print(p,result)









