--[[
Problem No. 20
 Find the sum of the digits in the number 100!

Thursday, January 12, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\?.lua"
require("BigNum v2") --My Own BigNum Library

--The Sum
local res = bigNum.new(1);

--The Main Loop
for i = 1, 100 do
	res = res * i
end

--We've Done It!!
print("The sum of the digits in the number 100! is "..res:dSum())