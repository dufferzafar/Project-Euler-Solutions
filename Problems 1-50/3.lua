--[[
Problem No. 3
 Find the largest prime factor of a composite number.

Friday, January 06, 2012
]]--

--Global Declarations
floor = math.floor
sqrt = math.sqrt

--IsPrime Function
function IsPrime(x)
	if (x%3 == 0) then return false
	else
		for n = 5, floor(sqrt(x)), 2 do
			if (x % n) == 0 then return false end
		end
	end
	return true
end

--The Largest Prime Divisor (currently 1)
largest = 1; num = 600851475143

--The Main Code
if (num%2 == 0) then 
	largest = 2
elseif (num%3 == 0) then
	largest = 3
else
	for i = 5, floor(sqrt(num)), 2 do
		if IsPrime(i) and (num%i == 0) then 
			largest = i
		end
	end	
end

--We've Done It
print("The Largest Prime Divisor of "..num.." is "..largest)


