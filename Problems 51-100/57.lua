--[[
Problem No. 57
 In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?

Monday, February 06, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\?.lua"
require("BigNum") --My Own BigNum Library

--Our Answers
local num, den, found = bigNum.new(3), bigNum.new(2), 0

--The Main Loop
for i = 2, 1000 do
	num, den = num + (den * 2) , num + den
	if num:nDigits() > den:nDigits() then found = found + 1 end
end

--We've Done It!!
print(found)