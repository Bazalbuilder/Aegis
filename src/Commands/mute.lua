return {
	PrimaryAlias = "mute",
	SecondaryAlias = "",
	Description = "Prevents a player from talking in chat.",
	Args = {},
	PermissionLevel = 0,
	Execute = function(player: Player)
		local moderatePlayer = require(script.Parent.Parent.moderationHandler)

		moderatePlayer:executeMute(player)
	end
}