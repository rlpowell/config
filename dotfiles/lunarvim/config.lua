--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  -- pattern = "*.lua",
  -- timeout = 1000,
}
lvim.colorscheme = "default"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

lvim.autocommands = {
  -- Fix the horrible background for which key
  { "ColorScheme", { pattern = { "*" }, command = "highlight Pmenu ctermbg=NONE guibg=#3A3A3A" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight FloatBorder ctermbg=NONE guibg=#3A3A3A" } },
  -- And some hard-to-read stuff
  { "ColorScheme", { pattern = { "*" }, command = "highlight Visual ctermbg=DarkRed guibg=DarkRed" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight PmenuSel ctermbg=Green guibg=Green" } },
  { "ColorScheme", { pattern = { "*" }, command = "highlight CursorLine guibg=Grey15" } },
}

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode[">"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<"] = ":BufferLineCyclePrev<CR>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- Built-in command to jump to previous file; see also ctrl-o and ctrl-i
lvim.keys.normal_mode["<Leader><Space>"] = "<C-^>"

-- These will show up in which-key without ignore_missing
lvim.builtin.which_key.setup.ignore_missing = true
lvim.keys.normal_mode["<Leader>1"] = "<cmd>BufferLineGoToBuffer 1<CR>"
lvim.keys.normal_mode["<Leader>2"] = "<cmd>BufferLineGoToBuffer 2<CR>"
lvim.keys.normal_mode["<Leader>3"] = "<cmd>BufferLineGoToBuffer 3<CR>"
lvim.keys.normal_mode["<Leader>4"] = "<cmd>BufferLineGoToBuffer 4<CR>"
lvim.keys.normal_mode["<Leader>5"] = "<cmd>BufferLineGoToBuffer 5<CR>"
lvim.keys.normal_mode["<Leader>6"] = "<cmd>BufferLineGoToBuffer 6<CR>"
lvim.keys.normal_mode["<Leader>7"] = "<cmd>BufferLineGoToBuffer 7<CR>"
lvim.keys.normal_mode["<Leader>8"] = "<cmd>BufferLineGoToBuffer 8<CR>"
lvim.keys.normal_mode["<Leader>9"] = "<cmd>BufferLineGoToBuffer 9<CR>"
lvim.keys.normal_mode["<Leader>0"] = "<cmd>BufferLineGoToBuffer 10<CR>"

lvim.builtin.which_key.mappings["d"] = { "<cmd>BufferKill<CR>", "Close Buffer" }

lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope find_files<CR>", "Find File" }
lvim.builtin.which_key.mappings["c"] = { "<cmd>Telescope commands<CR>", "Find Vim Command" }

lvim.builtin.which_key.mappings["r"] = {
  name = "Rust",
  h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
  u = { "<cmd>RustMoveItemUp<cr>", "Move Item Up" },
  d = { "<cmd>RustMoveItemDown<cr>", "Move Item Down" },
  c = { "<cmd>RustOpenCargo<cr>", "Open Cargo.toml" },
  p = { "<cmd>RustParentModule<cr>", "Open Parent Module" },
  r = { "<cmd>RustRunnables<cr>", "Run Rust Commands (i.e. cargo)" },
}

-- Why some of this works here and some only in the on_config_done below, I have no idea
lvim.builtin.bufferline.highlights.buffer_selected.bg = "DarkRed"
lvim.builtin.bufferline.options.indicator = { style = "icon", icon = "[0m~V~N" }
lvim.builtin.bufferline.options.indicator_icon = nil

lvim.builtin.bufferline.on_config_done = function()
  require("bufferline").setup {
    options = {
      numbers = "ordinal",
      sort_by = "insert_at_end",
    }
  };
end

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

lvim.plugins = {
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local status_ok, rust_tools = pcall(require, "rust-tools")
      if not status_ok then
        return
      end

      local opts = {
        tools = {
          executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
          reload_workspace_from_cargo_toml = true,
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
          hover_actions = {
            --border = {
            --        { "╭", "FloatBorder" },
            --        { "─", "FloatBorder" },
            --        { "╮", "FloatBorder" },
            --        { "│", "FloatBorder" },
            --        { "╯", "FloatBorder" },
            --        { "─", "FloatBorder" },
            --        { "╰", "FloatBorder" },
            --        { "│", "FloatBorder" },
            --},
            auto_focus = true,
          },
        },
        server = {
          on_attach = require("lvim.lsp").common_on_attach,
          on_init = require("lvim.lsp").common_on_init,
          settings = {
            ["rust-analyzer"] = {
              check = {
                command = "clippy",
		extraArgs = { "--all", "--", "-W", "clippy::all" },
              }
            }
          },
        },
      }
      --local extension_path = vim.fn.expand "~/" .. ".vscode/extensions/vadimcn.vscode-lldb-1.7.3/"

      --local codelldb_path = extension_path .. "adapter/codelldb"
      --local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

      --opts.dap = {
      --        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      --}
      rust_tools.setup(opts)
    end,
    ft = { "rust", "rs" },
  },
}
