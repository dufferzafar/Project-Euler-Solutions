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

--The Answer and its Period (currently the Winner is '7' as it has a period of '6' digits)
local ans, lPeriod = 7, 6;
local continue = true;

--The Main Loop
for p = 997, 11, -2 do
	if isPrime(p) then
	
		--Solving the congruence 10^i = 1 (mod p)		
		for i = 2, p-1 do
			if modExp(10, i, p) == 1 then
				if i > lPeriod then
					ans, lPeriod = p, i;
					
					if i == p-1 then
						continue = false
					end
					
					break;
				end
			end
		end
		
	end
	
	if not continue then break end
end

--We've Done It!!
print("1/"..ans.." has a period of "..lPeriod.." decimal digits.")