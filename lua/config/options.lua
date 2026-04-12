vim.g.c_syntax_for_h           = true
vim.g.have_nerd_font           = true
vim.g.mapleader                = " "
vim.g.maplocalleader           = "\\"

vim.g.loaded_node_provider     = 0
vim.g.loaded_perl_provider     = 0
vim.g.loaded_python3_provider  = 0
vim.g.loaded_ruby_provider     = 0

-- vim.opt.shada                  = ""
-- vim.opt.shadafile              = "NONE"

vim.opt.completeopt            = "menu,popup,menuone,noselect" -- fuzzy

vim.opt.cursorline             = true
vim.opt.number                 = true
vim.opt.relativenumber         = true
vim.opt.signcolumn             = "yes:1"

vim.opt.hlsearch               = true
vim.opt.incsearch              = true
vim.opt.termguicolors          = vim.uv.os_uname().sysname ~= "Linux" or ((os.getenv("TERM") and os.getenv("TERM") ~= "linux") and os.getenv("COLORTERM") ~= nil)
vim.opt.winborder              = "none"

vim.opt.scrolloff              = 20
vim.opt.sidescrolloff          = 10
vim.opt.splitbelow             = true
vim.opt.splitright             = true

vim.opt.clipboard              = "unnamedplus"
vim.opt.swapfile               = false
vim.opt.undofile               = true
vim.opt.undolevels             = 1000

vim.opt.expandtab              = true
vim.opt.tabstop                = 4
vim.opt.softtabstop            = 4
vim.opt.shiftwidth             = 4
vim.opt.smartindent            = true
vim.opt.wrap                   = false
vim.opt.foldenable             = false

vim.opt.mouse                  = "a"

vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_spec              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_spellfile_plugin  = 1
