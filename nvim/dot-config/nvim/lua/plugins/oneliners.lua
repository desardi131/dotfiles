return {
    { -- Copia al portapapeles del sistema estando conectado por ssh
        'ojroques/vim-oscyank',
    },
    { -- Plugin para gestionar Git desde nvim
        'tpope/vim-fugitive',
    },
    {
        -- Plugin para instalar LSPs
        "mason-org/mason.nvim",
        opts = {}
    },
    {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
