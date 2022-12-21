--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
local home = vim.fn.expand("D:/soft/obsidian/My_md_zettel")
-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
vim.cmd [[
let g:python3_host_prog = 'C:/Python310/python.exe'
let g:virtualenv_directory = 'C:/Users/reg16/Envs'
]]
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- FAQ: Set colorscheme to use
  colorscheme = "default_theme",

  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {

  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    -- FAQ: mapping settings
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
      ["<A-h>"] = { "<C-w>h", desc = "Move left" },
      ["<A-j>"] = { "<C-w>j", desc = "Move down" },
      ["<A-k>"] = { "<C-w>k", desc = "Move up" },
      ["<A-l>"] = { "<C-w>l", desc = "Move right" },
      ["<leader>-"] = { ":e $HOME/AppData/Local/nvim/init.lua<CR>", desc = "open config file" },
      ["<leader>x"] = { ":bp<bar>sp<bar>bn<bar>bd!<Enter>", desc = "open config file" },
      ["<C-n>"] = { ":Neotree reveal_force_cwd<Enter>", desc = "reveal Neotree window" },
      -- hop key
      ["jf"] = { ":HopChar2<cr>", silent=true, desc = "find letter" },
      --browse key
      ["<m-o>"] = { "<cmd>BrowseBookmarks<cr>", desc = "browse_bookmarks" },
      ["<m-i>"] = { "<cmd>BrowseInputSearch<cr>", desc = "google search" },
      --telescope key
      ["<leader>fp"] = { ":lua require('telescope').extensions.projects.projects()<CR>", desc = "project search" },
      ["<leader>ft"] = { ":TodoTelescope<CR>", desc = "todo_search" },
      ["<leader>ss"] = { ":lua require('spectre').open()<CR>", desc = "spectre" },
      --telekastennnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
      ["<leader>zd"] = { ":lua require('telekasten').find_daily_notes()<CR>", desc="find_daily_notes"},
      ["<leader>zg"] = { ":lua require('telekasten').search_notes()<CR>", desc="search_notes"},
      ["<leader>zz"] = { ":lua require('telekasten').follow_link()<CR>", desc="follow_link"},
      -- ["<leader>zT"] = { ":lua require('telekasten').goto_today()<CR>", desc="cast"},
      -- ["<leader>zW"] = { ":lua require('telekasten').goto_thisweek()<CR>", desc="cast"},
      -- ["<leader>zw"] = { ":lua require('telekasten').find_weekly_notes()<CR>", desc="cast"},
      ["<leader>zn"] = { ":lua require('telekasten').new_note()<CR>", desc="new_note"},
      ["<leader>zN"] = { ":lua require('telekasten').new_templated_note()<CR>", desc="new_templated_note"},
      ["<leader>zy"] = { ":lua require('telekasten').yank_notelink()<CR>", desc="yank_notelink"},
      ["<leader>zc"] = { ":lua require('telekasten').show_calendar()<CR>", desc="show_calendar"},
      ["<leader>zC"] = { ":CalendarT<CR>", desc="CalendarT"},
      -- TIP: разобраться что делают эти функции
      ["<leader>zi"] = { ":lua require('telekasten').paste_img_and_link()<CR>", desc="paste_img_and_link"},
      ["<leader>zt"] = { ":lua require('telekasten').toggle_todo()<CR>", desc="toggle_todo"},
      ["<leader>zb"] = { ":lua require('telekasten').show_backlinks()<CR>", desc="show_backlinks"},
      ["<leader>zF"] = { ":lua require('telekasten').find_friends()<CR>", desc="cast"},
      ["<leader>zI"] = { ":lua require('telekasten').insert_img_link({ i=true })<CR>", desc="insert_img_link"},
      ["<leader>zp"] = { ":lua require('telekasten').preview_img()<CR>", desc="preview_img"},
      ["<leader>zm"] = { ":lua require('telekasten').browse_media()<CR>", desc="browse_media"},
      ["<leader>za"] = { ":lua require('telekasten').show_tags()<CR>", desc="show_tags"},
      -- ["<leader>#"] = { ":lua require('telekasten').show_tags()<CR>", desc="cast"},
      ["<leader>zr"] = { ":lua require('telekasten').rename_note()<CR>", desc="rename_note"},
      --ultisnip mapping
      -- ["ff"] = { "UltiSnipsJumpForwardTrigger", desc="Ulti_forward"},
      -- ["bb"] = { "UltiSnipsJumpBackwardTrigger", desc="Ulti_backward"},


      ["<C-C>"] = { '"+yy', desc = "copy to global buffer" },
      ["<p>"] = { '"+gP', desc = "paste from global buffer" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },

  --FAQ: Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["nvim-neo-tree/neo-tree.nvim"] = { disable = true },
      ["rafamadriz/friendly-snippets.nvim"] = { disable = true },
      ["L3MON4D3/LuaSnip.nvim"] = { disable = true },
      ["saadparwaiz1/cmp_luasnip.nvim"] = { disable = true },
      ["mfussenegger/nvim-dap"] = { disable = false },
      ["rcarriga/nvim-dap-ui"] = { disable = false },
      ["jayp0521/mason-nvim-dap.nvim"] = { disable = false },
      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      { "phaazon/hop.nvim" },
      { "folke/todo-comments.nvim" },
      {"andymass/vim-matchup" },
      { "folke/zen-mode.nvim" },
      { "karb94/neoscroll.nvim" },
      { "junegunn/vim-slash" },
      { 'renerocksai/telekasten.nvim' },
      { 'renerocksai/calendar-vim' },
      { 'lalitmee/browse.nvim' },
      { 'hkupty/iron.nvim' },
      {"ahmedkhalf/project.nvim"},
      {"windwp/nvim-spectre"},
      {"morhetz/gruvbox"},
      {"tomasr/molokai"},
      {"jmcantrell/vim-virtualenv"},
      {"nanotee/sqls.nvim"},
      {"SirVer/ultisnips"},
      {"honza/vim-snippets"},
      {"quangnguyen30192/cmp-nvim-ultisnips"},
      {"vim-scripts/vim-autopep8"}

      -- { "andweeb/presen,ce.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
      }
      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  -- LuaSnip Options
  -- luasnip = {
  --   -- Extend filetypes
  --   filetype_extend = {
  --     -- javascript = { "javascriptreact" },
  --   },
  --   -- Configure luasnip loaders (vscode, lua, and/or snipmate)
  --   vscode = {
  --     -- Add paths for including more VS Code style snippets in luasnip
  --     paths = {},
  --   },
  -- },
  --
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      ultisnips = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
-- NOTE: ALPHA dashboard setting
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end
--
local dashboard = require "alpha.themes.dashboard"
--
local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end
--
--
dashboard.section.header.val = {
[[░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░]],
[[░░░░░░░░░░░░░░░░░░░░░░░░░░░┌───┬───┬───┐░░░░░░░░░░░░░░░░░░░░░]],
[[░░░░░░░░░┌─────────────┬░░░│┌─┐│┌──┴┐┌┐│░░░░░░░░░░░░░░░░░░░░░]],
[[░░░░░░░┌─┘───────────┌─┤░░░│└─┘│░──┐││││░░░░░░░░░░░░░░░░░░░░░]],
[[░░░░░┌─┘────────────┌┘╬│░░░│┌┐┌┤┌──┘││││░░░░░░░░░░░░░░░░░░░░░]],
[[░░░░┌┘────────────┌─┘╬╬│░░░│││└┤│░░┌┘└┘│░░░░░░░░░░░░░░░░░░░░░]],
[[░░┌─┘───────────┌─┘╬╬┌─┤░░░└┘└─┴┘░░└───┘░░░░░░░░░░░░░░░░░░░░░]],
[[░░├─────────────┤╬╬┌─┘═│░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░]],
[[░░│╬╬╬╬╬╬╬╬╬╬╬╬╬│╬─┘═══│░░░░┌┐┌─┐░┌┐░░░░░░░░░░░░░┌┐░░░░░░░░░░]],
[[░░│╬╬╬╬╬╬╬╬╬┌───┼┘═══┌─┤░░░┌┘└┤│└┐││░░░░░░░░░░░░┌┘└┐░░░░░░░░░]],
[[░░├─────────┘═══│══┌─┘║│░░░└┐┌┤┌┐└┘├──┬┐┌┬┬──┬──┼┐┌┼──┬─┐░░░░]],
[[░░│═════════════│┌─┘║┌─┘░░░░││││└┐││┌┐│└┘├┤┌┐│┌┐││││┌┐│┌┘░░░░]],
[[░░│═════┌───────┼┘║║┌┘░░░░░░│└┤│░│││┌┐├┐┌┤│└┘│┌┐││└┤└┘││░░░░░]],
[[░░├─────┘║║║║║║║│║┌─┘░░░░░░░└─┴┘░└─┴┘└┘└┘└┴─┐├┘└┘└─┴──┴┘░░░░░]],
[[░░└─────────────┴─┘░░░░░░░░░░░░░░░░░░░░░░░┌─┘│░░░░░░░░░░░░░░░]],
[[░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░└──┘░░░░░░░░░░░░░░░]],
}
dashboard.section.buttons.val = {
  button("f", "  Find file", ":Telescope find_files <CR>"),
  button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  button("p", " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  button("r", "  Recent files", ":Telescope oldfiles <CR>"),
  button("t", "  Find text", ":Telescope live_grep <CR>"),
  -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
  button("s", "  Find Session", ":SessionManager load_session<CR>"),
  -- TODO: сделать линк на bookmarks
  --astronvim.alpha_button("LDR f m", "  Bookmarks  "),
  button("c", " Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("u", "  Update", ":PackerSync<CR>"),
  button("q", " Quit", ":qa<CR>"),
}
-- dashboard.section.header.opts.hl = "Include"
-- dashboard.section.buttons.opts.hl = "Macro"
--
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
--
--NOTE: HOP plugin
local status_ok, hop = pcall(require, "hop")
if not status_ok then
	return
end
hop.setup()
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
--NOTE:neoscroll plugin
local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
  return
end
neoscroll.setup {
  -- All these keys will be mapped to their corresponding default scrolling animation
  mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
  hide_cursor = true, -- Hide cursor while scrolling
  stop_eof = true, -- Stop at <EOF> when scrolling downwards
  use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
  respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
}
--NOTE: project plugin
local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
	return
end
project.setup({
	---@usage set to false to disable project.nvim.
	--- This is on by default since it's currently the expected behavior.
	active = true,

	on_config_done = nil,

	---@usage set to true to disable setting the current-woriking directory
	--- Manual mode doesn't automatically change your root directory, so you have
	--- the option to manually do so using `:ProjectRoot` command.
	manual_mode = false,

	---@usage Methods of detecting the root directory
	--- Allowed values: **"lsp"** uses the native neovim lsp
	--- **"pattern"** uses vim-rooter like glob pattern matching. Here
	--- order matters: if one is not detected, the other is used as fallback. You
	--- can also delete or rearangne the detection methods.
	-- detection_methods = { "lsp", "pattern" }, -- NOTE lsp detection will get annoying with multiple langs in one project
	detection_methods = { "pattern" },

	---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

	---@ Show hidden files in telescope when searching for files in a project
	show_hidden = false,

	silent_chdir = true,

	ignore_lsp = {},

	---@type string
	---@usage path to store the project history for use in telescope
  datapath = vim.fn.stdpath("data"),
})
local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
	return
end
telescope.load_extension('projects')

-- NOTE: todo plugin
local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

local error_red = "#F44747"
local warning_orange = "#ff8800"
-- local info_yellow = "#FFCC66"
local hint_blue = "#4FC1FF"
local perf_purple = "#7C3AED"
local note_green = '#10B981'
-- [[TODO] ]
todo_comments.setup {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = "", -- icon used for the sign, and in search results
      color = error_red, -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = "", color = hint_blue, alt = { "TIP" } },
    HACK = { icon = "", color = warning_orange, alt={ "FAQ" } },
    WARN = { icon = "", color = warning_orange, alt = { "WARNING", "XXX" } },
    PERF = { icon = "", color = perf_purple, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "", color = note_green, alt = { "INFO" } },
  },
  -- merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    -- keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- ругялярка для подсветки XXX: пробел должен стоять в конце!!!
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = { "markdown" }, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  -- colors = {
  --   error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
  --   warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
  --   info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
  --   hint = { "LspDiagnosticsDefaultHint", "#10B981" },
  --   default = { "Identifier", "#7C3AED" },
  -- },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
--NOTE:browse plugin
local status_ok, browse = pcall(require, "browse")
if not status_ok then
  return
end
require('browse').setup({
  -- search provider you want to use
  provider = "google", -- default
})
browse.setup {
  provider = "brave",
}
local bookmarks = {
    "https://srv.rfdyn.ru",
    "https://mail.rfdyn.ru/#1",
    "https://rchat.rfdyn.ru/home",
    "https://support.rfdyn.ru/index.php",
    "https://srv.rfdyn.ru/releases/releases_dir.php",
    "https://petrowiki.spe.org/PetroWiki",
    "https://stepik.org/",
    "https://baguzin.ru/wp/",
    "https://pbpython.com/index.html",
    "https://github.com/rockerBOO/awesome-neovim",
    "https://doc.rust-lang.org/book/",
    "https://aur.archlinux.org/packages/",
    "https://news.ycombinator.com/",
  -- "https://github.com/neovim/neovim",
  -- "https://neovim.discourse.group/",
}

local function command(name, rhs, opts)
  opts = opts or {}
  vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseInputSearch", function()
  browse.input_search()
end, {})

command("Browse", function()
  browse.browse { bookmarks = bookmarks }
end, {})
command("BrowseBookmarks", function()
  browse.open_bookmarks { bookmarks = bookmarks }
end, {})
command("BrowseDevdocsSearch", function()
  browse.devdocs.search()
end, {})
command("BrowseDevdocsFiletypeSearch", function()
  browse.devdocs.search_with_filetype()
end, {})
command("BrowseMdnSearch", function()
  browse.mdn.search()
end, {})
local opts = { noremap = true, silent = true }

--NOTE: spectre plugin
local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
	return
end
spectre.setup({

	color_devicons = true,
	highlight = {
		ui = "String",
		search = "DiffChange",
		replace = "DiffDelete",
	},
	mapping = {
		["toggle_line"] = {
			map = "t",
			cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
			desc = "toggle current item",
		},
		["enter_file"] = {
			map = "<cr>",
			cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
			desc = "goto current file",
		},
		["send_to_qf"] = {
			map = "Q",
			cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
			desc = "send all item to quickfix",
		},
		["replace_cmd"] = {
			map = "c",
			cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
			desc = "input replace vim command",
		},
		["show_option_menu"] = {
			map = "o",
			cmd = "<cmd>lua require('spectre').show_options()<CR>",
			desc = "show option",
		},
		["run_replace"] = {
			map = "R",
			cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
			desc = "replace all",
		},
		["change_view_mode"] = {
			map = "m",
			cmd = "<cmd>lua require('spectre').change_view()<CR>",
			desc = "change result view mode",
		},
		["toggle_ignore_case"] = {
			map = "I",
			cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
			desc = "toggle ignore case",
		},
		["toggle_ignore_hidden"] = {
			map = "H",
			cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
			desc = "toggle search hidden",
		},
		-- you can put your mapping here it only use normal mode
	},
	find_engine = {
		-- rg is map with finder_cmd
		["rg"] = {
			cmd = "rg",
			-- default args
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			options = {
				["ignore-case"] = {
					value = "--ignore-case",
					icon = "[I]",
					desc = "ignore case",
				},
				["hidden"] = {
					value = "--hidden",
					desc = "hidden file",
					icon = "[H]",
				},
				-- you can put any option you want here it can toggle with
				-- show_option function
			},
		},
		["ag"] = {
			cmd = "ag",
			args = {
				"--vimgrep",
				"-s",
			},
			options = {
				["ignore-case"] = {
					value = "-i",
					icon = "[I]",
					desc = "ignore case",
				},
				["hidden"] = {
					value = "--hidden",
					desc = "hidden file",
					icon = "[H]",
				},
			},
		},
	},
	replace_engine = {
		["sed"] = {
			cmd = "sed",
			args = nil,
		},
		options = {
			["ignore-case"] = {
				value = "--ignore-case",
				icon = "[I]",
				desc = "ignore case",
			},
		},
	},
	default = {
		find = {
			--pick one of item in find_engine
			cmd = "rg",
			options = { "ignore-case" },
		},
		replace = {
			--pick one of item in replace_engine
			cmd = "sed",
		},
	},
	replace_vim_cmd = "cdo",
	is_open_target_win = true, --open file on opener window
	is_insert_mode = false, -- start open panel on is_insert_mode
})
-- NOTE: Telekasten plugin
require('telekasten').setup({
    home         = home,

    -- if true, telekasten will be enabled when opening a note within the configured home
    take_over_my_home = true,

    -- auto-set telekasten filetype: if false, the telekasten filetype will not be used
    --                               and thus the telekasten syntax will not be loaded either
    auto_set_filetype = true,

    -- dir names for special notes (absolute path or subdir name)
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image (sub)dir for pasting
    -- dir name (absolute path or subdir name)
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "FILES",

    -- markdown file extension
    extension    = ".md",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/basic.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 4,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

    -- command palette theme: dropdown (window) or ivy (bottom panel)
    command_palette_theme = "ivy",

    -- tag list theme:
    -- get_cursor: small tag list at cursor; ivy and dropdown like above
    show_tags_theme = "ivy",

    -- when linking to a note in subdir/, create a [[subdir/title]] link
    -- instead of a [[title only]] link
    subdirs_in_links = true,

    -- template_handling
    -- What to do when creating a new note via `new_note()` or `follow_link()`
    -- to a non-existing note
    -- - prefer_new_note: use `new_note` template
    -- - smart: if day or week is detected in title, use daily / weekly templates (default)
    -- - always_ask: always ask before creating a note
    template_handling = "smart",

    -- path handling:
    --   this applies to:
    --     - new_note()
    --     - new_templated_note()
    --     - follow_link() to non-existing note
    --
    --   it does NOT apply to:
    --     - goto_today()
    --     - goto_thisweek()
    --
    --   Valid options:
    --     - smart: put daily-looking notes in daily, weekly-looking ones in weekly,
    --              all other ones in home, except for notes/with/subdirs/in/title.
    --              (default)
    --
    --     - prefer_home: put all notes in home except for goto_today(), goto_thisweek()
    --                    except for notes with subdirs/in/title.
    --
    --     - same_as_current: put all new notes in the dir of the current note if
    --                        present or else in home
    --                        except for notes/with/subdirs/in/title.
    new_note_location = "smart",

    -- should all links be updated when a file is renamed
    rename_update_links = true,
})

-- NOTE: iron config
local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        command = {"zsh"}
      },
      python = {
        command = { "ipython" }
        -- format = require("iron.fts.common").bracketed_paste,
      }
    },
    preffered ={
      python="ipython"
      -- clojure = "lein"
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  }
} 
 -- [NOTE:] CMP with ultisnip config
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

cmp.setup {
 formatting = {
   fields = { "kind", "abbr", "menu" },
   format = function(entry, vim_item)
     -- Kind icons
     vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
     -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
     vim_item.menu = ({
       nvim_lsp = "[LSP]",
       ultisnips = "[Snippet]",
       buffer = "[Buffer]",
       path = "[Path]",
     })[entry.source.name]
     return vim_item
   end,
 },
 sources = {
   { name = "nvim_lsp" },
   { name = "ultisnips" },
   { name = "buffer" },
   { name = "path" },
 },
 confirm_opts = {
   behavior = cmp.ConfirmBehavior.Replace,
   select = false,
 },
 window = {
     documentation = cmp.config.window.bordered(),
     },
 experimental = {
   ghost_text = false,
   native_menu = false,
 },
}
return config
