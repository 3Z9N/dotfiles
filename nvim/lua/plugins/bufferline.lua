return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    enabled = false,
    config = function()
        require("bufferline").setup({
            options = {
                mode = 'buffers',
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
                -- indicator = {
                --     -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
                --     icon = '|',
                --     style = 'underline' -- style = 'icon' | 'underline' | 'none'
                -- },
                themable = true,
                -- separator_style = { '|', '|' },
                -- separator_style = { '', '' },
            },
        })

        vim.cmd([[
            " nnoremap <TAB> :Commentary<cr>
            " nnoremap <silent><TAB> :BufferLineCycleNext<CR>
            " nnoremap <silent><S-TAB> :BufferLineCyclePrev<CR>
            nnoremap <silent><TAB> :BufferLineCycleNext<CR>
        ]])
    end,
}

-- return {}
