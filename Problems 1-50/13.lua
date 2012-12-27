--[[
Problem No. 13
 Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
 
Thursday, January 12, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\?.lua"
require("BigNum v2") --My Own BigNum Library

-- The Sum
local sum = bigNum.new(0);

-- The Main Loop
for line in io.lines("p13-Numbers.txt") do 
	sum = sum + bigNum.new(line)
end

-- We've Done It!!
print(tostring(sum):sub(1,10))