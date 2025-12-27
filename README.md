# 📌 CHEATSHEET

---

## 🔁 TWO POINTERS

### ✅ When to Use
- ✔ Sorted array
- ✔ Pairs / triplets
- ✔ Target sum
- ✔ Left + Right comparison
- ✔ In-place modification
- ✔ Opposite ends approach

---

## 🧮 HASHING

### ✅ When to Use
- ✔ Frequency / count
- ✔ Duplicates / unique
- ✔ Seen before?
- ✔ Fast lookup
- ✔ Order doesn’t matter
- ✔ Unsorted array

---

## 🪟 SLIDING WINDOW

### ✅ Use Sliding Window if You See
- ✔ Subarray / Substring / Continuous
- ✔ Longest / Shortest / Max / Min / Count
- ✔ At most / At least / Exactly / Without
- ✔ Constraint that can break and be fixed

❌ **Do NOT use if the problem is not continuous**

---

### 🔹 Types of Sliding Window

#### 1️⃣ Fixed Size Window (Window size = `K`)
📌 **Keywords**
- ✔ “subarray of size k”
- ✔ “window length k”

---

#### 2️⃣ Variable Size Window (Dynamic window)
📌 **Keywords**
- ✔ at most
- ✔ at least
- ✔ k distinct
- ✔ no repeating
- ✔ flip k zeros

---

## 🇳🇱 DUTCH NATIONAL FLAG ALGORITHM

### ✅ When to Use
- ✔ Array contains ONLY **3 distinct values**
- ✔ Values are usually **0, 1, 2** (or can be mapped)
- ✔ Sorting must be **IN-PLACE**
- ✔ **Single pass / O(n)**
- ✔ **No extra space**

📌 **Most Common Problem**
- Sort Colors / Sort 0s, 1s, and 2s

---

### 🔁 Three Pointers (Always the Same)

- `low`  → where `0` should go  
- `mid`  → current element  
- `high` → where `2` should go  

---

### 🚦 Action Table

| Value | Color | Action | Pointer Move |
|------|------|------|-------------|
| `0` | 🔴 Red | Send LEFT | `low++ , mid++` |
| `1` | ⚪ White | Stay | `mid++` |
| `2` | 🔵 Blue | Send RIGHT | `high--` |

❗ **NOTE:** No `mid++` for `2`

---

### 🧩 Pseudocode

 - while mid <= high
   if 0 → swap low & mid → low++, mid++
   if 1 → mid++
   if 2 → swap mid & high → high--

---

## 🗳️ BOYER–MOORE MAJORITY VOTE ALGORITHM

### ✅ When to Use
- ✔ Find a majority element
- ✔ Appears more than ⌊n/2⌋ times
- ✔ Majority element is guaranteed
- ✔ O(1) extra space required

---

### 🔑 Keywords
- majority element
- appears more than n/2 times
- most frequent (with guarantee)
- dominant element
- single element survives

---

### 🧠 Tips to Remember
- Same element → **+1 vote**
- Different element → **−1 vote**
- Votes become `0` → change candidate

---

### 🧩 Pseudocode

   count = 0
   candidate = nil
   
   for each element
   
      if count == 0
      
         candidate = element
         
         count = 1
         
      else if element == candidate
      
         count++
         
      else
      
         count--
         
   return candidate

⏱ **Time Complexity:** O(n)  
📦 **Space Complexity:** O(1)

---

## 🔁 KADANE's ALGORITHM (MAXIMUM SUBARRAY SUM)
DROP NEGATIVE, KEEP POSITIVE

### ✅ When to Use

 - ✔ You are asked for maximum (or minimum) subarray sum
 - ✔ Subarray must be continuous
 - ✔ Need O(n) solution
 - ✔ No fixed window size

📌 **Keywords**
- ✔ maximum subarray
- ✔ largest sum contiguous subarray
- ✔ maximum sum
- ✔ continuous elements

sum += element
max_sum = sum if(sum > max_sum)

if sum < 0
  sum = 0
Return max_sum

⏱ **Time & Space Complexity**
Time	O(n)
Space	O(1)

---

## NEXT PERMUTION:(Break → Swap → Reverse)
 " Find the first dip from the right, fix it, then sort the tail.”

 
### ✅ When to Use

  - ✔ “next permutation”
  - ✔ “lexicographically next”
  - ✔ “next greater arrangement”
  - ✔ permutations in dictionary order

   * Find the breakpoint
        - Scan from right to left and find the first index i such that:
        arr[i] < arr[i + 1]
        If no such index exists → array is in descending order.
        reverse entire array and return.
     * Find the next larger element (from right)
	     From the right side, find the smallest element > arr[i] Swap it with arr[i].
     * Reverse the right part
        rom the right side, find the smallest element > arr[i]Swap it with arr[i].

---
## 🔁 PREFIX SUM 
Prefix sum = cumulative sum up to an index
**prefix[i] = a[0] + a[1] + ... + a[i]**
 
