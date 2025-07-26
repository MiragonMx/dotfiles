return { {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
            strings = true,
            emphasis = true,
            folds = true,
            operators = false,
            comments = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = 'hard', -- can be 'hard', 'soft' or empty string
        palette_overrides = {},
        overrides = {
            Visual = { bg = '#ffaf00', fg = '#3c3836' },
            DiagnosticSignError = { bg = NONE, fg = '#fb4934' },
            DiagnosticSignHint = { bg = NONE, fg = '#878700' },
            DiagnosticSignWarn = { bg = NONE, fg = '#ffaf00' },
            DiagnosticSignInfo = { bg = NONE, fg = '#87d7ff' },
            NormalFloat = { bg = NONE },
        },
        dim_inactive = false,
        transparent_mode = true,
    },
} }
