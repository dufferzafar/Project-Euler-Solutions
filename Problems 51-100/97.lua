--[[
Problem No. 97
 Find the last ten digits of the non-Mersenne prime: 28433 × 2^7830457 + 1.

Monday, January 16, 2012
]]--

--Sub Routines
function modExp(x, pow, N)
	local m = x;
	for i=2, pow do m = (m*x)%(N) end
	return m
end

digits = (modExp(2, 7830457, 10^10)*28433)%(10^10) + 1
print("The last ten digits of 28433 * 2^7830457 + 1 are "..digits)