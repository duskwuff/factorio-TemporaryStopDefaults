script.on_event(defines.events.on_train_schedule_changed, function(event)
    if event.player_index and event.train and event.train.schedule then
        local ts = event.train.schedule
        local modified = false
        for i, tsr in ipairs(ts.records) do
            if tsr.temporary and tsr.wait_conditions and #tsr.wait_conditions == 1 and tsr.wait_conditions[1].type == "time" and tsr.wait_conditions[1].ticks == 300 then
                local cfg = settings.get_player_settings(event.player_index)
                local wc = {}
                if cfg["tempstop-time"].value == "never" then
                    -- set a silly condition which will never be true
                    table.insert(wc, {
                        compare_type = "and",
                        type = "circuit",
                        condition = { first_signal = { type = "virtual", name = "signal-red" } },
                    })
                elseif cfg["tempstop-time"].value ~= "0" then
                    table.insert(wc, {
                        compare_type = "and",
                        type = cfg["tempstop-mode"].value,
                        ticks = 60*cfg["tempstop-time"].value,
                    })
                end
                if cfg["tempstop-passenger"].value ~= "null" then
                    table.insert(wc, {
                        compare_type = "and",
                        type = cfg["tempstop-passenger"].value,
                    })
                end
                tsr.wait_conditions = wc
                modified = true
            end
        end
        -- write the schedule back to the train if any changes were made
        if modified then
            event.train.schedule = ts
        end
    end
end)
