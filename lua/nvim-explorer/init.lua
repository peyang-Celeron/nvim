vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_disable_netrw = O.explorer.disable_netrw
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_close = O.auto_close_tree
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_auto_ignore_ft = { 'dashboard' } -- "empty by default, don't auto open tree on specific filetypes.
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  -- mappings
  ["<CR>"] = tree_cb("edit"),
  ["l"] = tree_cb("edit"),
  ["o"] = tree_cb("edit"),
  ["<2-LeftMouse>"] = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<C-]>"] = tree_cb("cd"),
  ["v"] = tree_cb("vsplit"),
  ["s"] = tree_cb("split"),
  ["<C-t>"] = tree_cb("tabnew"),
  ["h"] = tree_cb("close_node"),
  ["<BS>"] = tree_cb("close_node"),
  ["<S-CR>"] = tree_cb("close_node"),
  ["<Tab>"] = tree_cb("preview"),
  ["I"] = tree_cb("toggle_ignored"),
  ["H"] = tree_cb("toggle_dotfiles"),
  ["R"] = tree_cb("refresh"),
  ["a"] = tree_cb("create"),
  ["d"] = tree_cb("remove"),
  ["r"] = tree_cb("rename"),
  ["<C-r>"] = tree_cb("full_rename"),
  ["x"] = tree_cb("cut"),
  ["c"] = tree_cb("copy"),
  ["p"] = tree_cb("paste"),
  ["[c"] = tree_cb("prev_git_item"),
  ["]c"] = tree_cb("next_git_item"),
  ["-"] = tree_cb("dir_up"),
  ["q"] = tree_cb("close")
}
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "➜",
    untracked = ""
    -- ignored = "◌"
  },
  folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" }
}

