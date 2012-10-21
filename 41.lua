--[[
Problem No. 41
 What is the largest n-digit pandigital prime that exists?

NOTE:-
 Going by the definition of a pandigital number, 
 it would contain all the digits from 0 to n exactly once.
 
 A 9 digit pandigital number would be like 123456789
 The Digit sum of that number is 1+2+3+4+5+6+7+8+9 = 45 = 9 (4+5)
 So, Any 9 digit pandigital number will be divisible by 9.
 
 Similarly 8 digit pandigitals would also be divisible by 9.
 
 So, We begin checking 7 digit ones and that too from the last,
 The greatest 7 digit pandigital is obviously 7654321.
 
Saturday, January 14, 2012
]]--

--Global Declarations
floor = math.floor
sqrt = math.sqrt
gsub = string.gsub
str = tostring
int = tonumber

--IsPrime Function
function isPrime(x)
	if (x%3 == 0) then return false
	else
		local f = 5;
		while f <= floor(sqrt(x)) do
			if (x%f) == 0 then return false, f end
			if (x%(f+2)) == 0 then return false, f+2 end
			f = f + 6;
		end
	end
	return true
end

function isPandigital(n)
	s = tostring(n);
	for i = 1, #s do
		_, d = gsub(s, i, i);
		if d ~= 1 then return false	end;
	end
	return true
end

--The Main Loop
for i = 7654321, 1234567, -2 do
	if isPandigital(i) then
		if isPrime(i) then
			-- We've Done It
			print(i); break;
		end
	end
end
