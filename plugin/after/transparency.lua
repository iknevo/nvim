-- Make highlight groups transparent while preserving their other attributes
---@diagnostic disable
local function make_transparent(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    hl.bg = nil
    vim.api.nvim_set_hl(0, name, hl)
  end
end

local groups = {
  -- transparent background
  "Normal",
  "NormalFloat",
  "FloatBorder",
  "Pmenu",
  "Terminal",
  "EndOfBuffer",
  "FoldColumn",
  "Folded",
  "SignColumn",
  "LineNr",
  "CursorLineNr",
  "NormalNC",
  "WhichKeyFloat",
  "TelescopeBorder",
  "TelescopeNormal",
  "TelescopePromptBorder",
  "TelescopePromptTitle",
  -- neotree
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeVertSplit",
  "NeoTreeWinSeparator",
  "NeoTreeEndOfBuffer",
  -- nvim-tree
  "NvimTreeNormal",
  "NvimTreeVertSplit",
  "NvimTreeEndOfBuffer",
  -- notify
  "NotifyINFOBody",
  "NotifyERRORBody",
  "NotifyWARNBody",
  "NotifyTRACEBody",
  "NotifyDEBUGBody",
  "NotifyINFOTitle",
  "NotifyERRORTitle",
  "NotifyWARNTitle",
  "NotifyTRACETitle",
  "NotifyDEBUGTitle",
  "NotifyINFOBorder",
  "NotifyERRORBorder",
  "NotifyWARNBorder",
  "NotifyTRACEBorder",
  "NotifyDEBUGBorder",
}

for _, name in ipairs(groups) do
  make_transparent(name)
end

-- Set border foreground color for all floating windows
local border_color = "#6e6a86"

local function set_border_fg(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then
    hl.fg = border_color
    vim.api.nvim_set_hl(0, name, hl)
  end
end

local border_groups = {
  -- global float border (covers LSP hover, signature, trouble, etc.)
  "FloatBorder",
  -- snacks picker
  "SnacksPickerBorder",
  "SnacksPickerInputBorder",
  "SnacksPickerListBorder",
  "SnacksPickerPreviewBorder",
  "SnacksPickerBoxBorder",
  -- noice
  "NoicePopupBorder",
  "NoicePopupmenuBorder",
  "NoiceConfirmBorder",
  "NoiceCmdlinePopupBorder",
  "NoiceCmdlinePopupBorderSearch",
}

for _, name in ipairs(border_groups) do
  set_border_fg(name)
end
