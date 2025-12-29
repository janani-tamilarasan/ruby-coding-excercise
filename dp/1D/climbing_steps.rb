
class Fibonnaci

  attr_accessor :dp_ary

  def initialize(n)
  	@dp_ary = Array.new(n + 1).fill(-1)
  end

  def execute_using_memorization(n)
      return n if n <= 1
	  return dp_ary[n] if(dp_ary[n] != -1)

	  dp_ary[n] = execute_using_memorization(n - 1) + execute_using_memorization(n - 2)
  end

   def execute_using_tabular(n)
      return n if n <= 1
	  dp_ary[0] = 0 
	  dp_ary[1] = 1

	  (2..n).each do |index|
	  	next if(dp_ary[index] != -1)

	  	dp_ary[index] = dp_ary[index-1] + dp_ary[index-2]
	  end 
	dp_ary[n]
  end

  def execute_using_space_optimization(n)
    return n if n <= 1

    # prev2 stores fib(n-2)
    prev2 = 0
    # prev stores fib(n-1)
    prev = 1
    # curr stores current fib
    curr = nil

    # Loop from 2 to n
    (2..n).each do |i|
      # Calculate current fib
      curr = prev + prev2
      # Update prev2 and prev
      prev2 = prev
      prev = curr
    end

    # Return final answer
    prev
  end
end

n = 5

fibbonaci = Fibonnaci.new(5)

p fibbonaci.execute_using_memorization(n)

fibbonaci = Fibonnaci.new(5)

p fibbonaci.execute_using_tabular(n)

fibbonaci = Fibonnaci.new(5)

p fibbonaci.execute_using_space_optimization(n)