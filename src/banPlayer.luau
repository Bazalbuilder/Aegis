local Players = game:GetService("Players")

local function getNextBanDuration(player): number
	local bans = {}
	local banHistoryPages = Players:GetBanHistoryAsync(player)

	while not banHistoryPages.IsFinished do
		for _, ban in banHistoryPages:GetCurrentPage() do
			table.insert(bans, ban)
		end

		banHistoryPages:AdvanceToNextPageAsync()
	end

	local lastBan = bans[#bans]

	if lastBan then
		return lastBan.ExpiresAt - DateTime.now().UnixTimestamp
	end

	return 0
end

local banPlayer = {}
banPlayer.__index = banPlayer

function banPlayer.new(player: Player, reason: string, explanation: string, permanent: boolean)
	local duration = getNextBanDuration(player.UserId)
	local config: BanConfigType = {
		UserIds = { player.UserId },
		Duration = if permanent then -1 else duration,
		DisplayReason = reason,
		PrivateReason = explanation,
		ExcludeAltAccounts = false,
		ApplyToUniverse = true,
	}

	return config
end

function banPlayer.execute(config: BanConfigType)
	return Players:BanAsync(config)
end

return banPlayer