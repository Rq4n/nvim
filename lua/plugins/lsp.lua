return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local signs = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = "󰠠 ",
				[vim.diagnostic.severity.INFO] = " ",
			}

			vim.diagnostic.config({
				signs = { text = signs },
				virtual_text = true,
				underline = true,
				update_in_insert = false,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
				},
			})

			-- toggle virtual text
			vim.keymap.set("n", "<leader>lx", function()
				local current = vim.diagnostic.config().virtual_text
				vim.diagnostic.config({ virtual_text = not current })
			end, { desc = "Toggle LSP virtual text" })

			-- setup cmp.lua
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Global LSP capabilities
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			--gopls
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
						goimports = true,
					},
				},
			})

			-- lua_ls
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- ts_ls (TypeScript/JavaScript)
			vim.lsp.config("ts_ls", {
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
				single_file_support = true,
				init_options = {
					preferences = {
						includeCompletionsForModuleExports = true,
						includeCompletionsForImportStatements = true,
					},
				},
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayVariableTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
						},
					},
					javascript = {
						validate = {
							enable = true,
						},
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayVariableTypeHints = true,
						},
					},
				},
			})

			-- emmet_language_server
			vim.lsp.config("emmet_language_server", {
				filetypes = {
					"css",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"typescriptreact",
				},
				init_options = {
					includeLanguages = {},
					excludeLanguages = {},
					extensionsPath = {},
					preferences = {},
					showAbbreviationSuggestions = true,
					showExpandedAbbreviation = "always",
					showSuggestionsAsSnippets = false,
					syntaxProfiles = {},
					variables = {},
				},
			})

			-- emmet_ls
			vim.lsp.config("emmet_ls", {
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
					"svelte",
				},
			})

			-- css
			vim.lsp.config("cssls", {
				filetypes = { "css", "scss", "less" },
				init_options = { provideFormatter = true },
				single_file_support = true,
				settings = {
					css = {
						lint = {
							unknownAtRules = "ignore",
						},
						validate = true,
					},
					scss = {
						lint = {
							unknownAtRules = "ignore",
						},
						validate = true,
					},
					less = {
						lint = {
							unknownAtRules = "ignore",
						},
						validate = true,
					},
				},
			})

			-- tailwindcss
			vim.lsp.config("tailwindcss", {
				filetypes = {
					"html",
					"css",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
				},
			})
		end,
	},
}
