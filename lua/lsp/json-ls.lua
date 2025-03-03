local bin = vim.fn.stdpath("data") .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js"
local lsp_config = require("lsp")

if vim.fn.filereadable(bin) == 0 then require("lspinstall").install_server("json") end

require'lspconfig'.jsonls.setup {
  cmd = { "node", bin, "--stdio" },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
      end
    }
  },
  on_attach = lsp_config.common_on_attach
}

