local Themes = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme catppuccin]])
            require('myfunc').LoadTheme("catppuccin")
        end,
    },
    -- {
    --     "EdenEast/nightfox.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('nightfox').setup({
    --             options = {
    --                 styles = {
    --                     comments = "italic",
    --                     -- functions = "italic,bold",
    --                 }
    --             },
    --         })

    --         -- load the colorscheme here
    --         -- vim.cmd([[colorscheme nightfox]])
    --         -- vim.cmd([[colorscheme carbonfox]])
    --         require('myfunc').LoadTheme("nightfox")

    --     end,

    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,   -- make sure we load this during startup if it is your main colorscheme
        priority = 100, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 100,
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme catppuccin]])
            -- require('myfunc').LoadTheme("kanagawa")
        end,
    },
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,   -- make sure we load this during startup if it is your main colorscheme
        priority = 100, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        'marko-cerovac/material.nvim',
        priority = 100,
        config = function()
            require("material").setup({
                contrast = {
                    terminal = false,            -- Enable contrast for the built-in terminal
                    sidebars = true,             -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
                    floating_windows = true,     -- Enable contrast for floating windows
                    cursor_line = false,         -- Enable darker background for the cursor line
                    non_current_windows = false, -- Enable contrasted background for non-current windows
                    filetypes = {},              -- Specify which filetypes get the contrasted (darker) background
                },
                styles = {                       -- Give comments style such as bold, italic, underline etc.
                    comments = { italic = true },
                    strings = { italic = true },
                    -- keywords = { --[[ underline = true ]] },
                    -- functions = { --[[ bold = true, undercurl = true ]] },
                    -- variables = {},
                    -- operators = {},
                    -- types = {},
                },
                plugins = { -- Uncomment the plugins that you use to highlight them
                    -- Available plugins:
                    -- "coc"
                    -- "dap",
                    -- "dashboard",
                    -- "eyeliner",
                    -- "fidget",
                    -- "flash",
                    -- "gitsigns",
                    -- "harpoon",
                    -- "hop",
                    -- "illuminate",
                    "indent-blankline",
                    -- "lspsaga",
                    -- "mini",
                    -- "neogit",
                    -- "neotest",
                    "neo-tree",
                    -- "neorg",
                    -- "noice",
                    "nvim-cmp",
                    -- "nvim-navic",
                    -- "nvim-tree",
                    "nvim-web-devicons",
                    -- "rainbow-delimiters",
                    -- "sneak",
                    "telescope",
                    -- "trouble",
                    -- "which-key",
                    -- "nvim-notify",
                },
            })
            -- vim.cmd([[colorscheme material-deep-ocean]])
            -- vim.g.material_style = 'deep ocean'
            -- require('myfunc').LoadTheme("material")
        end
    },
    {
        'sainnhe/gruvbox-material',
        lazy = false,
        priority = 100,
        config = function()
            vim.cmd([[
                set background=dark
                let g:gruvbox_material_background = 'hard'
                " let g:gruvbox_material_dim_inactive_windows = 1
                " let g:gruvbox_material_visual = 'green background'
                let g:gruvbox_material_ui_contrast = 'high'
                let g:gruvbox_material_float_style = 'dim'
                let g:gruvbox_material_diagnostic_virtual_text = 'colored'
                " let g:gruvbox_material_diagnostic_virtual_text = 'highlighted'
                " let g:gruvbox_material_colors_override = {'bg0': ['#1d2021', '234'], 'bg2': ['#282828', '235']}
                " let g:gruvbox_material_colors_override = {'bg_dim': ['#101010', '232'], 'bg0': ['#151515', '234'], 'bg1': ['#181818', '235'], 'bg2': ['#181818', '235']}
            ]])

            -- load the colorscheme here
            -- vim.cmd([[colorscheme gruvbox-material]])
            -- require('myfunc').LoadTheme("gruvbox-material")
        end,

    },
    {
        "kristijanhusak/vim-hybrid-material",
        lazy = false,
        priority = 100,
        config = function()
            -- load the colorscheme here
            -- vim.cmd([[colorscheme catppuccin]])
            vim.cmd([[
                let g:enable_italic_font = 1
            ]])
            -- require('myfunc').LoadTheme("hybrid")
        end,
    },
    {
        'themeloader',
        dir = '~/.config/nvim/themeloader',
        lazy = false,
        priority = 99, -- must be lover then colorscheme plugins
        -- version = "*",
        -- dependencies = 'nvim-tree/nvim-web-devicons',
    },
    {
        "rose-pine/neovim",
        name = "rose-pine"
    },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 100
    },
}

return Themes
