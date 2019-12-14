︠680477ab-9739-48fe-a53a-8548e701cce9︠
#This worksheet does almost the exact same thing that Incorporating Stocahsticity does, except that it does it three times, changing the value of sigma and r for each to reflect the type of fund.
def stochastic_euler(f,h,x0,y0,x_end,sigma):
    x=[x0]
    y=[y0]
    P=[[x0,y0]]
    sqrt_h = sqrt(h)
    T = RealDistribution('gaussian', sqrt_h)
    end_step=ceil((x_end-x0)/h)
    for i in range(end_step):
        ran = T.get_random_element()
        x.append(x[i]+h)
        y.append(y[i]+h*f(x[i],y[i])+sigma*y[i]*ran)
        P.append([x[i+1],y[i+1]])
    return(P)

#Fund 1: r=0.15, sigma=0.35
x,y=var('x,y')
f(x,y)=(0.15*y+1200)
results = []
for i in range(1000):
    simulation = stochastic_euler(f,1/24,0,0,18,0.35)
    results.append(simulation[432][1])
tot = 0
for j in results:
    tot += j
avg = tot / len(results)
med = results[500]
print("0.35:", avg, med)
results.sort()
list_plot(results)

print("_________________________________________________________________")
#Fund 2: r=0.1, sigma=0.15
x,y=var('x,y')
f(x,y)=(0.1*y+1200)
results = []
for i in range(1000):
    simulation = stochastic_euler(f,1/24,0,0,18,0.15)
    results.append(simulation[432][1])
tot = 0
for j in results:
    tot += j
avg = tot / len(results)
med = results[500]
print("0.15:", avg, med)
results.sort()
list_plot(results)

print("_________________________________________________________________")
#Fund 3: r=0.05, sigma=0.03
x,y=var('x,y')
f(x,y)=(0.05*y+1200)
results = []
for i in range(1000):
    simulation = stochastic_euler(f,1/24,0,0,18,0.03)
    results.append(simulation[432][1])
tot = 0
for j in results:
    tot += j
avg = tot / len(results)
med = results[500]
print("0.03:", avg, med)
results.sort()
list_plot(results)









