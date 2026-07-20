return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- essa branch não suporta lazy-loading
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    local parsers = {
      "bash", "c", "cpp", "css", "go", "gomod", "gosum", "gowork",
      "html", "javascript", "json", "lua", "markdown", "markdown_inline",
      "query", "svelte", "tsx", "typescript", "vim", "vimdoc", "yaml",
    }
    require("nvim-treesitter").install(parsers)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ok = pcall(vim.treesitter.start)
        if not ok then return end
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
