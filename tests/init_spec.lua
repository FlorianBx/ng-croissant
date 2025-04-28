package.path = package.path .. ";lua/?.lua;lua/?/init.lua"
local M = require("ng-croissant.init")

describe("get_base", function()
  it("removes .component.spec.ts", function()
    assert.are.equals(M.get_base("foo/bar/button.component.spec.ts"), "foo/bar/button.component")
  end)
  it("removes .component.ts", function()
    assert.are.equals(M.get_base("foo/bar/button.component.ts"), "foo/bar/button.component")
  end)
  it("removes .component.html", function()
    assert.are.equals(M.get_base("foo/bar/button.component.html"), "foo/bar/button.component")
  end)
  it("keeps unrelated file names", function()
    assert.are.equals(M.get_base("foo/bar/baz.ts"), "foo/bar/baz.ts")
  end)
    it("removes .component.css", function()
    assert.are.equals(M.get_base("foo/bar/button.component.css"), "foo/bar/button.component")
  end)
  it("removes .component.scss", function()
    assert.are.equals(M.get_base("foo/bar/button.component.scss"), "foo/bar/button.component")
  end)
end)

describe("goto_component_ts", function()
  local mock

  before_each(function()
    mock = {
      api = {
        nvim_buf_get_name = function() return "foo/button.component.html" end
      },
      fn = {
        filereadable = function(name)
          if name == "foo/button.component.ts" then return 1 else return 0 end
        end,
        fnameescape = function(name) return name end,
      },
      cmd = function(cmd_str) mock.last_cmd = cmd_str end,
      notify = function(msg) mock.last_notify = msg end,
      log = { levels = { INFO = "info" } }
    }
    M._set_vim(mock)
    mock.last_cmd = nil
    mock.last_notify = nil
  end)

  it("opens .ts file if exists", function()
    M.goto_component_ts()
    assert.are.equal(mock.last_cmd, 'edit foo/button.component.ts')
  end)

  it("notifies if .ts does not exist", function()
    mock.fn.filereadable = function() return 0 end
    M.goto_component_ts()
    assert.is_truthy(mock.last_notify:find(".ts not found"))
  end)
end)

describe("goto_component_html", function()
  local mock

  before_each(function()
    mock = {
      api = { nvim_buf_get_name = function() return "foo/button.component.ts" end },
      fn = {
        filereadable = function(name)
          if name == "foo/button.component.html" then return 1 else return 0 end
        end,
        fnameescape = function(name) return name end,
      },
      cmd = function(cmd_str) mock.last_cmd = cmd_str end,
      notify = function(msg) mock.last_notify = msg end,
      log = { levels = { INFO = "info" } }
    }
    M._set_vim(mock)
    mock.last_cmd = nil
    mock.last_notify = nil
  end)

  it("opens .html file if exists", function()
    M.goto_component_html()
    assert.are.equal(mock.last_cmd, 'edit foo/button.component.html')
  end)

  it("notifies if .html does not exist", function()
    mock.fn.filereadable = function() return 0 end
    M.goto_component_html()
    assert.is_truthy(mock.last_notify:find(".html not found"))
  end)
end)

describe("goto_component_spec", function()
  local mock

  before_each(function()
    mock = {
      api = { nvim_buf_get_name = function() return "foo/button.component.html" end },
      fn = {
        filereadable = function(name)
          if name == "foo/button.component.spec.ts" then return 1 else return 0 end
        end,
        fnameescape = function(name) return name end,
      },
      cmd = function(cmd_str) mock.last_cmd = cmd_str end,
      notify = function(msg) mock.last_notify = msg end,
      log = { levels = { INFO = "info" } }
    }
    M._set_vim(mock)
    mock.last_cmd = nil
    mock.last_notify = nil
  end)

  it("opens .spec.ts file if exists", function()
    M.goto_component_spec()
    assert.are.equal(mock.last_cmd, 'edit foo/button.component.spec.ts')
  end)

  it("notifies if .spec.ts does not exist", function()
    mock.fn.filereadable = function() return 0 end
    M.goto_component_spec()
    assert.is_truthy(mock.last_notify:find(".spec.ts not found"))
  end)
end)

describe("goto_component_css", function()
  local mock

  before_each(function()
    mock = {
      api = {
        nvim_buf_get_name = function() return "foo/button.component.ts" end,
      },
      fn = {
        filereadable = function(name)
          if name == "foo/button.component.css" then return 1 else return 0 end
        end,
        fnameescape = function(name) return name end,
      },
      cmd = function(cmd_str) mock.last_cmd = cmd_str end,
      notify = function(msg) mock.last_notify = msg end,
      log = { levels = { INFO = "info" } }
    }
    M._set_vim(mock)
    mock.last_cmd = nil
    mock.last_notify = nil
  end)

  it("opens .css file if exists", function()
    M.goto_component_css()
    assert.are.equal(mock.last_cmd, 'edit foo/button.component.css')
  end)

  it("notifies if .css does not exist", function()
    mock.fn.filereadable = function() return 0 end
    M.goto_component_css()
    assert.is_truthy(mock.last_notify:find(".css not found"))
  end)
end)

describe("goto_component_scss", function()
  local mock

  before_each(function()
    mock = {
      api = {
        nvim_buf_get_name = function() return "foo/button.component.ts" end,
      },
      fn = {
        filereadable = function(name)
          if name == "foo/button.component.scss" then return 1 else return 0 end
        end,
        fnameescape = function(name) return name end,
      },
      cmd = function(cmd_str) mock.last_cmd = cmd_str end,
      notify = function(msg) mock.last_notify = msg end,
      log = { levels = { INFO = "info" } }
    }
    M._set_vim(mock)
    mock.last_cmd = nil
    mock.last_notify = nil
  end)

  it("opens .scss file if exists", function()
    M.goto_component_scss()
    assert.are.equal(mock.last_cmd, 'edit foo/button.component.scss')
  end)

  it("notifies if .scss does not exist", function()
    mock.fn.filereadable = function() return 0 end
    M.goto_component_scss()
    assert.is_truthy(mock.last_notify:find(".scss not found"))
  end)
end)

