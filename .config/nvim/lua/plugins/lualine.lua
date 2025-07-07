return { {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        -- Lualine status
        local colors = {
            black        = '#282828',
            white        = '#ebdbb2',
            red          = '#fb4934',
            green        = '#878700',
            blue         = '#87d7ff',
            yellow       = '#ffaf00',
            gray         = '#a89984',
            darkgray     = '#3c3836',
            lightgray    = '#98971a',
            inactivegray = '#7c6f64',
        }

        local custom_gruvbox = require 'lualine.themes.gruvbox'
        custom_gruvbox.normal.a.bg = colors.inactivegray
        custom_gruvbox.normal.c.fg = colors.lightgray
        custom_gruvbox.insert.a.bg = colors.blue
        custom_gruvbox.visual.a.bg = colors.yellow
        custom_gruvbox.command.a.bg = colors.green
        require 'lualine'.setup {
            lualine_b = { { 'FugitiveHead', icon = '' }, },
            --  extensions = {'fugitive'}
            options = { theme = custom_gruvbox },
        }
    end
} }
