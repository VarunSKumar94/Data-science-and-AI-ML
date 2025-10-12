class Solution(object):
    def maximumGap(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        nums.sort()
        diff=0
        max_diff=0
        for i in range(len(nums)-1):
            diff=nums[i+1]-nums[i]
            max_diff=max(diff, max_diff)

        return max_diff