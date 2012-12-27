--[[
Problem No. 55
 How many Lychrel numbers are there below ten-thousand?

Wednesday, February 01, 2012
]]--

--The Add Function
local function add(a, b)
	local ans, carry = "", 0
	if #a < #b then	a = string.rep("0", #b-#a)..a
	elseif #b < #a then	b = string.rep("0", #a-#b)..b end
	for i = #a, 1, -1 do
		local m, n = a:sub(i, i), b:sub(i, i);
		if i ~= 1 then
			ans = ((carry + m + n) % 10)..ans;
		else
			ans = (carry + m + n)..ans;
		end
		carry = math.floor((carry + m + n) / 10)
	end; return ans;
end

local function isPalin(s)
	return s == s:reverse()
end

local function isLychrel(n)
	local a = tostring(n);
	for i = 1, 24 do --You could change the limit to 50 ;)
		a = add(a, a:reverse())
		if isPalin(tostring(a)) then
			return false
		end
	end; return true
end

-- Our Answer
cnt = 0

-- The Main Loop
for i = 1, 10000 do
	if isLychrel(i) then cnt = cnt + 1 end
end

--We've Done It!!
print(cnt)
