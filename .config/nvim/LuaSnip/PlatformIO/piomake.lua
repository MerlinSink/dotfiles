local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  -- s(
  --   { trig = "piomake", snippetType = "autosnippet", priority = "2000" },
  --   ("make")
  -- ),
  -- s(
  --   'mfn',
  --   c(1, {
  --     fmt('function {}.{}({})\n  {}\nend', {
  --       -- f(get_returned_mod_name, {}),
  --       i(1),
  --       i(2),
  --       i(3),
  --     }),
  --     fmt('function {}:{}({})\n  {}\nend', {
  --       -- f(get_returned_mod_name, {}),
  --       i(1),
  --       i(2),
  --       i(3),
  --     }),
  --   })
  -- )
}
