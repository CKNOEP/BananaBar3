

    local LDB = LibStub("LibDataBroker-1.1", true)
    BB3LDBIcon = LDB and LibStub("LibDBIcon-1.0", true)
    if LDB then
        local BB_MinimapBtn = LDB:NewDataObject("BananaBar3", {
            type = "launcher",
			text = "BananaBar3",
            icon = "Interface\\Addons\\BananaBar3\\Images\\BananaBar64",
            OnClick = function(_, button)
                if button == "LeftButton" then 
				
				
					if LibStub("AceConfigDialog-3.0"):Open("BananaBar3") then
						LibStub("AceConfigDialog-3.0"):Close("BananaBar3") 
					else
						LibStub("AceConfigDialog-3.0"):Open("BananaBar3") 
					end
				
				end
            end,
            OnTooltipShow = function(tt)
                tt:AddLine("Bannabar 3")
                tt:AddLine("|cffffff00Click|r to open the Bannabar settings window.")
            end,
        })
        if BB3LDBIcon then
            
			
			BB3LDBIcon:Register("BananaBar3", BB_MinimapBtn, defaultMinimapPosition) -- MinimapPos is a SavedVariable which is set to 90 as default

		end
    end
