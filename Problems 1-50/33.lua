--[[
Problem No. 33
 If the product of the four fractions is given in its lowest common terms, find the value of the denominator.

Saturday, January 14, 2012
]]--

--Global Declarations
local sub = string.sub
local rep = string.rep
local int = tonumber
local str = tostring

--The Main Loop
for n = 11, 98 do
    for d = n + 1, 99 do
        if (n%10) ~= 0 then
            if str(n):sub(1,1) == str(d):sub(1,1) and
                int(str(n):sub(2,2)) / int(str(d):sub(2,2)) == n / d then
                    print("Found: " .. n .. "/" .. d)
            end
            if str(n):sub(2,2) == str(d):sub(1,1) and
                int(str(n):sub(1,1)) / int(str(d):sub(2,2)) == n / d then
                    print("Found: " .. n .. "/" .. d)
            end
            if str(n):sub(1,1) == str(d):sub(2,2) and
                int(str(n):sub(2,2)) / int(str(d):sub(1,1)) == n / d then
                    print("Found: " .. n .. "/" .. d)
            end
            if str(n):sub(2,2) == str(d):sub(2,2) and
                int(str(n):sub(1,1)) / int(str(d):sub(1,1)) == n / d then
                    print("Found: " .. n .. "/" .. d)
            end
        end
    end
end
