--[[
Problem No. 56
 Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?

Saturday, February 04, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\?.lua"
require("BigNum") --My Own BigNum Library

--Sub Routines
function pow(b, e)
	local m = bigNum.new(b);
	for i = 2, e do m = m * b end; return m
end

--Our Answers
local maxdSum = 1

--The Main Loop
for b = 95, 99 do
	local dSum = pow(99, b):dSum()
	if dSum > maxdSum then
		maxdSum = dSum
	end
end

--We've Done It!!
print(maxdSum)