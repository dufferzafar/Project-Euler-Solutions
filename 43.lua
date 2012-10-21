--[[
Problem No. 43 
 Find the sum of all pandigital numbers with an unusual sub-string divisibility property.
	
Saturday, January 14, 2012
]]--

--Global Declarations
local str = tostring
local int = tonumber

--Sub Routines
function isPan(n)
	local s = tostring(n);
	for i = 1, #s do
		_, d = string.gsub(s, s:sub(i, i), s:sub(i, i));
		if d ~= 1 then return false	end;
	end; return true
end

--The Variables
local tablesFor = {13, 11, 7, 5, 3, 2}
local mTables = {{},{},{},{},{},{},{}}

-- Table of 17
for i = 17, 999, 17 do --Table of 17
	if isPan(i) then
		mTables[1][#mTables[1] + 1] = i
	end
end

--Other Numbers
for h = 1, #mTables-1 do
	for i = 1, #mTables[h] do
		local s = str(mTables[h][i])
		if #s == 2 then
			start = s:sub(1,1); ending = s:sub(2,#s)
		else
			start = s:sub(1,2); ending = s:sub(3,#s)
		end
	--Check if Something can be appended to make it divisible by the number
		for j = 0, 9 do	
			if #start == 1 then
				if int(j.."0"..start)%(tablesFor[h]) == 0 then 
					if isPan(j.."0"..start..ending) then
						mTables[h+1][#mTables[h+1] + 1] = j.."0"..start..ending
					end
				end
			else
				if int(j..start)%(tablesFor[h]) == 0 then 
					if isPan(j..start..ending) then
						mTables[h+1][#mTables[h+1] + 1] = j..start..ending
					end
				end
			end	
		end
	end
end

--Our Answer
local sum = 0;

--Check what else can be appended so that it remains Pandigital
for i = 1, #mTables[7] do
	for j = 0, 9 do
		if isPan(j..mTables[7][i]) then
			sum = sum + int(j..mTables[7][i])
		end
	end
end

--We've Done It!!
print("The sum of all pandigital numbers with that property is "..sum..".")