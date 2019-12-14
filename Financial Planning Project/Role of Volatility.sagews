︠6d28f28f-cf8a-42f1-8307-074b7f958f8c︠
#There isn't much to explain here that hasn't already been touched on in Incorporating Stochasticity.
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

x,y=var('x,y')
f(x,y)=(0.1*y+1200)
#This loop computes 2000 solution paths for each value of sigma and plots the results
for sig in [0,0.25,0.5,1]:
    results = []
    for i in range(2000):
        simulation = stochastic_euler(f,1/12,0,0,35,sig)
        results.append(simulation[420][1])
    tot = 0
    for j in results:
        tot += j
    avg = tot / len(results)
    med = results[1000]
    print("Sigma:", sig)
    print("Average", avg)
    print("Median value", med)
    results.sort()
    list_plot(results)









