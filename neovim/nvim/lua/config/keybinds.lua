vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", function()
    vim.cmd("Ex")
end)

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")

vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
end)
