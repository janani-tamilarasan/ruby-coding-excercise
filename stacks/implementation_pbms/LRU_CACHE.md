<!-- LRU with Ruby
- Least Recently Used Cache

Problem Statement: Design a data structure that follows the constraints of Least Recently Used (LRU) cache.

Implement the LRUCache class:
LRUCache(int capacity): We need to initialize the LRU cache with positive size capacity. int get(int key): Returns the value of the key if the key exists, otherwise return -1. void put(int key,int value): Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

The functions get and put must each run in O(1) average time complexity.
Example 1:
Input:
  
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]  
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]  
Output:
  [null, null, null, 1, null, -1, null, -1, 3, 4]  
Explanation:
  LRUCache lRUCache = new LRUCache(2);  
lRUCache.put(1, 1); // cache is {1=1}  
lRUCache.put(2, 2); // cache is {1=1, 2=2}  
lRUCache.get(1);   // return 1  
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}  
lRUCache.get(2);   // returns -1 (not found)  
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}  
lRUCache.get(1);   // return -1 (not found)  
lRUCache.get(3);   // return 3  
lRUCache.get(4);   // return 4  

Example 2:
Input:
  
["LRUCache", "put", "put", "get", "put", "get", "put", "get"]  
[[1], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [3]]  
Output:
  [null, null, null, -1, null, -1, null, -1]  
Explanation:
  LRUCache lRUCache = new LRUCache(1);  
lRUCache.put(1, 1); // cache is {1=1}  
lRUCache.put(2, 2); // evicts key 1, cache is {2=2}  
lRUCache.get(1);   // returns -1 (not found)  
lRUCache.put(3, 3); // evicts key 2, cache is {3=3}  
lRUCache.get(2);   // returns -1 (not found)  
lRUCache.put(4, 4); // evicts key 3, cache is {4=4}  
lRUCache.get(3);   // returns -1 (not found) -->



The cache can hold a fixed number of items, in LRU we remove the least recently used item in the cache to make room for the new item.
The data structure used here is a Hash for fast lookup and Doubly Linked List(DLL) for the fast removal of the least recently used items.

Tail -> older one(least recently used)
head -> recent one(most recently used)


LRU_CACHE
 - total_capcity
 - current_capacity
 - lookup_hash
 - node
 - head
 - tail

Node:
 value
 prev
 next

 hash
 key -> new_node


 - Create new cache with given capacity and also create the head and tail node
 - Put(key,value)
    - Increment the capacity by 1

    - Case: 1
      - If key is aelady exist
        - Delete key from lookup_hash
        - Delete node
    Case: 2
    - if total_capcity > capacity
      - Fast Lookup in current_capacity -> if key is exists then delete key from lookup_hash
      - Delete the least recently (tail.prev) from node
        - lru_next = tail.prev.next
        - lru_prev = tail.prev.prev
        - lru_next.prev = lru_prev
        - lru_prev.next = lru_next
    Case 3:
     - Create new node with key and value
     - Add it in look_up_hash
     - Add into head
       - head_next = head.next
       - new_node.next = head_next
       - new_node.prev = head
       - head_next = new_node

 - Get key
    - Checkif key is exists or not
    - If not -1
    - IF key is there in llok_up-hash
      -  node = @map[key]
      - delete_node
      - add_node(ndoe)