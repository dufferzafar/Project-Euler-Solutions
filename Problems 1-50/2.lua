--[[
Problem No. 2
 By considering the terms in the Fibonacci sequence whose values do not exceed four million, 
 find the sum of the even-valued terms.

Wednesday, January 11, 2012
]]--

--The Sum
sum = 0

--First 2 Terms
local a, b, t = 1, 2, 1;

--The Main Loop
while b <= 4000000 do
	if b%2 == 0 then
		sum = sum + b
	end
	
	t = a; a = b; b = t + b;
end

--We've Done It!!
print(sum)