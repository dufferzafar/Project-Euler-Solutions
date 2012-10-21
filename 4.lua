--[[
Problem No. 4
 Find the largest palindrome made from the product of two 3-digit numbers.

Tuesday, January 10, 2012
]]--

--Sub Routines
function isPalindrome(str)
	return str == string.reverse(str)
end

--The Largest Palindrome
largest = 909

--The Main Loop
for i = 900, 999 do			--Let's Assume that a number between 900 and 999
	for j = 900, 999 do		--will give a palindrome.
		if isPalindrome(tostring(i * j)) then
			largest = i*j
		end
	end
end

--We've Done It
print(largest)