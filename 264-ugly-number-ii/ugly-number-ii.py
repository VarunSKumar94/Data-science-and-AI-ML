class Solution(object):
    def nthUglyNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        import numpy as np
        
        ugly = np.zeros(n)
        ugly[0]=1
        p2=0
        p3=0
        p5=0
        i=0
        while i<(n-1):
            i+=1
            next_multiple_2=ugly[p2]*2
            next_multiple_3=ugly[p3]*3
            next_multiple_5=ugly[p5]*5
            
            next_ugly=min([next_multiple_2, next_multiple_3, next_multiple_5])
            
            ugly[i] = next_ugly
            if next_ugly==next_multiple_2:
                p2+=1
            if next_ugly==next_multiple_3:
                p3+=1
            if next_ugly==next_multiple_5:
                p5+=1
        return int(ugly[n-1])    