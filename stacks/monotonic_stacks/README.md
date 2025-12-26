## Next Greater Element Using Stack /Next Smaller Element
Problem Statement:
------------------ 
Given an integer array A, return the next greater element for every element in A. The next greater element for an element x is the first element greater than x that we come across while traversing the array in a clockwise manner. If it doesn't exist, return -1 for this element.

### Intitution:
  To find the next greater element for each element in an array, we can use a stack to efficiently track potential candidates. As we traverse the array from right to left, we maintain a stack that always stores elements in decreasing order from top to bottom. This way, when we process an element, we can simply pop off all smaller or equal elements (which can't be the next greater element), and the top of the stack, if it exists, will be the next greater element. If the stack is empty, there is no greater element to the right, so we assign -1.
  ### NOTE
   If we need to find next greater element in clockwise like a clock rotation -> we need to add i % n => ex: n = 5
   5%5 -> i will go for clock wise. for circlua r we need to do (2 * n - 1) 

### Algorithm
  - 1. Traverse the array from right to left using downto
  - 2. Maintain a monotonic decreasing stack
  - 3. For each element:
       - a) Pop smaller or equal elements from the stack
       - b) The top of the stack (if any) is the next greater element

Push the current element onto the stack
### Time Complexity: O(N), 
we traverse the entire array once and find next greater element in linear time.
### Space Complexity: O(N), 
additional space used for resultant array and stack.

--

**Trapping Rainwater**
Problem Statement: 
-----------------
Given an array of non-negative integers representation elevation of ground. Your task is to find the water that can be trapped after rain .

Input : height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output : 6
Explanation : Water is trapped in the dips between bars. The total trapped water units add up to 6 (1+1+2+1+1).

Input : height = [4,2,0,3,2,5]
Output : 9
Explanation : The elevation map traps 9 units of water in total, as water fills the spaces between higher bars on both sides.

### Algorithm(using two pointer with left and right + stak array)
 -> min(maxLefts,maxRights) - ary[i] (heights)
 -> The optimal approach uses two pointers to efficiently calculate the trapped water without extra space for arrays. The key insight is that the amount of water trapped at any position depends on the tallest bars to the left and right of that position. By maintaining two pointers starting from both ends of the elevation array and tracking the maximum heights encountered so far from both sides, we can determine the trapped water at each step. If the left height is smaller or equal to the right height, the trapped water depends on the left side's maximum; otherwise, it depends on the right side's maximum. This two-pointer technique lets us compute trapped water in one pass while using constant extra space.

 ### Note: 
    Water lagging will be happend if bettween two biuilding left and right
    So, Alsway check thecurrent height is smaller than maxLext , you need to subtac r that yu get result

    - Intailize max_left, max_right and total = 0
    - Intailize left = 0 right = ary.length - 1
    - Loop throught left < = right
      - Compare wuth left and right and if left is smaller
        - Compare max_left wtih current_ele and if it greater then max_left - ary[i] else assign max_left with current_ele
      - else(ie ary[right] is asamller than left)
        - Compare max_right wtih current_ele and if it greater then max_right - ary[i] else assign max_right with current_ele
    - Fianlly print the result

### Time Complexity: O(n)
 because the two pointers traverse the array only once, each pointer moving inward and covering the entire array in total linear time.

### Space Complexity: O(1)
 as only constant extra space is used for pointers and variables, regardless of input size.

--

**Sum of Subarray Minimums**
Problem Statement:
------------------
 Given an array of integers arr of size n, calculate the sum of the minimum value in each (contiguous) subarray of arr. Since the result may be large, return the answer modulo 10⁹ +7.

 Example 1:
  Input:
   arr = [3, 1, 2, 5]
  Output:
   18
  Explanation:
   The minimum of subarrays: [3], [1], [2], [5], [3, 1], [1, 2], [2, 5], [3, 1, 2], [1, 2, 5], [3, 1, 2, 5] are 3, 1, 2, 5, 1, 1, 2, 1, 1, 1 respectively and their sum is 18.

  Example 2:
  Input:
   arr = [2, 3, 1]
  Output:
   10
  Explanation:
   The minimum of subarrays: [2], [3], [1], [2,3], [3,1], [2,3,1] are 2, 3, 1, 2, 1, 1 respectively and their sum is 10.

### Algorithm(using next_smaller_elemelent with previous_Smaller_eleme)
### Intitution:
   Find the next smaller element of array and previous smaller of element and filablly  Count of first type of subarrays (i - previous smaller of element of i ) * count of second type of subarrays(next smaller of element of i - i ) * 1. add it to sum

     - Use a stack to find the index of the next smaller element to the right for each position
     - Use another stack to find the index of the previous smaller or equal element to the left for each position
     - For each element, determine how many subarrays it appears in as the minimum using its NSE and PSEE indices
     - Calculate the contribution of each element by multiplying its value with its frequency
     - Add each contribution to a total sum
     - Return the total sum modulo 10^9 + 7

