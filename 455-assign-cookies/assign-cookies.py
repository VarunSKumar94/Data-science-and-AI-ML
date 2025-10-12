class Solution(object):
    def findContentChildren(self, g, s):
        """
        :type g: List[int]
        :type s: List[int]
        :rtype: int
        """
        g.sort()
        s.sort()
        i = j = 0

        while i < len(g) and j < len(s):
            if s[j] >= g[i]:   # cookie can satisfy this child
                i += 1         # move to next child
            j += 1             # move to next cookie
        return i
            