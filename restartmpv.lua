local utils = require 'mp.utils'

local last_file_path = nil

function restart_mpv()
    mp.command_native({"quit"})
    
    if last_file_path then
        local args = {}
        args.args = {"mpv", last_file_path}
        utils.subprocess_detached(args)
    end
end

mp.observe_property("path", "string", function(_, path)
    last_file_path = path
end)

mp.add_key_binding("", "restart-mpv", restart_mpv)
