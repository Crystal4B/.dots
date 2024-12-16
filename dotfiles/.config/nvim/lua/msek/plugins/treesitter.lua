return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = {
                "vimdoc",
                "c",
                "lua",
                "bash",
                "json",
                "yaml",
                "markdown",
                "markdown_inline",
                "vim",
                "gitignore",
            },

            sync_install = false,
            auto_install = true,

            indent = {
                enable = true
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end,
}

