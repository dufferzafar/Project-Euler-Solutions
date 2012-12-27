--[[
Problem No. 36
 Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

Thursday, January 19, 2012
]]--

--Global Declarations
local floor = math.floor
local str = tostring

--Sub Routines
function isPalindrome(s)
	return s == s:reverse()
end

function toBin(num)
	local q, r, bin = num, 0, "";
	while (q ~= 1) do
		r, q = q%2, floor(q/2);
		bin = r..bin;
	end; return "1"..bin;
end

--The Sum
sum = 0;

--The Main Loop
for i = 1, 1000000 do
	if isPalindrome(str(i)) then
		if isPalindrome(toBin(i)) then --I could've done it by a AND condition but NO :0
			sum = sum + i; print("Found - "..i.."\t"..toBin(i))
		end
	end
end

--We've Done It!!
print("Their Sum is "..sum);