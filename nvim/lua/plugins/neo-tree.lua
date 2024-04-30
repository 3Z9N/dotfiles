return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    -- enabled = false,
    config = function()
        -- vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', { silent = true })
        vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true })
        -- vim.keymap.set('n', '<leader>b', ':Neotree buffers reveal float<CR>', { silent = true })
        -- vim.keymap.set('n', '<M-t>', ':Neotree filesystem reveal float<CR>', { silent = true })
    end,
    -- opts = {
    --   filesystem = {
    --     bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
    --     cwd_target = {
    --       sidebar = "tab",   -- sidebar is when position = left or right
    --       current = "window" -- current is when position = current
    --     },
    --   },
    -- },

    -- event_handlers = {
    --     {
    --         event = "file_opened",
    --         handler = function(file_path)
    --             -- auto close
    --             vim.cmd("Neotree close")
    --             -- OR
    --             -- require("neo-tree.command").execute({ action = "close" })
    --         end
    --     },
    -- },
}
