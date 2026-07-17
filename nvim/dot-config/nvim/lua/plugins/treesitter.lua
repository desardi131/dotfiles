return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- fijamos la rama explícitamente: ya no depende del default de upstream
    build = ':TSUpdate',
    config = function()
        local ts = require('nvim-treesitter')

        -- En la rama 'main', setup() ya NO acepta 'highlight' ni 'indent':
        -- solo gestiona instalación de parsers.
        ts.setup({})

        ts.install({
            "lua",
            "php",
            "php_only",
            "phpdoc",
            "passwd",
            "bash",
            "zsh",
            "nginx",
            "markdown",
            "markdown_inline",
            "gitignore",
            "gitcommit",
            "git_config",
            "css",
            "html",
            "python",
            "javascript",
            "yaml",
            "json",
            "toml",
            "ssh_config",
            "sql",
            "regex",
            "requirements",
            "query",
            "powershell",
        })

        -- El highlight (y el indent) ahora hay que arrancarlos nosotros mismos,
        -- por buffer, cuando Neovim detecta el filetype. pcall evita errores
        -- en filetypes sin parser instalado (p. ej. texto plano).
        vim.api.nvim_create_autocmd('FileType', {
            pattern = '*',
            callback = function(ev)
                local ok = pcall(vim.treesitter.start, ev.buf)
                if ok then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
