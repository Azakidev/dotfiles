-- Wallpaper picker

local wp_location = os.getenv("HOME") .. "/Projects/dotfiles/wallpaper/"

-- POSSIBLE VALUES
    -- content
    -- expressive
    -- fidelity
    -- fruit-salad
    -- monochrome
    -- neutral
    -- rainbow
    -- tonal-spot
    -- vibrant
    -- smart
local matugen_scheme = "vibrant"

PREFIX = '+'

NAME = "Wallpaper"

--- @param query string
--- @return table
function GET_RESULTS(query)
    local entries = {}

    for fname in io.popen("ls -- " .. wp_location):lines() do
        if string.find(fname, query)
            or string.find(query, "?")
            and string.find(fname, '.png', nil, true)
        then
            table.insert(
                entries,
                {
                    name = fname,
                    description = nil,
                    icon = "preferences-desktop-wallpaper-symbolic",
                }
            )
        end
    end

    return entries
end

--- @param entry table
function EXECUTE_ENTRY(entry)
    local normal = "awww" .. "\n"
        .. "img" .. "\n"
        .. "--transition-type" .. "\n"
        .. "wipe" .. "\n"
        .. "--transition-duration" .. "\n"
        .. "1" .. "\n"
        .. wp_location .. entry.name

    local overview = "awww" .. "\n"
        .. "img" .. "\n"
        .. "-n" .. "\n"
        .. "overview" .. "\n"
        .. "--transition-type" .. "\n"
        .. "center" .. "\n"
        .. "--transition-duration" .. "\n"
        .. "1" .. "\n"
        .. wp_location .. "blur/" .. entry.name

    local matugen = "matugen" .. "\n"
        .. "image" .. "\n"
        .. wp_location .. entry.name .. "\n"
        .. "-t" .. "\n"
        .. "scheme-" .. matugen_scheme .. "\n"
        .. "--source-color-index" .. "\n"
        .. "1"

    local confirm = "canberra-gtk-play" .. "\n"
        .. "-i" .. "\n"
        .. "desktop-login"

    lupa.spawn(normal)
    lupa.spawn(overview)
    lupa.spawn(matugen)
    lupa.spawn(confirm)
end
