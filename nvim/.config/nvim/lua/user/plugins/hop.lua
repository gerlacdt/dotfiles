return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  event = "User AstroFile",
  opts = function(_, config)
    require("hop").setup({
      -- Configuration here, or leave empty to use defaults
    })

    return config
  end,
}
