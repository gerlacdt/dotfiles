return {
   "nvim-treesitter/nvim-treesitter",
   opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "rust", "go", "lua", "python", "java", "typescript", "javascript", "ruby"})
      textobjects = {
         select = {
            enable = true,
            lookahead = true,
            keymaps = {
               ["af"] = "@function.outer",
               ["if"] = "@function.inner",
               ["ac"] = "@class.outer",
               ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
               ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            selection_modes = {
               ['@parameter.outer'] = 'v', -- charwise
               ['@function.outer'] = 'V', -- linewise
               ['@class.outer'] = '<c-v>', -- blockwise
            },
            include_surrounding_whitespace = true,
         },
         move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
               ["]m"] = "@function.outer",
               ["]]"] = { query = "@class.outer", desc = "Next class start" },
               --
               -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
               ["]o"] = "@loop.*",
               -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
               --
               -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
               -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
               ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
               ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
               ["]M"] = "@function.outer",
               ["]["] = "@class.outer",
            },
            goto_previous_start = {
               ["[m"] = "@function.outer",
               ["[["] = "@class.outer",
            },
            goto_previous_end = {
               ["[M"] = "@function.outer",
               ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
               ["]d"] = "@conditional.outer",
            },
            goto_previous = {
               ["[d"] = "@conditional.outer",
            }
         },
      }
      opts.textobjects = textobjects
   end,
}
