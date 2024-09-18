-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.opt.compatible = false

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.undolevels = 10000
vim.opt.diffopt = vim.opt.diffopt + 'iwhiteall'
vim.opt.diffopt = vim.opt.diffopt + 'iwhite'

vim.keymap.set('n', '<C-s>', ':w<cr>', { desc = 'Write on ctrl-s' })
vim.keymap.set('n', '>', ':BufferLineCycleNext<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<', ':BufferLineCyclePrev<CR>', { desc = 'which_key_ignore' })

vim.keymap.set('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>', { desc = 'which_key_ignore' })

vim.keymap.set('n', '<leader>d', ':bdelete<CR>', { desc = 'Close Buffer' })
vim.keymap.set('n', '<leader>o', '<C-w>o', { desc = 'Close Other Windows == <C-w>o' })

vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { desc = 'Find File' })

vim.keymap.set('n', '<leader>K', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show LSP hover == K' })

-- Extra LSP bits, mostly to help remember the other shortcuts
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Show references == gr' })
vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Show definition == gd' })
vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Show declaration == gD' })
vim.keymap.set('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float({ border = "rounded"}) <CR>', { desc = 'Show line diagnostics/errors' })
vim.keymap.set('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Show implementation == gI' })
vim.keymap.set('n', '<leader>lK', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show LSP hover == K' })
vim.keymap.set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = 'Show type definition' })

-- Some of these are from
-- https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#configuration-optional
-- , some of them (gc visual, gcc) are built in
--
-- lvim.builtin.which_key.mappings['C'] = {
--   name = 'Comments',
--   A = { '<cmd>lua local api = require('Comment.api') ; api.insert.linewise.eol()<CR>', 'Comment insert end of line == gcA' },
--   O = { '<cmd>lua local api = require('Comment.api') ; api.insert.linewise.above()<CR>', 'Comment insert above == gcO' },
--   o = { '<cmd>lua local api = require('Comment.api') ; api.insert.linewise.below()<CR>', 'Comment insert below == gco' },
--   L = { '<Plug>(comment_toggle_linewise_current)', 'Comment toggle current line == gcc' },
--   B = { '<Plug>(comment_toggle_blockwise_current)', 'Comment toggle current block == gcc' },
--   l = { '<Plug>(comment_toggle_linewise)', 'Comment toggle linewise by motion == gc' },
--   b = { '<Plug>(comment_toggle_blockwise)', 'Comment toggle blockwise by motion == gb' },
-- }

-- These require https://github.com/mrcjkb/rustaceanvim
--
-- lvim.builtin.which_key.mappings['r'] = {
--   name = 'Rust',
--   h = { '<cmd>RustHoverActions<cr>', 'Hover Actions' },
--   u = { '<cmd>RustMoveItemUp<cr>', 'Move Item Up' },
--   d = { '<cmd>RustMoveItemDown<cr>', 'Move Item Down' },
--   c = { '<cmd>RustOpenCargo<cr>', 'Open Cargo.toml' },
--   p = { '<cmd>RustParentModule<cr>', 'Open Parent Module' },
--   r = { '<cmd>RustRunnables<cr>', 'Run Rust Commands (i.e. cargo)' },
-- }

-- Should learn to use this better
vim.keymap.set('n', '<Leader>ut', vim.cmd.UndotreeToggle, { desc = 'UndoTree' })

-- Aligning things in columns based on next character ; see
-- https://github.com/junegunn/vim-easy-align
vim.keymap.set('n', '<Leader>A', '<cmd>EasyAlign<cr>', { desc = 'EasyAlign' })
vim.keymap.set('v', '<Leader>A', "<cmd>'<,'>EasyAlign<cr>", { desc = 'EasyAlign' })
vim.keymap.set('v', '<Enter>', "<cmd>'<,'>EasyAlign<cr>", { desc = 'EasyAlign' })

