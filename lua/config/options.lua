vim.g.c_syntax_for_h           = true
vim.g.c_functions              = true
vim.g.c_function_pointers      = true

vim.g.have_nerd_font           = vim.uv.os_uname().sysname ~= 'Linux'
    or (os.getenv('TERM') and os.getenv('TERM') ~= 'linux')

vim.g.mapleader                = ' '
vim.g.maplocalleader           = '\\'

vim.g.loaded_node_provider     = 0
vim.g.loaded_perl_provider     = 0
vim.g.loaded_python3_provider  = 0
vim.g.loaded_ruby_provider     = 0

local user                     = vim.uv.os_getenv("USER")
vim.g.loaded_netrw             = not user and 1 or (user ~= "root" and 1 or nil)
vim.g.loaded_netrwPlugin       = vim.g.loaded_netrw
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_spec              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_spellfile_plugin  = 1

-- vim.opt.shada                  = ''
-- vim.opt.shadafile              = 'NONE'

-- vim.opt.autocomplete           = true
vim.opt.completeopt            = 'menu,popup,menuone,noselect,fuzzy,preview'

vim.opt.cursorline             = true
vim.opt.number                 = true
vim.opt.relativenumber         = true
vim.opt.signcolumn             = 'yes:1'

vim.opt.hlsearch               = true
vim.opt.incsearch              = true

vim.opt.termguicolors          = vim.uv.os_uname().sysname ~= 'Linux'
    or (os.getenv('TERM') and os.getenv('TERM') ~= 'linux')

vim.opt.winborder              = 'none'
vim.opt.fillchars              = 'eob: '

vim.opt.scrolloff              = 20
vim.opt.sidescrolloff          = 10
vim.opt.splitbelow             = true
vim.opt.splitright             = true

vim.opt.clipboard              = 'unnamedplus'
vim.opt.swapfile               = false
vim.opt.undofile               = true
vim.opt.undolevels             = 1000
vim.opt.history                = 1000

vim.opt.expandtab              = true
vim.opt.tabstop                = 4
vim.opt.softtabstop            = 4
vim.opt.shiftwidth             = 4
vim.opt.autoindent             = true
vim.opt.smartindent            = true
vim.opt.cindent                = true
vim.opt.cinoptions             =
'>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,E0,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,k0,m0,j0,J0,)20,*70,#0,P0'
vim.opt.wrap                   = false
vim.opt.foldenable             = false
vim.opt.syntax                 = 'ON'

vim.opt.mouse                  = 'a'
