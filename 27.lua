--[[
Problem No. 27
 Find a quadratic formula that produces the maximum number of primes for consecutive values of n.

Wednesday, January 25, 2012
]]--

--Global Declarations
local max = math.max

--The isPrime Function
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

--Check the quadratic formula
local function eval(a, b)
	local n = 0;
	while n > -1 do --This is NOT an infinite loop, because NO QUADRATIC FORMULA CAN CREATE INFINITE PRIMES.
		if isPrime((n^2) + (a*n) + b) then
			n = n + 1;
		else
			return n
		end
	end
end

--Variables
local b = {2, 3};
local aBest, bBest, nGreat = 1, 41, 40

sT = os.clock()
--Generate Primes upto 1000 (for b)
for i = 5, 1000, 2 do
	if isPrime(i) then
		b[#b + 1] = i
	end
end

--The Main Loop
for i = 1, #b do
	for a = 1, 1000, 2 do
		local n1, n2 = eval(a, b[i]),eval((-1*a), b[i])
		
		if n1 == max(n1, n2, nGreat) then
			aBest, bBest, nGreat = a, b[i], n1
		elseif n2 == max(n1, n2, nGreat) then
			aBest, bBest, nGreat = (-1*a), b[i], n2
		end
	end
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It!!
print("The quadratic formula n^2"..aBest.."n+"..bBest.." produces "..nGreat.." primes, n=0 to n="..(nGreat-1)..".")
print("The real answer is "..math.abs(aBest*bBest)..".")