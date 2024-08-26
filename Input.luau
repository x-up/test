local userInputService = game:GetService("UserInputService")


local self = {}

self.Connects = {}
self.NextInput = nil

self.Settings = nil

self.BindableEvent = Instance.new("BindableEvent")
self.NetworkReceived = self.BindableEvent.Event

self.InputBindable = Instance.new("BindableEvent")
self.Input = self.InputBindable.Event

self.SendInput = function(inputObject)
	self.InputBindable:Fire(inputObject)
end

self.GetSettings = function()
	if self.Settings then
		return self.Settings
	else 
		local settings = self.Services.Settings.Get()
		self.Settings = settings
		return settings
	end
end

self.Connects.InputBegan = userInputService.InputBegan:Connect(function(inputObject, gp)
	if gp then return end

	self.InputBindable:fire(inputObject)
end)

self.Connects.Input = self.Input:Connect(function(inputObject)
	local settings = self.Settings

	
end)

return self
