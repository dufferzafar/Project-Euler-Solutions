--[[
Problem No. 31
 How many different ways can £2 be made using any number of coins?

Tuesday, January 24, 2012
]]--

--The Total Number of Ways
local nWays = 0;
local target = 200;

--The Main Loop
for a = 200, 0, -200 do
	for b = a, 0, -100 do
		for c = b, 0, -50 do
			for d = c, 0, -20 do
				for e = d, 0, -10 do
					for f = e, 0, -5 do
						for g = f, 0, -2 do
                     nWays = nWays + 1
						end
					end
				end
			end
		end
	end
end

--We've Done It!!
print(nWays);
