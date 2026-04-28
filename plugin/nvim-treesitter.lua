vim.opt.foldenable = false
vim.g.no_plugin_maps = true

local languages = {
    'bash',
    'c',
    'cmake',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'python',
    'regex',
    'vim',
    'vimdoc',
}

require('nvim-treesitter').install(languages)
require('nvim-treesitter-textobjects').setup({
    select = {
        lookahead = true,
        selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = 'V',
        },
    },
    move = {
        set_jumps = true,
    },
})

local set = require('utils').keys.set
local repeat_move = require('nvim-treesitter-textobjects.repeatable_move')

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
set({ 'n', 'x', 'o' }, ';', repeat_move.repeat_last_move_next)
set({ 'n', 'x', 'o' }, ',', repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
set({ 'n', 'x', 'o' }, 'f', repeat_move.builtin_f_expr, { expr = true })
set({ 'n', 'x', 'o' }, 'F', repeat_move.builtin_F_expr, { expr = true })
set({ 'n', 'x', 'o' }, 't', repeat_move.builtin_t_expr, { expr = true })
set({ 'n', 'x', 'o' }, 'T', repeat_move.builtin_T_expr, { expr = true })

local select_textobject = require('nvim-treesitter-textobjects.select').select_textobject
local move = require('nvim-treesitter-textobjects.move')

vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function(args)
        vim.treesitter.start()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
        vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'

        local bufnr = args.buf

        set({ 'x', 'o' }, 'am', function() select_textobject('@function.outer', 'textobjects') end, { buf = bufnr, })
        set({ 'x', 'o' }, 'im', function() select_textobject('@function.inner', 'textobjects') end, { buf = bufnr, })
        set({ 'x', 'o' }, 'ac', function() select_textobject('@class.outer', 'textobjects') end, { buf = bufnr, })
        set({ 'x', 'o' }, 'ic', function() select_textobject('@class.inner', 'textobjects') end, { buf = bufnr, })
        -- set({ 'x', 'o' }, 'aa', function() select_textobject('@parameter.outer', 'textobjects') end, { buf = bufnr, })
        -- set({ 'x', 'o' }, 'ia', function() select_textobject('@parameter.inner', 'textobjects') end, { buf = bufnr, })
        set({ 'x', 'o' }, 'as', function() select_textobject('@local.scope', 'locals') end, { buf = bufnr, })

        set({ 'n', 'x', 'o' }, ']m',
            function() move.goto_next_start('@function.outer', 'textobjects') end,
            { buf = bufnr, }
        )
        set({ 'n', 'x', 'o' }, ']]', function() move.goto_next_start('@class.outer', 'textobjects') end, { buf = bufnr, })
        set({ 'n', 'x', 'o' }, ']o',
            function() move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects') end,
            { buf = bufnr, }
        )
        set({ 'n', 'x', 'o' }, ']s', function() move.goto_next_start('@local.scope', 'locals') end, { buf = bufnr, })
        set({ 'n', 'x', 'o' }, ']z', function() move.goto_next_start('@fold', 'folds') end, { buf = bufnr, })

        set({ 'n', 'x', 'o' }, ']M',
            function() move.goto_next_end('@function.outer', 'textobjects') end,
            { buf = bufnr, }
        )
        set({ 'n', 'x', 'o' }, '][', function() move.goto_next_end('@class.outer', 'textobjects') end, { buf = bufnr, })

        set({ 'n', 'x', 'o' }, '[m',
            function() move.goto_previous_start('@function.outer', 'textobjects') end,
            { buf = bufnr, }
        )
        set({ 'n', 'x', 'o' }, '[[',
            function() move.goto_previous_start('@class.outer', 'textobjects') end,
            { buf = bufnr, }
        )

        set({ 'n', 'x', 'o' }, '[M',
            function() move.goto_previous_end('@function.outer', 'textobjects') end,
            { buf = bufnr, }
        )
        set({ 'n', 'x', 'o' }, '[]',
            function() move.goto_previous_end('@class.outer', 'textobjects') end,
            { buf = bufnr, }
        )

        -- Go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        set({ 'n', 'x', 'o' }, ']f', function() move.goto_next('@conditional.outer', 'textobjects') end, { buf = bufnr, })
        set({ 'n', 'x', 'o' }, '[f',
            function() move.goto_previous('@conditional.outer', 'textobjects') end,
            { buf = bufnr, }
        )
    end,
})
