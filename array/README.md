**Find the Largest Elemeent in string**

    INPUT - [5,6,2,6,4,1,3]
    OUTPUT - 6

    - Algorithm 1(Using Sorting)
    - Intitution
      Sort the ary form desc and get the first element

        -> Sort the array with desc and get tthe firest element 0(nlogN) 

  - Alogithm 2(Using MAx)
  - Intitution
    check the each value and update the max if it is greater than

      -> Initialize the max with ary of first element
      -> Loop for 1 to ary.length with element
         -> check if element is greater than max
            -> Set arr[element]  to max
      -> Finally Return max

**Find Second Largest Element in an array**

    INPUT - [5,6,2,6,4,1,3]
    OUTPUT - 5

  - Algorithm 1(Using Sorting)

    - Intitution
      Sort the ary form desc and get the first element. 
      **NOTE** IT should  not works in ary which has duplicates
        -> Sort the array with desc and get tthe firest element 0(nlogN) 

  - Algorithm 1(Using MAX and second_max)
    - Intitution
        Make a two variale ie) max and second max -> if current elmemt is greater than max -> assign the current max to second_max and store current element to max -> if not match check if current element is greater tthan second max and also ite current_element is not same as max

      - Initialize the max and second_max with ary of first element.
      - Loop 1 to arr.size with index
        - Compare and check if ary[index] is greather than max
          - Then Set second_max with max value
          - And set max with ary[index]
        - Else
          - Check if ary[index] is greatee than second_max and ary[index] not equall to second_max
            - Set second_max with ele
      - Fianlly print second_max


**Remove Duplicates in-place from Sorted Array**


    INPUT -  arr[]=[1,1,2,2,2,3,3]
    OUTPUT - [1,2,3]

    - Algorithm 1(Using Hashing)

    - Intitution
      Store the each value in hash and dispaly the  keys values of hash.

      - Intialize ary_hash = {}
      - Loop 0 to ary.size with index
        - If hash has key of ary[index]
          - Then get ary[index] value and increment it
        - Else
          - Intialize the ary[index]with 1

      - Finally Return the hash.keys

    - Algorithm 1(Two Pointer)

    - Intitution
      Use two pointer(l=0,r=1) and compare l,r are same then increment the r and if l is greater than r it
      means we found the non-duplicate nuber hence increment l and assign arr[l] = arr[[r] and continues till it reaches a r with ary.length. And finaly return ary.silce(0 to l+1) or return the arry of 0 to l(included).
      NOTE: IT works only in sorted array , if given array is not sorted then sort it before

        - Intialize l = 0 r= 1
        - Loop r to arr.length with index
          - if arr[l] != arr[r]
            - increment l
            - Assign arr[l] with arr[r]
        - Return arr of slice with 0 to l

**Rotate array by K elements**

    Example 1
    ---------
    INPUT : nums = [1, 2, 3, 4, 5, 6, 7], k = 2, direction = right
    OUTPUT : [6, 7, 1, 2, 3, 4, 5]
    Explanation : rotate 1 step to the right: [7, 1, 2, 3, 4, 5, 6]
    rotate 2 steps to the right: [6, 7, 1, 2, 3, 4, 5] 
    Example 2
    ---------
    Input : nums = [1, 2, 3, 4, 5, 6], k=2, direction = left
    Output : [3, 4, 5, 6, 1, 2]
    Explanation :rotate 1 step to the left: [2, 3, 4, 5, 6, 1]
    rotate 2 steps to the left: [3, 4, 5, 6, 1, 2]
    NOTE
      k %= arr.length
        What it means
          k = k % arr.length
          This makes sure k is not bigger than the array size.
          Example
          arr = [1,2,3,4,5]
          k = 7
          Rotating right by 7 is same as rotating by:

          7 % 5 = 2 - So we only rotate 2 times, not 7.

    - Algorithm

    - Intitution
      Instead of simulating each rotation one by one, we can get the rotated array in-place by reversing specific parts of the array. Based on direction given(right or left) spilt into two parts as per ex: [1, 2, 3, 4, 5, 6, 7] -> right form k= 2
         1, 2, 3, 4, 5 ||| 6,7
         ----> reverse     --> reverse
         5, 4, 3, 2, 1 ||| 7,6
         ---------------------> reverse whole fro right(given) to left ie)(second part reverse + first part reverse next)
         6, 7, 1, 2, 3, 4, 5 -> output

         -  k %= arr.length
         - Split the ary into two parts based on direction
         - Reverse the first part and then second part
         - Reverse the whole 


