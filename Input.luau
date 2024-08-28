local userInputService = game:GetService("UserInputService")


local self = {}

self.Connects = {}
self.Services = {}
self.NextInput = nil

self.Settings = nil

self.BindableEvent = Instance.new("BindableEvent")
self.NetworkReceived = self.BindableEvent.Event

self.InputBeganBindable = Instance.new("BindableEvent")
self.InputBegan = self.InputBeganBindable.Event

self.InputEndedBindable = Instance.new("BindableEvent")
self.InputEnded = self.InputEndedBindable.Event

self.Setup = function()
	self.GetSettings()
	if not self.Settings then
		while not self.Settings do
			self.GetSettings()
			task.wait()
		end
	end
end

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
	return nil
end

self.Connects.UISInputBegan = userInputService.InputBegan:Connect(function(inputObject, gp)
	if gp or not self.Settings then return end

	self.InputBeganBindable:fire(inputObject)
end)

self.Connects.UISInputEnded = userInputService.InputEnded:Connect(function(inputObject, gp)
	if gp or not self.Settings then return end

	self.InputEndedBindable:fire(inputObject)
end)

self.Connects.InputBegan = self.InputBegan:Connect(function(inputObject)
	
end)

self.Connects.InputEnded = self.InputEnded:Connect(function(inputObject)

end)

return self
