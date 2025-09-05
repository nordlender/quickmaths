return {
  {
    "lervag/vimtex",
    ft = "tex", -- Lazy load on filetype tex 
    -- tag = "v2.15", -- uncomment to pin to a specific release

    init = function()
      -- VimTeX configuration goes here, e.g.
      -- vim.g.vimtex_view_general_viewer = 'evince'
      vim.g.vimtex_view_method = "zathura_simple" -- Use zathura_simple for wayland

      -- Remove these lines to use regular config. See options.lua
      vim.g.zathura_config_dir = "~/.config/zathura"
      vim.g.vimtex_view_zathura_options = "-c " .. vim.g.zathura_config_dir

      vim.opt.conceallevel = 2
      vim.g.tex_conceal = "abdmg"
      vim.o.linebreak = true

      -- Mappings
      local map = vim.keymap.set
      -- change j and k when in latex (works for wrapped lines)
      map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
      map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

    end,
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- vimtex isn't required if using treesitter
    ft = "tex",
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    opts = {
    	use_treesitter = false,
		}
  },
	{
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        -- add the config here
      })
    end
	},
	{
    "L3MON4D3/LuaSnip",
    dependencies = {
    	{"rafamadriz/friendly-snippets",
    	config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_lua").lazy_load({ paths = { "./snippets" } })
    	end,
    	}
    },
    event = { "InsertEnter" },
    opts = {
    	history = true, updateevents = "TextChanged,TextChangedI",
    	enable_autosnippets = true,
    },
    config = function(_, opts)
      require("luasnip").config.set_config(opts)
      require "nvchad.configs.luasnip"
    end,
    build = "make install_jsregexp"
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    -- `main` is untested, please open a PR if you've confirmed it works as expected
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = require('configs.blink'),
    opts_extend = { "sources.default" }
  },
}
