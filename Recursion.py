"""
Created on Fri Aug 23 14:29:30 2024

@author: Ambi, Demo code to show Recursion

"""

def factorialRecursive(n):
    if n ==1:
        return 1
    result=n*factorialRecursive(n-1)
    return result

def factorialIterate(n):
   result=1
   for i in range(1,n+1):
       result=result*i
   return result

answer1=factorialRecursive(5)
print(answer1)

answer2=factorialIterate(5)
print(answer2)