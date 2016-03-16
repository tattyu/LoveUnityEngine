Vector3 = class()
function Vector3:init(v1,v2,v3)
	local x,y,z = v1,v2,v3
	if ( v2 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
	end
	self.x,self.y,self.z = x,y,z
end

Vector3.temp = Vector3(0,0,0)
Vector3.zero = Vector3(0,0,0)
Vector3.one = Vector3(1,1,1)
Vector3.right = Vector3(1,0,0)
Vector3.left = Vector3(-1,0,0)
Vector3.up = Vector3(0,1,0)
Vector3.down = Vector3(0,-1,0)
Vector3.forward = Vector3(0,0,1)
Vector3.back = Vector3(0,0,-1)

function Vector3:dump()
	print("vec3:dump",self.x,self.y,self.z)
end

function Vector3:set(v1,v2,v3)
	local x,y,z = v1,v2,v3
	if ( v2 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
	end
	self.x,self.y,self.z = x,y,z
end

function Vector3:dot(v1,v2,v3)
	local x,y,z = v1,v2,v3
	if ( v2 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
	end
	return (self.x * x) +(self.y * y)+(self.z * z)
end

function Vector3:cross(v1,v2,v3)
	local x,y,z = v1,v2,v3
	if ( v2 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
	end
	self.temp.x = self.y*z - self.z*y
	self.temp.y = self.z*x - self.x*z
	self.temp.z = self.x*y - self.y*x
	return temp
end

function Vector3:add(v1,v2,v3)
	local x,y,z = v1,v2,v3
	if ( v2 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
	end
	self.x = self.x + x
	self.y = self.y + y
	self.z = self.z + z

	return self
end

function Vector3:mul(v1,v2,v3)
	local x,y,z = v1,v2,v3
	if ( v2 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
	end
	self.x = self.x * x
	self.y = self.y * y
	self.z = self.z * z
	return self
end

function Vector3:normalize()
	self.temp:set(self)
	self.temp:mul(self)

	local len = math.sqrt(self.temp.x+self.temp.y+self.temp.z)
	if ( len < 0.0000001 ) then
		len = 0
	else
		len = 1.0/len
	end

	self:mul(len,len,len)

	return self
end

function Vector3:magnitude()
	self.temp:set(self)
	self.temp:mul(self)

	local len = math.sqrt(self.temp.x+self.temp.y+self.temp.z)

	return len
end

function Vector3:sqrMagnitude()
	self.temp:set(self)
	self.temp:mul(self)
	return self.temp.x+self.temp.y+self.temp.z
end

Vector3.length = Vector3.magnitude
Vector3.sqrLength = Vector3.sqrMagnitude

function Vector3:lerp(v1,v2,v3,v4)
	local x,y,z,t = v1,v2,v3,v4
	if ( v3 == nil ) then
		x,y,z = v1.x,v1.y,v1.z
		t = v2
	end

	local rt = 1.0-t
	self:set(self.x*rt+x*t,
			self.y*rt+y*t,
			self.z*rt+z*t)

	return self
end

