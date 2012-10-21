--[[
Problem No. 44
 Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference is pentagonal
 and D = |Pk - Pj| is minimised; what is the value of D?

Wednesday, January 25, 2012
]]--

--Global Declarations
local sqrt = math.sqrt
local floor = math.floor
local abs = math.abs

--Sub Routines
local function isPent(n)
	local pN = (1 + sqrt(1 + 24*n))/6;
	return pN == floor(pN);
end

function pentNum(n)
	return (1 + sqrt(1 + 24*n))/6
end

--Variables
local tPent, flag = {}, true;
local ans;
sT = os.clock()
--Generate first 5000 pentagonal numbers
for i = 1, 5000 do
	tPent[i] = (i*(3*i - 1))/2;
end

--The Main Loop
for i = 1, #tPent - 1 do
	for j = i+1, #tPent do
		if isPent(tPent[i] + tPent[j]) then
			if isPent(abs(tPent[i] - tPent[j])) then
				-- print("Found -> P("..i..") + P("..j..") = P("..pentNum(tPent[i] + tPent[j])..")")
				-- print("Found -> P("..i..") - P("..j..") = P("..pentNum(abs(tPent[i] - tPent[j]))..")")
				ans = abs(tPent[i] - tPent[j]);
				flag = false; break; --Breaking from inner loop
			end
		end
	end
	if not flag then break end --Breaking from outer loop
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")

--We've Done It!!
print(ans)