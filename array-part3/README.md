**Pascal's Triangle**

Problem Statement:
------------------

Write a program to generate Pascal's triangle. In Pascal’s triangle, each number is the sum of the two numbers directly above it as shown in the figure below:

	Input: N = 5, r = 5, c = 3 
	Output: Element at position (r, c): 6
	N-th row of Pascal’s triangle: 1 4 6 4 1
	First n rows of Pascal’s triangle:
	1 
	1 1 
	1 2 1 
	1 3 3 1 
	1 4 6 4 1  
	Explanation: Pascal triangle for first 5 rows is shown above.
	Input: N = 1, r = 1, c = 1
	Output: Element at position (r, c): 1
	N-th row of Pascal’s triangle: 1
	First n rows of Pascal’s triangle:
	1  
	Explanation: N = 1 is the base case fof a pascal's triangle.

	Intitution
	Note
	|  r-1
    |   C
    |    c-1 -> To find thre row
    Ex: r= 5 and c = 4 (5th row adn 4th column) 
       5-1         4      4*3*2
          C    =>   C  => ------- => Ans: 4
           4-1       3    1*2*3
    Element at position:
     1. Intialize n with r - 1
     2. Intialize k with c - 1
     3. intiaize the result = 1
     - Loop 0 to c with index
       - Multiply result with (n - index)
       - Divide the result with index + 1
     4. Fianlly return the result


***3 Sum : Find triplets that add up to a zero**
Problem Statement:
-----------------
 Given an array of N integers, your task is to find unique triplets that add up to give a sum of zero. In short, you need to return an array of all the unique triplets [arr[a], arr[b], arr[c]] such that i!=j, j!=k, k!=i, and their sum is equal to zero.
 Example 1:
Input:
 nums = [-1,0,1,2,-1,-4]
Output:
 [[-1,-1,2],[-1,0,1]]
Explanation:
 Out of all possible unique triplets possible, [-1,-1,2] and [-1,0,1] satisfy the condition of summing up to zero with i!=j!=k


 Intitution:
  First sort the array, since it is  sum, we i ,j,k variable -> sum with al thre if greter than decrement k if < 0 increment j idf  matches 0 then j++ and k-- and sorte the array and then continue till k > j
  - Sort the ary ascending
  - Intialize output = []
  - Loop 0 to ary.size with index,ele
    - if output.last[0] is not equal to ele
    - iniatlize j = index +1 and k = ary.size
    - While loop j < K
      - If sum of ary[i],ary[j],ary[k] < 0
        then j++
      - If sum of ary[i],ary[j],ary[k] > 0
         then k--
      - If sum of ary[i],ary[j],ary[k] == 0
          Push triplet to output
          - Increment j++ and decrement k--
    - increment i++
   - Print result
   Time Complexity: O(NlogN)+O(N2), as The pointer i, is running for approximately N times. And both the pointers j and k combined can run for approximately N times including the operation of skipping duplicates. So the total time complexity will be O(N2). Space Complexity: O(no. of quadruplets), This space is only used to store the answer. We are not using any extra space to solve this problem. So, from that perspective, space complexity can be written as O(1).

**Length of the longest subarray with zero Sum**

Problem Statement: 
-----------------

Given an array containing both positive and negative integers, we have to find the length of the longest subarray with the sum of all elements equal to zero.
Example 1:
Input:
 N = 6, array[] = {9, -3, 3, -1, 6, -5}  
Result:
 5  
Explanation:
 The following subarrays sum to zero:
- {-3, 3}
- {-1, 6, -5}
- {-3, 3, -1, 6, -5}
The length of the longest subarray with sum zero is 5.

Example 2:
Input:
 N = 8, array[] = {6, -2, 2, -8, 1, 7, 4, -10}  
Result:
 8  
Explanation:
 Subarrays with sum zero:
- {-2, 2}
- {-8, 1, 7}
- {-2, 2, -8, 1, 7}
- {6, -2, 2, -8, 1, 7, 4, -10}
The length of the longest subarray with sum zero is 8.

### Algorithm(using prefix sum)

#### Intitition:
    - Calculate the prefix sum if it is equal to 0 calcluatie max else
    - check if prefix sum is matches with hash,if yest  caluclate maximun of max
    - Else storet the hash of prefix Sum
 - Intialize the prefix_sum = 0, max_len = 0, hash ={}
 - Loop 0 to ary.size with ele,index
   - Add ele to prefix_sum
   - Chek prefix_sum is equal to zero
     - Calcualte maxi with index + 1

   - Else check if prefix_sum is present in hash
     - If yes, take hash with index, Subtract prefix_sum - hash with index
     - Resulta can be storeed in max with find max
   - Else 
     - Store the hash with index
