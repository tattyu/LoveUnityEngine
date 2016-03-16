GameObject = class(GameObject)

function GameObject:init(active)
	if (active == nil) then active = true end
	self.transform = Transform(self)
	self.activeSelf = active
end

function GameObject:awake()
end

function GameObject:start()
end

function GameObject:update()
end

function GameObject:renderer()
end
