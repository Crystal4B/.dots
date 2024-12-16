return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup({})

            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<Cr>", {})
            vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<Cr>", {})
        end,
    },
    {
        "tpope/vim-fugitive",
    }
}

