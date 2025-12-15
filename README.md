**CHEATSHEET**

**TWO POINTERS**

   ✔ Sorted array
   
   ✔ Pairs / triplets
   
   ✔ Target sum
   
   ✔ Left + Right comparison
   
   ✔ In-place modification
   
   ✔ Opposite ends approach
   

**HASHING**
   ✔ Frequency / count
   
   ✔ Duplicates / unique
   
   ✔ Seen before?
   
   ✔ Fast lookup
   
   ✔ Order doesn’t matter
   
   ✔ Unsorted array
   

**SLIDING WINDOW**

Use Sliding Window if you see:

   ✔ Subarray / Substring / Continuous
   
   ✔ Longest / Shortest / Max / Min / Count
   
   ✔ At most / At least / Exactly / Without
   
   ✔ Constraint that can break and be fixed
   
   
   ❌ Do NOT use if it’s not continuous
   
Types of Sliding Window

   **1. Fixed Size Window(Window size = K)**
   
      Keywords
      
       ✔ “subarray of size k”
       
       ✔ “window length k”

   **2. Variable Size Window(No fixed size k given and its dynamic)**
   
      Keywords
      
       ✔ at most
       
       ✔  at least
       
       ✔  k distinct
       
       ✔ no repeating
       
       ✔  flip k zeros
       
** Dutch National algorithm **

      ✔ Array contains ONLY 3 distinct values
      
      ✔ Values are usually 0, 1, 2 (or can be mapped to them)
      
      ✔ Sorting must be IN-PLACE
      
      ✔ Single pass / O(n) required
      
      ✔ No extra space allowed

📌 Most common problem:

      Sort Colors / Sort 0s, 1s, and 2s
      Three Pointers (Always the Same)
         low  → where 0 should go
         mid  → current element
         high → where 2 should go

       | Value | Color   | Action     | Move       |
   | ----- | ------- | ---------- | --------------- |
   
   | `0`   | 🔴 Red  | Send LEFT  | `low++ , mid++` |
   
   | `1`   | ⚪ White | Stay       | `mid++`         |
   
   | `2`   | 🔵 Blue | Send RIGHT | `high--`        |

   NOTE: No mid++ for two

**NOTE (IMPROVEMENT)**

1. Use Hash.new(0)
