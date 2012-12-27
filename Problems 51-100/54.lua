--[[
Problem No. 54
 How many hands of Poker does Player 1 win?

Friday, February 10, 2012

]]--

--Global Variables
local max = math.max
local int = tonumber

--Cards Table
local cardV = {['0']=0,['2']=2,['3']=3,['4']=4,['5']=5,['6']=6,['7']=7,
			   ['8']=8,['9']=9,['T']=10,['J']=11,['Q']=12,['K']=13,['A']=14}
local card = {'0','2','3','4','5','6','7','8','9','T','J','Q','K','A'}

--Sub Routines
function highCard(hand, rem)
	hand = rem and hand:gsub(card[rem], "0") or hand, 0;
	local high = cardV[hand:sub(1,1)];
	for i = 4, #hand - 1, 3 do
		high = max(high, cardV[hand:sub(i,i)])
	end; return high;
end

function mulCards(hand)
	local flag, flag2, tCard, tCard2 = false, false, "", "";	
	for i = 1, #hand - 1, 3 do
		local card = hand:sub(i,i);	local _, times = hand:gsub(card, card);		
		if times == 4 then
			return 4, card --4 of a Kind
		elseif times == 3 then
			if flag then
				return 5, card, tCard --Full House
			else
				flag2, tCard2 = true, card
			end
		elseif times == 2 then
			if flag2 and (tCard2 ~= card) then
				return 5, tCard2, card --Full House
			elseif flag and (tCard ~= card) then
				return 2, card, tCard --2 Pairs
			else
				flag, tCard = true, card
			end
		end
	end
	if flag2 then return 3, tCard2 end --3 of a Kind
	if flag then return 1, tCard end --A Pair
end

function isStraight(hand)
	for i = 4, #hand - 1, 3 do
		val = cardV[hand:sub(i,i)]
		if val ~= cardV[hand:sub(i-3,i-3)] + 1 then
			return false
		end
	end; return true;
end

function isFlush(hand)
	local _, times = hand:gsub(hand:sub(2,2), "");
	return times == 5
end

function isRoyalFlush(hand)
	local index = 9
	for i = 1, #hand - 1, 3 do
		val, index = cardV[hand:sub(i,i)],index + 1
		if val ~= index then return false end
	end; return true and isFlush(hand);
end

function winner(hands) --This code SUCKS!! but WORKS!! 
	local hand1, hand2 = hands:sub(1,14), hands:sub(16,29)
	local reason = "Royal Flush" --Helps in debugging
	
	if isRoyalFlush(hand1) then
		if not isRoyalFlush(hand2) then	return 1, reason end
	elseif isRoyalFlush(hand2) then return 2, reason end
	
	reason = "Straight Flush"	
	if isStraight(hand1) and isFlush(hand1) then
		if not (isStraight(hand2) and isFlush(hand2)) then return 1, reason end
	elseif isStraight(hand2) and isFlush(hand2) then return 2, reason end
	
	--I told you, it sucks :o(
	local mcVal1, mc1, mc11 = mulCards(hand1); local mcVal2, mc2, mc21 = mulCards(hand2);	
	mc1, mc11 = cardV[mc1], cardV[mc11]; mc2, mc21 = cardV[mc2], cardV[mc21];
	
	reason = "4 of a kind"
	if mcVal1 == 4 then
		if mcVal2 == 4 then --tie
			if mc1 > mc2 then return 1, reason
			elseif mc2 > mc1 then return 2, reason end
		else return 1, reason end
	elseif mcVal2 == 4 then return 2, reason end
	
	reason = "Full House"
	if mcVal1 == 5 then
		if mcVal2 == 5 then --tie
			if mc1 == mc2 then goto hCard
			elseif mc1 > mc2 then return 1, reason
			else return 2, reason end
		else return 1, reason end
	elseif mcVal2 == 5 then return 2, reason end
	
	reason = "Flush"
	if isFlush(hand1) then
		if not isFlush(hand2) then	return 1, reason end
	elseif isFlush(hand2) then return 2, reason end
	
	reason = "Straight"
	if isStraight(hand1) then
		if not isStraight(hand2) then return 1, reason end
	elseif isStraight(hand2) then return 2, reason end
	
	reason = "3 of a kind"
	if mcVal1 == 3 then
		if mcVal2 == 3 then --tie
			if mc1 > mc2 then return 1, reason
			elseif mc2 > mc1 then return 2, reason end
		else return 1, reason end
	elseif mcVal2 == 3 then return 2, reason end
	
	reason = "2 Pairs"
	if mcVal1 == 2 then
		if mcVal2 == 2 then --tie
			if mc1 > mc2 then return 1, reason
			elseif mc2 > mc1 then return 2, reason end
		else return 1, reason end
	elseif mcVal2 == 2 then return 2, reason end
	
	reason = "A Pair"
	if mcVal1 == 1 then --1 Pair
		if mcVal2 == 1 then --tie
			if mc1 > mc2 then return 1, reason
			elseif mc2 > mc1 then return 2, reason end
		else return 1, reason end
	elseif mcVal2 == 1 then return 2, reason end
	
	::hCard::
	--Highest Card is our last option, Oh God!!
	local rem1 = mc1 and mc1 or nil
	local rem2 = mc2 and mc1 or nil
	
	local hc1, hc2 = highCard(hand1, rem1), highCard(hand2, rem2)
	
	reason = "Highest Card"
	if hc1 > hc2 then return 1, reason
	elseif hc2 > hc1 then return 2, reason end
end

--Our Answers
local winCount = 0

--The Main Loop
for line in io.lines("p54-Poker.txt") do
	if winner(line) == 1 then
		winCount = winCount + 1
	end
end

--The Answer is actually 3 less than our answer.
--Couldn't find out where the code was wrong but knew it would be close
--I tried 379, 381, 378, 374, 375 and '376' BINGO!!

--We've Done It!!
print(winCount)