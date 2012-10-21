--[[
Problem No. 30
 Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

Wednesday, January 18, 2012
]]--

--Sub Routines
function sum5pow(n)
	local s, sum = tostring(n), 0;
	for i = 1, #s do
		sum = sum + (tonumber(string.sub(s, i, i)))^5
	end; return sum
end

--The Sum
sum = 0;

--The Main Loop
for i = 2, 200000 do
	if i == sum5pow(i) then
		sum = sum + i; print("Found - ".. i)
	end
end

--We've Done It!!
print("Their Sum is "..sum);