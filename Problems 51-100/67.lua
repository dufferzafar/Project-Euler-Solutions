--[[
Problem No. 67
 Find the maximum total from top to bottom in a file containing a triangle with one-hundred rows.

Saturday, February 04, 2012
]]--

--Global Declarations
local max = math.max

--Read The Triangular Array From File
local tArr, index = {}, 1;
local file = io.open("p67-Triangle.txt", "r")

for line in file:lines() do
	tArr[index], pos = {}, 1
	for num in line:gmatch("%d+") do
		tArr[index][pos], pos = tonumber(num), pos + 1
	end; index = index + 1;
end

file:close()

-- The Main Loop
for i = #tArr-1, 1, -1 do
	for j = 1, i do
		tArr[i][j] = tArr[i][j] + max(tArr[i+1][j], tArr[i+1][j+1])
	end
end

-- We've Done It!!
print(tArr[1][1])