Time Complexity: O(n), where n is the length of the string. This is because we are using a single pass through the string with two pointers, leading to linear time complexity.
Space Complexity: O(1), as we are using a fixed-size hash array of size 256 (for ASCII characters) and not using any additional data structures that grow with input size.

**Merge Overlapping Sub-intervals**

Problem Statement: 
------------------

Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals and return an array of the non-overlapping intervals that cover all the intervals in the input.
Ex:
Input : intervals=[[1,3],[2,6],[8,10],[15,18]]
Output : [[1,6],[8,10],[15,18]]
Explanation : Since intervals [1,3] and [2,6] are overlapping we can merge them to form [1,6] intervals.
Input : [[1,4],[4,5]]
Output :  [[1,5]]
Explanation :  Since intervals [1,4] and [4,5] are overlapping we can merge them to form [1,5].

### Algorithm (using sort ans pointer)
## Intituation
     sort the intervals, so that any overlapping intervals will come one after the other. This way, we only need to compare each interval with the last one added to our answer. If they overlap, we merge them. If they don’t, we simply add the current interval as a new entry.
     -  Sort intervals based on starting time
     -  Array to store final merged interval merged = [];
     - store thr merged with ary.first
     - Loop from 1 to ary.size with ele, index
       - if merged.last[1] is greater than ele[0]
          - push the resultant with [ele[0], merged.last[1] ]
        - else
           -  push the ele
    Time Complexity: O(N*logN) + O(N), we sort the entire array and then merge them in a single pass.
    Space Complexity: ON), additonal space used to store the non-overlapping intervals.


**Merge two Sorted Arrays Without Extra Space**
Problem Statement: 
------------------
  Given two sorted integer arrays nums1 and nums2, merge both the arrays into a single array sorted in non-decreasing order.
  The final sorted array should be stored inside the array nums1 and it should be done in-place.
  Array nums1 has a length of m + n, where the first m elements denote the elements of nums1 and rest are 0s whereas nums2 has a length of n.

  Input : nums1 = [-5, -2, 4, 5, 0, 0, 0], nums2 = [-3, 1, 8]
  Output : [-5, -3, -2, 1, 4, 5, 8]
  Explanation : The merged array is: [-5, -3, -2, 1, 4, 5, 8], where [-5, -2, 4, 5] are from nums1 and [-3, 1, 8] are from nums2
  Input : nums1 = [0, 2, 7, 8, 0, 0, 0], nums2 = [-7, -3, -1]
  Output :  [-7, -3, -1, 0, 2, 7, 8]
  Explanation :  The merged array is: [-7, -3, -1, 0, 2, 7, 8], where [0, 2, 7, 8] are from nums1 and [-7, -3, -1] are from nums2

### Intitution
 Since it is sorted array intialize left with num1.last and right as nums2 of 0. we can compare the both value if left is less than increment left and left is greater than right , swap left with right and nincrement the right, and finall sort the nums1 and nums2 and mrge it
 - if nums1 has filled zerr, we need to slice it
 - Intialize left = nums1.length -1
 - Intailize right = 0
 - Loop left >=0 amd right < nums2.lengt
   - Check of aray of left is greter than ary of right
     - Swap left and right

     - Increment rigle
   - Else
     - increment left
- Finally sort hthe nums1 and nums 2
- Merge it

**Find the repeating and missing numbers**

First, calculate the sum of all elements in the given array, denoted as S, and the sum of natural numbers from 1 to N, denoted as Sn. The formula for Sn is (N * (N + 1)) / 2.
Now calculate S - Sn. This gives us X - Y, where X is the repeating number and Y is the missing number.
Next, calculate the sum of squares of all elements in the array, denoted as S2, and the sum of squares of the first N numbers, denoted as S2n. The formula for S2n is (N * (N + 1) * (2N + 1)) / 6.
Now calculate S2 - S2n. This gives us X2 - Y2.
From the equations S - Sn = X - Y and S2 - S2n = X2 - Y2, we can compute X + Y by the formula (S2 - S2n) / (S - Sn).
Using the values of X + Y and X - Y, we can solve for X and Y through simple addition and subtraction.
Finally, return the values of X (the repeating number) and Y (the missing number).