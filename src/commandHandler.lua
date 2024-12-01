--[[ 
	Used to handle commands in the "src/Commands" directory.
	
	To create a new command, follow the instructions in the "template.lua" file.
]]

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local Commands = script.Parent.Commands

local groupId = 11116305 -- Change this to reflect your own Group.

assert(
	TextChatService.ChatVersion == Enum.ChatVersion.TextChatService,
	"TextChatService is not enabled. Aegis.commandHandler will not work."
)

local function checkGroupPerms(player: Player): number
	if player.IsInGroup(player, groupId) then
		return player.GetRankInGroup(player, groupId)
	else
		return 0
	end
end

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

	for _, command in Commands:GetChildren() do
		if command:IsA("ModuleScript") then
			local commandModule = require(command)
			local textChatCommand = Instance.new("TextChatCommand")

			textChatCommand.Name = commandModule.PrimaryAlias
			textChatCommand.PrimaryAlias = "/" .. commandModule.PrimaryAlias
			if textChatCommand.SecondaryAlias then
				textChatCommand.SecondaryAlias = "/" .. commandModule.SecondaryAlias
			end
			textChatCommand.Parent = commandFolder

			textChatCommand.Triggered:Connect(function(textSource, message)
				-- Find the player object of the speaker
				local player = Players:GetPlayerByUserId(textSource.UserId)
				assert(player ~= nil, string.format("No player with UserId: %d", textSource.UserId))

				local playerPermissionLevel = checkGroupPerms(player)
				if playerPermissionLevel >= commandModule.PermissionLevel then
					-- Clean up whitespace in the message so that extra spaces do not cause empty strings in the split
					local cleanMessage = string.gsub(message, "%s+", " ")
					-- Split up the message into individual words
					local words = string.split(cleanMessage, " ")
					-- The first word is the command, select all words except the first to pass in as arguments
					local arguments = table.move(words, 2, #words, 1, {})
					commandModule.Execute(player, arguments) -- May not work.
				end
			end)
		end
	end

	commandHandler._initialized = true
end

commandHandler._initialize()

return commandHandler
