return
{
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = "InsertEnter",
    lazy = true,
    dependencies = { {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'octaltree/cmp-look',
        'hrsh7th/cmp-calc',
        'f3fora/cmp-spell',
        { 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
        'saadparwaiz1/cmp_luasnip',
        'molleweide/LuaSnip-snippets.nvim',
        'amarakon/nvim-cmp-lua-latex-symbols',
        'rafamadriz/friendly-snippets'
    } },
    config = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'
        require 'luasnip.loaders.from_vscode'.lazy_load()

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            --view = {'custom'},
            mapping = cmp.mapping.preset.insert({
                ['<C-f>'] = cmp.mapping.scroll_docs(-4),
                ['<C-v>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<C-d>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<C-b>'] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            -- This seems to break the config
            completion = { completeopt = "menu,menuone,noinsert" },
            sources = cmp.config.sources({
                { name = 'nvim_lsp', keyword_length = 1 },
                { name = 'luasnip',  keyword_length = 1 }, -- For luasnip users.
            }, {
                { name = 'buffer', keyword_length = 3 },
                --{ name = 'nvim_lsp_signature_help', keyword_length = 3 },
                { name = 'path' },
            })
        }) -- end of cmp.setup

        -- Set configuration for specific filetype.
        --  cmp.setup.filetype({'tex', 'plaintex'}, {
        --    sources = {
        --        { name = 'nvim_lsp', keyword_length = 3 },
        --        { name = 'luasnip', keyword_length = 2 }, -- For luasnip users.
        --        { name = 'buffer', keyword_length = 3 },
        --        { name = 'lua-latex-symbols', keyword_length = 3 },
        --    }
        --  })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- USED
        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' }
            })
        })
    end
}

-- Maybe at some point switch?:
-- { -- Autocompletion
--     'saghen/blink.cmp',
--     event = 'VimEnter',
--     version = '1.*',
--     dependencies = {
--       -- Snippet Engine
--       {
--         'L3MON4D3/LuaSnip',
--         version = '2.*',
--         build = (function()
--           -- Build Step is needed for regex support in snippets.
--           -- This step is not supported in many windows environments.
--           -- Remove the below condition to re-enable on windows.
--           if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
--             return
--           end
--           return 'make install_jsregexp'
--         end)(),
--         dependencies = {
--           -- `friendly-snippets` contains a variety of premade snippets.
--           --    See the README about individual language/framework/plugin snippets:
--           --    https://github.com/rafamadriz/friendly-snippets
--           -- {
--           --   'rafamadriz/friendly-snippets',
--           --   config = function()
--           --     require('luasnip.loaders.from_vscode').lazy_load()
--           --   end,
--           -- },
--         },
--         opts = {},
--       },
--       'folke/lazydev.nvim',
--     },
--     --- @module 'blink.cmp'
--     --- @type blink.cmp.Config
--     opts = {
--       keymap = {
--         -- 'default' (recommended) for mappings similar to built-in completions
--         --   <c-y> to accept ([y]es) the completion.
--         --    This will auto-import if your LSP supports it.
--         --    This will expand snippets if the LSP sent a snippet.
--         -- 'super-tab' for tab to accept
--         -- 'enter' for enter to accept
--         -- 'none' for no mappings
--         --
--         -- For an understanding of why the 'default' preset is recommended,
--         -- you will need to read `:help ins-completion`
--         --
--         -- No, but seriously. Please read `:help ins-completion`, it is really good!
--         --
--         -- All presets have the following mappings:
--         -- <tab>/<s-tab>: move to right/left of your snippet expansion
--         -- <c-space>: Open menu or open docs if already open
--         -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
--         -- <c-e>: Hide menu
--         -- <c-k>: Toggle signature help
--         --
--         -- See :h blink-cmp-config-keymap for defining your own keymap
--         preset = 'default',
--
--         -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--         --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--       },
--
--       appearance = {
--         -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--         -- Adjusts spacing to ensure icons are aligned
--         nerd_font_variant = 'mono',
--       },
--
--       completion = {
--         -- By default, you may press `<c-space>` to show the documentation.
--         -- Optionally, set `auto_show = true` to show the documentation after a delay.
--         documentation = { auto_show = false, auto_show_delay_ms = 500 },
--       },
--
--       sources = {
--         default = { 'lsp', 'path', 'snippets', 'lazydev' },
--         providers = {
--           lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
--         },
--       },
--
--       snippets = { preset = 'luasnip' },
--
--       -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
--       -- which automatically downloads a prebuilt binary when enabled.
--       --
--       -- By default, we use the Lua implementation instead, but you may enable
--       -- the rust implementation via `'prefer_rust_with_warning'`
--       --
--       -- See :h blink-cmp-config-fuzzy for more information
--       fuzzy = { implementation = 'lua' },
--
--       -- Shows a signature help window while you type arguments for a function
--       signature = { enabled = true },
--     },
--   },
