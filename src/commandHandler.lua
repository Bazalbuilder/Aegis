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
local function isEscaped(str: string, characterIndex: number): boolean
	local backslashCount: number = 0
	for _: number = 1, str:len() do
		characterIndex -= 1
		if str:sub(characterIndex, characterIndex) == "\\" then
			backslashCount += 1
		else
			break
		end
	end
	return math.fmod(backslashCount, 2) == 1
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

				-- Check to see if the player has appropriate permissions to run this command
				local playerPermissionLevel = checkGroupPerms(player)
				if playerPermissionLevel < commandModule.PermissionLevel then
					return
				end
				-- Clean up whitespace in the message so that extra spaces do not cause empty strings in the split
				local cleanMessage: string = message:gsub("%s+", " ")
				-- Split up the message into individual words
				local words: { string } = cleanMessage:split(" ")
				-- Remove the command from the words table
				table.remove(words, 1) -- The first word is the command, select all words except the first
				local arguments: { string } = table.create(0)
				-- Parse words for string arguments
				local inString: boolean = false
				for index: number, segment: string in ipairs(words) do
					local nextQuotation: number = segment:find('"') or 0
					if nextQuotation == 1 then
						inString = true
					elseif nextQuotation ~= 0 and not isEscaped(segment, nextQuotation) then
						error('Unexpected `"`')
					end

					repeat
						nextQuotation = segment:find('"', nextQuotation + 1)
					until not nextQuotation or not isEscaped(segment, nextQuotation)
					if nextQuotation then
						inString = false
					end

					if inString and index + 1 <= #words then
						words[index + 1] = segment .. " " .. words[index + 1]
						continue
					end

					local argIsString: boolean = segment:sub(1, 1) == '"' -- In a string, the first character should always be a quotation mark
					if argIsString then
						segment = segment:sub(2, -1)
						if nextQuotation == segment:len() + 1 then
							segment = segment:sub(1, -2)
						else
							error("Expected space after string argument #" .. #arguments)
						end
						segment = segment:gsub('\\"', '"')
					end

					table.insert(arguments, segment)
				end

				commandModule.Execute(player, table.unpack(arguments))
			end)
		end
	end

	commandHandler._initialized = true
end

commandHandler._initialize()

return commandHandler
