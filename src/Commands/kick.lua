return {
	PrimaryAlias = "kick",
	SecondaryAlias = "",
	Description = "Ejects a player from the server.",
	Args = {},
	PermissionLevel = 0,
	Execute = function(player: Player, arguments: { string }): ()
		local moderatePlayer = require(script.Parent.Parent.moderatePlayer)

		moderatePlayer:executeKick(player, arguments[1])
	end
}