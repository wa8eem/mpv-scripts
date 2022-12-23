-- switches secondary and primary subtitles with a keybinding

local mp = require 'mp'

local function notify(message, level, duration)
    level = level or 'info'
    duration = duration or 1
    mp.osd_message(message, 1)
end

function switch_sub()
    local temp_id_1   = mp.get_property('current-tracks/sub/id') 
    local temp_id_2   = mp.get_property('current-tracks/sub2/id') 
    mp.set_property('secondary-sid', 0)
    mp.set_property('sid', temp_id_2)
    mp.set_property('secondary-sid', temp_id_1)
    mp.osd_message("Subtiles Positions Switched...")
end


mp.add_key_binding('Alt+s', 'switch-sub', switch_sub)