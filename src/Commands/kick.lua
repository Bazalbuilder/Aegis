return {
	PrimaryAlias = "kick",
	SecondaryAlias = "",
	Description = "Ejects a player from the server.",
	PermissionLevel = 0,
	Execute = function(player: Player, ...): ()
		local moderatePlayer = require(script.Parent.Parent.moderationHandler)

		moderatePlayer:executeKick(player, ...)
	end,
}
