vim.loader.enable()

require("tipi.options")
require("tipi.keymaps")
require("tipi.lazy_init")

local lazy_autocmds = vim.fn.argc(-1) == 0
if not lazy_autocmds then
	require("tipi.autocmds")
end
