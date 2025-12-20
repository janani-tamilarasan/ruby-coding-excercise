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


  BETTER APPROACH => Algorithm 1:(USING DUTCH N ATIONAL ALGORITHM)

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

   - OPTIMAL APPROACH =>  Algorithm(BOYER–MOORE MAJORITY VOTE ALGORITHM)


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


**Kadane's Algorithm : Maximum Subarray Sum in an Array**

  Problem Statement: 
  -----------------

   Given an integer array nums, find the subarray with the largest sum and return the sum of the elements present in that subarray.A subarray is a contiguous non-empty sequence of elements within an array.
	Example 1:

	INPUT:
	 nums = [-2, -3, -7, -2, -10, -4]  
	OUTPUT:
	 15  
	Explanation:
	 The subarray from index 0 to index 4 has the largest sum = 15, which is the maximum sum of any contiguous subarray.


  OPTIMAL APPROACH =>  Algorithm(Kadane's Algorithm)

	 Intition 
	   Add the sum of each element. if it is greater than max then update max if sum is less than 0 then update sum = 0. ie) if we have negative numer, when you add up each element wil leads to negative number.
	     - Intialize max = -Infinity and sum  = 0
	     - Loop to 0 to ary.size wtith ele
	       - Add sum with ele
	       - If sum is greater than max
	         - Update the max with sum
	       - If sum is greater than 0
	          - Update sum to 0
	       Time Complexity: O(n), where n is the number of elements in the array. We traverse the array only once.
	       Space Complexity: O(1). We use a constant amount of space for variables.
	FOLLOW_UP -> If you want to display the subarray index
	 - used Kadane’s algorithm and tracked start and end indices by resetting the start whenever the running sum became negative

**Stock Buy And Sell**


  Problem Statement: 
  -----------------

    You are given an array of prices where prices[i] is the price of a given stock on an ith day. You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock. Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
    INPUT: prices = [7,1,5,3,6,4]
	OUTPUT: 5
	Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
	Note: That buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.

	INPUT: prices = [7,6,4,3,1]
	OUTPUT: 0
	Explanation: In this case, no transactions are done and the max profit = 0.

	OPTIMAL APPROACH =>  Algorithm(Min and max)

	 Intution:
	   The idea is to track the minimum price so far while traversing the array and calculate the profit if we sold today. This way, we can constantly update the maximum profit without using nested loops. We’re basically simulating
	    - Initialize a variable min = Infinity , cost = first value of ary and max_profit = 0
	    - Loop to 0 to prices wih index
	      - Find the cost by prices[index] - min
	      - Find the max of cost by comparing cost , with actual max
	      - Update the min with current_element
	      Time Complexity: O(n),This is because we are iterating through the array of prices exactly once. There are no nested loops or recursive calls.
	      Space Complexity: O(1),Only two variables are used to store the minimum price and maximum profit, regardless of the input size. 

 --

**Rearrange Array Elements by Sign**

   Problem Statement: Vairant 1 (Equal number of positives and negatives)
   ----------------------------

   There’s an array ‘A’ of size ‘N’ with an equal number of positive and negative elements. Without altering the relative order of positive and negative elements, you must return an array of alternately positive and negative values.

   INPUT: [3,1,-2,-5,2,-4]
   OUTPUT: [3,-2,1,-5,2,-4]

   Algorithm:

	 Intution:
	   By observing the output, we assume even index (0,2,4) holds a positive number and odd index(1,3,5) holds for negative number. Create a new array and maintain two variables posIndex= 0 negIndex= 1. Check each elemnt is odd then assign to new array and increase posIndex by 2. also ifis even then assign to new array and increase negIndex by 2
	   - Intialize posIndex = 0 and negIndex = 1 and result  = []
	   - Loop 0 to arr.size with el
	     - If el is  positive
	       - Assing result of posIndex with el
	       - Increment posIndex by 2
	    - Else(el is negative)
	       - Assing result of negIndex with el
	       - Increment negIndex by 2	  
	    - Finally Return result
	    Time Complexity: O(N) { O(N) for traversing the array once and substituting positives and negatives simultaneously using pointers, where N = size of the array A}.
	    Space Complexity: O(N) { Extra Space used to store the rearranged elements separately in an array, where N = size of array A}  


--

