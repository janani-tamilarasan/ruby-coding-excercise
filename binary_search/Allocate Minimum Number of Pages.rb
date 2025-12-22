# Allocate Minimum Number of Pages

# Problem Statement: Given an array ‘arr of integer numbers, ‘ar[i]’ represents the number of pages in the ‘i-th’ book. There are a ‘m’ number of students, and the task is to allocate all the books to the students.
# Allocate books in such a way that:

# Each student gets at least one book.
# Each book should be allocated to only one student.
# Book allocation should be in a contiguous manner.
# You have to allocate the book to ‘m’ students such that the maximum number of pages assigned to a student is minimum. If the allocation of books is not possible. return -1

# Examples
# Example 1:

# Input Format: n = 4, m = 2, arr[] = {12, 34, 67, 90}
# Result: 113
# Explanation: The allocation of books will be 12, 34, 67 | 90. One student will get the first 3 books and the other will get the last one.


# Example 2:
# Input Format:
#  n = 5, m = 4, arr[] = {25, 46, 28, 49, 24}
# Result:
#  71
# Explanation: The allocation of books will be 25, 46 | 28 | 49 | 24.

def allocate_min_number_of_pages(ary,m)
	low = ary.max
	high = ary.sum()
	while low <= high do 
		mid = ((low + high)/2).floor()
		if possible?(ary,mid,m)
			
			high = mid - 1
		else
			low = mid + 1
		end
	end
	low
end

def possible?(ary,mid_pages,m)
	students = 1
	pages_sudent = 0
	ary.each do |el|
		pages_sudent += el
		if(pages_sudent > mid_pages)
			students +=1
			pages_sudent = el
		end
	end
   students <= m
end

ary = [25, 46, 28, 49, 24]
m = 4
p allocate_min_number_of_pages(ary,m)