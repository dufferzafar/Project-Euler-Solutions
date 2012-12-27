--[[
Problem No. 7
 Find the 10001st prime.

Thursday, January 05, 2012
]]--

--Global Declarations
floor = math.floor
sqrt = math.sqrt

--IsPrime Function
function IsPrime(x)
	if (x%3 == 0) then return false
	else
		for n = 5, floor(sqrt(x)), 2 do
			if (x % n) == 0 then return false end
		end
	end

	return true
end

--The Prime Counter
pCnt = 2

--The Main Loop
sT = os.clock()
for i = 5, 1000000, 2 do
	if IsPrime(i) then
		pCnt = pCnt + 1
		if pCnt == 10001 then 
			--We've Done It
			print("The 10001st Prime is "..i)
			break
		end
	end
end
eT = os.clock(); print((eT - sT)*1000 .. " msec")
