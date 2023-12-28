require('lint').linters_by_ft = {
  ruby = {'standardrb'},
  elixir = {'credo'},
  sh = { 'shellcheck', },
  bash = { 'shellcheck', },
  zsh = { 'shellcheck', },
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  lua = {'luacheck'}
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
