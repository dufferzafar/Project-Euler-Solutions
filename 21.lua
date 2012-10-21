--[[
Problem No. 21
 Evaluate the sum of all the amicable numbers under 10000.

Friday, January 13, 2012
]]--

--Global Declarations
local floor = math.floor

--Sub Routines
function sumDiv(n)
	local sum = 1;
	for i = 2, floor(n/2) do
		if (n%i) == 0 then	sum = sum + i end
	end
	return sum
end

--The Sum
sum = 0;

--The Main Loop
for i = 2, 10000 do
	local sumI = sumDiv(i);
	if i == sumDiv(sumI) and (i ~= sumI) then
		sum = sum + i;
	end
end

--We've Done It!!
print(sum);