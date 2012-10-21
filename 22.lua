--[[
Problem No. 21
 What is the total of all the name scores in the file?

Friday, January 13, 2012
]]--

--Global Declarations
local sub = string.sub
local byte = string.byte

--The Total of The NameScores
total = 0;

--Sub Routines
function readToTable(fName)
	local file = io.open(fName, "r");
	local tbl, i = {}, 1;	
	for line in file:lines() do tbl[i], i = line, i + 1; end
	file:close(); return tbl;
end

function bubbleSort(A)
  local itemCount=#A
  local hasChanged
  repeat
    hasChanged = false
    itemCount=itemCount - 1
    for i = 1, itemCount do
      if A[i] > A[i + 1] then
        A[i], A[i + 1] = A[i + 1], A[i]
      end
        hasChanged = true
    end
  until hasChanged == false
end

function letterSum(s)
	local sum = 0;
	for i = 1, #s do sum = sum + byte(sub(s, i, i))-64 end
	return sum;
end

--Sort
local tNames = readToTable("p22-Names.txt");
bubbleSort(tNames);

--The Main Loop
for i = 1, #tNames do
	total = total + (letterSum(tNames[i]) * i)
end

--We've Done It!!
print(total);