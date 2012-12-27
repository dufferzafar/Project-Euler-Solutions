--[[
Problem No. 81
 

Friday, February 10, 2012
]]--

--Read the file into a matrix
-- local tArr, index = {}, 1;

-- for line in io.lines("p81-Matrix.txt") do
	-- tArr[index], pos = {}, 1
	-- for num in line:gmatch("%d+") do
		-- tArr[index][pos], pos = tonumber(num), pos + 1
	-- end; index = index + 1;
-- end
-- tArr = {{131,673,234,103,18},{201,96,342,965,150},{630,803,746,422,111},{537,699,497,121,956},{805,732,524,37,331}}
tArr = {{1,2,3,4,5}, {6,7,8,9,10}, {11,12,13,14,15}, {16,17,18,19,20}, {21,22,23,24,25}}

--Global Variables
l, k = 0, 4
min, huge = math.min, math.huge

--The Main Loop
for i = #tArr - l, k, -1 do
	for j = k, #tArr do		
		print (i, j, tArr[i][j])
	end
	if k == 1 then 	l = l + 1 else k = k - 1 end
end