-- Settings for textual writing, i.e. for blog post editing; got
-- these from https://stackoverflow.com/a/50415982/1461430
vim.keymap.set(
  'n',
  '<Space>t',
  ':setl number<CR>:setl textwidth=0<CR>:setl wrapmargin=0<CR>:setl wrap<CR>:setl linebreak<CR>:setl columns=80<CR>:setl spell<CR>',
  { desc = 'text mode: soft wrap' }
)

-- Settings for 'don't wrap my shit' but without the visual soft margin
vim.keymap.set(
  'n',
  '<Space>C',
  ':setl number<CR>:setl textwidth=0<CR>:setl wrapmargin=0<CR>:setl wrap<CR>:setl linebreak<CR>:setl columns&vim<CR>:setl nospell<CR>',
  { desc = 'text mode: no wrap' }
)

-- Settings for textual writing with hard wrapping
vim.keymap.set(
  'n',
  '<Space>w',
  ':setl nonumber<CR>:setl textwidth=68<CR>:setl wrapmargin=0<CR>:setl nowrap<CR>:setl formatoptions+=t<CR>:setl linebreak<CR>:setl columns&vim<CR>:setl spell<CR>',
  { desc = 'text mode: hard wrap' }
)

-- Normal settings
vim.keymap.set(
  'n',
  '<Space>n',
  ':setl nonumber<CR>:setl textwidth=68<CR>:setl wrapmargin=0<CR>:setl nowrap<CR>:setl formatoptions=cqron,j<CR>:setl nolinebreak<CR>:setl columns&vim<CR>:setl nospell<CR>',
  { desc = 'text mode: normal' }
)

vim.diagnostic.config {
  underline = true,
  virtual_text = true,
  signs = true,
  severity_sort = true,
}

-- Built-in command to jump to previous file; see also ctrl-o and ctrl-i
vim.keymap.set('n', '<Leader><Space>', '<C-^>', { desc = 'Jump to previous file' })

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = ''

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Open [c]ode diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>cf', function()
  vim.diagnostic.open_float { border = 'rounded' }
