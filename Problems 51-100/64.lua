--[[
Problem No. 64
 How many continued fractions for N <= 10000 have an odd period?

Tuesday, February 14, 2012
]]--

--Local Functions
local floor, abs = math.floor, math.abs

--Sub Routines
function surdAsFraction(n) --This is Complex ;)
	local cInt, pInt = 0, floor(n^0.5)
	local tQuo, ans = n - pInt^2, {pInt}
	
	while cInt ~= 2*ans[1] do
		cInt = floor((n^0.5 + pInt) / tQuo)
		pInt = abs(pInt - (tQuo*cInt))
		tQuo = floor((n - pInt^2)/tQuo)
		
		ans[#ans + 1] = cInt
	end; return ans
end

--Our Answers
local oddPeriod = 4

--The Main Loop
for i = 14, 10000 do
	if (i^0.5) ~= floor(i^0.5) then --If Square root is not an integer
		if (#surdAsFraction(i) - 1)%2 ~= 0 then --If the Period is Odd
			oddPeriod = oddPeriod + 1
		end
	end
end

--We've Done It!!
print(oddPeriod)