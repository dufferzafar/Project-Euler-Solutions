--[[
Problem No. 12
 What is the value of the first triangle number to have over five hundred divisors?
 
Monday, January 16, 2012
]]--

--Global Declarations
floor = math.floor
sqrt = math.sqrt

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
	--Remove all factor of a number
	for i = 3, floor(sqrt(n)), 2 do
		if n%i == 0 then
			p = 0;
			while n%i == 0 do
				n, p = n/i, p+1;
			end
			pFac[#pFac + 1] = i.."."..p
		end
	end
	--The number left is prime itself
	if n~=1 then pFac[#pFac + 1] = n..".1" end
	
	return pFac
end

function nDivisors(n)
	local pFac = pFactors(n);
	local nDiv = 1;
	for i = 1, #pFac do
		posPoint = string.find(pFac[i], "%.");
		nDiv = nDiv * ((string.sub(pFac[i], posPoint+1, string.len(pFac[i]))) + 1);
	end
	return nDiv
end

--The Answer
ans = 0;

--The Main Loop
sT = os.clock()
for i = 1, 50000 do 
	if nDivisors((i^2 + i)/2) > 500 then
		ans = i; break
	end
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It
-- print(((ans^2 + ans)/2).." - "..ans.."th Triangular Number has "..nDivisors((ans^2 + ans)/2).." factors.")