end, { desc = 'Open [c]ode diagnostic [f]loat for current line' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- <leader>l is used elsewhere
-- vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = 'which_key_ignore' })
-- vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'which_key_ignore' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'which_key_ignore' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'mbbill/undotree',
    lazy = false,
  },

  {
    'junegunn/vim-easy-align',
    lazy = false,
  },

  {
    'akinsho/bufferline.nvim',
    opts = {
      options = {
        indicator = {
          style = 'underline',
        },
        numbers = 'ordinal',
        sort_by = 'insert_at_end',
        diagnostics = 'nvim_lsp',
        diagnostics_update_on_event = true, -- use nvim's diagnostic handler
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        diagnostics_indicator = function(count, _, _, _)
          return '(' .. count .. ')'
        end,
      },
      highlights = {
        modified = { fg = 'Red' },
        modified_selected = { fg = 'Red' },
        modified_visible = { fg = 'Red' },
        diagnostic = { fg = 'Blue' },
        diagnostic_selected = { fg = 'Blue' },
        diagnostic_visible = { fg = 'Blue' },
        hint_diagnostic = { fg = 'Blue' },
        hint_diagnostic_selected = { fg = 'Blue' },
        hint_diagnostic_visible = { fg = 'Blue' },
        info_diagnostic = { fg = 'Blue' },
        info_diagnostic_selected = { fg = 'Blue' },
        info_diagnostic_visible = { fg = 'Blue' },
        warning_diagnostic = { fg = 'Yellow' },
        warning_diagnostic_selected = { fg = 'Yellow' },
        warning_diagnostic_visible = { fg = 'Yellow' },
        error_diagnostic = { fg = 'Red' },
        error_diagnostic_selected = { fg = 'Red' },
        error_diagnostic_visible = { fg = 'Red' },
      },
    },
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[c]ode' },
        { '<leader>D', group = '[D]ocument' },
        { '<leader>l', group = '[l]SP' },
        -- { '<leader>r', group = '[r]ename' },
        { '<leader>s', group = '[s]earch' },
        -- { '<leader>w', group = '[w]orkspace' },
        -- { '<leader>t', group = '[t]oggle' },
        -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      }
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    -- FIXME: currently on master (rather than a release) because
    -- https://github.com/nvim-telescope/telescope.nvim/issues/2020
    -- / https://github.com/nvim-telescope/telescope.nvim/pull/2452
    -- is not released yet
    branch = 'master',
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}

        -- Don't do bizarre truncations on find file's directory list
        defaults = {
          path_display = { 'absolute' },
          wrap_results = true,
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', function()
        builtin.diagnostics { wrap_results = true, line_width = 'full' }
      end, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sR', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch Vim [C]ommands' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      -- vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sl', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Search Lines In Current Buffer' })
      vim.keymap.set('n', '<leader>sb', ':Telescope buffers<CR>', { desc = 'Search Buffers' })
      vim.keymap.set('n', '<leader>sr', ':Telescope lsp_references<CR>', { desc = 'Search LSP References' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>cs', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[C]ode Workspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>cr', vim.lsp.buf.rename, '[R]ename')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
            -- Use a sharp border with `FloatBorder` highlights
            border = 'rounded',
            -- add the title in hover float window
            title = 'hover',
          })

          -- Inlay hint stuff
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            -- Set up a handler to notice when the LSP is all the
            -- way ready and turn on inlay hints
            --
            -- Note that this will override whatever's there,
            -- globally, but as of this writing (21 Aug 2024), there
            -- doesn't seem to be anything.  It can be viewed with
            -- `:lua =vim.lsp.handlers`
            vim.lsp.handlers['experimental/serverStatus'] = function(_, result, _, _)
              if result.quiescent then
                vim.lsp.inlay_hint.enable(false, nil)
                vim.lsp.inlay_hint.enable(true, nil)

                vim.lsp.handlers['experimental/serverStatus'] = nil
              end
            end

            -- -- Also set up a keymap to toggle inlay hints
            -- map('<leader>th', function()
            --   vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            -- end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              check = {
                command = 'clippy',
              },
            },
          },
        },

        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  -- Adds a bunch of Rust features if we decide we need that
  --
  --   {
  --     'mrcjkb/rustaceanvim',
  --     version = '^5', -- Recommended
  --     lazy = false, -- This plugin is already lazy
  --   },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>F',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'rust' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- This started life as https://github.com/pineapplegiant/spaceduck
