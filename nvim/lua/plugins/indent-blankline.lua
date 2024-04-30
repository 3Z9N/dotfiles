return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup({
            enabled = true,
            scope = {
                enabled = true,
                show_start = false,
                show_end = false
            },
            indent = {
                char = "▏",
                -- char = "│",
                -- priority = 2,
            },
        })
        local hooks = require "ibl.hooks"
        hooks.register(
            hooks.type.WHITESPACE,
            hooks.builtin.hide_first_space_indent_level
        )
    end
}

