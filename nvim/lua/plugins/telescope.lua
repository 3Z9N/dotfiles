return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "truncate " },
                file_ignore_patterns = { "build%/*" },
                mappings = {
                    i = {
                        --            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        --            ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy opened buffers" })
        keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Fuzzy lsp diagnostics" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope git_status<cr>", { desc = "Fuzzy git status" })
        -- keymap.set('n', '<leader>s',
        --     function()
        --         require("telescope.builtin").current_buffer_fuzzy_find({
        --             -- function from
        --             -- https://github.com/nvim-telescope/telescope.nvim/pull/1401#issuecomment-957234973
        --             tiebreak = function(entry1, entry2, prompt) -- sort by line number
        --                 local start_pos1, _ = entry1.ordinal:find(prompt)
        --                 if start_pos1 then
        --                     local start_pos2, _ = entry2.ordinal:find(prompt)
        --                     if start_pos2 then
        --                         return start_pos1 < start_pos2
        --                     end
        --                 end
        --                 return false
        --             end,
        --             word_match = "-w", -- not working
        --         })
        --     end,
        --     { desc = '[/] Fuzzily search in current buffer' })

        -- See `:help telescope.builtin`
        vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
            { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = true,
            })
        end, { desc = '[/] Fuzzily search in current buffer]' })

    end,
}
