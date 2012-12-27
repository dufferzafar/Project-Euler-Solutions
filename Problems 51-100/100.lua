--[[
Problem No. 100

Monday, January 16, 2012
]]--

--Global Declarations
local floor = math.floor
local sqrt = math.sqrt

--Sub Routines
function isInt(n)
	return n == math.floor(n)
end

function mult(a, b)
	a = tostring(a);local ans, carry = "", 0;
	for i = #a, 1, -1 do
		local m = string.sub(a, i, i)
		if i ~= 1 then
			ans = ((carry + m*b) % 10)..ans;
		else
			ans = ((carry + m*b))..ans
		end
		carry = floor((carry + m*b) / 10);
	end; return ans
end

for i = 10^12, 10^12+10^5 do
	local b = (1+sqrt(2*i*(i-1)))/2
	if isInt(b) then
		if (b*(b-1) == i*(i-1)/2) then
			-- print(b, i-b, i) 756,872,327,473
			print(b.." * "..(b-1).." = "..i.." * "..(i-1).." /2");
			print(mult(b,b-1).." = "..((mult(i,i-1))/2));
			print(math.log10(b*(b-1)),math.log10(i*(i-1)/2))
			break;
		end
	end
end

-- print(mult(45,34)