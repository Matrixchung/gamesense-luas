local ui_new_checkbox, ui_reference, ui_new_slider, ui_get, client_get_cvar, client_set_cvar, client_set_event_callback = ui.new_checkbox, ui.reference, ui.new_slider, ui.get, client.get_cvar, client.set_cvar, client.set_event_callback

local ref_slowwalk, ref_slowwalk_key = ui_reference("AA", "Other", "Slow motion")
local random_slowwalk = ui_new_checkbox("AA", "Other", "Random slow motion")
local slider_slowwalk = ui_new_slider("AA", "Other", "Slow motion speed", 1, 100, 30, true, "u")
local slow_favor = ui_reference("AA", "Other", "Slow motion type")

local function setSpeed(newSpeed)
	if client_get_cvar("cl_sidespeed") == 450 and newSpeed == 450 then
		return
	end

    client_set_cvar("cl_sidespeed", newSpeed)
    client_set_cvar("cl_forwardspeed", newSpeed)
    client_set_cvar("cl_backspeed", newSpeed)
end

client_set_event_callback("run_command", function()
	if not ui_get(ref_slowwalk) then 
		return 
	end

	if not ui_get(ref_slowwalk_key) then
		setSpeed(450)
	else
		setSpeed(ui_get(slider_slowwalk))
		if ui_get(random_slowwalk) then
			local pest = client.random_int(1, 3)
			if pest == 1 then
				ui.set(slow_favor, "Favor high speed")
			elseif pest == 2 then
			   ui.set(slow_favor, "Favor anti-aim")
			elseif pest == 3 then
				ui.set(slow_favor, "Favor high speed")
			end
		end
	end
end)