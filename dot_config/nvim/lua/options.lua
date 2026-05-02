local opt = vim.opt

-- General
opt.clipboard     = "unnamedplus"
opt.hidden        = true
opt.formatoptions = "qrn1"
opt.fileformats   = "unix,dos,mac"
opt.shell         = "bash"
opt.shortmess:append("I")

-- Colors
opt.termguicolors = true
opt.background    = "dark"

-- Indentation
opt.expandtab   = true
opt.tabstop     = 2
opt.shiftwidth  = 2
opt.softtabstop = 2
opt.autoindent  = true
opt.copyindent  = true

-- Appearance
opt.ruler       = true
opt.showmode    = true
opt.cursorline  = true
opt.laststatus  = 2
opt.cmdheight   = 2
opt.number      = false
opt.wrap        = false
opt.textwidth   = 80
opt.colorcolumn = "81"
opt.listchars   = { tab = "▸ ", trail = "▫" }
opt.list        = false
opt.scrolloff   = 5

-- Editing
opt.backspace = "indent,eol,start"
opt.wildmenu  = true
opt.wildmode  = "list:longest"
opt.wildignore:append("*/tmp/*,*.swp,*.zip,*.out")
opt.wildignore:append("*.so,*.dylib,*.a,*.o")
opt.wildignore:append(".git,.hg,.svn")
opt.wildignore:append("*.class,node_modules")

-- Search
opt.ignorecase = true
opt.smartcase  = true
opt.gdefault   = true
opt.incsearch  = true
opt.showmatch  = true
opt.hlsearch   = true

-- Spelling
opt.spelllang = "en"
opt.spell     = false

-- Folding
opt.foldenable = false

-- Performance
opt.autoread    = true
opt.lazyredraw  = true
opt.errorbells  = false
opt.visualbell  = false

-- History / undo
opt.history    = 1000
opt.undolevels = 1000
opt.undofile   = true
opt.backup     = false
opt.swapfile   = false

local undodir = vim.fn.expand("~/.local/share/nvim/undo")
vim.fn.mkdir(undodir, "p")
opt.undodir = undodir

-- Filetype-specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "java", "xml", "python" },
  callback = function()
    vim.opt_local.tabstop     = 4
    vim.opt_local.shiftwidth  = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Spell checking
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "text", "markdown", "gitcommit" },
  callback = function() vim.opt_local.spell = true end,
})

-- Visible whitespace
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "vim", "ruby", "javascript", "css" },
  callback = function() vim.opt_local.list = true end,
})

-- Filetype associations
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "Podfile",       command = "set filetype=ruby" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.json.schema", command = "set filetype=javascript" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md",          command = "set filetype=markdown" })

-- Save on focus lost
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wa" })