-- , but I wanted to change several colors everywhere they occurred
-- so I just went ahead and copied it.
vim.cmd [[
hi ColorColumn guifg=NONE guibg=#16172d gui=NONE
hi CursorColumn guifg=NONE guibg=#16172d gui=NONE
hi Conceal guifg=#686f9a guibg=NONE gui=NONE
hi Cursor guifg=#0f111b guibg=#818596 gui=NONE
hi link CursorIM Cursor
hi CursorLine guifg=NONE guibg=#16172d gui=NONE
hi CursorLineNr guifg=#c1c3cc guibg=#16172d gui=NONE
hi Directory guifg=#00a3cc guibg=NONE gui=NONE
hi DiffAdd guifg=#5ccc96 guibg=#1b1c36 gui=NONE
hi DiffChange guifg=#e39400 guibg=#1b1c36 gui=NONE
hi DiffDelete guifg=#e33400 guibg=#1b1c36 gui=NONE
hi DiffText guifg=#f2ce00 guibg=#1b1c36 gui=NONE
hi EndOfBuffer guifg=#FF0000 guibg=#333333 gui=NONE
hi NonText guifg=#FF0000 guibg=#333333 gui=NONE
hi link TermCursor Cursor
hi ErrorMsg guifg=#e33400 guibg=NONE gui=NONE
hi VertSplit guifg=#000000 guibg=#000000 gui=NONE
hi Folded guifg=#686f9a guibg=#0f111b gui=NONE
hi FoldColumn guifg=#FF0000 guibg=#000000 gui=NONE
hi SignColumn guifg=#FF0000 guibg=#000000 gui=NONE
hi IncSearch guifg=#ffffff guibg=#FF0000 gui=NONE
hi LineNr guifg=#FF0000 guibg=#000000 gui=NONE
hi MatchParen guifg=#ffffff guibg=#FF0000 gui=NONE
hi ModeMsg guifg=#b3a1e6 guibg=NONE gui=NONE
hi MoreMsg guifg=#b3a1e6 guibg=NONE gui=NONE
hi Pmenu guifg=#ecf0c1 guibg=#1b1c36 gui=NONE
hi PmenuSel guifg=#ffffff guibg=#FF0000 gui=NONE
hi PmenuSbar guifg=NONE guibg=#FF0000 gui=NONE
hi PmenuThumb guifg=NONE guibg=#686f9a gui=NONE
hi Question guifg=#b3a1e6 guibg=NONE gui=NONE
hi QuickFixLine guifg=#ecf0c1 guibg=#16172d gui=NONE
hi Search guifg=#ffffff guibg=#686f9a gui=NONE
hi SpecialKey guifg=#e39400 guibg=#0f111b gui=NONE
hi SpellBad guifg=#e33400 guibg=NONE gui=underline
hi SpellLocal guifg=#ecf0c1 guibg=NONE gui=underline
hi SpellCap guifg=#5ccc96 guibg=NONE gui=underline
hi SpellRare guifg=#f2ce00 guibg=NONE gui=underline
hi StatusLine guifg=#ecf0c1 guibg=#0f111b gui=reverse
hi link StatusLineTerm StatusLine
hi StatusLineTermNC guifg=#000000 guibg=#CC99FF gui=reverse
hi link StatusLineNC StatusLineTermNC
hi TabLine guifg=#000000 guibg=#818596 gui=NONE
hi TabLineFill guifg=#818596 guibg=#000000 gui=NONE
hi TabLineSel guifg=#c1c3cc guibg=#0f111b gui=NONE
hi Visual guifg=NONE guibg=#2e4053 gui=NONE
hi link VisualNOS Visual
hi WarningMsg guifg=#e39400 guibg=#0f111b gui=NONE
hi WildMenu guifg=#000000 guibg=#c1c3cc gui=NONE
hi link Whitespace EndOfBuffer
hi diffAdded guifg=#b3a1e6 guibg=NONE gui=NONE
hi diffRemoved guifg=#e33400 guibg=NONE gui=NONE
hi Normal guifg=#ecf0c1 guibg=#0f111b gui=NONE
hi Comment guifg=#CC99FF guibg=NONE gui=NONE
hi Constant guifg=#f2ce00 guibg=NONE gui=NONE
hi Identifier guifg=#00a3cc guibg=NONE gui=NONE
hi Statement guifg=#5ccc96 guibg=NONE gui=NONE
hi PreProc guifg=#b3a1e6 guibg=NONE gui=NONE
hi Type guifg=#ce6f8f guibg=NONE gui=NONE
hi Special guifg=#b3a1e6 guibg=NONE gui=NONE
hi Underlined guifg=#5ccc96 guibg=NONE gui=underline
hi Error guifg=#e33400 guibg=NONE gui=NONE
hi Ignore guifg=#e33400 guibg=NONE gui=NONE
hi Delimiter guifg=#ecf0c1 guibg=NONE gui=NONE
hi Operator guifg=#ce6f8f guibg=NONE gui=NONE
hi Tag guifg=#b3a1e6 guibg=NONE gui=NONE
hi Debug guifg=#b3a1e6 guibg=NONE gui=NONE
hi StorageClass guifg=#b3a1e6 guibg=NONE gui=NONE
hi String guifg=#00a3cc guibg=NONE gui=NONE
hi Structure guifg=#00a3cc guibg=NONE gui=NONE
hi Typedef guifg=#00a3cc guibg=NONE gui=NONE
hi Function guifg=#5ccc96 guibg=NONE gui=NONE
hi Include guifg=#5ccc96 guibg=NONE gui=NONE
hi Label guifg=#5ccc96 guibg=NONE gui=NONE
hi Exception guifg=#e39400 guibg=NONE gui=NONE
hi Keyword guifg=#e39400 guibg=NONE gui=NONE
hi SpecialChar guifg=#e39400 guibg=NONE gui=NONE
hi Boolean guifg=#f2ce00 guibg=NONE gui=NONE
hi Character guifg=#f2ce00 guibg=NONE gui=NONE
hi Float guifg=#f2ce00 guibg=NONE gui=NONE
hi Number guifg=#f2ce00 guibg=NONE gui=NONE
hi Conditional guifg=#5ccc96 guibg=NONE gui=NONE
hi Repeat guifg=#5ccc96 guibg=NONE gui=NONE
hi Title guifg=#9A82D8 guibg=NONE gui=NONE
hi Define guifg=#9A82D8 guibg=NONE gui=NONE
hi Macro guifg=#9A82D8 guibg=NONE gui=NONE
hi PreCondit guifg=#9A82D8 guibg=NONE gui=NONE
hi link SpecialComment Comment
hi Todo guifg=#ffffff guibg=#686f9a gui=underline
hi link cFormat Title
hi link cCppOutIf1 Normal
hi link cCppOutIf2 Normal
hi link cBracket Title
hi link cssBraces Normal
hi cssSelectorOp guifg=#ce6f8f guibg=NONE gui=NONE
hi link fortranType Tag
hi link fortranStructure Structure
hi link fortranStorageClass StorageClass
hi link fortranUnitHeader Title
hi link haskellType Tag
hi link haskellIdentifier Label
hi link haskellKeyword Boolean
hi link haskellDecl Boolean
hi link htmlTagName Function
hi link htmlEndTag Conditional
hi link htmlArg Tag
hi link htmlSpecialTagName Type
hi link javaClassDecl Structure
hi link javaTypeDef Keyword
hi link jsStorageClass Title
hi link jsFunction Function
hi link jsFuncName Special
hi link jsOperator Operator
hi link jsNull Constant
hi link jsGlobalObjects Constant
hi link jsFuncCall Function
hi link jsOperatorKeyword Operator
hi link jsExceptions Error
hi link jsObjectProp Tag
hi link jsTernaryIfOperator Title
hi link jsTemplateBraces Title
hi link jsTemplateExpression String
hi link texTypeStyle Special
hi link mkdDelimiter Normal
hi link phpFunction Function
hi link phpMethod Function
hi link phpType Constant
hi link phpIdentifier Type
hi link phpStringSingle String
hi link phpStringDouble String
hi pythonOperator guifg=#ce6f8f guibg=NONE gui=NONE
hi link rubyConstant Constant
hi link rubyDefine Define
hi link rubyMethodName Function
hi link rubyInstanceVariable Tag
hi link rubyKeywordAsMethod Tag
hi link typescriptProp Tag
hi link typescriptVariable Title
hi link jsxTagName HTMLTagName
hi link jsxComponentName Tag
hi link jsxOpenPunct jsxTagName
hi link jsxClosePunct jsxOpenPunct
hi link jsxCloseString jsxClosePunct
hi link typescriptBraces Normal
hi typescriptArrowFunc guifg=#ce6f8f guibg=NONE gui=NONE
hi link typescriptNumberStaticMethod Function
hi link typescriptNumberMethod Function
hi link typescriptStringStaticMethod Function
hi link typescriptStringMethod Function
hi link typescriptArrayStaticMethod Function
hi link typescriptArrayMethod Function
hi link typescriptObjectStaticMethod Function
hi link typescriptObjectMethod Function
hi link typescriptSymbolStaticMethod Function
hi link typescriptFunctionMethod Function
hi link typescriptMathStaticMethod Function
hi link typescriptDateStaticMethod Function
hi link typescriptDateMethod Function
hi link typescriptJSONStaticMethod Function
hi link typescriptRegExpMethod Function
hi link typescriptES6MapMethod Function
hi link typescriptES6SetMethod Function
hi link typescriptPromiseStaticMethod Function
hi link typescriptPromiseMethod Function
hi link typescriptReflectMethod Function
hi link typescriptIntlMethod Function
hi link typescriptBOMNavigatorMethod Function
hi link typescriptServiceWorkerMethod Function
hi link typescriptBOMLocationMethod Function
hi link typescriptBOMHistoryMethod Function
hi link typescriptConsoleMethod Function
hi link typescriptXHRMethod Function
hi link typescriptFileMethod Function
hi link typescriptFileReaderMethod Function
hi link typescriptFileListMethod Function
hi link typescriptBlobMethod Function
hi link typescriptURLStaticMethod Function
hi link typescriptSubtleCryptoMethod Function
hi link typescriptCryptoMethod Function
hi link typescriptHeadersMethod Function
hi link typescriptRequestMethod Function
hi link typescriptResponseMethod Function
hi link typescriptCacheMethod Function
hi link typescriptEncodingMethod Function
hi link typescriptGeolocationMethod Function
hi link typescriptPaymentMethod Function
hi link typescriptPaymentResponseMethod Function
hi link typescriptDOMNodeMethod Function
hi link typescriptDOMDocMethod Function
hi link typescriptDOMEventTargetMethod Function
hi link typescriptDOMEventMethod Function
hi link typescriptDOMStorageMethod Function
hi link typescriptDOMFormMethod Function
hi link vimGroupName Normal
hi link yamlKeyValueDelimiter Normal
hi link yamlBlockMappingKey Function
hi link vistaTag Conditional
hi link vistaIcon Identifier
hi link vistaColon Normal
hi link vistaScope Constant
hi link vistaKind Conditional
hi Sneak guifg=#000000 guibg=#f2ce00 gui=NONE
hi BufferCurrent guifg=#c1c3cc guibg=#0f111b gui=NONE
hi BufferVisible guifg=#CC99FF guibg=#0f111b gui=NONE
hi BufferInactive guifg=#CC99FF guibg=#0f111b gui=NONE
hi BufferTabpageFill guifg=#0f111b guibg=#0f111b gui=NONE
hi BufferCurrentIndex guifg=#5ccc96 guibg=#0f111b gui=NONE
hi BufferVisibleIndex guifg=#CC99FF guibg=#0f111b gui=NONE
hi BufferInactiveIndex guifg=#CC99FF guibg=#0f111b gui=NONE
hi BufferCurrentMod guifg=#e39400 guibg=#0f111b gui=NONE
hi BufferVisibleMod guifg=#e39400 guibg=#0f111b gui=NONE
hi BufferInactiveMod guifg=#e39400 guibg=#0f111b gui=NONE
hi BufferCurrentSign guifg=#5ccc96 guibg=#0f111b gui=NONE
hi BufferVisibleSign guifg=#CC99FF guibg=#0f111b gui=NONE
hi BufferInactiveSign guifg=#CC99FF guibg=#0f111b gui=NONE
hi BufferCurrentTarget guifg=#ce6f8f guibg=#0f111b gui=NONE
hi BufferVisibleTarget guifg=#ce6f8f guibg=#0f111b gui=NONE
hi BufferInactiveTarget guifg=#ce6f8f guibg=#0f111b gui=NONE
]]

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
