--[[
Problem No. 16
 What is the sum of the digits of the number 2^1000?

Thursday, January 12, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\?.lua"
require("BigNum v2") --My Own BigNum Library

--The Number
local res = bigNum.new(2) ^ 1000;

--We've Done It!!
print("The sum of the digits of the number 2^1000 is "..res:dSum())