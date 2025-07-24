return {
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {},
        dependencies = {
            { 'mason-org/mason.nvim', opts = {} },
            'neovim/nvim-lspconfig'
        },
        config = function()
            -- Set up lspconfig.
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "marksman", "clangd", "matlab_ls", "lua_ls", "texlab", "pyright" },
                automatic_enable = {
                    exclude = {
                        "clangd",
                        "texlab",
                        "lua_ls"
                    }
                }
            })

            --vim.api.nvim_command("MasonToolsInstall")

            local lspconfig = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

            -- lspconfig.marksman.setup {
            --     capabilities = capabilities
            -- }
            lspconfig.clangd.setup {
                capabilities = capabilities,
                cmd = { "clangd", "--background-index" }
            }
            -- lspconfig.matlab_ls.setup {
            --     capabilities = capabilities
            -- }
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            }
            lspconfig.texlab.setup {
                cmd = { "texlab" }, --, "-vvvv", "--log-file", "/tmp/texlab.log" },
                log_level = vim.lsp.protocol.MessageType.Log,
                message_level = vim.lsp.protocol.MessageType.Log,
                settings = {
                    texlab = {
                        --rootDirectory = "/home/moritz/documents/uni/master/masterthesis/",
                        diagnosticsDelay = 50,
                        build = {
                            executable = "latexmk",
                            onSave = true,
                            args = {
                                "-pdf",
                                "-interaction=nonstopmode",
                                "-synctex=1",
                                "-shell-escape",
                                "%f",
                            },
                        },
                        forwardSearch = {
                            executable = "zathura",
                            args = { "--synctex-forward", "%l:1:%f", "%p" },
                        },
                    },
                },
                -- capabilities = capabilities
            }
            vim.diagnostic.config({ virtual_lines = true })
            vim.diagnostic.config({ virtual_text = false })
            vim.keymap.set("n", "<leader>bb", ":TexlabBuild<CR>")

            -- LSP remaps
            vim.keymap.set("n", "<leader>gD", ":lua vim.lsp.buf.declaration()<CR>")
            vim.keymap.set("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
            vim.keymap.set("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>")
            vim.keymap.set("n", "<leader>vi", ":lua vim.lsp.buf.implementation()<CR>")
            vim.keymap.set("n", "<leader>vsh", ":lua vim.lsp.buf.signature_help()<CR>")
            vim.keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.references()<CR>")
            vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
            vim.keymap.set("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>")
            vim.keymap.set("n", "<leader>lca", ":lua vim.lsp.buf.code_action()<CR>")
            vim.keymap.set("n", "<leader>vsd", ":lua vim.lsp.diagnostic.show()<CR>")
            vim.keymap.set("n", "<leader>ln", ":lua vim.diagnostic.goto_next()<CR>")
            vim.keymap.set("n", "<leader>qf", ":lua vim.diagnostic.setqflist()<CR>")
            vim.keymap.set("n", "<leader>vll", ":call LspLocationList()<CR>")
        end

    },
    --'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Setup null-ls with `black`
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            'nvimtools/none-ls-extras.nvim',
            'jayp0521/mason-null-ls.nvim',
        },

        config = function()
            require("mason-null-ls").setup({
                -- Install linters, formatters, debuggers automatically
                ensure_installed = {
                    "ruff",
                    "prettier",
                    "shfmt"
                    --"debugpy",
                    --"mypy",
                },
            })

            local null_ls = require("null-ls")
            local sources = {
                require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
                require('none-ls.formatting.ruff_format'),
                null_ls.builtins.formatting.prettier.with { filetypes = { 'json', 'yaml', 'markdown' } },
                null_ls.builtins.formatting.shfmt.with { args = { '-i', '4' } },
            }

            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            require("null-ls").setup({
                -- you can reuse a shared lspconfig on_attach callback here
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                end,
            })
        end

    },
}
