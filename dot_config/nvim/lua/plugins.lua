-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Colorscheme (loaded first)
  { "tomasr/molokai",
    lazy     = false,
    priority = 1000,
    config   = function() vim.cmd("colorscheme molokai") end },

  -- Git
  "tpope/vim-fugitive",

  -- Smart tmux/nvim split navigation (Ctrl+hjkl)
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- Surround: ys/cs/ds (replaces vim-surround)
  { "kylechui/nvim-surround",
    event  = "VeryLazy",
    config = function() require("nvim-surround").setup() end },

  -- Comments: gcc / gc<motion> (replaces nerdcommenter)
  { "numToStr/Comment.nvim",
    event  = "VeryLazy",
    config = function() require("Comment").setup() end },

  -- Alignment: <Enter> in visual (replaces vim-easy-align)
  { "junegunn/vim-easy-align",
    keys = { { "<Enter>", "<Plug>(EasyAlign)", mode = "v" } } },

  -- Motion: s to jump, S for treesitter (replaces easymotion + vim-seek)
  { "folke/flash.nvim",
    event = "VeryLazy",
    keys  = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end },
    } },

  -- Fuzzy finder: <leader>t files, <leader>a grep (replaces CtrlP + ag.vim)
  { "nvim-telescope/telescope.nvim",
    tag          = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>t", "<cmd>Telescope find_files<cr>" },
      { "<leader>T", "<cmd>Telescope find_files<cr>" },
      { "<leader>a", "<cmd>Telescope live_grep<cr>" },
      { "<leader>b", "<cmd>Telescope buffers<cr>" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg", "--color=never", "--no-heading",
            "--with-filename", "--line-number", "--column", "--smart-case",
          },
        },
      })
    end },

  -- Syntax / indent for all languages (replaces vim-ruby, vim-javascript, etc.)
  { "nvim-treesitter/nvim-treesitter",
    build  = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "lua", "vim", "go", "ruby", "javascript", "typescript",
          "python", "json", "html", "css", "markdown", "bash",
        },
      })
    end },

  -- LSP server installer
  { "williamboman/mason.nvim",
    config = function() require("mason").setup() end },

  -- LSP default configs (provides root patterns / filetypes; no setup() needed in nvim 0.11+)
  { "neovim/nvim-lspconfig" },

  -- Auto-install + enable servers via vim.lsp.enable (replaces syntastic)
  { "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls", "ts_ls", "ruby_lsp", "pyright" },
        automatic_enable = true,
      })
    end },

  -- Completion: <C-Space> trigger, <CR> confirm, <C-n>/<C-p> navigate
  { "hrsh7th/nvim-cmp",
    event        = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<C-n>"]     = cmp.mapping.select_next_item(),
          ["<C-p>"]     = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end },

  -- Indent guides (replaces vim-indent-guides)
  { "lukas-reineke/indent-blankline.nvim",
    main   = "ibl",
    config = function() require("ibl").setup({ indent = { char = "│" } }) end },

  -- Auto-strip trailing whitespace on save (replaces vim-trailing-whitespace)
  { "ntpeters/vim-better-whitespace",
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save  = 1
    end },

  -- Auto-close brackets + endwise for Ruby/etc.
  { "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = function() require("nvim-autopairs").setup() end },

  -- Distraction-free writing
  { "junegunn/goyo.vim", cmd = "Goyo" },

}, {
  ui = { border = "rounded" },
})
