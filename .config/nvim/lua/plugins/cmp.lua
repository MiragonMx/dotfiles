return
{
   'hrsh7th/nvim-cmp',
   version = false,  -- last release is way too old
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
local cmp = require'cmp'
local luasnip = require'luasnip'
require'luasnip.loaders.from_vscode'.lazy_load()

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
      end, {'i', 's'}),

      ['<C-b>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {'i', 's'}),
    }),
    -- This seems to break the config
    completion = { completeopt = "menu,menuone,noinsert" },
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'luasnip', keyword_length = 1 }, -- For luasnip users.
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
