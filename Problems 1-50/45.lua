--[[
Problem No. 45
 After 40755, What is the next triangle number that is also pentagonal and hexagonal.

Thursday, January 12, 2012
]]--

--Global Declarations
sqrt = math.sqrt
floor = math.floor

--Sub Routines
function isInt(a)
	return a == floor(a)
end

-- sT = os.clock()
--The Main Loop
for x = 1, 60000 do
	local y = (1 + sqrt(12*x^2 + 12*x + 1))/6
	local z = (1 + sqrt(12*y^2 - 4*y + 1))/4	
	
	--We've Done It!!
	if isInt(y) and isInt(z) then
		print((x^2 + x)/2)
	end
end
-- eT = os.clock(); print((eT - sT)*1000 .. " msec")