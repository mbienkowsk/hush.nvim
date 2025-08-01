# 🤫 hush

Silence LSP diagnostics with a single click

## Demo
<https://github.com/user-attachments/assets/98df20f8-45c1-4587-8403-b78accd837a3>

## Installation

**lazy.nvim**
```lua
return {
  "mbienkowsk/hush.nvim",
  config = {},
  keys = {
      { "<leader>h", "<Cmd>Hush<CR>", desc = "Hush" }, -- customize
  },
  cmd = {
      "Hush", "HushAll"
  },
}
```

**packer.nvim**
```lua
use({
  "mbienkowsk/hush.nvim",
  config = function()
    require("hush").setup({})
  end,
})

vim.keymap.set("n", "<leader>h", "<Cmd>Hush<CR>", { desc = "Hush" }) -- customize
```

**vim-plug**
```vim
Plug 'mbienkowsk/hush.nvim'
lua << EOF
require("hush").setup({})
vim.keymap.set("n", "<leader>h", "<Cmd>Hush<CR>", { desc = "Hush" }) " customize
EOF
```

## Usage

Currently, the plugin supports the following diagnostic sources:

* basedpyright
* LuaLS
* clang-tidy

Hush exposes two commands - `:Hush` and `:HushAll`. `Hush` tries to silence the specific warnings emitted by the line using their error codes (if it's not supported in the source, it falls back to `HushAll`. `HushAll` disables the offended source for the line (if it's not supported in the source, falls back to `Hush`.


## Development

### Adding support for new diagnostic sources

In order to add support for hushing a source, a subclass of `DiagnosticSource` has to be added in `sources/`. Each diagnostic source has to implement 4 things:
* `comment_position` field - whether the diagnostic ignore comment is supposed to be above or on the offending line
* `build_suppress_all_diagnostics` - function returning a string which disables all diagnostics from this source for a given line
* `build_suppress_diagnostics` - function returning a string which disables the given diagnostics for a given line
* `matches_diagnostic` - function that checks if the diagnostic source matches the given diagnostic (some diagnostic sources provide several "source" arguments in the diagnostic based on the context - e.g. lua_ls)

### Run tests


Running tests requires either

- [luarocks][luarocks]
- or [busted][busted] and [nlua][nlua]

to be installed[^1].

[^1]: The test suite assumes that `nlua` has been installed
      using luarocks into `~/.luarocks/bin/`.

You can then run:

```bash
luarocks test --local
# or
busted
```

Or if you want to run a single test file:

```bash
luarocks test spec/path_to_file.lua --local
# or
busted spec/path_to_file.lua
```

If you see an error like `module 'busted.runner' not found`:

```bash
eval $(luarocks path --no-bin)
```

For this to work you need to have Lua 5.1 set as your default version for
luarocks. If that's not the case you can pass `--lua-version 5.1` to all the
luarocks commands above.

[luarocks]: https://luarocks.org
[busted]: https://lunarmodules.github.io/busted/
[nlua]: https://github.com/mfussenegger/nlua
