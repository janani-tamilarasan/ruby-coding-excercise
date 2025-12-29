## Sliding Window + Hashinng

### 1. Length of Longest Substring without any Repeating Character 
Keywords: #substring #longest
🧠 Memory line:
“Expand right, shrink left on duplicates, record max”
**!!Note: make sure you use **.ord** to get ASCII code and check the current character count form triming**

## Sliding Window + alloation Problems(flip)
### 1. Max Consecutive Ones III
Keywords: #consecutive #maximum #flip #atmost
🧠 Memory line:
“Spend k when zero enters, refund k when zero leaves”



## Sliding Window + atmost differene
### 1.Binary subarray with sum
Keywords: #subarray #targetsum #exacctly
🧠 Memory line:
Binary exact sum = atMost(goal) − atMost(goal − 1) + atMost(Add -> Shrink -> count)

### 2. Count number of nice subarrays
Keywords: #subarray #exactly 
🧠 Memory line:
Binary exact sum = atMost(goal) − atMost(goal − 1) + atMost(Add -> Shrink -> count)
exact K = ≤K − ≤(K−1)
odd++ when odd
shrink when odd > k
