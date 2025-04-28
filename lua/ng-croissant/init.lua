local M = {}

local function get_base(filename)
  return filename:gsub('%.component%.spec%.ts$', '.component')
                 :gsub('%.component%.ts$', '.component')
                 :gsub('%.component%.html$', '.component')
                 :gsub('%.component%.css$', '.component')
                 :gsub('%.component%.scss$', '.component')
end

local function goto_component(extension)
  local filename = vim.api.nvim_buf_get_name(0)
  local base = get_base(filename)
  local target = base .. extension
  if vim.fn.filereadable(target) == 1 then
    vim.cmd('edit ' .. vim.fn.fnameescape(target))
  else
    vim.notify(extension .. ' not found: ' .. target, vim.log.levels.INFO)
  end
end

M.goto_component_ts = function() goto_component('.ts') end
M.goto_component_html = function() goto_component('.html') end
M.goto_component_spec = function() goto_component('.spec.ts') end
M.goto_component_css = function() goto_component('.css') end
M.goto_component_scss = function() goto_component('.scss') end

M.get_base = get_base
M._set_vim = function(vim_mock) vim = vim_mock end

return M
