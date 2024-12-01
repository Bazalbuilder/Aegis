return {
	PrimaryAlias = "ban",
	SecondaryAlias = "",
	Description = "Prevents a player from joining the experience.",
	PermissionLevel = 0,
	Execute = function(player: Player, ...): ()
		local moderatePlayer = require(script.Parent.Parent.moderationHandler)

		moderatePlayer:executeBan(player, ...)
	end,
}
