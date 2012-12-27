--[[
	Set:
		(i)		Union*
		(ii)	Intersection
		(iii)	NoOfSubsets
		(iv)	IsSubset*
		(v)		RemoveDuplicates*
		(vi)	Sort
		(vi)	AreEqual*
		(vii)	ToString*
]]--

--The Set Library
Set = {};

--- Creates a new set from a standard lua table.
-- @param x The source of the new set, a Table.
-- @return A set that can be used in other operations.
function Set.new(tab)
	local obSet = {}
	if tab then
		for _, v in ipairs(tab) do
			obSet[v] = true
		end		
	end
	
	--Connect set to its meta-methods
	setmetatable(obSet, Set.mt)
	
	return obSet
end

function Set:union(s)
	local res = Set.new()
	for k in pairs(self) do res[k] = true end
	for k in pairs(s) do res[k] = true end
	return res
end

function Set:intersec(s)
	local res = Set.new()
	for k in pairs(self) do res[k] = s[k] end
	return res
end

function Set.sub(s1,s2)
	local res = Set.new()
	for k in pairs(s1) do 
		if not s2[k] then
			res[k] = s1[k]
		end
	end; return res
end

local function bubbleSort(t)
	local change, iCount = false, #t
	repeat
		change, iCount = false, iCount - 1
		for i = 1, iCount do
			if t[i] > t[i + 1] then
				t[i], t[i + 1] = t[i + 1], t[i]
				change = true
			end
		end
	until change == false
end

function Set.tostring(s1)
	local res = {}
	for k in pairs(s1) do
		res[#res + 1] = k
	end; bubbleSort(res);
	return "{"..table.concat(res, ",").."}"
end

--The Set Meta-Table
Set.mt = {	__index = Set,
			__add = Set.union,
			__mul = Set.intersec,
			__sub = Set.sub,
			__tostring = Set.tostring
};

local s = Set
--###################################################
--				    TESTING TESTING
--###################################################
x = s.new({1,2,3,9,81,810})
y = s.new({1,2,3,23})
-- print(x, y); 
print(x+y);
-- print(x*y); 
-- print(x-y)
-- print(y-x)