--[[
Problem No. 69
 Find the value of n = 1,000,000 for which n/ø(n) is a maximum.

Wednesday, February 01, 2012
]]--

--Global Declarations
local floor = math.floor

--Sub Routines
function eulTot(n)
	local resNum, resDen = n, 1
	if n%2 == 0 then
		resNum, resDen = resNum * (2-1), resDen * 2
		while n%2 == 0 do n = n/2 end	
	end
	if n~=1 then
		for i = 3, floor(n^0.5), 2 do
			if n%i == 0 then
				resNum, resDen = resNum * (i-1), resDen * i
				while n%i == 0 do n = n/i end
			end
		end
	end
	--The number left is prime itself
	if n~=1 then resNum, resDen = resNum * (n-1), resDen * n end	
	return (resNum / resDen)
end

--Our Answers
local maxTot, num = 2, 2

--The Main Loop
for i = 1, 600000 do	--I Changed it after i had actually calculated upto a million ;o)
	local tot = i/eulTot(i)
	if tot > maxTot then
		maxTot, num = tot, i
	end
end

--We've Done It!!
print(maxTot, num, eulTot(num))