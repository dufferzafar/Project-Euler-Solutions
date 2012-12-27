--[[
Problem No. 58
 What is the length of the spiral for which the ratio of primes on the diagonals falls below 10%?

Tuesday, February 14, 2012
]]--

--Sub Routines
function isPrime(x)
	if (x==2) or (x==3) then return true
	elseif (x%3 == 0) then return false
	elseif (x%2 == 0) then return false
	else
		local f = 5;
		while f <= math.floor(x^0.5) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end; return true
end

--Our Answers
local n, pCount = 3, 3

--The Main Loop
while (pCount/(4*(n-1) + 1) > 0.1) do
	if isPrime(4*(n-1)*(n-1) + 1) then	pCount = pCount + 1 end
	if isPrime(2*(n-1)*(n-1 + n) + 1) then	pCount = pCount + 1 end
	if isPrime(2*(n-1)*(n-1 + n-2) + 1) then	pCount = pCount + 1 end
	n = n + 1
end

--We've Done It!!
print("Answer is - "..(n + n-1))