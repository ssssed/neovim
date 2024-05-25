vim.opt.termguicolors = true

function SetColor(color)
    color = color or "vscode_modern"
    vim.cmd.colorscheme(color)
end

SetColor('vscode_modern')
