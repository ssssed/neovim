local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

local js_snippets = {
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
}

ls.add_snippets("javascript", js_snippets)
ls.add_snippets("javascriptreact", js_snippets)

ls.add_snippets("typescript", vim.list_extend(vim.deepcopy(js_snippets), {
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
}))

ls.add_snippets("typescriptreact", vim.list_extend(vim.deepcopy(js_snippets), {
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
}))

ls.add_snippets("vue", {
  s("vbase", {
    t("<script setup lang=\"ts\">"),
    t({ "", "" }),
    t({ "", "</script>" }),
    t({ "", "" }),
    t({ "", "<template>" }),
    t({ "", "  <div></div>" }),
    t({ "", "</template>" }),
    t({ "", "" }),
    t({ "", "<style scoped>" }),
    t({ "", "" }),
    t({ "", "</style>" }),
  }),
  s("vcomp", {
    t("const "), i(1, "name"), t(" = defineProps<{"),
    t({ "", "  " }), i(2, "prop: string"),
    t({ "", "}>()" }),
  }),
})

ls.add_snippets("svelte", {
  s("sbase", {
    t("<script lang=\"ts\">"),
    t({ "", "" }),
    t({ "", "</script>" }),
    t({ "", "" }),
    t({ "", "<!-- markup -->" }),
    t({ "", "" }),
    t({ "", "<style>" }),
    t({ "", "" }),
    t({ "", "</style>" }),
  }),
  s("sprops", {
    t("let { "), i(1, "prop"), t(" }: { "), i(1), t(": string } = $props();"),
  }),
})
