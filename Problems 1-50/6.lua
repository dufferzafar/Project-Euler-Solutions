--[[
Problem No. 6
 What is the difference between the sum of the squares and the square of the sums?

Friday, January 06, 2012
]]--

--Solution

n = 100;

x = ((n^2 + n)/2)^2				--Square of Sums
y = ((n^2 + n)*(2*n + 1))/6	--Sum of Squares

print(x - y);
