local ok, Snacks = pcall(require, 'snacks')
if not ok then
  return
end

Snacks.setup({
  bigfile = { enabled = false },
  dashboard = {
    enabled = true,
    width = 60,
    pane_gap = 4,
    preset = {
      pick = function(cmd, opts)
        opts = opts or {}
        local telescope = require('telescope.builtin')
        if cmd == 'files' then
          telescope.find_files(vim.tbl_extend('force', { no_ignore = true, hidden = true }, opts))
        elseif cmd == 'live_grep' then
          telescope.live_grep(opts)
        elseif cmd == 'oldfiles' then
          telescope.oldfiles(opts)
        end
      end,
      keys = {
        { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
        { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
        { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
        { icon = ' ', key = 'm', desc = 'Mason', action = ':Mason' },
        { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
      },
      header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
    },
    sections = {
      { section = 'header' },
      {
        pane = 2,
        section = 'terminal',
        cmd = [[sh -c 'printf "%s |  %s\n" "$(uname -s) $(sw_vers -productVersion 2>/dev/null || true)" "$(nvim --version | head -n1 | cut -d" " -f2)"']],
        height = 2,
        padding = 1,
      },
      { section = 'keys', gap = 1, padding = 1 },
      { pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
      { pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
      {
        pane = 2,
        icon = ' ',
        title = 'Git Status',
        section = 'terminal',
        enabled = function()
          return Snacks.git.get_root() ~= nil
        end,
        cmd = 'git status --short --branch --renames',
        height = 8,
        padding = 1,
        ttl = 5 * 60,
        indent = 3,
      },
    },
  },
  explorer = { enabled = false },
  indent = { enabled = false },
  input = { enabled = false },
  picker = { enabled = false },
  notifier = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
  zen = { enabled = false },
  dim = { enabled = false },
  animate = { enabled = false },
  bufdelete = { enabled = false },
  git = { enabled = true },
  image = { enabled = false },
  lazygit = { enabled = false },
  profiler = { enabled = false },
  rename = { enabled = false },
  scratch = { enabled = false },
  terminal = { enabled = false },
  toggle = { enabled = false },
})
