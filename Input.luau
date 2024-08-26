local userInputService = game:GetService("UserInputService")


local self = {}

self.Connects = {}


self.BindableEvent = Instance.new("BindableEvent")
self.NetworkReceived = self.BindableEvent.Event

self.InputBindable = Instance.new("BindableEvent")
self.Input = self.InputBindable.Event

self.Connects.InputBegan = userInputService.InputBegan:Connect(function(inputObject, gp)
	if gp then return end

	self.InputBindable:fire(inputObject)
end)

self.Connects.Input = self.Input:Connect(function(inputObject)
	
end)

return self
