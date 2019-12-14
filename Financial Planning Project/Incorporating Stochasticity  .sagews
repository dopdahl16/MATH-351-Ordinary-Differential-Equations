#This function defines the stochastic euler method I employ to generate stochastic solution paths
def stochastic_euler(f,h,x0,y0,x_end):
    x=[x0]
    y=[y0]
    P=[[x0,y0]]
    sqrt_h = sqrt(h)
    T = RealDistribution('gaussian', sqrt_h)
    end_step=ceil((x_end-x0)/h)
    for i in range(end_step):
        ran = T.get_random_element()
        x.append(x[i]+h)
        y.append(y[i]+h*f(x[i],y[i])+0.15*y[i]*ran)
        P.append([x[i+1],y[i+1]])
    return(P)

x,y=var('x,y')
f(x,y)=(0.1*y+1200)
results = []
#This loop executes 10,000 times and generates 10,000 unique solution paths, saving the final value of each path. I use 1/24 as the step size because 1/12 was not representative enough for my model. Reducing the step size yeils more subtle changes in the market, leading to more precise results.
for i in range(10000):
    simulation = stochastic_euler(f,1/24,0,0,18)
    results.append(simulation[432])
tot = 0
for j in results:
    tot += j[1]
avg = tot / len(results)
print(avg)
results.sort()
vals = []
for i in results:
    vals.append(i[1])
#This is the 75th percentile of generated values for A(18)
results[7500]
#This is the 25th percentile of generated values for A(18)
results[2500]
#This is the median of generated values for A(18)
results[10000/2]
#Generates graph of values for A(18)
t = text('A(18)', (-1500, 1.75e5), color='black')
list_plot(vals, title='Sorted Stocastically Generated Values of A(18)') + t
#This code answers question 2 from Introducing Stochasticity. For values of M = [100,110,120,130,140,150], I use my stochastic Euler's method to generate 1000 possible solution paths for each value of M. I then find their value at the 20th percentile, which corresponds to 80% confidence.
differing_M_list_of_lists = []
for M in [1200,1320,1440,1560,1680,1800,1920]:
    g(x,y)=(0.1*y+M)
    variable_M_results = []
    #The reason that I use 1000 iterations and a step size of 1/12 here is partially due to the computational complexity that those numbers would afford, but it is also because I do not need the same level of preciseness in these estimates as I did in the previous part.
    for i in range(1000):
        simulation = stochastic_euler(g,1/12,0,0,18)
        variable_M_results.append(simulation[216])
    variable_M_results.sort()
    variable_M_plot=[]
    for i in variable_M_results:
        variable_M_plot.append(i[1])
#     list_plot(variable_M_plot)
    differing_M_list_of_lists.append(variable_M_plot)
print(len(differing_M_list_of_lists))
#This is the 20th percentile value of A(18) for M=100
print(differing_M_list_of_lists[0][200])
#This is the 20th percentile value of A(18) for M=110
print(differing_M_list_of_lists[1][200])
#This is the 20th percentile value of A(18) for M=120
print(differing_M_list_of_lists[2][200])
#This is the 20th percentile value of A(18) for M=130
print(differing_M_list_of_lists[3][200])
#This is the 20th percentile value of A(18) for M=140
print(differing_M_list_of_lists[4][200])
#This is the 20th percentile value of A(18) for M=150
print(differing_M_list_of_lists[5][200])
#This is the 20th percentile value of A(18) for M=160
print(differing_M_list_of_lists[6][200])









