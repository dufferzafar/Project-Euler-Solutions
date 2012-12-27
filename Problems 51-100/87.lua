--[[
Problem No. 87
 Numbers that can be expressed as the sum of a prime square, cube, and fourth power?

Saturday, February 04, 2012
]]--

--Sub Routines
function isPrime(x)
	if (x%3 == 0) then return false
	else
		local f = 5;
		while f <= math.floor(x^0.5) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end; return true
end

--The Primes 1097343
local tPrimes7071, tPrimes368, tPrimes83, eliminated = {2, 3}, {2, 3}, {2, 3}, {}
local found = 0

--Prime Numbers upto 83
for i = 5, 7071, 2 do
	if i < 84 then 
		if isPrime(i) then tPrimes83[#tPrimes83 + 1] = i end
	end
	if i < 369 then
		if isPrime(i) then tPrimes368[#tPrimes368 + 1] = i end
	end
	if i < 7071 then
		if isPrime(i) then tPrimes7071[#tPrimes7071 + 1] = i end
	end
end

--The Main Loop
for i = 1, #tPrimes7071 do
	for j = 1, #tPrimes368 do
		for k = 1, #tPrimes83 do
			if tPrimes7071[i]^2 + tPrimes368[j]^3 + tPrimes83[k]^4 < 50000000 then
				if not eliminated[tPrimes7071[i]^2 + tPrimes368[j]^3 + tPrimes83[k]^4] then
					eliminated[tPrimes7071[i]^2 + tPrimes368[j]^3 + tPrimes83[k]^4] = true
					found = found + 1
				end
			end
		end
	end
end

--We've Done It!!
print(found)