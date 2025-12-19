vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new(); $PSDefaultParameterValues[\\"Out-File:Encoding\\"]=\\"utf8\\"; $PSStyle.OutputRendering = \\"PlainText\\";'
vim.cmd("let $__SuppressAnsiEscapeSequences = 1")
vim.opt.shellpipe = '> %s 2>&1'
vim.opt.shellquote = ""
vim.opt.shellxquote = ""
