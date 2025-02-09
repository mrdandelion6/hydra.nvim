local M = {}

local function check_timeoutlen_option()
	-- check timeoutlen
	if vim.o.timeoutlen < 300 then
		local message = [[
            Your current `timeoutlen` value is %d which might be too small to
            make each mapping working!
            It's recommended to use %d for the `timeoutlen` option!
        ]]
		vim.health.warn(message:format(vim.o.timeoutlen, 300))
	else
		local message = [[
            `timeoutlen` (value: %d) is set to a good value.
        ]]

		vim.health.ok(message:format(vim.o.timeoutlen))
	end
end

M.check = function()
	vim.health.start("Hydra: Checking settings")
	check_timeoutlen_option()
end

return M
