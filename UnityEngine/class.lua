function class(parent)
	local base = {
	}
	local mt = {
		__call = function(...)
			local mt = setmetatable({},{__index=base})
			mt.init(mt,select(2,...))
			return mt
		end
	}
	if (parent) then
		mt.__index = parent
		mt.super = parent
	end

	return setmetatable(base,mt)
end