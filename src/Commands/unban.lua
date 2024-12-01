return {
	PrimaryAlias = "unban",
	SecondaryAlias = "",
	Description = "Unbans a player who has been banned before.",
	PermissionLevel = 0,
	Execute = function(player: Player, ...): ()
		local moderatePlayer = require(script.Parent.Parent.moderationHandler)

		moderatePlayer:executeUnban(player, ...)
	end,
}
