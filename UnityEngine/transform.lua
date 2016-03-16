Transform = class()

function Transform:init(gameObject)
	self.localPosition = Vector3(Vector3.zero)
	self.position = Vector3(Vector3.zero)
	self.localScale = Vector3(Vector3.one)
	self.scale = Vector3(Vector3.one)
	self.localEulerAngles = Vector3(Vector3.zero)
	self.eulerAngles  = Vector3(Vector3.zero)
	self.parent = nil
	self.child = {}
	self.gameObject = gameObject
end

