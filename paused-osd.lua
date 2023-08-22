local mp = require 'mp'
mp.observe_property('pause', 'bool', function(_, paused)
    mp.add_timeout(0.1, function()
        if paused then 
            mp.commandv("script-message", "osc-visibility", "always", "no_osd")
        else 
            mp.commandv("script-message", "osc-visibility", "auto", "no_osd") 
        end
    end)
end)