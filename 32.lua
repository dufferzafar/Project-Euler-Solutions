--[[
Problem No. 32
 Find the sum of all 'products' whose multiplicand/multiplier/product identity
 can be written as a 1 through 9 pandigital.

Wednesday, January 25, 2012
]]--

--Sub Routines
local function isPan(n)
	local s = tostring(n);
	if #s ~= 9 then return false end
	for i = 1, 9 do
		_, d = string.gsub(s, i, i);
		if d ~= 1 then return false	end;
	end; return true
end

local function isPan2(n)
	local s = tostring(n);
	for i = 1, #s do
		_, d = string.gsub(s, s:sub(i, i), s:sub(i, i));
		if d ~= 1 then return false	end;
	end; return true
end

--The Pandigitals
local tPans, sum = {}, 0

-- The Main Loop
for i = 1, 2000 do
	for j = i+1, 2000 do
		if isPan2(i) and isPan2(j) then
			if isPan(i..j..(i*j)) then
				tPans[i*j] = i*j;
				-- print(i.." * "..j.." = "..(i*j))
			end
		end
	end
end

--Sum up all those numbers
for _, num in next, tPans do
	sum = sum + num;
end

--We've Done It!!
print(sum)