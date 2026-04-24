require('utils').keys.set("t", "<ESC><ESC>", "<C-\\><C-N>:bd!<CR>", { desc = "Close terminal buffer" })

vim.opt.shell        = vim.fn.executable('pwsh.exe') and 'pwsh.exe' or 'powershell.exe'

vim.opt.shellcmdflag =
"-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new(); \z
$PSDefaultParameterValues['Out-File:Encoding']='utf8'; \z
$PSStyle.OutputRendering='plaintext'; \z
Remove-Alias -Force -ErrorAction SilentlyContinue tee;"

vim.opt.shellredir   = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.opt.shellpipe    = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
vim.opt.shellquote   = ""
vim.opt.shellxquote  = ""
