--[[
Problem No. 35
 How many circular primes are there below one million?

Monday, January 23, 2012
]]--

--Global Declarations
local str = tostring
local int = tonumber

--IsPrime Function
local function isPrime(x)
	if (x < 2) then return false 
	elseif (x==2) or (x==3) then return true
	elseif (x%2 == 0) then return false
	elseif (x%3 == 0) then return false
	else
		local f = 5;
		while f <= math.floor(math.sqrt(x)) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end; return true
end

local function genCircular(n)
	local tCirc, s = {n}, str(n);
	for i = 1, #s-1 do
		tCirc[i + 1] = s:sub(2, #s)..s:sub(1,1);
		s = str(tCirc[i + 1]);
	end; return tCirc
end

local function isCircularPrime(n)
	local tCirc = genCircular(n);
	for j = 1, #tCirc do
		if not isPrime(int(tCirc[j])) then
			return false;
		end
	end; return true
end

--The Number of Circular Primes (upto 100)
local cPrimes = 13;

--The Main Loop
for i = 101, 1000000, 2 do
	if isPrime(i) then
		if isCircularPrime(i) then
			cPrimes = cPrimes + 1;
			print(i)
		end
	end
end

--We've Done It
print("There are "..cPrimes.." circular primes below one million.")