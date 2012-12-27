--[[
Problem No. 38
 What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product
 of an integer with (1,2, ... , n) where n > 1?

Friday, January 27, 2012
]]--

--Global Declarations
local max = math.max

--Sub Routines
function isPandig(n)
	local s = tostring(n);
	for i = 1, #s do
		_, d = string.gsub(s, i, i);
		if d ~= 1 then return false	end;
	end; return true
end

local nGreat, n = 918273645, ""

--The Main Loop
for i = 10, 9999 do
	if i < 99 then
		n = i..(i*2)..(i*3)..(i*4)
		if isPandig(n) then
			nGreat = max(nGreat, tonumber(n))
		end
	elseif i < 999 then
		n = i..(i*2)..(i*3)
		if isPandig(n) then
			nGreat = max(nGreat, tonumber(n))
		end
	else
		n = i..(i*2)
		if isPandig(n) then
			nGreat = max(nGreat, tonumber(n))
		end
	end
end

--We've Done It!!
print(nGreat)