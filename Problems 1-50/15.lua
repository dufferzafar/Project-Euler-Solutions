--[[
Problem No. 15
 How many routes are there through a 20×20 grid?

Friday, January 06, 2012
]]--

--Sub Routines
function fact(n)
  return n > 0 and n * fact(n-1) or 1
end 

--We've Done It !!
print(fact(40)/(fact(20)^2))