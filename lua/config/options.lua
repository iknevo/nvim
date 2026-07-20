vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.deprecation_warnings = false
vim.g.markdown_recommended_style = 0
vim.g.have_nerd_font = true

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.linespace = 4

vim.opt.fillchars = {
  diff = "╱",
  eob = " ",
}

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.diagnostic.config({
  -- virtual_text = true,
  -- virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = "󰋼 ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  severity_sort = true,
})

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.winminwidth = 5
vim.opt.scrolloff = 8
vim.opt.jumpoptions = "view"
vim.o.winborder = "rounded"

vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.virtualedit = "block"
vim.wo.wrap = true
vim.opt.linebreak = true
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.iskeyword:remove("_")

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.smoothscroll = true
vim.opt.spelllang = { "en" }

vim.opt.shortmess:append("I")
