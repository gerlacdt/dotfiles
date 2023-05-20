return {
  "kylechui/nvim-surround",
  version = "*",
  event = "User AstroFile",
  opts = function(_, config)
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })

    return config
  end,
}
