--[[
Problem No. 59
 Using a brute force attack, can you decrypt the cipher using XOR encryption?

Saturday, January 21, 2012
]]--

--Global Declarations
local floor = math.floor;
local char, byte = string.char, string.byte;

--Sub Routines
function toBin(n)
	if n == 0 then return "0" end
	local q, r, bin = n, 0, ""; 
	while (q ~= 1) do
		r, q = q%2, floor(q/2);
		bin = r..bin;
	end; return "1"..bin;
end

function toDec(s)
	local n = 0;	
	for i = 1, #s do
		n = n + ((s:sub(i, i)) * (2^(#s-i)))
	end; return n;
end

function xor(m, n)
	if m == 0 then return n
	elseif n == 0 then return m end
	local a, b, ans = toBin(m), toBin(n), "";
	
	if #a > #b then
		b = string.rep(0, #a-#b)..b;
	elseif #b > #a then
		a = string.rep(0, #b-#a)..a;
	end
	
	for i = 1, #a do
		if a:sub(i, i) == b:sub(i, i) then
			ans = ans..0
		else
			ans = ans..1
		end
	end; return toDec(ans);
end

--Read File Data
local f = io.open("p59-Cipher.txt");
local cipherData = f:read("*all"); f:close();

--Our Answers
local ans, key, keyIndex = 0, "god", 0;

--The Main Loop
for num in cipherData:gmatch("%d+") do
	ans = ans + xor(tonumber(num), byte(key:sub(keyIndex+1)))
	keyIndex = (keyIndex + 1)%3
end

--I've Done It!!
print(ans)

-- for i = 97, 122 do
	-- for j = 97, 122 do
		-- for k = 97, 122 do
			-- local key = char(i,j,k);			
		-- end
	-- end
-- end