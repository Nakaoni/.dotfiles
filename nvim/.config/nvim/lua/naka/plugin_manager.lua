-- Plugin management by Lazy
-- @see https://github.com/folke/lazy.nvim
-- @version v10

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=v10.20.3", -- latest stable release
    "--depth=1",
    "--single-branch",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
    checker = {
        enable = true,
    },
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
}

require("lazy").setup("naka.plugins", opts)
