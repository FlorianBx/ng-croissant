local M = {}

local function get_base(filename)
  -- removes .ts, .html, or .spec.ts at the end to get the common prefix
  return filename:gsub('%.component%.spec%.ts$', '.component')
                :gsub('%.component%.ts$', '.component')
                :gsub('%.component%.html$', '.component')
end

M.goto_component_ts = function()
  local filename = vim.api.nvim_buf_get_name(0)
  local base = get_base(filename)
  local ts = base .. '.ts'
  if vim.fn.filereadable(ts) == 1 then
    vim.cmd('edit ' .. vim.fn.fnameescape(ts))
  else
    vim.notify('.ts not found: ' .. ts, vim.log.levels.INFO)
  end
end

M.goto_component_html = function()
  local filename = vim.api.nvim_buf_get_name(0)
  local base = get_base(filename)
  local html = base .. '.html'
  if vim.fn.filereadable(html) == 1 then
    vim.cmd('edit ' .. vim.fn.fnameescape(html))
  else
    vim.notify('.html not found: ' .. html, vim.log.levels.INFO)
  end
end

M.goto_component_spec = function()
  local filename = vim.api.nvim_buf_get_name(0)
  local base = get_base(filename)
  local spec = base .. '.spec.ts'
  if vim.fn.filereadable(spec) == 1 then
    vim.cmd('edit ' .. vim.fn.fnameescape(spec))
  else
    vim.notify('.spec.ts not found: ' .. spec, vim.log.levels.INFO)
  end
end

M.get_base = get_base
M._set_vim = function(vim_mock) vim = vim_mock end

return M
