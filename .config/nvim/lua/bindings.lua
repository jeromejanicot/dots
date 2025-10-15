local keymap = vim.keymap

-- Moving Selections
keymap.set({ "n", "i" }, "<A-Down>", "<Esc>:m .+1<CR>==", { silent = true, desc = "Move Selection Down" })
keymap.set({ "n", "i" }, "<A-Up>", "<Esc>:m .-2<CR>==", { silent = true, desc = "Move Selection Up" })
keymap.set("v", "<A-Down>", [[:m '>+1<CR>gv=gv]], { silent = true, desc = "Move Selection Down" })
keymap.set("v", "<A-Up>", [[:m '<-2<CR>gv=gv]], { silent = true, desc = "Move Selection Up" })

keymap.set({ "n", "i" }, "<A-Left>", "<Esc><<", { desc = "Move Selection Left" })
keymap.set({ "n", "i" }, "<A-Right>", "<Esc>>>", { desc = "Move Selection Right" })
keymap.set("v", "<A-Left>", "<gv", { desc = "Move Selection Left" })
keymap.set("v", "<A-Right>", ">gv", { desc = "Move Selection Right" })

-- Split window
keymap.set("n", "ss", ":split<Return>", { noremap = true, silent = true, desc = "Horizontal Split Window" })
keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true, desc = "Vertical Split Window" })

-- Move window
keymap.set("n", "sh", "<C-w>h", { desc = "Move to Left Window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Move to Upper Window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Move to Lower Window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Move to Right Window" })

-- Resize panes
keymap.set("n", "<C-A-l>", "<Cmd>vertical resize -4<CR>", { desc = "Resize Pane Left" })
keymap.set("n", "<C-A-j>", "<Cmd>resize +4<CR>", { desc = "Resize Pane Up" })
keymap.set("n", "<C-A-k>", "<Cmd>resize -4<CR>", { desc = "Resize Pane Down" })
keymap.set("n", "<C-A-h>", "<Cmd>vertical resize +4<CR>", { desc = "Resize Pane Right" })
