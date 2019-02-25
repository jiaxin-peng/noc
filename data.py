#!/bin/python3

'''
This program is written to calculate the power consumpsion for DDDAS NoC.
'''

import matplotlib as plt
import numpy as np


buffer_ep, optHop_ep, eleHop_ep, reconf_ep, optTra_ep = np.loadtxt('ep.csv', delimiter=',', usecols=(3, 4, 5, 7, 8), unpack=True)

print (buffer_ep[0:4])
print (optHop_ep[0:4])
print (eleHop_ep[0:4])
print (reconf_ep[0:4])
print (optTra_ep[0:4])




