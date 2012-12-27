--[[
Problem No. 39
 If p is the perimeter of a right angle triangle, {a, b, c}, which value, for p <= 1000, has the most solutions?

Tuesday, January 24, 2012
]]--

--Number of solutions for a particular perimeter value
function solutions(p)
	local num = 0;
	for a = 3, math.floor((p-3)/3) do
		for b = a+1, math.floor((p-a-1)/2) do
			if (a^2) + (b^2) == (p-a-b)^2 then
				num = num + 1
				-- print(a, b, p-a-b)
			end
		end
	end; return num
end

--Variables
local ans, gSol = 120, 3;

-- The Main Loop
for i = 12, 1000, 2 do
	local sol = solutions(i)
	if sol > gSol then
		ans, gSol = i, sol
	end
end

--We've Done It!!
print(ans.." has "..gSol.." solutions.")