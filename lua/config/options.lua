local g                    = vim.g
local opt                  = vim.opt

g.c_syntax_for_h           = true
g.c_functions              = true
g.c_function_pointers      = true

g.have_nerd_font           = vim.uv.os_uname().sysname ~= 'Linux'
    or (os.getenv('TERM') and os.getenv('TERM') ~= 'linux')

g.mapleader                = ' '
g.maplocalleader           = '\\'

g.loaded_node_provider     = 0
g.loaded_perl_provider     = 0
g.loaded_python3_provider  = 0
g.loaded_ruby_provider     = 0

local user                 = vim.uv.os_getenv("USER")
g.loaded_netrw             = not user and 1 or (user ~= "root" and 1 or nil)
g.loaded_netrwPlugin       = vim.g.loaded_netrw
g.loaded_shada_plugin      = 1
g.loaded_gzip              = 1
g.loaded_spec              = 1
g.loaded_tar               = 1
g.loaded_tarPlugin         = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_zipPlugin         = 1
g.loaded_zip               = 1
g.loaded_spellfile_plugin  = 1

-- opt.shada                  = ''
-- opt.shadafile              = 'NONE'

opt.autocomplete           = not user and false or user == "root"
opt.complete               = '.,w,b,o'
opt.completeopt            = 'menu,popup,menuone,noselect,fuzzy,preview'
opt.pumheight              = 10

-- opt.wildchar               = '<C-Space>'
opt.wildoptions            = 'pum,fuzzy'
opt.wildmode               = 'full:noselect'

opt.foldenable             = false
opt.foldmethod             = 'expr'
opt.foldexpr               = 'v:lua.vim.treesitter.foldexpr()'

opt.cursorline             = true
opt.number                 = true
opt.relativenumber         = true
opt.signcolumn             = 'yes:1'

opt.hlsearch               = true
opt.incsearch              = true

opt.termguicolors          = vim.uv.os_uname().sysname ~= 'Linux'
    or (os.getenv('TERM') and os.getenv('TERM') ~= 'linux')

opt.winborder              = 'none'
opt.fillchars              = 'eob: '

opt.scrolloff              = 20
opt.sidescrolloff          = 10
opt.splitbelow             = true
opt.splitright             = true

opt.clipboard              = 'unnamedplus'
opt.swapfile               = false
opt.undofile               = true
opt.undolevels             = 1000
opt.history                = 1000

opt.expandtab              = true
opt.tabstop                = 4
opt.softtabstop            = 4
opt.shiftwidth             = 4

opt.autoindent             = true
opt.smartindent            = true
opt.cindent                = true
-- opt.cinoptions             =
-- '>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,gs,hs,N0,E0,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,k0,m0,j0,J0,)20,*70,#0,P0'
opt.formatoptions          = 'tcqwnj'
opt.wrap                   = false
opt.syntax                 = 'ON'

opt.mouse                  = 'a'
