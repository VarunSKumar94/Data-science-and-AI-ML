class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: int
        """
        list_s=sorted([a for a in s])

        left = []
        right = []
        middle = None
        i = 0
        n = len(list_s)

        while i < n - 1:
            if list_s[i] == list_s[i+1]:
                left.append(list_s[i])      # add one to left
                right.append(list_s[i+1])   # add one to right
                i += 2
            else:
                middle = list_s[i]
                i += 1

        # handle leftover element
        if i == n - 1 and middle is None:
            middle = list_s[i]
        # Combine greedily
        pal = left + ([middle] if middle else []) + right[::-1]
        if len(list_s)>1:
            return len(pal)
        else:
            return 1
