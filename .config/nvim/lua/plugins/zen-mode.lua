return { {
    'folke/zen-mode.nvim',
    opts = {
        window = {
            width = 105,
        },
    },
    config = function()
        vim.keymap.set("n", "<leader><leader>f", "<cmd>ZenMode<CR>")
    end
} }
