require'lspconfig'.rnix.setup{}
require'lspconfig'.sumneko_lua.setup{}

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
})

vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

vim.o.updatetime = 100

vim.o.completeopt = "menuone,noselect"
