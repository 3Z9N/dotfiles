return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- options = {
            --     theme = 'auto'
            -- }
            size = 15,
            open_mapping = [[<c-\>]],
            hide_numbers = true, -- hide the number column in toggleterm buffers
            direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float',
            close_on_exit = true, -- close the terminal window when the process exits
        })
    end,
}
