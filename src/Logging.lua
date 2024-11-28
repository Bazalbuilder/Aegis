--[[
	Implements a custom logger to display more information than what Luau already 
	provides. These logs can be enabled or disabled in Config.lua.
	
	The logger outputs to the dev console, and can be classed in the following ways:
	- STDOUT (print) - Informational messages, used to give updates to a log, or to 
	tell what has changed; Enabled in studio; disabled in player.
	- STDWRN (warn) - Warning messages, used to warn developers of potential issues, 
	point out deprecated code, or unstable APIs: Always enabled.
	- STDERR (error) - Error messages, used to tell developers that something has
	gone wrong with Aegis. A stacktrace will be provided when necessary. Developers
	should not try and fix errors, and should instead file an issue report in the 
	repository; Always enabled.
	- STDDBG (print) - Debug messages, used to tell developers unnecessary
	information to figure out an error or warning; Enabled via config.
]]

local Logger = {}

function Logger.new(name, message)
	local self = {
		logType = "STDOUT" or "STDWRN" or "STDERR",
		name = name,
		message = message or "Something happened!",
	}

	return setmetatable(self, Logger)
end

function Logger:create()
	return Logger.new(self.name, self.message)
end

function Logger:output()
	if self.logType == "STDOUT" then
		print(self:create())
	elseif self.logType == "STDWRN" then
		warn(self:create())
	elseif self.logType == "STDERR" then
		local instance = self:create()
		instance.stack = debug.traceback()
		error(instance, 2)
	end
	--TODO: Add STDDBG.
end

return Logger
