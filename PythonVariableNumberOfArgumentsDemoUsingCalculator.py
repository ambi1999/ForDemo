#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug  5 19:51:07 2024

@author: ambi
"""

#Program written by Ambi to demonstrate: #1. positional arguments using * to take #variable number of arguments, and 
#2. keyword arguments using the **
def calculator(*numbers, **operation):
    results=list()
    for key,value in operation.items():
        if value=='add':
            result=0
            for num in numbers:
                result=result+num
            results.append(result)
        if value=='mul':
            result=1
            for num in numbers:
                result=result*num
            results.append(result)
    return results

res1=calculator(5,4,7,2,4,op1="add")
res2=calculator(5,4,7,2,4,op1="add",op2="mul")
res3=calculator(5,4,7,2,4,op1="mul",op2="add")
print(res1)
print(res2)
print(res3)
#Output is
#[22]
#[22, 1120]
#[1120, 22]