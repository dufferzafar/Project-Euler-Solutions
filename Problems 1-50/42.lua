--[[
Problem No. 42
 In a file containing nearly two-thousand common English words, How many are triangle words?

Saturday, January 14, 2012
]]--

--Global Declarations
local sub = string.sub
local byte = string.byte
local floor = math.floor
local sqrt = math.sqrt

--The Total Number
total = 0;

--Sub Routines
function readToTable(fName)
	local file = io.open(fName, "r");
	local tbl, i = {}, 1;	
	for line in file:lines() do tbl[i], i = line, i + 1; end
	file:close(); return tbl;
end

function letterSum(s)
	local sum = 0;
	for i = 1, #s do sum = sum + byte(sub(s, i, i))-64 end
	return sum;
end

function isTriangular(n)
	local x = (-1 + sqrt(8*n + 1))/2
	return x == floor(x);	
end

--Read File
local tWords = readToTable("p42-Words.txt");

--The Main Loop
for i = 1, #tWords do
	local sum = letterSum(tWords[i])
	if isTriangular(sum) then
		total = total + 1;
	end
end

--We've Done It!!
print(total);