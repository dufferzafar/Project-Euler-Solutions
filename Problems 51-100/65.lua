--[[
Problem No. 65
 Find the sum of digits in the numerator of the 100th convergent of the continued fraction for e.

Tuesday, February 14, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\BigNum\\?.lua"
require("BigNum v2") --My Own BigNum Library

--Our Answers
local num1, den1 = bigNum.new(2), bigNum.new(1)
local num2, den2 = bigNum.new(3), bigNum.new(1)

local k, term1, term2 = 1, 1, 1

-- The Main Loop
for i = 2, 50 do
	if i%3 == 2 then
		k, term1, term2 = k+1, 2*k, 1
	elseif i%3 == 0 then
		k, term1, term2 = k+1, 1, 2*k
	else
		term1, term2 = 1, 1
	end
	
	num1, den1 = num1 + num2*term1, den1 + den2*term1
	num2, den2 = num2 + num1*term2, den2 + den1*term2
end

-- We've Done It!!
print(num2:dSum())