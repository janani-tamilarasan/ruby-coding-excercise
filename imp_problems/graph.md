
# 📌 CHEATSHEET - Table of Contents

- [No of Islands](#no-of-islands)

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





