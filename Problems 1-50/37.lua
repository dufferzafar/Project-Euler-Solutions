--[[
Problem No. 37
 Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

Thursday, January 19, 2012
]]--

--The List of All Right Truncatable Primes
local rTruncatable = {23,29,31,37,53,59,71,73,79,233,239,293,311,313,317,373,379,593,599,719,733,739,797,2333,2339,2393,2399,2939,3119,3137,3733,3739,3793,3797,5939,7193,7331,7333,7393,23333,23339,23399,23993,29399,31193,31379,37337,37339,37397,59393,59399,71933,73331,73939,233993,239933,293999,373379,373393,593933,593993,719333,739391,739393,739397,739399,2339933,2399333,2939999,3733799,5939333,7393913,7393931,7393933,23399339,29399999,37337999,59393339,73939133}

--Global Declarations
local floor = math.floor
local sqrt = math.sqrt
local sub = string.sub
local str = tostring
local int = tonumber

--Sub Routines
function isPrime(x)
	if (x < 2) then return false
	elseif (x==2) or (x==3) then return true
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

function isLTruncatable(n)
	s = tostring(n);
	for i = 1, #s-1 do
		if not isPrime(int(sub(s, i+1, #s))) then
			return false
		end
	end; return true
end



--The Sum
sum = 0

--The Main Loop
for i = 1, #rTruncatable do
	if isLTruncatable(rTruncatable[i]) then
		sum = sum + rTruncatable[i]; print("Found - \t"..rTruncatable[i])
	end
end

--We've Done It!!
print("\nTheir Sum is - "..sum);