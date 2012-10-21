--[[
Problem No. 10
 Calculate the sum of all the primes below two million.

Thursday, January 05, 2012
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

--The Prime Sum (2 & 3 are already included)
sum = 2+3

--The Main Loop
-- sT = os.clock()
for i = 5, 2000000, 2 do
	if IsPrime(i) then
		sum = sum + i
	end
end
-- eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It
print("The Sum of all the primes below 20,00,000 is "..sum)
