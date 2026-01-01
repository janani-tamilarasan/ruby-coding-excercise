# 📌 CHEATSHEET - Table of Contents

- [Two Pointers](#two-pointers)
- [Sliding Window](#sliding-window)
- [Hashing](#hashing)
- [Xor](#xor)
- [Prefix Sum](#prefix-sum)
- [Dutch National Flag Algorithm](#dutch-national-flag-algorithm)
- [Boyer Moore Majority Vote Algorithm](#boyer–moore-majority-vote-algorithm)
- [Kadanes Algorithm](#kadanes-algorithm)
- [Next Permutation](#next-permutation)

----

# Patterns

## Two Pointers

### Types of Two pointers
#### Opposite Direction (Left => 0 && right => ary.size) 

Two pointers start from both direction and move towards each other.
Left always increment
Right always decrement

📌 **Keywords**
- ✔ Sorted 
- ✔ Pairs / triplets
- ✔ Symmetric problems

### 👉 **Time / Space**
O(n) time, O(1) space 

```ruby
l = 0
r = ary.length - 1

while l < r
  # condition (compare with l and r value  do actions accordingly like swap)

  if condition
    // Swap if needed or possible actions
    l += 1
  else
    r -= 1
  end
end
```

#### <u> Same Direction with diffrent index (Left => 0 && right => 1) </u>
Two pointers start from same direction different index.
Left, Right always increment
Right use to process/compare the possible conditions
Left is used to store/swap/any  If possible condtions are statisfied

📌 **Keywords**
- ✔ Un-Sorted 
- ✔ Pairs / triplets
- ✔ Symmetric problems

### 👉 **Time / Space**
O(n) time, O(1) space 

```ruby
l = 0
r = ary.length - 1

while l < r
  # condition (compare with l and r value  do actions accordingly like swap)

  if condition
    // Swap if needed or possible actions
    l += 1
  else
    r -= 1
  end
end
```

#### Slow and Fast Same Direction(Tortise and rare)(Fast scans, Slow stores) 
Both pointers move forward, but at different speeds.
📌 **Keywords**
- ✔ Remove / filter elements 
- ✔ In-place modification
- ✔ Maintain order

```ruby
slow = 0

(0...ary.length).each do |fast|
  # Check condition using ary[fast]
  if condition
    ary[slow] = ary[fast]   # keep valid element
    slow += 1
  end
end

# Result is usually in ary[0...slow]

```

[Slow and Fast Same Direction Problems](problems/slow_and_fast.md)

#### Merge pointers (“Compare → pick smaller → move pointer”)
Two pointers traverse two different sorted arrays.
📌 **Keywords**
- ✔ Merge or compare two sorted arrays
```ruby
i = 0
j = 0
result = []

while i < arr1.length && j < arr2.length
  if arr1[i] <= arr2[j]
    result << arr1[i]
    i += 1
  else
    result << arr2[j]
    j += 1
  end
end

# add remaining elements
while i < arr1.length
  result << arr1[i]
  i += 1
end

while j < arr2.length
  result << arr2[j]
  j += 1
end

result
```
[ Merge pointers Problems](problems/merge_pointers.md)

#### FAST & SLOW POINTERS(Hare and tortise algorithm) Slow -> 1 and Fast -> 2 steps
📌 **Keywords**
- ✔ cycle / loop
- ✔ linked list loop
-  ✔ detect duplicate
- ✔ Values are in a fixed range (1…n)
- ✔ find middle
### Pattern
```text
slow → 1 step
fast → 2 steps

If loop exists → fast catches slow
```
```ruby
slow = head
fast = head

while fast && fast.next
  slow = slow.next
  fast = fast.next.next

  return true if slow == fast
end

false
```

#### SORT + TWO POINTERS (“Sort → Fix → Sweep”)
🔑 Use when:
2-sum / 3-sum / closest
minimize / maximize difference

#### 🧩 Pattern Steps
✔ Sort
✔ Fix one
✔ Two pointer on rest

🧠 Memory line:

“Sort → Fix → Sweep”

----

## Sliding Window 
(Contiguous + Range → Sliding Window)

### ✅ Use Sliding Window if You See
- ✔ Subarray / Substring / Continuous
- ✔ Longest / Shortest / Max / Min / Count
- ✔ At most / At least / Exactly / Without
- ✔ Constraint that can break and be fixed

❌ **Do NOT use if the problem is not continuous**
Note:
If they ask
**max/min of count -> increment the coubt
length of subarray = (r-l+1)
count of subarray = (r-l+1)**

### 🔹 Types of Sliding Window

#### 1️⃣ Fixed Size Window (Window size = `K` => “K is fixed → no shrinking”)
📌 **Keywords**
- ✔ “subarray of size k”
- ✔ “window length k”
- 
### 👉 **Time / Space**
O(n) time, O(1) space 

🔹 **Pattern**
- ✔ Build first window
- ✔ Slide: remove left, add right
Tempalte 1 or Template 2 cn be use

**Tempalte 1:**
```ruby
Given K=4v ary =[] 
fun fixedSliding {
// calcuate with firsst n elements
  for (let i = 0; i < k; i++) {
    //Compute Calc goes  here
  }
  // Store the value as ex: maxSum
  // Slide the window from start to end and  calcuate with  n+1 elements to ary.length
      for (let i = k; i < arr.length; i++) {
    // Expand the window (add the k the element)
    windowSum += ary[k]
   // Trim the previus element using ary[i-k]
    windowSum -= ary[i-k]
  //Compute Calc goes  here
}
```

**Tempalte 2:**
```ruby
l = 0
r = 0
window_sum = 0

while r < arr.length
  window_sum += arr[r]

  if r - l + 1 > k
    window_sum -= arr[l]
    l += 1
  end

  if r - l + 1 == k
    # use window_sum
  end

  r += 1
end

```
#### 2️⃣ Atmost and atleast

#### 2️⃣ Variable Size Window (Dynamic window) “Expand → break → shrink”
🔹 When
✔ Window size not fixed
✔ Condition-based problems

### 👉 **Time / Space**
O(n) time, O(1) space

📌 **Keywords**
- ✔ at most
- ✔ at least
- ✔ k distinct
- ✔ no repeating
- ✔ flip k zeros
- 
🔹 Pattern
- ✔ Expand right
- ✔ Shrink left when condition breaks

```ruby
l = 0

(0...arr.length).each do |r|
  # add arr[r]

  while condition_invalid
    # remove arr[l]
    l += 1
  end
//Finnd max/min
end
```
[Longest Substring with At Most K Distinct Characters](https://takeuforward.org/data-structure/longest-substring-with-at-most-k-distinct-characters)


#### 3️⃣ COUNT / FREQUENCY WINDOW -> Sliding_window + Hashhing
It can be use if any str and char are given
In hash we wll store hash wuth count
🔹 When
✔ Characters or numbers frequency matters
### 👉 **Time / Space**
O(n) time, O(m + n ) hasing spacespace

**🧠 Memory Trick**

“Window + HashMap”

[Length of Longest Substring without Repeating Characters](https://takeuforward.org/data-structure/length-of-longest-substring-without-any-repeating-character)

[Number of substring containing all three characters](https://takeuforward.org/data-structure/number-of-substring-containing-all-three-characters)

#### 4️⃣ Exactly k element

🔹 When
✔ “At most K” / “At least K” asked

**🧠 Trick**

**At least K = total − at most (K−1)**

```ruby
 at_most (K) -  at_most (K−1) 

```
[Binary subarray with sum](https://takeuforward.org/data-structure/binary-subarray-with-sum)

[Count number of nice subarrays](https://takeuforward.org/data-structure/count-number-of-nice-subarrays)

[Subarray with k different integers](https://takeuforward.org/data-structure/subarray-with-k-different-integers)


#### 4️⃣ Replacement or flip
```ruby
l = 0
zeros_count(replacement_coutnt) = 0
(0...arr.length).each do |r|
  # If replacement found then increase the zeros_count

  while zeros_count > k
    # remove arr[l]
    l += 1
  end
//Finnd max/min
end
```
[Max Consecutive Ones III](https://takeuforward.org/data-structure/max-consecutive-ones-iii)


others:

[longest repeating character replacement](https://takeuforward.org/data-structure/longest-repeating-character-replacement)

[Maximum point you can obtain from cards](https://takeuforward.org/data-structure/maximum-point-you-can-obtain-from-cards)

[miniumm Window Substring](https://takeuforward.org/data-structure/subarray-with-k-different-integers)


----

## Xor

## 🔁  XOR
**Duplicates cancel, one remains” → XOR**

### ✅ When to Use
- ✔ Fixed repetition pattern ex: every element appears twice except one
- ✔ find the unique / missing number
- ✔ Unsorted array

### Pattern
```text
x ^ x = 0
0 ^ x = x
```
----

## Hashing

## 🔁  HASHING

### ✅ When to Use
- ✔ Frequency / count
- ✔ Duplicates / unique
- ✔ Seen before?
- ✔ Fast lookup
- ✔ Order doesn’t matter
- ✔ Unsorted array
### 👉 **Time / Space**
O(n) time, O(k) space 

```ruby
# Initialize hash or set
freq = Hash.new(0)   # for counting
set = Set.new        # for existence

arr.each do |el|
  # 1️⃣ Count / frequency
  freq[el] += 1

  # 2️⃣ Existence check
  if set.include?(el)
    # duplicate / condition met
  else
    set.add(el)
  end

  # 3️⃣ Prefix sum / cumulative check (if needed)
  # sum += el
  # count += freq[sum - k] if freq[sum - k]
end

# 4️⃣ Use freq/set to compute result
# Examples: first unique, max frequency, check duplicate, subarray count
```
⚠️ **Important:** Use Hash.new, Array.new.fill(-1)
Some times we use Hashing with store count or index

----

## Prefix Sum

## 🔁 PREFIX SUM (Store cumulative sum so middle can be found by subtraction)
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
	
### 👉 **Time / Space**
O(n) time, O(n) space 

```text
Range Sum    → prefix[R] - prefix[L-1]
Count        → freq map + (sum - K)
Longest      → index map + first occurrence

```

#### 🧠 Patrern
✔ Build running sum
✔ Subtract to get range
✔ Use hashmap (if counting)
1. “CUT THE MIDDLE”
   prefix[j] - prefix[i] = middle subarray
2. “Seen before = valid subarray”

#### CORE IDEA (Most Important Line)
```text	
	For any subarray i → j:
	
**sum(i..j) = prefix[j] - prefix[i-1]**

**prefix[i] = prefix[j] - K**
```
👉 Use a HashMap to store prefix frequencies.
👉 Always add 0 as first in prefix array

#### 1️⃣ RANGE SUM 
 - Always add 0 as first in prefix array
 - 
 
```text
sum(i, j) = prefix[j] - prefix[i - 1]

```

#### 2️⃣ COUNT of Subarrays sum equal to k
🧠 MEMORIZATION LINE
  COUNT → HashMap stores prefix_sum with count
🧩 Keywords
	“Count subarrays with sum = K”
	“Number of subarrays”
	“Binary array / target sum”

```text
prefixSum += currentSum
remaining_value = prefixSum - k(given)
If:
 - remaining_value exists before
 - we found a get the count and use and store the prefis sum value with count in hash

count  +=  prefis sum[remaining_value].count
```

#### 3️⃣ LONGEST Subarray (Length problem)
🧠 MEMORIZATION LINE 
  COUNT → HashMap stores prefix_sum(j) with first_seen_index(i) 
 
  *** NOTE: sum(i,j) =  prefix_sum(j) -  prefix_sum(i - 1)
  
🧩 Keywords
	“Longest subarray”
	“Maximum length”
	“With sum K / equal 0 / equal target”
```text
prefixSum += currentSum
remaining_value = prefixSum - k(given)
If:
 - remaining_value exists before
 - we found a get the count and use and store the prefis sum value with first_seend_index in hash
length  +=  i - prefis sum[remaining_value].index
```
----

## Dutch National Flag Algorithm

## 🔁  DUTCH NATIONAL FLAG ALGORITHM (Three pointer - low,mid,high)

### ✅ When to Use
- ✔ Array contains ONLY **3 distinct values**
- ✔ Values are usually **0, 1, 2** (or can be mapped)
- ✔ Sorting must be **IN-PLACE**
- ✔ **Single pass / O(n)**
- ✔ **No extra space**

### 👉 **Time / Space**
O(n) time, O(1) space 

📌 **Most Common Problem**
- Sort Colors / Sort 0s, 1s, and 2s

### Three Pointers (Always the Same)

- `low`  → where `0` should go  
- `mid`  → current element  
- `high` → where `2` should go  

### 🚦 Action Table

| Value | Color | Action | Pointer Move |
|------|------|------|-------------|
| `0` | 🔴 Red | Send LEFT | `low++ , mid++` |
| `1` | ⚪ White | Stay | `mid++` |
| `2` | 🔵 Blue | Send RIGHT | `high--` |

❗ **NOTE:** No `mid++` for `2`

### Pattern

 - while mid <= high
   if 0 → swap low & mid → low++, mid++
   if 1 → mid++
   if 2 → swap mid & high → high--

```ruby
arr = [2,0,1,2,1,0]
low = 0
mid = 0
high = arr.length - 1

while mid <= high
  case arr[mid]
  when 0
    arr[low], arr[mid] = arr[mid], arr[low]
    low += 1
    mid += 1
  when 1
    mid += 1
  when 2
    arr[mid], arr[high] = arr[high], arr[mid]
    high -= 1
  end
end

arr
```

---
----

## Boyer Moore Majority Vote Algorithm

## 🔁  BOYER–MOORE MAJORITY VOTE ALGORITHM(vote - count cancelation - majorith of n/2 times)

### ✅ When to Use
- ✔ Find a majority element
- ✔ Appears more than ⌊n/2⌋ times
- ✔ Majority element is guaranteed
- ✔ O(1) extra space required
- 
⏱ **Time Complexity:** O(n)

📦 **Space Complexity:** O(1)

### 🔑 Keywords
- majority element
- appears more than n/2 times
- most frequent (with guarantee)
- dominant element
- single element survives

### 🧠 Pattern
- Same element → **+1 vote**
- Different element → **−1 vote**
- Votes become `0` → change candidate

```ruby
def majority_element(nums)
  candidate = nil
  count = 0

  nums.each do |num|
    if count == 0
      candidate = num
    end

    if num == candidate
      count += 1
    else
      count -= 1
    end
  end

  candidate
end
```
----
## Kadanes Algorithm
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
- 
⏱ **Time Complexity:** O(n)

📦 **Space Complexity:** O(1)

### 🧠 Pattern
- 1. Start from first element
- 2. Extend or Restart
- 3. Update best

```ruby
sum += element
max_sum = sum if(sum > max_sum)

if sum < 0
  sum = 0
Return max_sum

```
----
## Next Permutation
## NEXT PERMUTION:(Break → Swap → Reverse)
 " Find the first dip from the right, fix it, then sort the tail.”
🧠 MEMORIZATION LINE 
Dip → Just bigger → Swap → Reverse suffix
 
### ✅ When to Use

  - ✔ “next permutation”
  - ✔ “lexicographically next”
  - ✔ “next greater arrangement”
  - ✔ permutations in dictionary order

   * Find the breakpoint
        - Find the “dip” (breaking point)
        - Find the next greater element on the right
        - Swap
        - Reverse the right part
----

## Binary Search

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

----
## Binary Tree

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

# 🌳 Binary Tree – Interview Revision Guide

A compact, easy-to-remember guide to **identify Binary Tree problems**, choose the **correct template (DFS/BFS)**, and confidently explain **TC & SC** in interviews.

---

## 1️⃣ How to Identify a Binary Tree Problem

If the problem mentions:
- `root`
- `left` / `right`
- traversal
- height / depth / diameter
- views (top, bottom, left, right)
- path / ancestor / subtree

👉 **It is a Binary Tree problem**

---

## 2️⃣ First Question to Ask Yourself (MOST IMPORTANT)

> **Does the solution depend on children first or level by level?**

| Observation | Use |
|------------|----|
| Depends on left & right subtree | **DFS (Recursion)** |
| Depends on levels / distance / view | **BFS (Queue)** |

---

## 3️⃣ Problem → Template Mapping (Cheat Sheet)

| Problem | Approach | Pattern |
|------|--------|--------|
| Height / Depth | DFS | Postorder |
| Diameter | DFS | Postorder + Global |
| Max Path Sum | DFS | Postorder + Global |
| Balanced Tree | DFS | Height check |
| Identical Trees | DFS | Node comparison |
| Subtree Check | DFS | Tree matching |
| Pre/In/Post Order | DFS | Traversal |
| Level Order | BFS | Queue |
| Zigzag Traversal | BFS | Queue + Direction |
| Top / Bottom View | BFS | Vertical Index |
| Left / Right View | BFS | Level tracking |

---

## 4️⃣ Universal DFS Template (90% Tree Problems)

def dfs(node)
  return base_value if node.nil?

  left = dfs(node.left)
  right = dfs(node.right)

  # process current node
  answer = combine(left, right, node.value)

  return value_to_parent
end

### Use DFS When:

Height / Depth
Diameter
Max Path Sum
Balanced Tree
LCA
Identical Trees
5️⃣ Universal BFS Template (Views & Levels)
queue = [root]

while !queue.empty?
  size = queue.length

  size.times do
    node = queue.shift
    queue << node.left if node.left
    queue << node.right if node.right
  end
end
### Use BFS When:
Level Order
Zigzag
Top / Bottom View
Left / Right View

### Core Formula Cheat Sheet 🧠
<img width="663" height="465" alt="image" src="https://github.com/user-attachments/assets/4fcf5f91-ab8b-4d64-b840-d06b201f7741" />
<img width="549" height="322" alt="image" src="https://github.com/user-attachments/assets/884313fd-e102-4773-a24a-ea819197ba8d" />

----

### 📝 NOTE (IMPROVEMENT)

- Use default hash for frequency problems:
### Hash.new(0)
- if you want to assign infinity you use
 ### max_sum = -Float::INFINITY
