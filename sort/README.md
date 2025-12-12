**Sort the number in array using Merge sort**
	Intitution:
	 - Instead of travesal entire loop, sort thare array using merge sort by splitting and checking with mid.

  1. Sort the array using aseending_order
     it involves two method
     -> merge_sort => Args(ary) -> Find tehe mid, left (0 to mid) and rught(mid to ary.lemnt ) and recursive merge sort
     -> merge -> compare left and right most elemente and compare with asc and at lat append left and right remaining items

  - Algorithm
    - Arg(ary)
    -> merge_sort
       - Base condtion
          - Return ary If ary of size is less than equal to 1
       - Find the mid using ary.length/2.floor()
       - Find left with recusively with merge_sort
           left = merge_sort(ary[0...mid])
      - Find right with recusively with merge_sort
            right = merge_sort(ary[mid...ar.size])        
            
      - call left and right with merge function
    -> merge
       - Arg(left, right)    
       - Intialize i and j with 0 and result = for storing sorted aray
       - Loop i < left.length && j < right.length
          - Compare if left[i] is less taht right[j]
            - Then push the left into result array
            - increment i
          - Else
           - Then push the right into result array
            - increment j
        - Store the remaining values
            - result + left[i..] + right[j..]


W:C 0(nlogn)
two parts
  merge_sort
    -> BAse coding
    -> find mid, recursiveFn(left), recursiveFn(right)
    -> call mergeFn(left,right)
   mergeFn(left,right)
     -> intialize i,j = 0 amd result = []
     -> Loop i < left.length and j < right.lenght
        -> compare with left and if < or > push to left and increment
        - Else push to right and increment
     -> merge (result , left remaining, right_remaining)