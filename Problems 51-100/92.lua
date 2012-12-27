--[[
Problem No. 92
 
Saturday, February 04, 2012
]]-- 8581146

--Global Declarations
local str = tostring
local int = tonumber
local gmatch = string.gmatch

--Our Answer
local sqr, found = {0,1,4,9,16,25,36,49,64,81}, 0
local s, x = 0, 0

sT = os.clock()
--The Main Loop
for i = 2, 100000 do
	s, x = i, 0
	repeat
		for d in gmatch(str(s), "%d") do x = x + sqr[d+1] end		
		if x == 89 then found = found + 1; break end		
		s, x = x, 0;
	until s == 1
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It!!
print(found)