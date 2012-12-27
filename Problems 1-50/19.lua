--[[
Problem No. 19
 How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

Friday, January 13, 2012
]]--

--Global Declarations
local floor = math.floor
local ceil = math.ceil

--Sub Routines
function dayOfWeek(d, m, y)
	local tMonth = {0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5};
	local cent = floor(y/100);
	return ((((ceil((cent+1)/4)*4)-1)-(cent))*2 + (y%100) + floor((y%100)/4) + tMonth[m] + d)%7;
end

--The Result Variable
sun = 0;

--The Main Loop
for year = 1901, 1999 do
	for mon = 1, 12 do
		if dayOfWeek(1, mon, year) == 0 then
			sun = sun + 1;
		end
	end
end

--We've Done It!!
print(sun);