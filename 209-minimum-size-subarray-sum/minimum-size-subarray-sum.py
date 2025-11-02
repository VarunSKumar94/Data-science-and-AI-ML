class Solution(object):
    def minSubArrayLen(self, target, nums):
        """
        :type target: int
        :type nums: List[int]
        :rtype: int
        """
        # Initialize the minimum length to a value larger than any possible length (e.g., n + 1 or infinity)
        min_len = float('inf')
        
        # 'left' pointer for the start of the sliding window
        left = 0
        
        # 'current_sum' to track the sum of the elements in the window nums[left:right]
        current_sum = 0
        
        # 'right' pointer iterates through the array, expanding the window
        for right in range(len(nums)):
            # 1. Expand the window to the right and update the sum
            current_sum += nums[right]
            
            # 2. Check if the current window sum meets the target.
            # While the condition is met, we try to shrink the window from the left
            # to find the *smallest* valid subarray.
            while current_sum >= target:
                # Update the minimum length found so far
                current_len = right - left + 1
                min_len = min(min_len, current_len)
                # print(min_len)
                # Shrink the window from the left and update the sum
                current_sum -= nums[left]
                left += 1
                
        # If min_len is still infinity, it means no valid subarray was found, so return 0.
        # Otherwise, return the smallest length found.
        return min_len if min_len != float('inf') else 0