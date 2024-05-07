-- ----------------------------------------------------------
-- Key bindings
-- ----------------------------------------------------------
-- Functional wrapper for mapping custom keybindings
local function keymap(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})


-- Toggle relative or absolute number lines
vim.cmd([[
    function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
      else
        set relativenumber
    endif
    endfunction
]])

keymap("n", "<leader>n", ":call NumberToggle()<CR>",
    { desc = "Toggle absolute/relative line number" })


-- global keys
keymap("n", "<C-M-q>", ":qa<CR>")
keymap("n", "<C-M-x>", ":qa!<CR>")
keymap("n", "<C-M-w>", ":wa<CR>")

-- reset highlighted search text
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- search and replace the word under the cursor  :%s/text/
-- keymap("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/", {noremap = true, silent = false})
keymap("n", "<leader>r", ":%s/<C-r><C-w>/",
    { silent = false, desc = "Find and replace word under cursor" })



-- -- Open netrw in 25% split in tree view
-- keymap("n", "<leader>e", ":25Lex<CR>") -- space+e toggles netrw tree view

-- withouth bufferline
keymap("n", "<leader><Right>", ":bnext<CR>")
keymap("n", "<leader><Left>", ":bprev<CR>")
keymap("n", "<leader><Down>", ":bnext<CR>")
keymap("n", "<leader><Up>", ":bprev<CR>")
keymap("n", "<leader>d", ":bdelete<CR>")
-- keymap("n", "<M-d>", ":bdelete<CR>")


-- keymap('n', '<leader>b', ':Neotree buffers reveal float<CR>')
-- keymap('n', '<leader>t', ':Neotree filesystem reveal float<CR>')
keymap('n', '<M-b>', ':Neotree buffers reveal float<CR>')
keymap('n', '<M-t>', ':Neotree filesystem reveal float<CR>')
keymap('n', '<leader>t', ':Neotree filesystem reveal left<CR>')

-- bufferline
-- keymap("n", "<leader>d", ":bdelete<CR>:bnext<CR>")
-- keymap("n", "<leader><Right>", ":BufferLineCycleNext<CR>")
-- keymap("n", "<leader><Left>", ":BufferLineCyclePrev<CR>")
-- keymap("n", "<leader><S-Right>", ":BufferLineMoveNext<CR>")
-- keymap("n", "<leader><S-Left>", ":BufferLineMovePrev<CR>")
keymap("n", "<M-Tab>", "<C-6>") -- switch to last buffer

-- window manipulation
keymap("n", "<M-c>", "<C-w>c")           -- close window
keymap("n", "<M-s>", "<C-w>s")           -- split to horizontal window
keymap("n", "<M-v>", "<C-w>v")           -- split to vertical window
keymap("n", "<M-w>", "<C-w>w")           -- switch to next window
keymap("n", "<M-Left>", "<C-w><Left>")   -- switch to left window
keymap("n", "<M-Right>", "<C-w><Right>") -- switch to right window


-- keymap("n", "<M-b>", ":Telescope buffers<CR>")    -- select buffer
keymap("n", "<M-e>", ":Explore<CR>")              -- netrw file explorer
keymap("n", "<M-g>", ":Telescope git_status<CR>") -- netrw file explorer

keymap("v", ">", ">gv")                           -- indent, stay on visual mode
keymap("v", "<", "<gv")                           -- unindent, stay on visual mode

-- vim.keymap.set("n", "<F8>", "<cmd>lua RunCmd()<CR>", {})
-- vim.keymap.set("n", "<C-a>", "<cmd>lua require('myfunc').GoToErrorFromClipboard()<CR>", {})
keymap("n", "<C-a>", ":ThemeLoaderSelect<CR>")

-- vim.keymap.set("i", "<C-O>", "<esc> <C-O>:stopinsert<CR>", {silent = true})
-- inoremap <silent> <Esc> <C-O>:stopinsert<CR>

keymap("n", "<F2>", ":Neotree toggle<CR>")
keymap("n", "<F3>", ":Telescope buffers<CR>")
keymap("n", "<F4>", ":Telescope git_status<CR>")

keymap("n", "<F5>", "mZ")
keymap("n", "<F6>", "`Z")
keymap("n", "<F7>", ":lua vim.lsp.buf.declaration()<CR>")
keymap("n", "<F8>", ":lua vim.lsp.buf.definition()<CR>")

keymap('n', '<leader>m', ":Telescope marks<CR>")
keymap('n', '<leader>s', ":Telescope current_buffer_fuzzy_find<CR>")

-- keymap("i", "<C-/>", "<C-O>:Commentary<cr>")
-- keymap("n", "<C-/>", ":Commentary<cr>")
-- keymap("v", "<C-/>", ":Commentary<cr>")
keymap("i", "<C-c>", "<C-O>:Commentary<cr>")
keymap("n", "<C-c>", ":Commentary<cr>")
keymap("v", "<C-c>", ":Commentary<cr>")

-- GitGutter
--      n    [c    :GitGutterPrevHunk<cr>
--      n    ]c    :GitGutterNextHunk<cr>
keymap("n", "[v", ":GitGutterPreviewHunk<cr>")
keymap("n", "]v", ":GitGutterPreviewHunk<cr>")

-- add single quotes around a selected block of text
keymap("v", "\'", "<Esc>`>a\'<Esc>`<i\'<Esc>")

-- add double quotes around a selected block of text
keymap("v", "\"", "<Esc>`>a\"<Esc>`<i\"<Esc>")

-- add {,} around a selected block of text
keymap("v", "{", "<Esc>`>a}<Esc>`<i{<Esc>")

-- add (,) around a selected block of text
keymap("v", "(", "<Esc>`>a)<Esc>`<i(<Esc>")

-- add [,] around a selected block of text
keymap("v", "[", "<Esc>`>a]<Esc>`<i[<Esc>")

-- paste in the insert mode
-- keymap('i', '<C-v>', "<C-r>\"")
-- keymap('i', '<C-v>', "<C-r>0")
-- synchronized with the system clipboard
keymap('i', '<C-V>', "<C-R>+")


-- vim.cmd([[
--     " iunmap <C-P>
--     inoremap <C-P> <C-R>+
-- ]])

