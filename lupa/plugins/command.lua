--- Replace with your terminal of choice
--- and the corresponding argument for launching a process
local terminal = "ghostty"
local terminal_arguments = "-e"

local shell = os.getenv("SHELL") or "bash"

PREFIX = '>'

NAME = "Command"

--- @param query string
--- @return table
function GET_RESULTS(query)
    return {
        {
            name = "Run " .. query .. " in " .. terminal,
            description = query,
            icon = "utilities-terminal",
        },
    }
end

--- @param entry table
function EXECUTE_ENTRY(entry)
    local launch = terminal ..
        "\n" .. terminal_arguments .. "\n"
        .. shell .. "\n" .. "-c" .. "\n"
        .. entry.description .. ";" .. shell;

    lupa.spawn(launch)
end
