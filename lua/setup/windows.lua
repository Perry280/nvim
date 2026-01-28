local function shell()
    if vim.fn.executable("pwsh.exe") then
        return "pwsh.exe"
    else
        return "powershell.exe"
    end
end

vim.opt.shell        = shell()
vim.opt.shellcmdflag = "-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new(); $PSDefaultParameterValues['Out-File:Encoding']='utf8'; $PSStyle.OutputRendering='plaintext'; Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
vim.opt.shellredir   = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.opt.shellpipe    = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
vim.opt.shellquote   = ""
vim.opt.shellxquote  = ""
