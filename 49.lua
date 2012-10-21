--[[
Problem No. 49
 What 12-digit number do you form by concatenating the three terms in this sequence?

Thursday, January 05, 2012
]]--

--Global Declarations
local floor = math.floor
--Sub Routines
local function isPrime(x)
	if (x%3 == 0) then return false
	else
		local f = 5;
		while f <= floor(x^0.5) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end; return true
end

local function isPerm(a, b) --isPermutation
	local s, t = tostring(a), tostring(b)
	if #s ~= #t then return false
	else
		for i = 1, #s do
			local _, m = s:gsub(s:sub(i,i), s:sub(i,i))
			local _, n = t:gsub(s:sub(i,i), s:sub(i,i))
			if m ~= n then return false end
		end
	end; return true
end

--The Prime Sieve
local tPrimes = {};

--All 4 digit primes
for i = 1001, 10000, 2 do
	if isPrime(i) then
		tPrimes[#tPrimes+1] = i
	end
end

--The Main Loop
for i = 1, #tPrimes-1 do
	for j = i+1, #tPrimes do
		if isPrime(((2*tPrimes[j]) - tPrimes[i])) then
			if tPrimes[i] ~= 1487 and isPerm(tPrimes[i], tPrimes[j]) and isPerm(tPrimes[i], ((2*tPrimes[j]) - tPrimes[i]))then
				print(tPrimes[i], tPrimes[j], ((2*tPrimes[j]) - tPrimes[i])); --We've Done It!!
			end
		end
	end
end