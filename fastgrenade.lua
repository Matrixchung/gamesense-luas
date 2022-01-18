client.set_event_callback(
    "grenade_thrown",
    function(e)
        if not entity.get_local_player() then
            return
        end
        if not entity.is_alive(entity.get_local_player()) then
            return
        end
        local me = client.userid_to_entindex(e.userid)
        if me ~= entity.get_local_player() then
            return
        end
        client.exec("slot1")
    end
)