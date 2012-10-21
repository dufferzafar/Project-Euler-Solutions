--[[
Problem No. 23
 Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
  
Tuesday, January 17, 2012
]]--

--Global Declarations
sub = string.sub
find = string.find

--Sub Routines
function pFactors(n)
	local pFac = {};
	local p = 0;
	--Remove any factor of 2
	if n%2 == 0 then
		while n%2 == 0 do
			n, p = n/2, p+1;
		end	
		pFac[#pFac + 1] = "2."..p
	end
	
	--The Number was a perfect power of 2
	if n~=1 then
		--Remove all factor of a number
		for i = 3, math.floor(math.sqrt(n)), 2 do
			if n%i == 0 then
				p = 0;
				while n%i == 0 do
					n, p = n/i, p+1;
				end
				pFac[#pFac + 1] = i.."."..p
			end
		end
	end
	
	--The number left is prime itself
	if n~=1 then pFac[#pFac + 1] = n..".1" end
	
	return pFac
end

function sDivisors(n)
	local pFac = pFactors(n);
	local sDiv = 1;	
	for i = 1, #pFac do
		posPoint = find(pFac[i], "%.");
		a = sub(pFac[i], 1, posPoint-1);
		p = sub(pFac[i], posPoint+1, string.len(pFac[i]));
		sDiv = sDiv * ((a^(p+1) - 1)/(a - 1))
	end; return sDiv;
end

function isAbun(n)
	return sDivisors(n)-n > n
end

--Locals are FAST!!
local tAbun = {}; 
local canBeWritten = {};
local sum = 0;

--Create a table of all abundant numbers
for i = 2, 28123 do
	if isAbun(i) then
		tAbun[#tAbun + 1] = i;
	end
end

--Find their Sums
for i = 1, #tAbun do
	for j = i, #tAbun do
		if tAbun[i] + tAbun[j] <= 28123 then	
			canBeWritten[tAbun[i]+tAbun[j]] = true;
		else 
			break;
		end
	end
end

--Check which can't be written as sums
for i = 1, 28123 do
	if not canBeWritten[i] then
		sum = sum + i;
	end
end

--We've Done It!
print(sum)