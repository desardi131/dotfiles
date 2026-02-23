vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")

vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)

--[[ Highlight when yanking text
Try it with `yap` in normal mode
  See `:help vim.highlight.on_yank()`
-- ]]
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- MOVIMIENTOS EN EL ARCHIVO
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Almacena el contenido pegado y no el sustituido al pegarlo
-- Es necesario tener instalado un cliente del portapapeles (e.g. wl-copy)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Para copiar
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Para borrar
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
