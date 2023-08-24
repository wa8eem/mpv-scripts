function open_url_in_browser(url)
    mp.msg.info("Opening URL in browser: " .. url)
    
    local command
    local platform = mp.get_property_native("options/vo-mmcss-profile")
    
    if platform == "win" then
        -- Windows
        command = 'start "" "' .. url .. '"'
    elseif platform == "mac" then
        -- macOS
        command = 'open "' .. url .. '"'
    else
        -- Linux (fallback)
        command = 'xdg-open "' .. url .. '"'
    end
    
    os.execute('start "" ' .. url .. "'")
end

function is_url(str)
    return string.match(str, "^https?://")
end

mp.add_key_binding("o", "open_url", function()
    local filename = mp.get_property("path")
    if is_url(filename) then
        open_url_in_browser(filename)
    end
end)
