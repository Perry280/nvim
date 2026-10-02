---@type vim.lsp.Config
return {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'ruff.toml',
        '.ruff.toml',
        '.git',
        '.venv',
    },
    ---@type init_options.ruff
    init_options = {
        settings = {
            configuration = {
                ["target-version"] = "py314",
                format = {
                    ["docstring-code-format"] = true,
                    ["docstring-code-line-length"] = 80,
                    ["indent-style"] = "space",
                    ["line-ending"] = "auto",
                    -- ["skip-magic-trailing-comma"] = true,
                },
                ["indent-width"] = 4,
                lint = {
                    -- ["dummy-variable-rgx"] = "^_$", -- "^(_+|(_+[a-zA-Z0-9_]*[a-zA-Z0-9]+?))$"
                    ["typing-extensions"] = false,
                    ["flake8-builtins"] = {
                        ["strict-checking"] = true,
                    },
                    ["flake8-type-checking"] = {
                        strict = true,
                    },
                    isort = {
                        ["force-wrap-aliases"] = true,
                        ["combine-as-imports"] = true,
                        -- ["split-on-trailing-comma"] = false,
                    },
                    pycodestyle = {
                        ["max-doc-length"] = 100,
                    },
                    pydocstyle = {
                        convention = "numpy",
                    }
                },
            },
            lineLength = 100,
            lint = {
                extendSelect = {
                    "A",
                    "ANN",
                    "COM818",
                    "E701",
                    "E702",
                    "E703",
                    "E713",
                    "E714",
                    "F",
                    "ICN",
                    "ISC",
                    "NPY",
                    "PERF",
                    "PGH",
                    "RET502",
                    "RET503",
                    "RUF103",
                    "RUF104",
                    "SIM212",
                    "SIM300",
                    "SIM910",
                    "TRY300",
                    "TRY301",
                },
                -- ignore = { "COM812", },
            }
        },
    }
}
