--[[
Problem No. 46
 What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
 
 Sorry! Goldbach :(

Wednesday, January 18, 2012
]]--

--Global Declarations
floor = math.floor
sqrt = math.sqrt

--Sub Routines
function isPrime(x)
	if (x%3 == 0) then return false
	else
		local f = 5;
		while f <= floor(sqrt(x)) do
			if (x%f) == 0 then return false end
			if (x%(f+2)) == 0 then return false end
			f = f + 6;
		end
	end

	return true
end

--The Main Loop
for i = 9, 1000000, 2  do
	j = 1;
	if not isPrime(i) then	
		while (j < floor(sqrt(i)) - 1) and (2*j*j < i) do
			t = i - (2*j*j);
		
			if isPrime(t) then
				break;
			elseif 2*((j+1)^2) > i then
				print("Found - "..i) --We've Done It!!
			end
		
			j = j + 1;
		end	
	end
end