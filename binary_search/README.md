**Finding Sqrt of a number using Binary Search**
Problem Statement: 
You are given a positive integer n. Your task is to find and return its square root. If ‘n’ is not a perfect square, then return the floor value of sqrt(n).
	Input: N = 36
	Output: 6
	Explanation: Square root of 36 is 6. 
	Input: N = 28
	Output: 5
	Explanation: Square root of 28 is approximately 5.292. So, the floor value will be 5.

### Alogorithm(using Binary search)
	Intitution:
	 The naive method tries every number, which is slow when n is large. But our possible answer space (from 1 to n) is sorted, meaning if a certain number squared is less than or equal to n, then all smaller numbers will also work. This allows us to apply Binary Search on the answer space to efficiently find the largest number whose square is less than or equal to n.

	  - Intialize with low as 1, high as n/2 
	  - ans = 0
	  - Loop low < = mid
	    - If mid ** mid is less than and equal to given n
	      - Store ans = mid
	      - low = mid + 1
	    else
	      - high = mid - 1
	  - Fnially Return ans
	  Time Complexity: O(log(N)), we apply binary search on our search space to reduce it into half at every step.
	  Space Complexity: O(1), since the algorithm does not use any additional space or data structures.

**Koko Eating Bananas**
Problem Statement: 
A monkey Koko is given ‘n’ piles of bananas, whereas the 'ith' pile has ‘a[i]’ bananas. An integer ‘h’ is also given, which denotes the time (in hours) for all the bananas to be eaten.

Each hour, the monkey chooses a non-empty pile of bananas and eats ‘k’ bananas. If the pile contains less than ‘k’ bananas, then the monkey consumes all the bananas and won’t eat any more bananas in that hour.

Find the minimum number of bananas ‘k’ to eat per hour so that the monkey can eat all the bananas within ‘h’ hours.
Input: N = 4, a[] = {7, 15, 6, 3}, h = 8
Output: 5
Explanation:  If Koko eats 5 bananas/hr, he will take 2, 3, 2, and 1 hour to eat the piles accordingly. So, he will take 8 hours to complete all the piles.

### Algortith 
Intitution:
The naive method checks every speed, which is slow if the piles are large. But the possible answer space (from 1 to the maximum pile size) is sorted, meaning if a certain speed works, then all higher speeds will also work. This allows us to apply Binary Search on the answer space to efficiently find the minimum speed at which Koko can finish the bananas within the given hours.
 - First, identify the largest pile size since the eating speed cannot be more than that.
 - Set the search range with the lowest speed as 1 and the highest speed as the maximum pile size.
 - Use binary search within this range to check possible speeds.
 - At each step, take the middle value as the current speed and calculate how many hours it would take to finish all piles at this speed.
 - If the total hours are less than or equal to the allowed hours, this speed is a candidate, so try to see if a smaller speed also works by moving left.
 - If the total hours exceed the allowed hours, then the speed is too slow, so move right to try higher speeds.
 - Continue this process until the range closes, and the smallest valid speed found will be the answer.
 Time Complexity: O(N*log(max(a[]))), we apply binary search on our search space to reduce it into half at every step.
Space Complexity: O(1), since the algorithm does not use any additional space or data structures.


**Minimum days to make M bouquets**

Problem Statement: 
You are given 'N’ roses and you are also given an array 'arr' where 'arr[i]' denotes that the 'ith' rose will bloom on the 'arr[i]th' day. You can only pick already bloomed roses that are adjacent to make a bouquet. You are also told that you require exactly 'k' adjacent bloomed roses to make a single bouquet. Find the minimum number of days required to make at least ‘m' bouquets each containing 'k' roses. Return -1 if it is not possible.
Example 1:
Input Format: N = 8, arr[] = {7, 7, 7, 7, 13, 11, 12, 7}, m = 2, k = 3
Result: 12
Explanation: On the 12th the first 4 flowers and the last 3 flowers would have already bloomed. So, we can easily make 2 bouquets, one with the first 3 and another with the last 3 flowers.

Example 2:
Input Format: N = 5, arr[] = {1, 10, 3, 10, 2}, m = 3, k = 2
Result: -1
Explanation: If we want to make 3 bouquets of 2 flowers each, we need at least 6 flowers. But we are given only 5 flowers, so, we cannot make the bouquets.

