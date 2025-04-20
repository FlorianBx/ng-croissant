<img src="https://angular.dev/assets/images/uwu.png" />

&nbsp;

# 🥐 ng-croissant

&nbsp;

> ✨ Angular navigation so smooth, you’ll want a coffee with it.  
> *Jump instantly between your Angular files in Neovim. Lightning fast. Minimal setup.*

&nbsp;

---

## 🚀 Features

- **One key, instant jump:** between `.component.ts`, `.component.html`, and `.component.spec.ts`
- **Smart pattern matching** (no LSP required)
- **Lightweight:** 100% Lua, zero dependencies
- **Works everywhere:** Neovim-ready, dead simple codebase

&nbsp;

---

## 📦 Installation

<details open>
<summary><b>With <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a></b></summary>

```lua
{
  "florianbx/ng-croissant",
  config = function()
    local ng = require("ng-croissant");
    ng.setup()

    local keymap = vim.keymap
    keymap.set("n", "<leader>ac", ng.goto_component_ts,   { desc = "Go to component.ts" })
    keymap.set("n", "<leader>at", ng.goto_component_html, { desc = "Go to component.html" })
    keymap.set("n", "<leader>as", ng.goto_component_spec, { desc = "Go to component.spec.ts" })
  end
}
```
</details>

&nbsp;

<details>
<summary><b>With <a href="https://github.com/wbthomason/packer.nvim">Packer</a></b></summary>

```lua
use {
  "florianbx/ng-croissant",
  config = function()
    local ng = require("ng-croissant");
    ng.setup()

    local keymap = vim.keymap
    keymap.set("n", "<leader>ac", ng.goto_component_ts,   { desc = "Go to component.ts" })
    keymap.set("n", "<leader>at", ng.goto_component_html, { desc = "Go to component.html" })
    keymap.set("n", "<leader>as", ng.goto_component_spec, { desc = "Go to component.spec.ts" })
  end
}
```
</details>

&nbsp;

Just copy, paste, and start coding!

&nbsp;

---

## ⚡ Usage

**Default keymaps:**  

| Keybinding    | Action                  |
| :-----------: | :---------------------- |
| `<leader>ac`  | Go to component.ts      |
| `<leader>at`  | Go to component.html    |
| `<leader>as`  | Go to component.spec.ts |

<br />

_Files should follow standard Angular naming: `foo.component.ts`, `foo.component.html`, `foo.component.spec.ts`._

<br />

Want your own keys? Example:

```lua
keymap.set("n", "<leader>ngt", ng.goto_component_html, { desc = "Go to component.html" })
```

&nbsp;

---

## 🎯 How does it work?

> `ng-croissant` uses **simple filename pattern matching** to quickly find and open your related Angular files.  
> No dependencies, no LSP, just smart file-based jumping.

&nbsp;

---

## ❔ FAQ

<details open>
<summary><b>Is Angular LSP required?</b></summary>

No, navigation is file-based and works out-of-the-box.
</details>

<details>
<summary><b>What if my files use a different naming convention?</b></summary>

It follows Angular’s defaults. For custom structures, feel free to adapt or PR!
</details>

<details>
<summary><b>Can I set custom keymaps?</b></summary>

Absolutely, just add your own `vim.keymap.set` lines.
</details>

&nbsp;

---

## 🤝 Contributing

Open to issues, PRs, or suggestions!  
Help keep it fast and simple!

&nbsp;

---

## 🙌 Credits

The initial inspiration came from [ng.nvim](https://github.com/joeveiga/ng.nvim) by joeveiga — thank you for lighting the path!

&nbsp;

---

## ⚖️ License

MIT License © 2025 florianbx
