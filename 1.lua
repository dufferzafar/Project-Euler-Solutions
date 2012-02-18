--[[
Problem No. 1
 Add all the natural numbers below one thousand that are multiples of 3 or 5.

Thursday, January 05, 2012
]]--

--The Sum
sum = 0

--The Main Loop
for i = 1, 999 do
	if (i%3 == 0) or (i%5 == 0) then
		sum = sum + i;
	end
end

--We've Done ItS
print("The Sum of Multiples of 3 or 5 below 1000 is "..sum)