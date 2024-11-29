return {
	PrimaryAlias = "ban",
	SecondaryAlias = "",
	Description = "Bans a player from the experience.",
	Args = {},
	PermissionLevel = 0,
	Execute = function(player: Player, arguments: { string }): ()
		local moderatePlayer = require(script.Parent.Parent.moderationHandler)

		moderatePlayer:executeBan(player, false, arguments[1])
	end
}