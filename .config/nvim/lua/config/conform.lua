local M = {}

M.config = function()
  return {
    formatters_by_ft = {
      lua = { "stylua" },
      go = {"gofmt"},
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }
end

return M

