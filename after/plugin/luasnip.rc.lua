local status, ls = pcall(require, 'luasnip')
if (not status) then return end

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

require("luasnip.loaders.from_vscode").lazy_load({
  include = { "javascript", "typescript" },
})

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "DATE",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
  },
})
