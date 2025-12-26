# **Asteroid Collision**
# Problem Statement: 
# -----------------
# Given an array of integers asteroids, where each integer represents an asteroid in a row, determine the state of the asteroids after all collisions. In this array, the absolute value represents the size of the asteroid, and the sign represents its direction (positive meaning right and negative meaning left). All asteroids move at the same speed.

# When two asteroids meet, the smaller one will explode. If they are the same size, both will explode. Asteroids moving in the same direction will never meet.
# Example 1:
# Input:
#  asteroids = [2, -2]
# Output:
#  []
# Explanation:
#  The asteroid with size 2 and the one with size -2 collide, exploding each other.

# Example 2:
# Input:
#  asteroids = [10, 20, -10]
# Output:
#  [10, 20]
# Explanation:
#  The asteroid with size 20 and the one with size -10 collide, resulting in the remaining asteroid with size 20. The asteroids with sizes 10 and 20 never collide.


def astroid_collision(ary)
	result = []

	ary.each do |element|
		if(element.positive?)
			result.push(element)
		else
			# abs => make nagive to pisivite ex: -9 => 9
			while result.length > 0 && element.positive? && result[-1] < element.abs do
				result.pop()
			end

			if(result.length > 0 && result[-1] == element.abs)
				result.pop()
			 # Otherwise, if there is no left
             #    moving asteroid, the right moving 
             #    asteroid will not be destroyed 
			elsif(result.length == 0 || result[-1] < 0)
				result.push(element)
			end

		end
	end
	result
end

p astroid_collision([10, 20, -10])
p astroid_collision([4,7,1,1,2,-3,-7,17,15,-16])
p astroid_collision([4,7,1,1,2,-3,-7,17,15,-18,-19])