--[[
Problem No. 17
 If all the numbers from 1 to 1000 were written out in words, how many letters would be used? 

Friday, January 27, 2012
]]--

--Global Declarations
local str = tostring
local int = tonumber

--Number of Letters in  The 'Numbers'
local tOnes = {0, 3, 3, 5, 4, 4, 3, 5, 5, 4, 3, 6, 6, 8, 8, 7, 7, 9, 8, 8}
local tTens = {0, 3, 6, 6, 5, 5, 5, 7, 6, 6}

--Number of Letters in a Number
function numLetter(n)
	local s = str(n);
	return tOnes[int(s:sub(1,1)) + 1] + 10 + tTens[int(s:sub(2,2)) + 1] + tOnes[int(s:sub(3,3)) + 1]
end

-- print(numLetter(90))

local sum = 0

--The Main Loop
for i = 1, 999 do
	local s = str(i)
	
	if i < 20 then
		sum = sum + tOnes[i+1]
	elseif i < 100 then
		sum = sum + tTens[int(s:sub(1,1)) + 1] + tOnes[int(s:sub(2,2)) + 1]
	else
		if i%100 == 0 then
			sum = sum + tOnes[int(s:sub(1,1)) + 1] + 7
		else
			sum = sum + tOnes[int(s:sub(1,1)) + 1] + 10 + tTens[int(s:sub(2,2)) + 1] + tOnes[int(s:sub(3,3)) + 1]
		end
	end
end

--We've Done It!!
print(sum + 11)