**Move all Zeros to the end of the array**

      INPUT: 1 ,0 ,2 ,3 ,0 ,4 ,0 ,1
      OUTPUT: 1 ,2 ,3 ,4 ,1 ,0 ,0 ,0
      Explanation: All the zeros are moved to the end and non-negative integers are moved to front by maintaining order


      Algorithm(TWO POINTER)

    - Intitution:
        Keep all non-zero elements at the front as you scan the array once.Use one pointer (l) to remember where the next non-zero should go Scan the array with another pointer. Whenever you see a non-zero → put it at position l. Zeros naturally get pushed to the end

      - Initialize l = 0
      - Loop r from 0 to n-1
        - If arr[r] is not zero:
        - Swap arr[l] and arr[r]
        - Move l forward (l += 1)
        - Continue until the array ends


**Find the missing number in an array**

    Algorithm(using Formula)
    Example 1:
    INPUT Format: N = 5, array[] = {1,2,4,5}
    OUTPUT: 3
    Explanation: In the given array, number 3 is missing. So, 3 is the answer.

    Intitution
      Sum of natural numuners N *(N+1)/2. Hence, the sum of nutual numbes of given N is subtraced with sum of array of given number.

      - Find the total sum of natural number with given N
      - find the sum of given array using reduce
      - total sum of natural number - sum of given array
      TC- 0(n) SC: O(3N) where 3 is for the stack, left small array and a right small array


**Count Maximum Consecutive One's in the array**

    Example 1:
    INPUT: prices = {1, 1, 0, 1, 1, 1}
    OUTPUT: 3
    Explanation: There are two consecutive 1’s and three consecutive 1’s in the array out of which maximum is 3.

     Algorithm(using Each Loop) ->
     Intitution
      - Increment the count until if price is 0 else, store the count with maxCount dispaly

        - Initialize the max_count = 0 and count=0 
        - Loop 0 to prices size() with elemnt
           - if  elemnt is equal to 1
             - Increment the count
             - store maxCount with max of count and existing maxCount
           - Else
             - Set count = 0
        - Finally Return maxCount

**Find the number that appears once, and the other numbers twice**

    Example 1:
    INPUT Format: arr[] = {2,2,1}
    OUTPUT: 1
    Explanation: In this array, only the element 1 appear once and so it is the answer.

    Algorithm(using Hashing) ->
     Intitution
      - Store the hash with all value with count and finally list out the emplement which has count = 1
        - Intialize the hash = {}
        - Loop 0 to arr.size with ele
          - if ele is founnd increment the count
          - Else intialize with 1
        - Finally, Return the element whcih having only one count


**Longest Subarray with sum K | [Postives and Zeros]**

   Example 1:
    Input Format: k = 6, arr[] = {1,2,3,1,1,1,1,3,3}
    Result: 4
    Explanation: The longest subarray with sum 5 is {2, 3}. And its length is 2.


    Algorithm(using Sliding windows (keyword -Longest subarray)) ->
     Intitution
      - Slid the window and increment the count untill it reaches the<= sum and if sums is greetehr thank k and thrim the last one
        - Intialize the max_len = 0 and sum =0, l = 0
        - Loop 0 to arr.size with r
          - Add sum with arr[r]
          - Loop untill it goes to sum > k
            - trim the arr[l]
          - if sum is equal to the k
            - Then find the maxLength
