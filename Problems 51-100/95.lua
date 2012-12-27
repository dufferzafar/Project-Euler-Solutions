--[[
Problem No. 95
 Find the smallest member of the longest amicable chain with no element exceeding one million.

Wednesday, February 01, 2012
]]--

--Global Declarations
local floor = math.floor

--Sub Routines
function pFactors(n)
	local pFac, p = {}, 0
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
		for i = 3, floor(n^0.5), 2 do
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
	
	return pFac;
end

function sumDiv(n)
	if n == 0 then return 0 end
	local pFac = pFactors(n);
	local sDiv = 1;
	for i = 1, #pFac do
		local posPoint = pFac[i]:find("%.");
		local a, p = pFac[i]:sub(1, posPoint-1), pFac[i]:sub(posPoint+1, #pFac[i]);
		sDiv = sDiv * ((a^(p+1) - 1)/(a - 1))
	end; return sDiv;
end

--Our Answers
local maxChain, lNum = 5, 12496

for i = 10000, 20000 do
	local  n, cnt = i, 0;
	local terms = {};
	repeat
		local sumN = sumDiv(n)-n
		
		if sumN < n/2 or sumN > 1000000 or (terms[sumN] and n ~= i) then			
			cnt = 0; break;
		end
		-- print(sumN)
		n, cnt, terms[sumN] = sumN, cnt + 1, true;
	until n == i
	
	if cnt > maxChain then maxChain, lNum = cnt, i; print(lNum, maxChain) end
end