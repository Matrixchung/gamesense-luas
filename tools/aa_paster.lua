local ui_get,ui_set,ui_reference = ui.get,ui.set,ui.reference
local ui_new_label,ui_new_combobox,ui_new_slider,ui_new_checkbox,ui_new_multiselect = ui.new_label, ui.new_combobox, ui.new_slider, ui.new_checkbox, ui.new_multiselect

local ref_yaw_base = ui_reference("AA", "Anti-aimbot angles", "Yaw base")
local ref_yaw_mode, ref_yaw = ui_reference("AA", "Anti-aimbot angles", "Yaw")
local ref_yaw_jitter_mode, ref_yaw_jitter = ui_reference("AA", "Anti-aimbot angles", "Yaw jitter")
local ref_bodyyaw_mode, ref_bodyyaw = ui_reference("AA", "Anti-aimbot angles", "Body yaw")
local ref_fs_yaw = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local ref_limit = ui_reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local ref_edgeyaw = ui_reference("AA", "Anti-aimbot angles", "Edge yaw")
local ref_fs = ui_reference("AA", "Anti-aimbot angles", "Freestanding")




--local label_start = ui_new_label("LUA","B","-------- AA Debugger --------")
ui_new_label("LUA","B","------------------- AA Debugger -------------------")

local yaw_base = ui_new_combobox("LUA","B","Yaw base", {"Local view","At targets"})
ui_new_label("LUA","B","-------------------------------------------------------")

local yaw_mode = ui_new_combobox("LUA","B","Yaw",{"Off","180","Spin","Static","180 Z","Crosshair"})
local yaw = ui_new_slider("LUA","B"," ",-180,180,0,true,"°")
ui_new_label("LUA","B","-------------------------------------------------------")

local yaw_jitter_mode = ui_new_combobox("LUA","B","Yaw jitter",{"Off","Offset","Center","Random"})
local yaw_jitter = ui_new_slider("LUA","B"," ",-180,180,0,true,"°")
ui_new_label("LUA","B","-------------------------------------------------------")

local bodyyaw_mode = ui_new_combobox("LUA","B","Body yaw",{"Off","Opposite","Jitter","Static"})
local bodyyaw = ui_new_slider("LUA","B"," ",-180,180,0,true,"°")
ui_new_label("LUA","B","-------------------------------------------------------")


local fs_yaw = ui_new_checkbox("LUA","B","Freestanding body yaw")

local limit = ui_new_slider("LUA","B","Fake yaw limit",-60,60,0,true,"°")
local edge_yaw = ui_new_checkbox("LUA","B","Edge yaw")
local fs = ui_new_multiselect("LUA","B","Freestanding",{"Default"})

client.set_event_callback('paint_ui', function(e)
    ui_set(yaw_base,ui_get(ref_yaw_base))
    ui_set(yaw_mode,ui_get(ref_yaw_mode))
    ui_set(yaw,ui_get(ref_yaw))
    ui_set(yaw_jitter_mode,ui_get(ref_yaw_jitter_mode))
    ui_set(yaw_jitter,ui_get(ref_yaw_jitter))
    ui_set(bodyyaw_mode,ui_get(ref_bodyyaw_mode))
    ui_set(bodyyaw,ui_get(ref_bodyyaw))
    ui_set(fs_yaw,ui_get(ref_fs_yaw))
    ui_set(limit,ui_get(ref_limit))
    ui_set(edge_yaw,ui_get(ref_edgeyaw))
    ui_set(fs,ui_get(ref_fs))
end)