### ✅ When to Use
    - ✅ “subarray” (contiguous)
	- ✅ “range sum”
	- ✅ “sum equals K”
	- ✅ “count number of subarrays”
	- ✅ “find length of subarray”
	- ✅ “continuous sequence”
	- ✅ negative numbers present
	- ✅ multiple sum queries

### CORE IDEA (Most Important Line)
	
	For any subarray i → j:
	
### sum(i..j) = prefix[j] - prefix[i-1]

If:

### prefix[j] - prefix[i] = K

Then:

### prefix[i] = prefix[j] - K

👉 Use a HashMap to store prefix frequencies.

### Template
def subarray_sum(nums, k)
  count = 0
  prefix_sum = 0
  freq = Hash.new(0)

  freq[0] = 1   # VERY IMPORTANT

  nums.each do |num|
    prefix_sum += num
    count += freq[prefix_sum - k]
    freq[prefix_sum] += 1
  end

  count
end

## 🔁 Binary search
 ✅ 1. Search space is sorted
 ✅ 2. Any range like range like 1..10^9
 ✅ 3. Decision is monotonic ex: 
 Can Koko finish eating at speed = mid?
Can we ship packages in mid days?
Can we allocate books with max pages = mid?

✅ When to Use Binary Search
 1️⃣ Data is sorted
  1️⃣ Answer space is numeric and ordered
Condition is monotonic (MOST IMPORTANT)

❌ When NOT to Use Binary Search

❌ Unsorted data with no order
❌ Condition is random (true/false jumps)
❌ Need all results, not one
❌ No monotonic behavior

### Template
low = minimum_possible
high = maximum_possible
ans = high

while low <= high
  mid = (low + high) / 2

  if possible?(mid)
    ans = mid
    high = mid - 1 or  low = mid + 1
  else
    low = mid + 1 or low = mid + 1
  end
end

ans
### Template (Using range)

<img width="484" height="338" alt="image" src="https://github.com/user-attachments/assets/2fb1a646-c8d8-4e37-bae3-f669370eaf9d" />
<img width="428" height="267" alt="image" src="https://github.com/user-attachments/assets/56627df0-8662-4f1e-9349-d0b14cc2f132" />

### Index-Based Partition (Binary Search on Index) — TEMPLATE

 ### When to Use 
✔ Arrays are sorted
✔ You are asked for median / k-th element
✔ You must split arrays into left and right parts
✔ Condition compares left max ≤ right min
<img width="426" height="470" alt="image" src="https://github.com/user-attachments/assets/49a66e3d-5ae2-4e25-81f3-579dcda25272" />
### Question to ask yourself	#
If YES →
Are we partitioning an array?	low = max(arr)
Must each element fit entirely?	low = max(arr)
Is answer a speed / rate / divisor?	low = 1
Is zero a valid solution?	low = 0
1. Index-Based Binary Search (Classic)
Am I searching an index?
→ low = 0, high = n-1

2. Answer-Based (Range) — Partition / Capacity Problems
Am I minimizing a maximum (capacity/partition)?
→ low = max(arr), high = sum(arr)

3. Answer-Based — Rate / Speed Problems
Am I finding a rate/speed?
→ low = 1
4. Maximize Minimum Distance (Aggressive Cows)
Am I maximizing minimum distance?
→ low = 1, high = max-min

Is zero allowed?
→ maybe low = 0

Capacity problems → max(arr)
Speed problems    → 1

## 🌳 Binary Tree 

### 📌 What is a Binary Tree?
A **binary tree** is a hierarchical data structure in which:
- Each node has **at most two children**
- Children are referred to as:
  - **Left child**
  - **Right child**
- A node can have **0, 1, or 2 children**

---

### 📌 Types of Binary Trees

#### 🔹 Proper (Full) Binary Tree
- Every node has **either 0 or 2 children**
- No node has exactly one child
  A
 / \
B   C

#### 🔹 Complete Binary Tree
- All levels are **completely filled**
- Except possibly the **last level**
- The last level is filled **from left to right**
 A
 / \
B   C


💡 **Used in Heap data structure**

---

## 📌 Tree Traversals

### 🔹 DFS (Depth First Search)
Explores a branch fully before moving to the next.

#### ✅ Preorder Traversal
**Root → Left → Right**
- Used to **copy trees**
- Used in **prefix expressions**

#### ✅ Inorder Traversal
**Left → Root → Right**
- In a **BST**, this gives **sorted order**

#### ✅ Postorder Traversal
**Left → Right → Root**
- Used to **delete trees**
- Used in **postfix expressions**

🧠 Memory Trick:
Pre → Root first
In → Root in middle
Post → Root last

## 📌 BFS (Breadth First Search)

### 🔹 Level Order Traversal
- Traverses the tree **level by level**
- Implemented using a **queue**





### 📝 NOTE (IMPROVEMENT)

- Use default hash for frequency problems:
# Hash.new(0)
- if you want to assign infinity you use
 # max_sum = -Float::INFINITY
