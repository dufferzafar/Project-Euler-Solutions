--[[
Problem No. 14
 Which starting number, under one million, produces the longest chain?

Wednesday, January 11, 2012
]]--

--Largest Numbers
sLargest = 1;
nLargest = 1;

--The Main Loop
for n = 1, 1000000 do
	local step = 1;
	local m = n;

	while m ~= 1 do
		if m%2 == 0 then m = m/2
		else m = 1 + 3*m end
		
		step = step + 1
	end
	
	if step > sLargest then
		sLargest = step; nLargest = n;
	end
end

--We've Done It!!
print(nLargest.." - "..sLargest)