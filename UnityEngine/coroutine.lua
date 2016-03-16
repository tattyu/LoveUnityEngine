local coList={}
local coFlagList={}
local coSize=32
local coWaitList={}

local function getEmpty()
	local id = 0;
	for i=1,coSize do
		if ( coFlagList[i] == nil ) then
			coFlagList[i] = false
		end
		local flg = coFlagList[i]
		if ( flg == false ) then
			id = i
			break
		end
	end
	if ( id == 0 ) then
		id = coSize+1
		coSize=coSize+16
	end
	return id
end

function startCoroutine(func)
	local id = getEmpty()
	coList[id] = coroutine.create( func )
	coFlagList[id] = true
	coWaitList[id] = 0
	return id
end

function yield(handle,seconds)
	if seconds==nil then

	else
		coWaitList[handle] = seconds
	end

	coroutine.yield()
end

function moveNext()
	for i=1,coSize do
		if ( coList[i] ~= nil ) then
			if ( coWaitList[i] ~= nil and coWaitList[i] > 0 ) then
				coWaitList[i] = coWaitList[i] - love.timer.getDelta()
				if ( coWaitList[i] <= 0 ) then
					coroutine.resume(coList[i])
					coWaitList[i] = 0
				end
			else
				coroutine.resume(coList[i])
			end

			if ( "dead" == coroutine.status( coList[i] ) ) then
				coList[i] = nil
				coFlagList[i] = false
				coWaitList[i] = 0
			end
		end
	end
end

