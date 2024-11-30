--[[
	This is a template command that prints out "Hello Aegis World!" to the output,
	and also prints out the player and arguments.
	
	The command will already be formatted in the "commandHandler.lua" script.

    To create a new command, duplicate this script and change the values.
]]

return {
	PrimaryAlias = "template", -- The primary alias of the command. This will already be formatted with the prefix in commandHandler.
	SecondaryAlias = "", -- The optional secondary alias of the command.
	Description = "Prints a statement.", -- The description of the command.
	Args = {},
	PermissionLevel = 0, -- Minimum ID required when running from a group's role. Range: 0-255
	Execute = function(
		player: Player,
		arguments: { string }
	): () -- The core of the command; what the command will execute when triggered.
		print("Hello Aegis World!")
		print(string.format("%s, %s", tostring(player), arguments[1]))
	end,
}