**next_permutation : find next lexicographically greater permutation**

	Problem Statement: 
	------------------
	Given an array Arr[] of integers, rearrange the numbers of the given array into the lexicographically next greater permutation of numbers.
	If such an arrangement is not possible, it must rearrange to the lowest possible order (i.e., sorted in ascending order).
    INPUT = 2154300
    OUTPUT = 2300341

	OPTIMAL APPROACH =>  Algorithm(Next Permutation)

    Intution:
    find the first decreasing element from the right, swap it with the next greater element on the right, and reverse the suffix to get the next permutation in O(n).
      - Find the breakpoint
        - Scan from right to left and find the first index i such that:
        arr[i] < arr[i + 1]
        If no such index exists → array is in descending order.
        reverse entire array and return.
      -  Find the next larger element (from right)
	     From the right side, find the smallest element > arr[i] Swap it with arr[i].
      - Reverse the right part
        rom the right side, find the smallest element > arr[i]Swap it with arr[i].
        Time Complexity: O(N), we find the breaking point and reverse the subarray in linear time.
        Space Complexity: O(1), constant additional space is used.

**Leaders in an Array**

	Example 1:
	INPUT: arr = [10, 22, 12, 3, 0, 6]    
	OUTPUT: 6,12,22  
	Explanation:
	 The rightmost element (0) is always a leader.  
	7 and 1 are greater than the elements to their right, making them leaders as well.
     
	OPTIMAL APPROACH =>  Algorithm(Using reverse travelsal)
	Intution:
	  Interate the reverse and update the max if current element is gretaerh than max
	   - Intialize max = 0 and result = []
	   - Loop ary.size to 0 with el
	     - Compare el with max if greater than max
	       - Update max
	       - Push the result into el
	   - Fianlly Return the result
   

**Longest Consecutive Sequence in an Array**

Problem Statement: Given an array nums of n integers.

Return the length of the longest sequence of consecutive integers. The integers in this sequence can appear in any order.
INPUT: nums = [0, 3, 7, 2, 5, 8, 4, 6, 0, 1]  
OUTPUT: 9  
Explanation:
 The longest sequence of consecutive elements in the array is [0, 1, 2, 3, 4, 5, 6, 7, 8], which has a length of 9.

	 BETTER_APPROACH ->(using current Algorithm)
	   Intution
	     Sort the array and compare with currentCount having currentCount -1 if it is there increase the count or else reset count is 0 and update the currentElemet
	     - sort the given array
	     - Intialize lastSmaller = 0, maxLongest = 1 and count = 0
	     - Each Loop arr with each do with el
	       - if lastSmaller is equal to el - 1
	           - Increment the count
	           - Assign lastSmaller is equal to el
	       - Else
	           - Update maxLongest = [maxLongest,count].max()
	           - Reset counter to 0
	           Time Complexity: O(n log n), where n is the number of elements in the array. This is due to the sorting step, which is the most time-consuming operation in this approach.
	           Space Complexity: O(1), as we are using only a constant amount of extra space.

    OPTIMAL APPROACH ->(using HASH compare)
     Intution
       Store all values into the hash and check with each element with elemeent + 1 is present if it there increment the count or else find the maxLongest with count and reset to 0.
        - Intialize  maxLongest = 1 and count = 0
        - Store all the hash
        - Loop 0 to ary.sze with el
          - Check if el + 1 is present in hash
            - If yes, Increment the count
            - Else Find the max of maxLongest with count , count = 1
        - Finally return maxLongest
	        Time Complexity: O(n), where n is the number of elements in the array. This is because we traverse each element once to build the set and then again to find the longest consecutive sequence.
	        Space Complexity: O(n), as we use a set to store the unique elements of the array, which in the worst case can be equal to the size of the input array.
  
**Count Subarray sum Equals K**

Problem Statement: 
Given an array of integers and an integer k, return the total number of subarrays whose sum equals k. A subarray is a contiguous non-empty sequence of elements within an array.
EX:
Input : N = 4, array[] = {3, 1, 2, 4}, k = 6
Output: 2
Explanation: The subarrays that sum up to 6 are [3, 1, 2] and [2, 4].

Input: N = 3, array[] = {1,2,3}, k = 3
Output: 2
Explanation: The subarrays that sum up to 3 are [1, 2], and [3]

### NOTE
  | prefix_sum += ele        |
  | remove = prefix_sum - k  |


  Intitiation
    - Adding the each element to prefix_sum , find remove using prefix_sum - k , check if remove is present in the hash,if its there get the value and add it count else store element into hash with value by deffault
    NOT: Alwy store hash {0:1 }as default
	Algorithm(Using prefixSum)
	 - Intailize the prefix_sum = 0 , count = 0 
	 - Intailizehash {0:1 }as default
	 - Loop 0 to ary.size with ele
	   - Add ele to prezix sum
	   - Find remove using prefix_sum - k
s	      - Get the values and add with count
	   - Update the hash with prefix_sum
	   Time Complexity: O(n) We traverse the array once, where n is the size of the array. Each prefix sum operation and hashmap lookup is O(1) on average.
	   Space Complexity: O(n) In the worst case, all prefix sums are distinct and stored in the hashmap, so space grows linearly with input size. 