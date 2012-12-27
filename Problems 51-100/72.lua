--[[
Problem No. 69
 How many elements would be contained in the set of reduced proper fractions for d = 1,000,000?

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
local ans = 0

--The Main Loop
for i = 2, 1000000 do
	ans = ans + eulTot(i)
end

--We've Done It!!
print(ans)