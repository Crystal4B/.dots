local function is_nixos()
	return true
end

return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", enable = not is_nixos() },
			{ "williamboman/mason-lspconfig.nvim", enable = not is_nixos() },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim", enable = not is_nixos() },

			{ "j-hui/fidget.nvim", opts = {} },

			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("msek-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local telescope_builtin = require("telescope.builtin")
					map("gd", telescope_builtin.lsp_definitions, "[G]oto [D]efinition")
					map("gr", telescope_builtin.lsp_references, "[G]oto [R]eferences")
					map("gI", telescope_builtin.lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", telescope_builtin.lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", telescope_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local hightlight_augroup = vim.api.nvim_create_augroup("msek-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = hightlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = hightlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("msek-lsp-detach", { clear = true }),
							callback = function(detach_event)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = detach_event.buf })
							end,
						})

						if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
							map("<leader>th", function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
							end, "[T]oggle Inlay [H]ints")
						end
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- TODO: Mason does not support all of these
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						},
					},
				},
				gopls = {},
				zls = {},
				nixd = {},
			}

			local lspconfig = require("lspconfig")

			if not is_nixos() then
				local ensure_installed = vim.tbl_keys(servers, {})
				vim.list_extend(ensure_installed, {
					"stylua",
				})

				require("mason").setup({})

				require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

				require("mason-lspconfig").setup({
					handlers = {
						function(server_name)
							local server = servers[server_name] or {}

							server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
							lspconfig[server_name].setup(server)
						end,
					},
				})
			else
				for name, server in pairs(servers) do
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					lspconfig[name].setup(server)
				end
			end
		end,
	},
}
