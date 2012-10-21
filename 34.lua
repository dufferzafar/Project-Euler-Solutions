--[[
Problem No. 34
 Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Wednesday, January 18, 2012
]]--

tFactorial = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880}

--Sub Routines
function sumFacDigits(n)
	local s, sum = tostring(n), 0;
	for i = 1, #s do
		sum = sum + tFactorial[tonumber(string.sub(s, i, i)) + 1]
	end; return sum
end

--The Sum
sum = 0;

--The Main Loop
for i = 3, 50000 do
	if i == sumFacDigits(i) then
		sum = sum + i; print("Found - ".. i)
	end
end

--We've Done It!!
print("Their Sum is "..sum);