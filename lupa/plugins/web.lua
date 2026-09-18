--- Replace with your browser engine of choice
--- __QUERY__ will be replaced with the search query

local browser_name = "DuckDuckGo"
local browser_query = "https://noai.duckduckgo.com/?q=__QUERY__&noai"

PREFIX = '@'

NAME = "Web"

--- @param query string
--- @return table
function GET_RESULTS(query)
    return {
        {
            name = "Search " .. query .. " in " .. browser_name,
            description = query,
            icon = "web-browser",
        },
    }
end

--- @param entry table
--- @return table | nil
function EXECUTE_ENTRY(entry)
    local launch = "xdg-open" .. "\n" .. string.gsub(browser_query, "__QUERY__", entry.description)
    return {
        action = "spawn",
        value = launch,
    }
end
