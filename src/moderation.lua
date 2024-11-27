--!strict
--[[
	TEMPORARY. Will be changed soon.
]]

local ModerationStatus = {}
ModerationStatus.__index = ModerationStatus

function ModerationStatus.new(action: string, date: number, permanent: boolean?, expiry: number?, reason: string?)
	local self = {
		action = action,
		date = date,
		permanent = permanent,
		expiry = if permanent then -1 else expiry,
		reason = reason,
	}
	
	setmetatable(self, ModerationStatus)
	
	return self
end

function ModerationStatus:getKickMessage(): string
	if self.action == "Kick" then
		if self.reason then
			return string.format("Kicked by Aegis, Reason: %s", self.reason)
		else
			return "Kicked by Aegis, no reason provided."
		end
	else 
		return ""
	end
end

function ModerationStatus:getBanMessage()
	if self.action == "Ban" then
		if self.permanent then
			if self.reason then
				return string.format("Permanently banned by Aegis, Reason: %s", self.reason)
			else
				return "Permanently bannned by Aegis, no reason provided."
			end
		else
			if self.reason then
				return string.format("Permanently banned by Aegis, Reason: %s. Expiry: %c", self.reason, self.expiry)
			else
				return string.format("Banned by Aegis, no reason provided. Expiry: %c", self.expiry)
			end
		end
	else
		return ""
	end
end

return ModerationStatus
