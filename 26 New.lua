--[[
Problem No. 26
 Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
 
Saturday, January 21, 2012
]]--

--Global Declarations
local mod = math.mod

--The isPrime Function
function isPrime(x)
	if (x%3 == 0) then return false
	else
		local f = 5;
		while f <= math.floor(math.sqrt(x)) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end; return true
end

--Modular Exponentiation
function modExp(a, b, c)
    local x, y, z = 1, a, b
    while z ~= 0 do
        if z%2 == 0 then
			z, y = z/2, (y^2) % c;
        else
			z, x = z-1, (x*y) % c;
        end
    end
    return x
end

--Recurring Period of a 1/p
function rPeriod(p)
	--Solving the congruence 10^i = 1 (mod p)
	for i = 1, math.floor(math.sqrt(p-1)) do
		if ((p-1)%i) == 0 then
			if modExp(10, i, p) == 1 then
				return i
			elseif modExp(10, (p-1)/i, p) == 1 then
				return ((p-1)/i)
			end
		end
	end
end

--The Answer and its Period (currently the Winner is '7' as it has a period of '6' digits)
local ans, largestPeriod = 7, 6;

-- sT = os.clock()
--The Main Loop
for p = 7, 9999, 2 do
	if isPrime(p) then
		x = rPeriod(p);	
		if x > largestPeriod then
			ans, largestPeriod = p, x;			
			if x == p-1 then break end
		end
	end
end
-- eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It!!
-- print("1/"..ans.." has a period of "..largestPeriod.." decimal digits.")

--Testing Answer
-- if modExp(10, largestPeriod, ans) == 1 then print("It has been verified again.") end
