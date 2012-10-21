--[[
Problem No. 48
 Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

Thursday, January 12, 2012
]]--

--Sub Routines
function lastDigits(x, pow, N)
	local m = x;
	
	for i=2, pow do 
		m = (m*x)%(10^N) 
	end
	
	return m
end

--Sum of The Numbers
local sum = 0;

--The Main Loop
for i = 1, 1000 do
	if i%10 ~= 0 then
		n = lastDigits(i, i, 10);
		sum = (sum+n) % 10^10
	end
end

--We've Done It!!
print("The last ten digits of 1^1 + 2^2 + 3^3 + ... + 1000^1000 are "..sum)
