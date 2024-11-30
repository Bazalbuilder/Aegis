--[[
	Prints out if the player has joined or left the experience.
]]

local Players = game:GetService("Players")

local playerLogger = {}

function playerLogger.init()
	Players.PlayerAdded:Connect(function(player)
		print("PlayerLogger: Adding" .. player.Name)
	end)
	
	Players.PlayerRemoving:Connect(function(player)
		print("PlayerLogger: Removing" .. player.Name)
	end)
end

return playerLogger
