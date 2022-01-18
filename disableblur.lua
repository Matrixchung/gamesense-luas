local disable_blur = cvar["@panorama_disable_blur"]
local disable_blur_checkbox = ui.new_checkbox("VISUALS", "Effects", "Disable Panorama UI Blur")

local function run()
    disable_blur:set_raw_int(ui.get(disable_blur_checkbox) and 1 or 0)
end

ui.set_callback(disable_blur_checkbox, run)