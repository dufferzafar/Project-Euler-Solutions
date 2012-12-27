--[[
Problem No. 63
 How many n-digit positive integers exist which are also an nth power?

Saturday, February 04, 2012
]]--

--Global Declarations
local floor = math.floor
local log = math.log10

--Our Answer
local cnt = 0

--The Main Loop
for i = 1, 10 do
	for j = 1, 25 do
		if floor(j * log(i)) == j-1 then
			cnt = cnt + 1
		end
	end
end

--We've Done It!!
print(cnt)