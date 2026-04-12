vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name = ev.data.spec.name
        local kind = ev.data.kind
        local active = ev.data.active
        local path = ev.data.path
        if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
            if not active then vim.cmd.packadd('telescope-fzf-native.nvim') end
            vim.system({ 'make', '-C', path },
                {
                    stdout = function(_, data)
                        if data then
                            vim.notify(data, vim.log.levels.INFO)
                        end
                    end,
                    stderr = function(_, data)
                        if data then
                            vim.notify('ERR: ' .. data, vim.log.levels.ERROR)
                        end
                    end,
                },
                function(out)
                    if out.code == 0 then
                        vim.notify('telescope-fzf-native.nvim built successfully.', vim.log.levels.INFO)
                    else
                        vim.notify('Failed to build telescope-fzf-native.nvim.', vim.log.levels.ERROR)
                    end
                end
            ):wait()
        end
    end
})
