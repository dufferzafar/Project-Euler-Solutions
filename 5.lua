--[[
Problem No. 5
 What is the smallest number divisible by each of the numbers 1 to 20?

Notes:-
	The Question seemed easy to me;
	So, As a challenge I added an option to set the upperlimit.
	
Friday, January 06, 2012
]]--

--Global Declarations
floor = math.floor
log = math.log
sqrt = math.sqrt

--Sub Routines
function HighestPow(Of, In)
	return floor(log(In)/log(Of))
end

function IsPrime(x)
	if (x%3 == 0) then return false
	else
		for n = 5, floor(sqrt(x)), 2 do
			if (x % n) == 0 then return false end
		end
	end

	return true
end

--The Limit
lim = 20

--The Number
ans = 1*(2^HighestPow(2, lim))*(3^HighestPow(3, lim))

--The Main Code
for i = 5, lim, 2 do
	if IsPrime(i) then
		ans = ans * (i^HighestPow(i, lim))
	end
end

print("The smallest number divisible by each of the numbers 1 to "..lim.." is "..ans)

--[[Checking The Answer
for i=1, lim do
	if ans%i ~= 0 then
		print("Ooooops, "..ans.." is not divisible by "..i)
	end
	--print(ans.." / "..i.." = "..(ans/i))	
end]]--
