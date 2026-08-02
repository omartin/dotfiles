# Neovim Configuration Guide

## Commands
- No explicit build/lint/test commands (configuration repo)
- Launch Neovim with `nvim`
- Install plugins with `:Lazy`
- Update plugins with `:Lazy update`
- Check LSP status with `:LspInfo`
- Format code with `:lua vim.lsp.buf.format()`

## Code Style
- Use 2 spaces for indentation
- Follow camelCase for variable names
- Plugin configurations return a table with standardized format
- Organize imports at the top of files
- Use vim.keymap.set for key mappings with descriptive comments
- Group related settings in modules by functionality
- Follow existing patterns for plugin configurations
- Use descriptive variable names that explain purpose

## Project Structure
- `init.lua`: Entry point
- `lua/options.lua`: General settings
- `lua/keymaps.lua`: Key mappings
- `lua/plugins/`: Individual plugin configurations