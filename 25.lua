--[[
Problem No. 25
 What is the first term in the Fibonacci sequence to contain 1000 digits?
 
Saturday, January 14, 2012
]]--

package.path = package.path..";..\\mLib for Lua\\?.lua"
require("BigNum v2") --My Own BigNum Library

--The First Terms of Fibonacci Series
local a, b, term = bigNum.new(1), bigNum.new(1), 2;

--The Main Loop
while b:digits() < 1000 do
	a, b = b, a + b;
	term = term + 1;
end

--We've Done It!!
print(term)