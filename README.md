1. Check if a Number Is a Prime
What is prime Number? 
Prime Number can be divisible by 1 and number itself. ie_ the divisor count would be 2.
Ex: 5, 7, 3 (prime numbers) and 2,9,10 -> Non prime number

Input -> 7 o/p -> '7 is prime number'
Input -> 9 o/p -> '9 is not prime number'

*Intitution
- 1 and number itself is prime number
- Loop to 2 to number -1 -> check prime number and return 'Not Prime Number'
- How to check if it prime number => num % i == 0 
   Ex:  5
   => 5 % 2 == 0 => False   => 5 % 4 == 0 => False 
   => 5 % 3 == 0 => False   
   //between 2 to number -1 is not satisfy the condition so it is prime number
   Ex: 9 Loop (2 to 8)
   => 9 % 2 == 0 => False   
   => 9 % 3 == 0 => true   => reurn 'Not Prime Number'
   -- ImproveMent
   Ex: 36 (2 to 35)
	Divinsible of 36 => 1,2,3,4,6,9,12,18,36
	If you observe carefully,
	36 /1 = 36 , 36 /2 = 12, 36 /3 = 18, 36 /4 = 9, 36 /6 = 6
	1,   2,  3, 4, 6, 9 -> divisor
	36, 12, 18, 9, 6, 4 -> Quotient

	you will ge 36 = divisor * Quotient
	Hence Looping with  2 to Sqrt(n) is fine instead of loop n
	ex: i = 2 
	   check num % 2 == 0
	   Also check num/2(we will get 12) % i == 0 -> in one check we are checking both quotioent and divisor to avoid loop
	   Also check num/2(we will get 12) != i -> if it alrdeay processed, no need ot check again. 
	     ex: i = 6
	     check num % 6 == 0
	      Also check num/6(we will get 6) here both i and num/i is 6 then no need to check
1. Algorithm to check if prime number or not for given num

   - Intialiize flag = ture
   - Base case
        - If num is less than 2
        - Then Return 'Not Prime Number'
   - Loop to 2 to Sqrt(num) with i
        - Check if Mod(num) is equal to 0
          - Then set flag = false
        - Check Mod(num is divided by i) is equal to 0 
        - Also check num is divided by i not equal to i
           - Then set flag = false
   - Finally Return 
        - Check flag is true 
           - Then Return 'Prime Number'
        - Else
           - Then Return 'Not Prime Number'

2. Algorithm to display the prime numbers within given n
  ex: 9 -> The prime numbers ae 3,5,7
  -  Intialiize prime_numbers = []
  - Base case
    - No
  - Loop 2 to n with num
    - Set Flag = true
    - Loop 2 to sqrt(num) with i
       - Check if Mod(num) is  equal to 0
         - Set Flag = false
    - Push num to prime number if only Flag = true
  - Finally display the prime numbers list

3. Algorithm to find the next prime number of given num

   ex: 7 -> o/p(11), ex: 5 -> o/p(7)

   - Set next_num = num + 1
   - Loop till next_num
     - Set Flag is true
     - Loop 2 to Sqrt(next_num) with i
       - Check if Mod(num) is  equal to 0
          Set Flag = false
     - Check if Flag is true
       - Then Return next_num
     - Else
        - next_num = next_num + 1

