--[[ 
	Used to handle commands in the "src/CommandModules" directory.
	
	To create a new command, follow the instructions in the "template.lua" file.
]]

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local CommandModules = script.Parent.CommandModules

assert(
	TextChatService.ChatVersion == Enum.ChatVersion.TextChatService,
	"TextChatService is not enabled. Aegis.commandHandler will not work."
)

local commandHandler = {
	_initialized = false,
	_permissionCache = {},
}

function commandHandler._initialize()
	assert(not commandHandler._initialized, "Aegis.commandHandler is already initialized.")

	Players.PlayerRemoving:Connect(function(player)
		if commandHandler._permissionCache[player] then
			commandHandler._permissionCache[player] = nil
		end
	end)

	local commandFolder = Instance.new("Folder")
	commandFolder.Name = "AegisCommands"
	commandFolder.Parent = TextChatService

	for _, command in ipairs(CommandModules:GetChildren()) do
		if CommandModules:IsA("ModuleScript") then
			local commandModule = require(command)
			local textChatCommand = Instance.new("TextChatCommand")

			textChatCommand.Name = commandModule.PrimaryAlias
			textChatCommand.PrimaryAlias = "/" .. commandModule.PrimaryAlias
			if textChatCommand.SecondaryAlias then
				textChatCommand.SecondaryAlias = "/" .. commandModule.SecondaryAlias
			end
			textChatCommand.Parent = commandFolder

			textChatCommand.Triggered:Connect(function(textSource, message)
				local player = Players:GetPlayerByUserId(textSource.UserId)
				assert(player ~= nil, string.format("No player with UserId: %d", textSource.UserId))

				local playerPermissionLevel = 0 -- Currently 0 until we can figure out how to implement a permission checking system
				if playerPermissionLevel >= commandModule.PermissionLevel then
					local cleanMessage = string.gsub(message, "%s+", " ")
					local words = string.split(cleanMessage, " ")
					local arguments = table.move(words, 2, #words, 1, {})
					commandModule.Execute(player, arguments or nil) -- May not work.
				end
			end)
		end
	end

	commandHandler._initialized = true
end

commandHandler._initialize()

return commandHandler
