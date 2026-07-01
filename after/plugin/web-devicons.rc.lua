local status, devicons = pcall(require, 'nvim-web-devicons')
if not status then
  return
end

local docker_icon = { icon = '󰡨', color = '#458EE6', cterm_color = 68, name = 'DockerCompose' }
local css_module_icon = { icon = '', color = '#42A5F5', cterm_color = 39, name = 'CssModule' }

local function basename(path)
  return vim.fn.fnamemodify(path, ':t'):lower()
end

local function custom_icon_data(path)
  if not path or path == '' then
    return
  end
  local name = basename(path)
  if name:match('%.module%.css$') then
    return css_module_icon
  end
  if name:match('^docker%-compose%.') and name:match('%.ya?ml$') then
    return docker_icon
  end
end

local function icon_result(data)
  return data.icon, 'DevIcon' .. data.name
end

devicons.setup({
  default = true,
  override_by_extension = {
    ['module.css'] = css_module_icon,
  },
  override_by_filename = {
    ['docker-compose.yaml'] = docker_icon,
    ['docker-compose.yml'] = docker_icon,
    ['compose.yaml'] = docker_icon,
    ['compose.yml'] = docker_icon,
  },
})

-- snacks передаёт только последнее расширение ("css"), из-за этого *.module.css
-- и docker-compose.*.yaml не попадают в lookup — проверяем имя файла сами.
local orig_get_icon = devicons.get_icon
function devicons.get_icon(name, ext, opts)
  local data = type(name) == 'string' and custom_icon_data(name)
  if data then
    return icon_result(data)
  end
  return orig_get_icon(name, ext, opts)
end

local orig_get_icon_colors = devicons.get_icon_colors
function devicons.get_icon_colors(name, ext, opts)
  local data = type(name) == 'string' and custom_icon_data(name)
  if data then
    return data.icon, data.color, data.cterm_color
  end
  return orig_get_icon_colors(name, ext, opts)
end
