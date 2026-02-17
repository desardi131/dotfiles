local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

-- Source - https://stackoverflow.com/a/75302916
-- Posted by Mr.Programmer
-- Retrieved 2026-02-13, License - CC BY-SA 4.0
-- Sets colors to line numbers Above, Current and Below  in this order
local function line_number_colors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#9ece6a', bold=false })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#9ece6a', bold=false })
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            vim.cmd.colorscheme "tokyonight-storm"
            enable_transparency()
            line_number_colors()
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            theme = 'tokyonight',
        }
    },
}
