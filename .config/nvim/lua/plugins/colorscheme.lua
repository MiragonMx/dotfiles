  return{
      { "ellisonleao/gruvbox.nvim", 
      priority = 1000, config = true, 
      opts =   {
          undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    operators = false,
    comments = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = 'hard', -- can be 'hard', 'soft' or empty string
  palette_overrides = {},
  overrides = {
    Visual = {bg = '#ffaf00', fg = '#3c3836'},
    DiagnosticSignError = {bg = NONE, fg = '#fb4934'},
    DiagnosticSignHint = {bg = NONE, fg = '#878700'},
    DiagnosticSignWarn = {bg = NONE, fg =  '#ffaf00'},
    DiagnosticSignInfo = {bg = NONE, fg = '#87d7ff'},
    --CursorLineNr = {bg = '#000000'},
    NormalFloat = {bg = NONE},
    },
  dim_inactive = false,
  transparent_mode = true,
},

config = function()
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    Visual = {bg = '#ffaf00', fg = '#3c3836'},
    DiagnosticSignError = {bg = NONE, fg = '#fb4934'},
    DiagnosticSignHint = {bg = NONE, fg = '#878700'},
    DiagnosticSignWarn = {bg = NONE, fg =  '#ffaf00'},
    DiagnosticSignInfo = {bg = NONE, fg = '#87d7ff'},
    --CursorLineNr = {bg = '#000000'},
    NormalFloat = {bg = NONE},
    },
  dim_inactive = false,
  transparent_mode = true,
})
end
}
}
