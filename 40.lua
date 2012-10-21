--[[
Problem No. 40
 Finding the nth digit of the fractional part of an irrational number.

Tuesday, January 10, 2012
]]--

--Functions
local int = tonumber

--Our Answers
local anStr = {}

--The Main Loop
for i = 1, 200000 do anStr[i] = i end

--The String of Numbers
local s = table.concat(anStr)

--We've Done It!!
print(int(s:sub(10,10))*int(s:sub(100,100))*int(s:sub(1000,1000))*int(s:sub(10000,10000))*int(s:sub(100000,100000))*int(s:sub(1000000,1000000)))