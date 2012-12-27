--[[
Problem No. 53
 How many, not necessarily distinct, values of  nCr, for 1 < n < 100, are greater than one-million?

Saturday, February 04, 2012
]]--

--Sub Routines
function fac(n)
  return n>0 and n*fac(n-1) or 1
end

function nCr(n, r)
	return fac(n) / (fac(r) * fac(n-r))
end

--Our Answer
local cnt = 0

--The Main Loop
for n = 23, 100 do
	for r = 2, n-1 do
		if nCr(n, r) > 1000000 then cnt = cnt + 1 end
	end
end

--We've Done It!!
print(cnt)