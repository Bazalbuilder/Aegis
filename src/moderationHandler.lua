local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local function getNextBanDuration(player: number): number
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

local playerAction = {}
function playerAction:executeMute(player: Player)
	-- Listens for future TextSources
	TextChatService.DescendantAdded:Connect(function(child)
		if child:IsA("TextSource") and child.UserId == player.UserId then
			child.CanSend = false
		end
	end)

	-- Then mute any current TextSources sent by the player
	for _, child in TextChatService:GetDescendants() do
		if child:IsA("TextSource") and child.UserId == player.UserId then
			child.CanSend = false
		end
	end
end

function playerAction:executeKick(player: Player, message: string)
	return player:Kick(message or "Kicked by Aegis.")
end

function playerAction:executeBan(player: Player, permanent: boolean, reason: string?, explanation: string?)
	local duration = getNextBanDuration(player.UserId)
	local config = {
		UserIds = { player.UserId },
		Duration = if permanent then -1 else duration,
		DisplayReason = reason or "Banned by Aegis.",
		PrivateReason = explanation or "No reason specified.",
		ExcludeAltAccounts = false,
		ApplyToUniverse = true,
	}

	return Players:BanAsync(config)
end

function playerAction:executeUnban(player: Player)
	local config = {
		UserIds = { player.UserId },
		ApplyToUniverse = true,
	}

	return Players:UnbanAsync(config)
end

return playerAction
