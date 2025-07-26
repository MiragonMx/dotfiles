return {
    { 'numToStr/Comment.nvim', opts = {} },
    { 'folke/neodev.nvim',     opts = {} },
    { 'folke/which-key.nvim',  opts = {} },
    -- 'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    { 'phelipetls/vim-hugo', dependencies = { 'robertbasic/vim-hugo-helper' } },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    'bkad/camelcasemotion',
}
