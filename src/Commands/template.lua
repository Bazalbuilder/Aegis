--[[
	This is a template command that prints out "Hello Aegis World!" to the output.
	
	Use this template when creating custom commands.
]]

return {
	PrimaryAlias = "template", -- The primary alias of the command. This will already be formatted with the prefix in commandHandler.
	SecondaryAlias = "", -- The optional secondary alias of the command.
	Description = "Prints a statement.", -- The description of the command.
	Group = "StandardUtil", -- The built-in utility group. Currently, the default is present.
	Args = {},
	PermissionLevel = 0, -- Permission level required when running from a group's roles. Range: 0-255
	Execute = function(player: Player, arguments: { string }): ()
		print("Hello Aegis World!")
	end
}