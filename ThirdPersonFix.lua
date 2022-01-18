local ui_get = ui.get
local ui_set = ui.set
local ui_ref = ui.reference
local ui_hotkey = ui.new_hotkey
local client_set_event_callback = client.set_event_callback
local client_console_log = client.log
local client_console_cmd = client.exec

local new_button = ui.new_checkbox("MISC", "Settings", "Disable collision")
local new_slider = ui.new_slider("MISC", "Settings", "Thirdperson delta", 0, 150, 150)

ui.set_callback(new_slider, function()
    slider = ui.get(new_slider)
client.exec("cam_idealdist ", slider)
end)

    ui.set_callback(new_button, function()
        client.set_event_callback("paint", function()
        if ui.get(new_button) then 
            client.exec("cam_collision 0")
        else
            client.exec("cam_collision 1")
        end
    end)
end)