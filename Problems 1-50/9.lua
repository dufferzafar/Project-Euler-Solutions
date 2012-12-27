--[[
Problem No. 9
 Find the only Pythagorean triplet, {a, b, c}, for which a + b + c = 1000.

Thursday, January 05, 2012
]]--

--The Main Routine
for i = 1, 999 do
	for j = 1, 998 do
		if  (i^2 + j^2 == (1000-i-j)^2) then
			--We've Done it
			print(i..","..j..","..(1000-i-j))
			return
		end
	end
end