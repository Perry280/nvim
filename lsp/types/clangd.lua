---@meta

---@class settings.clangd.Clangd.InactiveRegions
---@field opacity? number = 0.55 Opacity of inactive regions (used only if clangd.inactiveRegions.useBackgroundHighlight=false)
---@field useBackgroundHighlight? boolean Use a background highlight rather than opacity to identify inactive preprocessor regions.

---@class settings.clangd.Clangd
---@field arguments? string[] = {} Arguments for clangd server.
---@field checkUpdates? boolean Check for language server updates on startup.
---@field detectExtensionConflicts? boolean = true Warn about conflicting extensions and suggest disabling them.
---@field enable? boolean = true Enable clangd language server features
---@field enableCodeCompletion? boolean = true Enable code completion provided by the language server
---@field enableHover? boolean = true Enable hovers provided by the language server
---@field fallbackFlags? string[] = {} Extra clang flags used to parse files when no compilation database is found.
---@field inactiveRegions? settings.clangd.Clangd.InactiveRegions
---@field onConfigChanged? "prompt" | "restart" | "ignore" = "prompt" What to do when clangd configuration files are changed. Ignored for clangd 12+, which can reload such files itself; however, this can be overridden with clangd.onConfigChangedForceEnable.
---@field onConfigChangedForceEnable? boolean Force enable of "On Config Changed" option regardless of clangd version.
---@field path? string = "clangd" The path to clangd executable, e.g.: /usr/bin/clangd.
---@field restartAfterCrash? boolean = true Auto restart clangd (up to 4 times) if it crashes.
---@field semanticHighlighting? boolean = true Enable semantic highlighting in clangd.
---@field serverCompletionRanking? boolean = true Always rank completion items on the server as you type. This produces more accurate results at the cost of higher latency than client-side filtering.
---@field trace? string Names a file that clangd should log a performance trace to, in chrome trace-viewer JSON format.
---@field useScriptAsExecutable? boolean Allows the path to be a script e.g.: clangd.sh.

---@class settings.clangd
---@field clangd? settings.clangd.Clangd

---@class ClangdInitializeResult: lsp.InitializeResult
---@field offsetEncoding? string
