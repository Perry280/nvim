---@meta

---@class settings.bashls.BashIde.Shfmt
---@field binaryNextLine? boolean Allow boolean operators (like && and ||) to start a line.
---@field caseIndent? boolean Indent patterns in case statements.
---@field funcNextLine? boolean Place function opening braces on a separate line.
---@field ignoreEditorconfig? boolean Ignore shfmt config options in .editorconfig (always use language server config)
---@field keepPadding? boolean **([Deprecated](https://github.com/mvdan/sh/issues/658))** Keep column alignment padding.
---@field languageDialect? "auto" | "bash" | "posix" | "mksh" | "bats" = "auto" Language dialect to use when parsing (bash/posix/mksh/bats).
---@field path? string = "shfmt" Controls the executable used for Shfmt formatting. An empty string will disable formatting.
---@field simplifyCode? boolean Simplify code before formatting.
---@field spaceRedirects? boolean Follow redirection operators with a space.

---@class settings.bashls.BashIde
---@field backgroundAnalysisMaxFiles? number = 500 Maximum number of files to analyze in the background. Set to 0 to disable background analysis.
---@field enableSourceErrorDiagnostics? boolean Enable diagnostics for source errors. Ignored if includeAllWorkspaceSymbols is true.
---@field explainshellEndpoint? string = "" Configure explainshell server endpoint in order to get hover documentation on flags and options.
---@field globPattern? string = "**/*@(.sh|.inc|.bash|.command)" Glob pattern for finding and parsing shell script files in the workspace. Used by the background analysis features across files.
---@field includeAllWorkspaceSymbols? boolean Controls how symbols (e.g. variables and functions) are included and used for completion, documentation, and renaming. If false (default and recommended), then we only include symbols from sourced files (i.e. using non dynamic statements like 'source file.sh' or '. file.sh' or following ShellCheck directives). If true, then all symbols from the workspace are included.
---@field logLevel? "debug" | "info" | "warning" | "error" = "info" Controls the log level of the language server.
---@field shellcheckArguments? string = "" Additional ShellCheck arguments. Note that we already add the following arguments: --shell, --format, and --external-sources (if shellcheckExternalSources is true).
---@field shellcheckExternalSources? boolean = true Controls whether ShellCheck is invoked with --external-sources. When enabled (default), ShellCheck follows source directives to lint referenced files. On projects with many cross-sourcing scripts this can cause unbounded memory growth. Set to false to disable.
---@field shellcheckPath? string = "shellcheck" Controls the executable used for ShellCheck linting information. An empty string will disable linting.
---@field shfmt? settings.bashls.BashIde.Shfmt

---@class settings.bashls
---@field bashIde? settings.bashls.BashIde
