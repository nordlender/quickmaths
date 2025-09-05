return {
  -- enabled = function()   return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype) end,
  snippets = { preset = "luasnip" },
  -- ensure you have the `snippets` source (enabled by default)
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  completion = {
    -- 'prefix' will fuzzy match on the text before the cursor
    -- 'full' will fuzzy match on the text before _and_ after the cursor
    -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
    keyword = {
      range = "prefix",
    },

    -- Disable auto brackets
    -- NOTE: some LSPs may add auto brackets themselves anyway
    accept = {
      auto_brackets = { enabled = false },
      create_undo_point = true,
      dot_repeat = false,
    },

    -- Don't select by default, auto insert on selection
    list = { selection =
      { preselect = false, auto_insert = true }
    },
    ghost_text = {
      enabled = true,
      show_with_menu = true,
      show_without_menu = true},

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "single" },
    },
  },
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
    use_frecency = true,
    use_proximity = true,
    sorts = {
      'exact',
      -- defaults
      'score',
      'sort_text',
    },
  },
  keymap = {
    preset = "none",
    ['<C-g>'] = { 'hide' },
    ['<Tab>'] = { 'accept', 'snippet_forward', 'fallback'},
    ['<S-Tab>'] = { 'select_next', 'fallback'},

    ['<Up>'] = { 'select_prev', 'fallback' },
    ['<Down>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },
}
