vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind
        local active = ev.data.active
        local path = ev.data.path
        if name == 'telescope-fzf-native' and (kind == 'install' or kind == 'update') then
            if not active then vim.cmd.packadd('telescope-fzf-native') end
            vim.system({ 'make', '-C', path },
                {
                    stdout = function(_, data) if data then io.write(data) end end,
                    stderr = function(_, data) if data then io.write('ERR: ', data) end end,
                },
                function(out)
                    io.write(
                        out.code == 0
                        and 'telescope-fzf-native.nvim built successfully.'
                        or 'Failed to build telescope-fzf-native.nvim.'
                    )
                end
            ):wait()
        end
    end
})
