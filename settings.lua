data:extend({
    {
        name = "tempstop-mode",
        type = "string-setting",
        setting_type = "runtime-per-user",
        default_value = "inactivity",
        order = "01",
        allowed_values = {
            "time",
            "inactivity",
        },
    },

    {
        name = "tempstop-time",
        type = "string-setting",
        setting_type = "runtime-per-user",
        default_value = "5",
        order = "02",
        allowed_values = {
            "0",
            "1",
            "5",
            "10",
            "15",
            "30",
            "60",
            "300",
            "never"
        },
    },

    {
        name = "tempstop-passenger",
        type = "string-setting",
        setting_type = "runtime-per-user",
        default_value = "null",
        order = "03",
        allowed_values = {
            "null",
            "passenger_present",
            "passenger_not_present",
        },
    },
})
