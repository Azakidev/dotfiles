local function dotnet_get_csproj_path()
    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file == "" then return nil end
    local current_dir = vim.fs.dirname(current_file)

    local csproj_files = vim.fs.find(function(name)
        return name:match('%.csproj$')
    end, { path = current_dir, upward = true, limit = 1 })

    return csproj_files[1]
end

local function dotnet_get_dll_path()
    local csproj = dotnet_get_csproj_path()
    assert(csproj, "No .csproj file found!")

    local project_dir = vim.fs.dirname(csproj)
    local project_name = vim.fs.basename(csproj):gsub("%.csproj$", "")

    return project_dir .. '/bin/Debug/net10.0/' .. project_name .. ".dll"
end

local function dotnet_build_project()
    local csproj = dotnet_get_csproj_path()
    assert(csproj, "No .csproj file found!")

    vim.notify("Build: Starting", vim.log.levels.INFO)

    local function on_exit(obj)
        if obj.code == 0 then
            vim.notify('Build: ' .. '✔️', vim.log.levels.INFO)
        else
            vim.notify('Build: ' .. '❌' .. '(code: ' .. obj.stderr .. ')', vim.log.levels.ERROR)
        end
    end

    vim.wait(500)

    vim.system({ "dotnet", "build", "-c", "Debug", csproj }, on_exit):wait()
end


return {
    {
        'mfussenegger/nvim-dap',

        config = function()
            local dap = require('dap')


            dap.adapters.coreclr = {
                type = 'executable',
                command = 'netcoredbg',
                args = { '--interpreter=vscode' }
            }

            local config = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    console = "integratedTerminal",
                    program = function()
                        if vim.fn.confirm('Recompile project?', '&yes\n&no', 2) == 1 then
                            dotnet_build_project()
                        end

                        vim.cmd.DapViewOpen()

                        return dotnet_get_dll_path()
                    end,
                },
            }


            dap.configurations.cs = config
            dap.configurations.fsharp = config

            vim.keymap.set('n', "<leader>dbg", vim.cmd.DapNew)
        end
    },
    {
        'Weissle/persistent-breakpoints.nvim',

        config = function()
            require('persistent-breakpoints').setup {
                load_breakpoints_event = { "BufReadPost" }
            }

            vim.keymap.set('n', "<leader>bp", vim.cmd.PBToggleBreakpoint)
        end
    },
    {
        'igorlfs/nvim-dap-view',

        config = function()
            local opts = {
                winbar = {
                    default_section = "scopes",
                    show_keymap_hints = false,
                },
                windows = {
                    size = 0.40,
                    position = "right",
                    terminal = {
                        size = 0.25,
                        position = "below",
                        -- List of debug adapters for which the terminal should be ALWAYS hidden
                        -- Can also be set to "true" to never show the terminal
                        hide = {},
                    },
                },
            }

            require("dap-view").setup(opts)
        end
    },
}
