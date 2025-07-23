
return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
    })
  end,
  keys = {
    { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
    { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
    {
        "<leader>,",
        "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
    },
    -- { "<leader>/",       LazyVim.pick("live_grep"),                                  desc = "Grep (Root Dir)" },
    { "<leader>:",  "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
    -- { "<leader><space>", LazyVim.pick("files"),                                      desc = "Find Files (Root Dir)" },
    -- find
    { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    -- { "<leader>fc",      LazyVim.pick.config_files(),                                desc = "Find Config File" },
    { "<leader>ff", "<cmd>FzfLua files<cr>",                                    desc = "Find Files (Root Dir)" },
    { "<leader>fF", "<cmd>FzfLua files root=false<cr>",                         desc = "Find Files (cwd)" },
    { "<leader>fg", "<cmd>FzfLua git_files<cr>",                                desc = "Find Files (git-files)" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>",                                 desc = "Recent" },
    -- { "<leader>fR",      LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }),           desc = "Recent (cwd)" },
    -- git
    { "<leader>gc", "<cmd>FzfLua git_commits<CR>",                              desc = "Commits" },
    { "<leader>gs", "<cmd>FzfLua git_status<CR>",                               desc = "Status" },
    -- search
    { '<leader>s"', "<cmd>FzfLua registers<cr>",                                desc = "Registers" },
    { "<leader>sa", "<cmd>FzfLua autocmds<cr>",                                 desc = "Auto Commands" },
    { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>",                              desc = "Buffer" },
    { "<leader>sc", "<cmd>FzfLua command_history<cr>",                          desc = "Command History" },
    { "<leader>sC", "<cmd>FzfLua commands<cr>",                                 desc = "Commands" },
    { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>",                     desc = "Document Diagnostics" },
    { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>",                    desc = "Workspace Diagnostics" },
    -- { "<leader>sg",      LazyVim.pick("live_grep"),                                  desc = "Grep (Root Dir)" },
    -- { "<leader>sG",      LazyVim.pick("live_grep", { root = false }),                desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>FzfLua help_tags<cr>",                                desc = "Help Pages" },
    { "<leader>sH", "<cmd>FzfLua highlights<cr>",                               desc = "Search Highlight Groups" },
    { "<leader>sj", "<cmd>FzfLua jumps<cr>",                                    desc = "Jumplist" },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>",                                  desc = "Key Maps" },
    { "<leader>sl", "<cmd>FzfLua loclist<cr>",                                  desc = "Location List" },
    { "<leader>sM", "<cmd>FzfLua man_pages<cr>",                                desc = "Man Pages" },
    { "<leader>sm", "<cmd>FzfLua marks<cr>",                                    desc = "Jump to Mark" },
    { "<leader>sR", "<cmd>FzfLua resume<cr>",                                   desc = "Resume" },
    { "<leader>sq", "<cmd>FzfLua quickfix<cr>",                                 desc = "Quickfix List" },
  }
}
