
# Table of contents

- [Subsets](#subsets)
- [Subsets with duplicates](#subsets-with-duplicates)
- [Permutaions](#permutaions)

---

## Subsets

https://leetcode.com/problems/subsets/description/

### Choices

```text
At each element:
 ├─ Take it
 └─ Don’t take it

```

### Algorithm
```text
Start with empty subset []
Loop from index → n
 ├─ Add element
 ├─ Recurse
 └─ Remove element
```text

### Code
```ruby
def subsets(nums)
    result = []
    path = [] 
    subset_backtrack(result,path,nums, 0)
    result
end

def subset_backtrack(result, path, nums, index)
   result.push(path.clone)
   (index...nums.length).each do |i|
     path.push(nums[i])
     subset_backtrack(result,path,nums, i + 1)
     path.pop()
   end
end
```
---

## Subsets with duplicates

Sort → Pick / Skip → Skip duplicates at same level
https://leetcode.com/problems/subsets-ii/

### Choices

```text
At each element:
 ├─ Take it
 └─ Don’t take it
Skip duplicates at same level

```

### Algorithm
```text
Sort array
Start backtracking
 ├─ Add current subset to result
 ├─ Loop from index → end
 │    ├─ If same number as previous (same level) → SKIP
 │    ├─ Pick current number
 │    ├─ Recurse with next index
 │    └─ Undo pick (backtrack)
 └─ Done

```text

### Code
```ruby
# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
   nums.sort!
   result = []
   path = []
   backtrack_subsets_with_dup(result,path,nums,0)
   result
end

def backtrack_subsets_with_dup(result,path,nums,index)
  result.push(path.clone)
  (index...nums.length).each do |i|
      next if i > index && nums[i] == nums[i - 1]

     path.push(nums[i])
     backtrack_subsets_with_dup(result,path,nums,i + 1)
     path.pop
  end
end
```
---

## Permutaions

[https://leetcode.com/problems/permutations/submissions/1877188315/](https://leetcode.com/problems/permutations/submissions/1877188315/)

### Algorithm
```text
function backtrack(path):

    if path.size == nums.size:
        result.add(copy of path)
        return

    for each num in nums:

        if num already in path:
            continue

        path.add(num)        → CHOOSE
        backtrack(path)     → EXPLORE
        path.remove last    → UNCHOOSE


```text

### Code
```ruby
def permute(nums)
  result = []
  path = []
  visited = Array.new(nums.length, false)

  backtrack(result, path, nums, visited)

  result
end

def backtrack(result, path, nums, visited)
  if path.length == nums.length
    result << path.dup
    return
  end

  nums.length.times do |i|
    next if visited[i]

    visited[i] = true
    path << nums[i]

    backtrack(result, path, nums, visited)

    path.pop
    visited[i] = false
  end
end

```
---

```
