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