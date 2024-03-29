local Path = require("plenary.path")

local workspacePaths = {
	{ name = "work", path = "C:/Users/asharaf/OneDrive - Wood Rodgers Inc/Obsidian/Obsidian_work" },
	{ name = "personal", path = "C:/Users/asharaf/iCloudDrive/iCloud~md~obsidian/obsidian_personal" },
}

local workspaces = {}

for _, workspaceInfo in ipairs(workspacePaths) do
	local workspacePath = workspaceInfo.path
	if Path:new(workspacePath):exists() then
		local workspace = {
			name = workspaceInfo.name,
			path = workspacePath,
		}
		table.insert(workspaces, workspace)
	end
end

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = workspaces,

		-- see below for full list of options 👇
	},
}
