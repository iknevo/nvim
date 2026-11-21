local map = vim.keymap.set

-- Remove Neovim 0.11+ default LSP maps (grr/gra/grn/gri/grt/grx) so the
-- buffer-local `gr` (references) fires without waiting for timeoutlen
for _, lhs in ipairs({ "grr", "gra", "grn", "gri", "grt", "grx" }) do
  pcall(vim.keymap.del, "n", lhs)
  pcall(vim.keymap.del, "x", lhs)
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- Resize window
map("n", "<A-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<A-j>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<A-k>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<A-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Clear search on escape
map("n", "<Esc>", "<Cmd>nohlsearch<CR>", {
  desc = "Clear search highlights",
  silent = true,
})

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- undo break points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- quickfix list
map("n", "<leader>xq", function()
  require("quicker").toggle()
end, { desc = "Toggle Quickfix" })

map("n", "]q", function()
  pcall(vim.cmd.cnext)
end, { desc = "Next Quickfix" })

map("n", "[q", function()
  pcall(vim.cmd.cprev)
end, { desc = "Previous Quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- map("i", "jk", "<Esc>")

map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard after" })

-- paste without yank
map("x", "p", '"_dP', { desc = "Paste Without Yank" })

-- Toggle spell check
map("n", "<C-s>", "<cmd>set spell!<cr>", { desc = "Toggle spell check", silent = true })

-- better command
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "-", "<C-w>s", { desc = "Split Window Below" })
map("n", "|", "<C-w>v", { desc = "Split Window Right" })

map("n", "<leader>we", "<C-w>=", { desc = "Equalize Windows" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window" })
map("n", "<leader>wo", "<C-W>o", { desc = "Only Window" })

-- better scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

map("n", "J", "mzJ`z", { desc = "Join Lines" })

-- Duplicate line and comment the first line
map("n", "ycc", '"yy" . v:count1 . "gcc\']p"', { remap = true, expr = true })

-- Toggle cursor line
map("n", "<leader>ux", function()
  vim.wo.cursorline = not vim.wo.cursorline
end, { desc = "Toggle cursor line" })

map("n", "H", "^", { desc = "Start of the line" })
map("n", "L", "$", { desc = "End of the line" })

-- Redo last change
map("n", "U", "<C-r>", { desc = "Redo last change" })

map("n", "Q", "<nop>")

map("x", "u", "~", { desc = "Toggle case" })

map("n", "<leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle Wrap" })

map("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle Diagnostics" })

-- toggle line numbers
map("n", "<leader>ul", function()
  local enabled = vim.opt.number:get()
  vim.opt.number = not enabled
  vim.opt.relativenumber = not enabled
end, { desc = "Toggle line numbers" })
