vim.g.mapleader = ","

local map = vim.keymap.set

-- Quick colon
map({ "n", "v" }, ";", ":", { silent = false })

-- Search
map({ "n", "v" }, "/",           "/\\v",       { silent = false })
map("n",          "<leader><space>", ":noh<cr>", { silent = true })

-- Movement on wrapped lines
map("n", "j", "gj", { silent = true })
map("n", "k", "gk", { silent = true })

-- Yank to end of line
map("n", "Y", "y$", { silent = true })

-- Tab jumps to matching bracket
map({ "n", "v" }, "<tab>", "%", { silent = true })

-- Delete without yanking
map({ "n", "v" }, "<leader>d", '"_d', { silent = true })

-- Sort selection / paragraph
map("v", "<leader>s", "!sort -f<cr>gv",    { silent = true })
map("n", "<leader>s", "vip!sort -f<cr><Esc>", { silent = true })

-- Toggle invisible chars
map("n", "<leader>i", ":set list!<cr>", { silent = true })

-- Toggle paste mode
map("n", "<F2>", ":set invpaste paste?<cr>", { silent = true })

-- Open init.lua in a split
map("n", "<leader>E", ":vsplit $MYVIMRC<cr>", { silent = true })

-- Clipboard
map("v", "<C-x>", ":!pbcopy<cr>",    { silent = true })
map("v", "<C-c>", ":w !pbcopy<cr><cr>", { silent = true })

-- Disable arrow keys
map({ "n", "i" }, "<Up>",    "<NOP>", { silent = true })
map({ "n", "i" }, "<Down>",  "<NOP>", { silent = true })
map({ "n", "i" }, "<Left>",  "<NOP>", { silent = true })
map({ "n", "i" }, "<Right>", "<NOP>", { silent = true })
map("n", "ZZ", "<NOP>", { silent = true })

-- LSP keymaps (active when an LSP attaches to a buffer)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    map("n", "gd",         vim.lsp.buf.definition,   opts)
    map("n", "gr",         vim.lsp.buf.references,   opts)
    map("n", "K",          vim.lsp.buf.hover,        opts)
    map("n", "<leader>rn", vim.lsp.buf.rename,       opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action,  opts)
    map("n", "[d",         vim.diagnostic.goto_prev, opts)
    map("n", "]d",         vim.diagnostic.goto_next, opts)
  end,
})
