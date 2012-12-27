--[[
Problem No. 99
 Which base/exponent pair in the file has the greatest numerical value?

Wednesday, February 01, 2012
]]--

--Global Declarations
local int = tonumber
local log = math.log10

--Open File
file = io.open("p99-BaseExp.txt", "r")

--Our Answers
local lineNo, maxVal = 0, 0
local b, e = 0, 0
local ln = 1; --Temp. Line Number

--The Main Loop
for line in file:lines() do
	local comma = line:find(",");
	local base, exponent = int(line:sub(1, comma-1)), int(line:sub(comma+1, #line))
	if exponent*log(base) > maxVal then
		lineNo, maxVal = ln, exponent*log(base)
		b, e = base, exponent
	end; ln = ln + 1
end;file:close()

--We've Done It!!
print("Line Number:"..lineNo.." i.e "..b.."^"..e.." contains "..(math.ceil(maxVal)).." digits." )