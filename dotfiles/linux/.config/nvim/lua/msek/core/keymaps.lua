vim.g.mapleader = " "

local keybind = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local msekgroup = vim.api.nvim_create_augroup("msek", {})

keybind("n", "<leader>pv", vim.cmd.Ex, { desc = "Go back to file explorer" })

-- Might have a better place for this ?
autocmd("LspAttach", {
    group = msekgroup,
    callback = function(event)
        local opts = { buffer = event.buf }

        keybind("n", "gd", function() vim.lsp.buf.definition() end, opts)
        keybind("n", "K", function() vim.lsp.buf.hover() end, opts)
        keybind("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        keybind("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        keybind("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        keybind("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        keybind("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        keybind("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        keybind("n", "[d", function() vim.diagnostic.get_next() end, opts)
        keybind("n", "]d", function() vim.diagnostic.get_prev() end, opts)
    end,
})

