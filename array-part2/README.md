**Two Sum : indicies of  pairs with given sum exists in Array**

 Problem Statement:
 -----------------

Given an array of integers arr[] and an integer target.
Return indicies of the two numbers such that their sum is equal to the target. Otherwise, we will return {-1, -1}.


	INPUT: N = 5, arr[] = {2,6,5,8,11}, target = 14
	OUTPUT: [1,3] => arr[1] with 6 + arr[3] with 8 = 14.

  BETTER APPROACH => Algorithm 1:(USING HASHING)

     Intitution
	    Check the target - each element in hash if it is found means will return the pairs

		   - Intialize the hash
		   - Loop 0 to arr.size with ele,index
		     - Subtract target with ele and assign to needed_ele 
		     - If Found return [index,needed_ele.index]
		     - Else then hash[ele] = index
		   - Fianlly return [-1,-1]    
		Time Complexity: O(N) 
		Space Complexity: O(N) 

  OPTIMAL APPROACH => Algorithm 2:(SORTING + TWO POINTER)

       Intitution
	     Sort the given arrray and intializer left as l pointer an right as r pointer check if sum of ary[l] and ary[r] is greater than target and then decrement r and if less than increment l. continue until it matches.
		   - Create array of [value, originalIndex] pairs to keep track of original positions
		   - Sort the given array 
		   - Intialize l = 0 and r= ary.length
		   - While loop l < r
		     - Compare target wtih ary[l] + ary[r]
		     - If it is equal to with target
		        - return [l,r]
		     - If it is greater than target
		       - decrement r
		     - Else 
		       - Increment l
		   - Fianlly return [-1,-1] 
		   Time Complexity: O(N log N) due to sorting the array initially, where N is the number of  elements. The two-pointer traversal runs in O(N).
		   Space Complexity: O(N) because we store the array elements along with their original indices in a separate list or vector for sorting, maintaining original positions.


**Sort an array of 0s, 1s and 2s**

Problem Statement: 
------------------

Given an array nums consisting of only 0, 1, or 2. Sort the array in non-decreasing order. The sorting must be done in-place, without making a copy of the original array.

	Input: nums = [1, 0, 2, 1, 0]
	Output: [0, 0, 1, 1, 2]
	Explanation: The nums array in sorted order has 2 zeroes, 2 ones and 1 two
	Input: nums = [0, 0, 1, 1, 1]
	Output: [0, 0, 1, 1, 1]
	Explanation: The nums array in sorted order has 2 zeroes, 3 ones and zero twos.


  BETTER APPROACH => Algorithm 1:(USING Counters)

	  - Intution:
	    Since the array contains only 0s, 1s, and 2s, we can exploit this limited range of values to count how many of each element exists. Once we know how many 0s, 1s, and 2s are in the array, we can simply overwrite the original array by placing that many 0s, then 1s, and then 2s in order. This approach avoids sorting and gives a linear-time, constant-space solution.
	      - Initialize three counters to zero: one each for 0s, 1s, and 2s.
	      - Traverse the entire array and increment the respective counter based on the element value.
	      - Loop to freq_array with index and value
	      - After counting, overwrite the array:
		    - Place all 0s first (based on count of 0s).
		    - Then all 1s (based on count of 1s).
		    - Then all 2s (based on count of 2s).
	    Time Complexity:,O(n) We make two passes through the array: one for counting and one for updating. So the total time is proportional to the size of the array.
	    Space Complexity:O(1),Only three integer variables (cnt0, cnt1, cnt2) are used for counting. No extra space is used proportional to the input size.

   OPTIMAL APPROACH => Algorithm 2:(Three Pointers)

   	  - Intution:
	     Three pointer low_index, mid_index and high_index where low_index can handle 0s, mid_index can handle 1s and high_index can handle 2s.
	     If ary of mid_index is 1 -> just forward to next mid_index. 
	     If ary of mid_index is 0, then swap low_index to mid_index, increment low_index 
	     if ary of mid_index is 2 -> then swap mid_index to high_index and decrement high_index. 
	     contine the low until mid is greater than high
	       - Intialize low_index = 0, mid_index = 0 and high_index = ary.length - 1
	       - Loop if mid_index is less than high_index
	          -  If ary of mid_index is 1 
	             - Increment mid_index
	          - If ary of mid_index is 0
	              - swap low_index to mid_index,
	              - increment mid_index
	              - increment low_index
	          - If ary of mid_index is 2
	              - swap high_index to mid_index,
	              - decrement high_index	 
	        - Return ary             

**Find the Majority Element that occurs more than N/2 times**

  Problem Statement: 
  -----------------

	Given an integer array nums of size n, return the majority element of the array.
	The majority element of an array is an element that appears more than n/2 times in the array. The array is guaranteed to have a majority element.
	Input:
	 nums = [7, 0, 0, 1, 7, 7, 2, 7, 7]  
	Output:
	 7  
	Explanation:
	 The number 7 appears 5 times in the 9-sized array, making it the most frequent element.

   - Algorithm(Using Counter )


	- Intitution:
	    Use count and current element, EAch time compare current_ele with ary[i], if it this ther increase the count or decerement count and re-assign the ary[i] with current variable with 1
	    - Intialize count = 0 and current_ele with first value of ary
	    - Loop 0 to ary.length with el
	      - if el matches with current element
	         - Increment the count
	      - Else
	         - Decrement the count
	         - If count is zero
	           - Then assign  current_ele with el and make count  = 1
	    - Fianlly return current_element
	    Time Complexity: O(N), where N is the size of the input array. This is because we are iterating through the array once to find the potential majority element and then again to verify it.
        Space Complexity: O(1), as we are using only a constant amount of extra space.