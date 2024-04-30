return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                    "cmake",
                    "gopls",
                    "pylsp"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities() ------
            lspconfig.clangd.setup({
                capabilities = lsp_capabilities
            })
            lspconfig.cmake.setup({
                capabilities = lsp_capabilities
            })
            lspconfig.gopls.setup({
                capabilities = lsp_capabilities
            })
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            runtime = { 'LuaJIT' }
                        },
                        diagnostics = {
                            globals = { 'vim' }
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        }
                    }
                }
            })
            lspconfig.bashls.setup({
                capabilities = lsp_capabilities
            })
            lspconfig.pylsp.setup({
                capabilities = lsp_capabilities,
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                ignore = { 'W391' },
                                maxLineLength = 100
                            }
                        }
                    }
                }
            })



            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>gc', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>gh', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = "lsp document format" })
            vim.keymap.set('v', '<leader>cf', vim.lsp.buf.format, { desc = "lsp selection format" })

            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap = true, silent = true }
            vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
            vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
            vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
        end
    }
}
