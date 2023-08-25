local utils = require 'mp.utils'
function restart_mpv()
    mp.command_native({"quit"})
    
    local args = {}
    args.args = {"mpv"}
    
    utils.subprocess_detached(args)
end
mp.add_key_binding("", "restart-mpv", restart_mpv)
