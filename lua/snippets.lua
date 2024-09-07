local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- Сниппеты для JavaScript и TypeScript
ls.add_snippets("javascript", {
  s("af", {
    t("const "), i(1, "name"), t(" = () => {}")
  }),
  s("asf", {
    t("const "), i(1, "name"), t(" = async () => {}")
  }),
  s("eaf", {
    t("export const "), i(1, "name"), t(" = () => {}")
  }),
  s("easf", {
    t("export const "), i(1, "name"), t(" = async () => {}")
  }),
})

ls.add_snippets("javascriptreact", {
  s("af", {
    t("const "), i(1, "name"), t(" = () => {}")
  }),
  s("asf", {
    t("const "), i(1, "name"), t(" = async () => {}")
  }),
  s("eaf", {
    t("export const "), i(1, "name"), t(" = () => {}")
  }),
  s("easf", {
    t("export const "), i(1, "name"), t(" = async () => {}")
  }),
})

ls.add_snippets("typescript", {
  s("af", {
    t("const "), i(1, "name"), t(" = () => {}")
  }),
  s("asf", {
    t("const "), i(1, "name"), t(" = async () => {}")
  }),
  s("eaf", {
    t("export const "), i(1, "name"), t(" = () => {}")
  }),
  s("easf", {
    t("export const "), i(1, "name"), t(" = async () => {}")
  }),
  s("rec", {
    t("export const "), i(1, "ComponentName"), t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <div></div>" }),
    t({ "", "  )" }),
    t({ "", "}" }),
  }),
  s("recp", {
    t("type Props = {}"),
    t({ "", "" }),
    t({ "", "" }),
    t("export const "), i(1, "ComponentName"), t(" = (props: Props) => {"),
    t({ "", "  const {} = props;" }),
    t({ "", "" }),
    t({ "", "  return (" }),
    t({ "", "    <div></div>" }),
    t({ "", "  )" }),
    t({ "", "}" }),
  })
})


ls.add_snippets("typescriptreact", {
  s("af", {
    t("const "), i(1, "name"), t(" = () => {}")
  }),
  s("asf", {
    t("const "), i(1, "name"), t(" = async () => {}")
  }),
  s("eaf", {
    t("export const "), i(1, "name"), t(" = () => {}")
  }),
  s("easf", {
    t("export const "), i(1, "name"), t(" = async () => {}")
  }),
  s("rec", {
    t("export const "), i(1, "ComponentName"), t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <div></div>" }),
    t({ "", "  )" }),
    t({ "", "}" }),
  }),
  s("recp", {
    t("type Props = {}"),
    t({ "", "" }),
    t({ "", "" }),
    t("export const "), i(1, "ComponentName"), t(" = (props: Props) => {"),
    t({ "", "  const {} = props;" }),
    t({ "", "" }),
    t({ "", "  return (" }),
    t({ "", "    <div></div>" }),
    t({ "", "  )" }),
    t({ "", "}" }),
  })
})
