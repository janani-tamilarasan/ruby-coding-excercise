
# 📌 CHEATSHEET - Table of Contents

- [No of Islands](#no-of-islands)
- [Max Area of Island](#max-area-of-island)
- [Word Ladder](#word-ladder)
- [Rotting Oranges](#rotting-oranges)
- [Flood Fill Algorithm - Graphs](#flood-fill-algorithm-graphs)

## No of Islands

https://leetcode.com/problems/number-of-islands/

#### Techniques: DFS

####  Algorithm

```text
Loop every cell
 ├─ If cell == 1
 │    ├─ count += 1
 │    ├─ DFS/BFS from here(with horizontal, and vertical)
 │    └─ Mark all connected 1s → 0 (sink island)
 └─ Continue

DFS FLOW

DFS(i, j)
 ├─ If out of bounds → return 0
 ├─ If grid[i][j] == 0 → return 0
 ├─ Mark grid[i][j] = 0 (visited)
 ├─  DFS(down)
 ├─  DFS(up)
 ├─  DFS(right)
 └─  DFS(left)
```
#### Code:
```ruby
def num_islands(grid)

  rows = grid.length
  columns = grid[0].length
  count = 0
  ### Loop every cell
   (0...rows).each do |i|
        (0...columns).each do |j|
            ## If cell == 1
            if(grid[i][j]== '1')
                ## Increment the count with count += 1
                count +=1
                ## DFS/BFS from here(with horizontal, and vertical)
                dfs(grid,i,j)
            end
        end
    end
  count
end

#DFS/BFS REcursive call
def dfs(grid,i,j)

    ### check if i and j value is less than 0
    return if(i < 0 || j < 0 )

    ### check if i and j value is go beyond rows and columns
    return if(i >= grid.length || j >= grid[0].length)

     ### grid[i][j] is already 0
    return if(grid[i][j] == '0')

    ## assign the current to 0 and so that we can't revisit
    grid[i][j] = '0'

    ## dfs with horizontal and vertical
    dfs(grid,i,j+1)
    dfs(grid,i,j-1)
    dfs(grid,i+1,j)
    dfs(grid,i-1,j)
end
```

#### Time/Space Complexity
O(m * n)
O(m * n)

---

## Max Area of Island
GRID → LAND → DFS → MARK → COUNT / MAX

[https://leetcode.com/problems/number-of-islands/](https://leetcode.com/problems/max-area-of-island/)

#### Techniques: DFS

####  Algorithm

```text
Loop every cell (i, j)
 ├─ If grid[i][j] == 1
 │    ├─ area = DFS(i, j)
 │    ├─ max_area = max(max_area, area)
 │    └─ Continue scanning
 └─ Continue

DFS FLOW

DFS(i, j)
 ├─ If out of bounds → return 0
 ├─ If grid[i][j] == 0 → return 0
 ├─ Mark grid[i][j] = 0 (visited)
 ├─ area = 1
 ├─ area += DFS(down)
 ├─ area += DFS(up)
 ├─ area += DFS(right)
 └─ area += DFS(left)

```
#### Code:
```ruby
def max_area_of_island(grid)
    rows = grid.length
    columns = grid[0].length
    max_len = 0
    (0...rows).each do |i|
      (0...columns).each do |j|
        if(grid[i][j] == 1)
            max_len = [max_len, dfs(grid,i,j)].max
        end
       end
    end
    max_len
end

 def dfs(grid,i,j)
    return 0 if(i <0 || j <0)
    return 0 if(i >= grid.length || j >= grid[0].length)
    return 0 if(grid[i][j] == 0)

    grid[i][j] = 0
    len = 1
    len += dfs(grid,i, j+1)
    len += dfs(grid,i, j-1)
    len += dfs(grid,i+1, j)
    len += dfs(grid,i-1, j)
    len
 end
```

#### Time/Space Complexity
O(m * n)
O(m * n)

**NOTE**
<img width="526" height="181" alt="image" src="https://github.com/user-attachments/assets/ca03849a-218e-4bdf-ba19-91c7e4d75414" />

---

## Word Ladder

[https://leetcode.com/problems/word-ladder/description/](https://leetcode.com/problems/word-ladder/description/)

#### Techniques: BFS

#### Data Structure: 
   Set(stroring unique items for stroing wordslist)  
   Queue -> For proccesing transforamation
####  Algorithm

- Check if endWord is present in the wordlist
   - If no return 0
 - Store the word list in the hash_set -> with set
 - Add the start_word with depth 1 in queue
- Step 2
  - Process the First item in queue
    - Remove first_item from hash_set
    - Then get the first item and matches with all posible a-z string with each positio
   
    - if matches -> remove from the hash_set and add it in queue at last with increment the deptt
    - Continue untill it matches
   
    - 
```text
Start word → Queue
Word list → Set (for fast lookup)

While queue not empty
 ├─ Take word + steps
 ├─ If word == target
 │    └─ return steps
 ├─ For each character position
 │    ├─ Try a–z
 │    ├─ Form new word
 │    ├─ If new word in Set
 │    │    ├─ Remove from Set (visited)
 │    │    └─ Push to queue (steps + 1)
 └─ Continue

```
#### Code:
```ruby
 dict = word_list.to_set
   return 0 unless dict.include?(end_word)

    queue = [[begin_word, 1]]
    dict.delete(begin_word)

    while !queue.empty?
        word, steps = queue.shift

        return steps if word == end_word

        (0...word.length).each do |i|
        ('a'..'z').each do |ch|
            new_word = word[0...i] + ch + word[i+1..-1]

            if dict.include?(new_word)
            dict.delete(new_word)
            queue << [new_word, steps + 1]
            end
        end
        end
    end
  return 0
```

#### Time/Space Complexity
O(m * 256)
O(m)

---

## Rotting Oranges

[https://leetcode.com/problems/rotting-oranges/description/](https://leetcode.com/problems/rotting-oranges/description/)

#### Techniques: BFS

#### Data Structure: 
   Queue -> For proccesing transforamation
   
####  Algorithm
```text
Count all oranges
Push all rotten into queue

While queue not empty
 ├─ Process current level
 ├─ Rot neighbors (4 directions)
 ├─ Push newly rotten
 └─ Increment minute


```
#### Code:
```ruby
# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  return 0 if grid.empty?

  rows = grid.length
  cols = grid[0].length

  queue = []
  total = 0
  rotten_count = 0

  # Initialize
  (0...rows).each do |i|
    (0...cols).each do |j|
      total += 1 if grid[i][j] != 0
      queue << [i, j] if grid[i][j] == 2
    end
  end

  directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  minutes = 0

  # BFS
  while !queue.empty?
    size = queue.length
    rotten_count += size

    size.times do
      x, y = queue.shift

      directions.each do |dx, dy|
        nx = x + dx
        ny = y + dy

        next if nx < 0 || ny < 0 || nx >= rows || ny >= cols
        next if grid[nx][ny] != 1

        grid[nx][ny] = 2
        queue << [nx, ny]
      end
    end

    minutes += 1 if !queue.empty?
  end

  total == rotten_count ? minutes : -1
end

# Driver code
grid = [
  [2, 1, 1],
  [1, 1, 0],
  [0, 1, 1]
]

result = oranges_rotting(grid)
puts "Minimum Number of Minutes Required #{result}"

```
---

## Flood Fill Algorithm - Graphs

[[https://leetcode.com/problems/pacific-atlantic-water-flow/description/](https://takeuforward.org/graph/flood-fill-algorithm-graphs)

#### Techniques: BFS

   
####  Algorithm
```text
Start (sr, sc)
 ├─ Get starting color
 ├─ DFS / BFS in 4 directions
 │    ├─ If same color
 │    ├─ Change to new color
 │    └─ Continue
 └─ Done
Start (sr, sc)
 ├─ Get starting color
 ├─ DFS / BFS in 4 directions
 │    ├─ If same color
 │    ├─ Change to new color
 │    └─ Continue
 └─ Done

```

#### Code:
```ruby
# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
def flood_fill(image, sr, sc, color)
  start_color = image[sr][sc]
  return image if start_color == color   # nothing to change

  dfs(image, sr, sc, start_color, color)
  image
end

def dfs(image, r, c, start_color, new_color)
  return if r < 0 || c < 0
  return if r >= image.length || c >= image[0].length
  return if image[r][c] != start_color

  image[r][c] = new_color

  dfs(image, r + 1, c, start_color, new_color)
  dfs(image, r - 1, c, start_color, new_color)
  dfs(image, r, c + 1, start_color, new_color)
  dfs(image, r, c - 1, start_color, new_color)
end

```
---








