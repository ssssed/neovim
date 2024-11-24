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
  }),
  s("stories", {
    t("import type { Meta, StoryObj } from '@storybook/react';"),
    t({ "", "import { " }), i(1, "ComponentName"), t(" } from './"), i(1), t("';"),
    t({ "", "" }),
    t({ "", "" }),
    t("const meta: Meta<typeof "), i(1), t("> = {"),
    t({ "", "  component: " }), i(1), t(","),
    t({ "", "  tags: ['autodocs']" }),
    t({ "", "};" }),
    t({ "", "" }),
    t({ "", "" }),
    t("export default meta;"),
    t({ "", "" }),
    t({ "", "" }),
    t("type Story = StoryObj<typeof "), i(1), t(">;"),
    t({ "", "" }),
    t({ "", "" }),
    t("export const Default: Story = {};"),
  }),
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
  }),
  s("stories", {
    t("import type { Meta, StoryObj } from '@storybook/react';"),
    t({ "", "import { " }), i(1, "ComponentName"), t(" } from './"), i(1), t("';"),
    t({ "", "" }),
    t("const meta: Meta<typeof "), i(1), t("> = {"),
    t({ "", "  component: " }), i(1), t(","),
    t({ "", "  tags: ['autodocs']" }),
    t({ "", "};" }),
    t({ "", "" }),
    t("export default meta;"),
    t({ "", "" }),
    t("type Story = StoryObj<typeof "), i(1), t(">;"),
    t({ "", "" }),
    t("export const Default: Story = {};"),
  }),
})
