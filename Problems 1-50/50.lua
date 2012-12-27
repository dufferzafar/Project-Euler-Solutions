--[[
Problem No. 50
 Which prime, below one-million, can be written as the sum of the most consecutive primes?

Friday, January 27, 2012
]]--

--Sub Routines
local function isPrime(x)
	if (x < 2) then return false 
	elseif (x==2) or (x==3) then return true
	elseif (x%2 == 0) then return false
	elseif (x%3 == 0) then return false
	else
		local f = 5;
		while f <= math.floor(x^0.5) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end; return true
end

--Variables
local tPrimes = {2, 3};
local tSum = {}; tSum[0] = 0;
local pGreat, nGreat = 953, 21

--Primes upto 5000
for i = 5, 5000, 2 do
	if isPrime(i) then
		tPrimes[#tPrimes+1] = i;
	end
end

--Sum of those primes
for i = 1, #tPrimes do
	tSum[i] = tSum[i-1] + tPrimes[i];
end

--The Main Loop
for i = #tSum, 1, -1 do	
	for j = 1, #tSum-1 do
		if (i-j) > nGreat then
			if tSum[i]-tSum[j] < 1000000 then
				if isPrime(tSum[i] - tSum[j]) then
					pGreat, nGreat = (tSum[i] - tSum[j]), (i-j)
				end
			end
		end
	end
end

--We've Done It!!
print(pGreat.." can be written as the sum of "..nGreat.." consecutive primes.")