return {
	PrimaryAlias = "ban",
	SecondaryAlias = "",
	Description = "Bans a player from the experience.",
	Args = {},
	PermissionLevel = 0,
	Execute = function(player: Player, ...): ()
		local moderatePlayer = require(script.Parent.Parent.moderationHandler)

		moderatePlayer:executeBan(player, ...)
	end,
}