Algorithm:
 - Find thre range of low and high and ans
 -  Binary search between low and high
    - Find the mid
      - Check for possibe?
        - Push to ans 
         - high = mid - 1
      - else
         - low = mid +1
  - Return ans

  - possibe -> arguments(mid,ary,m,k)
    - Iterate each array and check if it less tahn mid then increment the count and check if matches the count incraetse the branche esle count 0
    finally check if branchett >=0
    Time Complexity: O(1) O(log(max(arr[])-min(arr[])+1) * N), where {max(arr[]) -> maximum element of the array, min(arr[]) -> minimum element of the array, N = size of the array}.

    Space Complexity : O(h)O(1) as we are not using any extra space to solve this problem.


    **Find the Smallest Divisor Given a Threshold**

    Problem Statement: 
    -----------------
    You are given an array of integers 'arr' and an integer i.e. a threshold value 'limit'. Your task is to find the smallest positive integer divisor, such that upon dividing all the elements of the given array by it, the sum of the division's result is less than or equal to the given threshold value.
    Example 1:
	Input Format: N = 5, arr[] = {1,2,3,4,5}, limit = 8
	Result: 3
	Explanation: We can get a sum of 15(1 + 2 + 3 + 4 + 5) if we choose 1 as a divisor. 
	The sum is 9(1 + 1 + 2 + 2 + 3)  if we choose 2 as a divisor. Upon dividing all the elements of the array by 3, we get 1,1,1,2,2 respectively. Now, their sum is equal to 7 <= 8 i.e. the threshold value. So, 3 is the minimum possible answer.

	Example 2:
	Input Format: N = 4, arr[] = {8,4,2,3}, limit = 10
	Result: 2
	Explanation: If we choose 1, we get 17 as the sum. If we choose 2, we get 9(4+2+1+2) <= 10 as the answer. So, 2 is the answer.

    Algoithm:
    - Start divisor from 1 to max element

	- Use binary search to try a divisor

	- For each divisor, compute total sum using ceiling division

	- If sum ≤ limit, save divisor and try smaller

	- Else, try bigger divisor

	- Return smallest valid divisor.

	Time Complexity:O(log(max(arr[]))*N), where max(arr[]) = maximum element in the array, N = size of the array. We are applying binary search on our answers that are in the range of [1, max(arr[])]. For every possible divisor ‘mid’, we call the sumByD() function. Inside that function, we are traversing the entire array, which results in O(N).
    Space Complexity: O(1), no extra space is used.


**Median of Two Sorted Arrays of different sizes**
Problem Statement:
------------------
Given two sorted arrays arr1 and arr2 of size m and n respectively, return the median of the two sorted arrays. The median is defined as the middle value of a sorted list of numbers. In case the length of the list is even, the median is the average of the two middle elements.

Examples
Input: n1 = 3, arr1[] = {2,4,6}, n2 = 3, arr2[] = {1,3,5}
Output: 3.5
Explanation: 
The array after merging 'a' and 'b' will be {1, 2, 3, 4, 5, 6}. As the length of the merged list is even, the median is the average of the two middle elements. Here two medians are 3 and 4. So the median will be the average of 3 and 4, which is 3.5.
Input: n1 = 3, arr1[] = {2,4,6}, n2 = 2, arr2[] = {1,3}
Output: 3
Explanation: 
The array after merging 'a' and 'b' will be { 1, 2, 3, 4, 6 }. The median is 3.

### Algorithm(using partition)
 - To find the median of two sorted arrays efficiently, we use binary search on the smaller array to minimize time complexity. The key idea is to partition both arrays such that the left half contains the smaller elements and the right half contains the larger elements. This way, the median lies at the boundary between the two halves.

 - We choose a cut (partition) in the first array, and accordingly calculate the cut in the second array such that the total number of elements on the left side equals the number of elements on the right (or differs by one if the total number is odd). For the correct partition, the maximum of the left parts should be less than or equal to the minimum of the right parts.

 - To check this, we compare the maximum of the left side from both arrays with the minimum of the right side. If the condition is not met, we move the binary search window either left or right depending on which condition fails. This process continues until we find the right partition.

 - Once the correct partition is found, the median is calculated based on the total number of elements. If the total is even, we take the average of the two middle values (i.e., max of left part and min of right part). If the total is odd, the median is the max of the left part since it would be the middle element.

  - // Ensure a is the smaller array to minimize binary search scope
  - Binary search on the smaller array
  -  Calculate the cut positions for both arrays
  - // Handle boundary elements
     - // Total even => average of max left and min right
     - // Total odd => max of left half
  -   // Shift left in a[]
  -  Shift right in a[]

 Time Complexity: O(log(min(n1,n2))), we are applying binary search on the range [0, min(n1, n2)].
