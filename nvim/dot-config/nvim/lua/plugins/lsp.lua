return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable({
                "lua_ls",
                "html",
                "intelephense",
                "sqlls",
                "bashls",
                "jsonls",
                "docker_compose_language_service",
                "yamlls",
                "markdown_oxide",
                "vimls",
                "emmet_language_server",
                "pylsp"
            })
        end,
    }
},

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'if_many'
    },
})