#### Time Complexity: O(N), 
since finding the indices of next smaller elements and previous smaller elements take O(2*N) time each and calculating the sum of subarrays minimum takes O(N) time.
### Space Complexity: O(N), since finding the indices of the next smaller elements and previous smaller elements takes O(N) space each due to stack space and storing the indices of the next smaller elements and previous smaller elements takes O(N) space each.

## Note
🔢 Why Do We Need mod = 10^9 + 7?ecause the sum can become extremely large and exceed integer limits, so we take the result modulo a large prime to keep numbers manageable and consistent.

--

**Asteroid Collision**
Problem Statement: 
-----------------
Given an array of integers asteroids, where each integer represents an asteroid in a row, determine the state of the asteroids after all collisions. In this array, the absolute value represents the size of the asteroid, and the sign represents its direction (positive meaning right and negative meaning left). All asteroids move at the same speed.

When two asteroids meet, the smaller one will explode. If they are the same size, both will explode. Asteroids moving in the same direction will never meet.
Example 1:
Input:
 asteroids = [2, -2]
Output:
 []
Explanation:
 The asteroid with size 2 and the one with size -2 collide, exploding each other.

Example 2:
Input:
 asteroids = [10, 20, -10]
Output:
 [10, 20]
Explanation:
 The asteroid with size 20 and the one with size -10 collide, resulting in the remaining asteroid with size 20. The asteroids with sizes 10 and 20 never collide.


 ### Intitution:
    store the stack if each element is positive, if element has negative sign ie) it measns go to left side. compare negative based element(positive) with last stack if element is less tha stack last, we pop th stack coninue unituil you get greater. if botah ars same , both can collide each other i this case pop and incremet. Finally check if stack is empty , the element is negative and then push to stacj

    - Initialize an empty stack to track asteroids after collisions
    - Loop through each asteroid in the input array
    - If the asteroid is moving right, push it onto the stack
    - If the asteroid is moving left, check for collisions with top elements of the stack
    - While the top of the stack is a smaller right-moving asteroid, pop it from the stack
    - If the top of the stack is a right-moving asteroid of equal size, pop it and do not push the current asteroid
    - If the stack is empty or the top is a left-moving asteroid, push the current asteroid
    - After the loop ends, return the stack as the final result

### Time Complexity: O(N), 
since traversing all the asteroids takes O(N) time.

### Space Complexity: O(N), 
since in the worst case, all asteroids will be stored in the stack if there are no collisions, leading to a space requirement of O(N).

--

**Remove K Digits**
Problem Statement:
------------------
 Given a string nums representing a non-negative integer, and an integer k, find the smallest possible integer after removing k digits from num.
 Example 1:
Input:
 nums = "541892", k = 2
Output:
 "1892"
Explanation:
 Removing the two digits 5 and 4 yields the smallest number, 1892.

Example 2:
Input:
 nums = "1002991", k = 3
Output:
 "21"
Explanation:
 Remove the three digits 1(leading one), 9, and 9 to form the new number 21(Note that the output must not contain leading zeroes) which is the smallest.

### Algorithm:
 - Use a stack to store digits of the resulting number
 - Iterate through each digit of the input string
 - While the stack is not empty, the current digit is smaller than the top of the stack, and k is greater than 0, pop from the stack and decrement k
Push the current digit onto the stack
 - If k is still greater than 0 after the iteration, remove digits from the end of the stack
 - Collect the remaining digits from the stack to form the result
 - Remove any leading zeroes from the result
 - If the result is empty after removing zeroes, return "0"

### Time Complexity: O(N), 
since traversing the given string takes O(N) time, each element is pushed onto and popped from the stack at most once in worst-case taking o(N) time, removing the remaining digits (if k > 0) takes O(k) time which can go upto O(N) in worst-case and forming the result, trimming the zeros and reversing the digits takes O(N) time.

### Space Complexity: O(N), since we are using a stack to store the digits of the resulting number, in the worst case, the stack can contain all the digits of the input string.

--

**Area of largest rectangle in Histogram**

Problem Statement: 
------------------
Given an array of integers heights representing the histogram's bar height where the width of each bar is 1 return the area of the largest rectangle in histogram. .
Example:

Input: N =6, heights[] = {2,1,5,6,2,3}
Output: 10

### Intution:
  To find leftsamller and rightsmaller fo elment.
  right_smaller - left_samlare - 1 * ary[i]
  - This approach is a single pass approach instead of a two-pass approach. When we traverse the array by finding the next greater element, we found that some elements were inserted into the stack which signifies that after them the smallest element is themselves
  - So we can find the area of the rectangle by using **arr[i] * (right smaller - left smaller -1 ).**


### Time Complexity: O(N) + O(N). 
For loop used along with a while loop
### Space Complexity: O(N). 
Used for stack

--

        