Space Complexity: O(1) , only constant variables are used.


**K-th Element of two sorted arrays**
Problem Statement:
------------------
 Given two sorted arrays a and b of size m and n respectively. Find the kth element of the final sorted array.
 Example 1:
Input:
 a = [2, 3, 6, 7, 9], b = [1, 4, 8, 10], k = 5  
Output:
 6  
Explanation:
 The final sorted array would be [1, 2, 3, 4, 6, 7, 8, 9, 10]. The 5th element of this array is 6.

Example 2:
Input:
 a = [100, 112, 256, 349, 770], b = [72, 86, 113, 119, 265, 445, 892], k = 7  
Output:
 256  
Explanation:
 The final sorted array is [72, 86, 100, 112, 113, 119, 256, 265, 349, 445, 770, 892]. The 7th element of this array is 256.

Time Complexity: O(log(min(M, N))), where M and N are the sizes of the two given arrays. As binary search is being applied on the range [max(0, k - N2), min(k, N1)], the range length <= min(M, N).

Space Complexity: O(1), as no additional space is used.

**Allocate Minimum Number of Pages**

Problem Statement: 
----------------
Given an array ‘arr of integer numbers, ‘ar[i]’ represents the number of pages in the ‘i-th’ book. There are a ‘m’ number of students, and the task is to allocate all the books to the students.
Allocate books in such a way that:

Each student gets at least one book.
Each book should be allocated to only one student.
Book allocation should be in a contiguous manner.
You have to allocate the book to ‘m’ students such that the maximum number of pages assigned to a student is minimum. If the allocation of books is not possible. return -1
Alggorithm 
- Identify the RANGE
- inary seratch form paritiction by possible conding 
- based on that increment and decrement_low


**Capacity to Ship Packages within D Days**

Problem Statement: 
------------------
You are the owner of a Shipment company. You use conveyor belts to ship packages from one port to another. The packages must be shipped within 'd' days. The weights of the packages are given in an array 'of weights'. The packages are loaded on the conveyor belts every day in the same order as they appear in the array. The loaded weights must not exceed the maximum weight capacity of the ship. Find out the least-weight capacity so that you can ship all the packages within 'd' days .	
Input: N = 5, weights = [5, 4, 5, 2, 3, 4, 5, 6], d = 5
Output: 9
Explanation: The minimum ship capacity needed to ship all packages within 5 days is 9.

Input: N = 3, weights = [1, 2, 3, 4, 5], d = 2
Output: 9
Explanation: With a capacity of 9, the packages can be shipped in 2 days as [1,2,3,4] and [5].
Algorithm (using ranges)
we want to find the minimum ship capacity that allows shipping all packages within the given number of days. The capacity must be at least the heaviest package because you can’t split a package. At the same time, the capacity can be at most the sum of all packages (if you ship everything in one day). So the answer lies between these two extremes. Using binary search on this range lets us efficiently find the smallest capacity that works. For each candidate capacity, we check if it’s possible to ship all packages within the given days by greedily accumulating package weights until we reach capacity, then moving to the next day.
Set the lower bound as the maximum weight in the packages.
Set the upper bound as the sum of all package weights.
While the lower bound is less than or equal to the upper bound, do:
Pick the middle value between lower and upper bounds as the candidate capacity.
Simulate shipping with this capacity: accumulate package weights until capacity is reached, then count a day and reset accumulation.
If the number of days used is within the allowed days, move the upper bound down to try smaller capacities.
If the number of days exceeds the allowed days, increase the lower bound to try larger capacities.
Return the lower bound when the search finishes as the minimum capacity needed.


**Aggressive Cows : Detailed Solution**

Problem Statement: 
You are given an array 'arr' of size 'n' which denotes the position of stalls. You are also given an integer 'k' which denotes the number of aggressive cows.
You are given the task of assigning stalls to 'k' cows such that the minimum distance between any two of them is the maximum possible. Find the maximum possible minimum distance.