--[[
Problem No. 52
 Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

Thursday, February 02, 2012
]]--

--Sub Routines
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

--The Main Loop
for i = 100000, 200000 do
	if isPerm(i, 2*i) then
		if isPerm(i, 3*i) then
			if isPerm(i, 4*i) then
				if isPerm(i, 5*i) then
					if isPerm(i, 6*i) then
						--We've Done It!!
						print(i, 2*i, 3*i, 4*i, 5*i, 6*i)
						break;
					end
				end
			end
		end
	end
end