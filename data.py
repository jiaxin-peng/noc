#!/bin/python3

'''
This program is written to calculate the latency/power consumpsion for DDDAS NoC.
print (optTra_ep[0:4])
'''

'''
Notation: arr[65] is the pure electrical mesh.
'''

import matplotlib.pyplot as plt
import numpy as np

#figure configuration
barwidth = 0.35

#simulation setup
bmNum = 6

eleRtPower = 10
eleLinkPower = 20
eleHopCycle = 3

optHopCycle = 2
optBarPower = 3
optCrossPower = 2
optLinkPower = 5

#buffer_ep, optHop_ep, eleHop_ep, reconf_ep, optTra_ep = np.loadtxt('ep.csv', delimiter=',', usecols=(3, 4, 5, 7, 8), unpack=True)

#eleHop = np.array([[1, 2, 3, 4],
#          [5, 6, 7, 8],
#          [9, 10, 11, 12]
#         ])

eleHop_ep = np.array([1, 2, 3])
eleHop_sp = np.array([11, 12, 13])
eleHop_lu = np.array([21, 22, 23])
eleHop_mg = np.array([31, 32, 33])
eleHop_ft = np.array([41, 42, 43])
eleHop_cg = np.array([51, 52, 53])

eleHop=np.concatenate((eleHop_ep, eleHop_sp, eleHop_lu, eleHop_mg, eleHop_ft, eleHop_cg))
eleHop = eleHop.reshape((bmNum, eleHop_ep.size))

#power of electrical mesh (basic) calculation
power_eleMesh = eleHop*eleLinkPower + (eleHop-2)*eleRtPower
#print (power_eleMesh)

#power of express links calculation
#power_express
#print (power_express)

#latency

minPower = np.amin(power_eleMesh, axis=1)
minPowerIndex = np.argmin(power_eleMesh, axis=1) #used to find the configuration index
#print (minPower)

groupTester = np.array([1, 2, 3, 4, 5, 6])

# figure plot
fig, ax = plt.subplots()

ind = np.arange(bmNum)
width = barwidth
p1 = ax.bar(ind, minPower, width, color='r')
p2 = ax.bar(ind+width, groupTester*10, width, color='y')

plt.show()


