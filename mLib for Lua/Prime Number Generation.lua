local function isPrime(x)
	if (x%3 == 0) then return false
	else
		local f = 5;
		while f <= math.floor(x^0.5) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end

	return true
end

local tPrimes = {2, 3}

sT = os.clock()
for i = 5, 1000000, 2 do
	if isPrime(i) then
		tPrimes[#tPrimes + 1] = i
	end
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")

print(#tPrimes, tPrimes[#tPrimes])

