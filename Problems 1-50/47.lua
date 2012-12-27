--[[
Problem No. 47
 Find the first four consecutive integers to have four distinct primes factors. 

Wednesday, January 25, 2012
]]--

--Sub Routines
function pFactors(n)
	local pFac, p = {}, 0;
	--Remove any factor of 2
	if n%2 == 0 then
		while n%2 == 0 do
			n, p = n/2, p+1;
		end	
		pFac[#pFac + 1] = "2^"..p
	end
	
	--The Number was a perfect power of 2
	if n~=1 then
		--Remove all factor of a number
		for i = 3, math.floor(n^0.5), 2 do
			if n%i == 0 then
				p = 0;
				while n%i == 0 do
					n, p = n/i, p+1;
				end
				pFac[#pFac + 1] = i.."^"..p
			end
		end
	end
	
	--The number left is prime itself
	if n~=1 then pFac[#pFac + 1] = n.."^1" end
	
	return pFac
end

function has4primes(n)
	return table.getn(pFactors(n)) == 4
end

--The Answer
local ans;

sT = os.clock()
--The Main Loop
for i = 210, 200000 do
	if has4primes(i) then
		if has4primes(i+1) then
			if has4primes(i+2) then
				if has4primes(i+3) then
					ans = i; break
				end
			end
		end
	end
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It!!
print(ans.." = "..table.concat(pFactors(ans)," "))
print((ans+1).." = "..table.concat(pFactors(ans+1)," "))
print((ans+2).." = "..table.concat(pFactors(ans+2)," "))
print((ans+3).." = "..table.concat(pFactors(ans+3)," "))