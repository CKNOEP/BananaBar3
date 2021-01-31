

    local LDB = LibStub("LibDataBroker-1.1", true)
    local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
    if LDB then
        local BB_MinimapBtn = LDB:NewDataObject("BannaBar", {
            type = "launcher",
			text = "BannaBar",
            icon = "Interface\\Addons\\BananaBar3\\Images\\BananaBar64",
            OnClick = function(_, button)
                if button == "LeftButton" then LibStub("AceConfigDialog-3.0"):Open("BananaBar3") end
            end,
            OnTooltipShow = function(tt)
                tt:AddLine("Bannabar 3")
                tt:AddLine("|cffffff00Click|r to open the Bannabar settings window.")
            end,
        })
        if LDBIcon then
            LDBIcon:Register("BannaBar", BB_MinimapBtn, MinimapPos) -- MinimapPos is a SavedVariable which is set to 90 as default
        end
    end
