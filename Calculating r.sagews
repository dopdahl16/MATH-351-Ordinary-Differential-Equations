︠c13c1d5a-8e8c-4321-b21c-76f8662645c3︠
# one_plus_r_values is the data pulled from the spreadsheet history.xlsx. The first value in the list is from 2018 and the last value is from 1926.
one_plus_r_values = [
0.9562,
1.2183,
1.1196,
1.0138,
1.1369,
1.3239,
1.16,
1.0211,
1.1506,
1.2646,
0.63,
1.0549,
1.1579,
1.0491,
1.1088,
1.2868,
0.779,
0.8811,
0.909,
1.2104,
1.2858,
1.3336,
1.2296,
1.3758,
1.0132,
1.1008,
1.0762,
1.3047,
0.969,
1.3169,
1.1661,
1.0525,
1.1867,
1.3173,
1.0627,
1.2256,
1.2155,
0.9509,
1.3242,
1.1844,
1.0656,
0.9282,
1.2384,
1.372,
0.7353,
0.8534,
1.1898,
1.1431,
1.0401,
0.915,
1.1106,
1.2398,
0.8994,
1.1245,
1.1648,
1.228,
0.9127,
1.2689,
1.0047,
1.1196,
1.4336,
0.8922,
1.0656,
1.3156,
1.5262,
0.9901,
1.1837,
1.2402,
1.3171,
1.1879,
1.055,
1.0571,
0.9193,
1.3644,
1.1975,
1.259,
1.2034,
0.8841,
0.9022,
0.9959,
1.3112,
0.6497,
1.3392,
1.4767,
0.9856,
1.5399,
0.9181,
0.5666,
0.751,
0.9158,
1.4361,
1.3749,
1.1162
]

low_index = 0
high_index = 18
avg_r_vals = []

#In this loop, we grab every contiguous set of 18 years that appears in our data set and take the geometric mean of those values. We append the geometric mean to the avg_r_vals list.
for i in range(len(one_plus_r_values)-18):
    product = 1
    for val in one_plus_r_values[low_index:high_index]:
        product *= val
    avg_r_vals.append(product**(1/18))
    low_index += 1
    high_index += 1

#This displays the calculated r+1 values as a sorted list and as a sorted graph.
avg_r_vals.sort()
print(avg_r_vals)
t = text('1+r', (-10, 1.1), color='black')
list_plot(avg_r_vals, title='Sorted Average Investment Growth Rates per 18 Year Period (1926-2018)') + t
print(len(avg_r_vals))
#This is the greatest historical value for r+1, which has a confidence of 1.35%
print(avg_r_vals[74])
#This is the value for r+1 which has a confidence of 25%
print((avg_r_vals[55]+avg_r_vals[56])/2)
#This is the median historical value for r+1, which has a confidence of 50%
print(avg_r_vals[37])
#This is the value for r+1 which has a confidence of 75%
print((avg_r_vals[18]+avg_r_vals[19])/2)
#This is the least historical value for r+1, which has a confidence of 98.65%
print(avg_r_vals[0])
#This is the average historical value for r+1
tot = 0
for g in avg_r_vals:
    tot += g
print(tot/75)









