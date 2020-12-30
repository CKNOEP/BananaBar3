BananaBar3 =
    LibStub("AceAddon-3.0"):NewAddon(
    "BananaBar3",
    "AceConsole-3.0",
    "AceHook-3.0",
    "AceEvent-3.0",
    "AceBucket-3.0",
    "AceTimer-3.0"
)

local L = LibStub("AceLocale-3.0"):GetLocale("BananaBar3")

--local Tablet = LibStub("Tablet-2.0")

local BananaBar3AssistButton = LibStub("BananaBar3AssistButton-2.0")
local BananaBar3Button = LibStub("BananaBar3Button-2.0")

local SecureActionQueue = LibStub("SecureActionQueue-2.0")

local AceConfigDialog = LibStub("AceConfigDialog-3.0")

local actual_settings_version = 4

BINDING_HEADER_BananaBar3_PLUGINNAME = L["addonnamelong"]
BINDING_NAME_BananaBar3_BINDING_MOUSEOVER = L["binding_mouseover"]
BINDING_NAME_BananaBar3_BINDING_KEY = L["binding_key"]
BINDING_NAME_BananaBar3_BINDING_SEARCH = L["binding_search"]

BananaBar3.name = L["addonname"]
BananaBar3.version = "3.0.9";
BananaBar3.date = "2020-08-11 T22:53:58Z";
BananaBar3.hasIcon = "Interface\\Addons\\BananaBar3\\Images\\BananaBar64"
BananaBar3.defaultMinimapPosition = 170



--local options = {
options = {
    handler = BananaBar3,
    type = "group",
    args = {
        updaterate = {
            type = "range",
            width = "full",
            name = L["updaterate"],
            desc = L["updateratedesc"],
            get = function()
                return BananaBar3:Get_updaterate()
            end,
            set = function(info, v)
                BananaBar3:Set_updaterate(v)
            end,
            min = 0.1,
            max = 2,
            step = 0.1,
            order = 1
        },
        reset = {
            name = L["reset"],
            desc = L["resetdesc"],
            hidden = false,
            width = "full",
            type = "execute",
            func = function()
                BananaBar3:ResetSettings()
            end
        },
        layoutmode = {
            type = "toggle",
            name = L["layoutmode"],
            width = "full",
            desc = L["layoutmodedesc"],
            get = function()
                return BananaBar3:Get_layoutmode()
            end,
            set = function(info, v)
                BananaBar3:Set_layoutmode(v)
            end,
            order = 5
        },
        autosetcombat = {
            type = "toggle",
            width = "full",
            name = L["autosetcombat"],
            desc = L["autosetcombatdesc"],
            get = function()
                return BananaBar3:Get_autosetcombat()
            end,
            set = function(info, v)
                BananaBar3:Set_autosetcombat(v)
            end,
            order = 4
        },
        showdebugmessages = {
            type = "toggle",
            width = "full",
            name = L["showdebugmessages"],
            desc = L["showdebugmessagesdesc"],
            get = function()
                return BananaBar3:Get_showdebugmessages()
            end,
            set = function(info, v)
                BananaBar3:Set_showdebugmessages(v)
            end,
            order = 3
        },
        mobsettings = {
            type = "group",
            hidden = true,
            name = L["mobsettings"],
            desc = L["mobsettingsdesc"],
            args = {},
            order = 2
        },
        mousebutton = {
            type = "group",
            hidden = false,
            name = L["mousebutton"],
            desc = L["mousebuttondesc"],
            order = 3,
            args = {

            action_config = {
                type = "header",
                name = L["action_config"],
                desc = L["action_configdesc"],
                order = 0,
            },
				config_mouse = {
                type = "select",
                width = "full",
                name = "",
                values = {
                    --[10] = "Left mouse button",
                    --[11] = "Right mouse button",
                    [12] = "Middle mouse button",
                    --[13] = "Mouse 4",
                    --[14] = "Mouse 5",
                },
                get = function()
                    return BananaBar3:Get_action_part_mouse("action_config", v)
                end,
                set = function(info, v)
                    BananaBar3:Set_action_part_mouse("action_config", v)
                end,
                order = 1
            },
				--config_shift = {
                --type = "toggle",
                --width = "half",
				--name = L["shift"],
                --desc = L["shiftdesc"],
                ----get = function()
                --    return BananaBar3:Get_action_part("action_config", 1)
                --end,
                --set = function(info, v)
                --    BananaBar3:Set_action_part("action_config", 1, v)
                --end,
                
				--order = 2
            --},
				--config_control = {
                --type = "toggle",
                --width = "half",
				--name = L["control"],
                --desc = L["controldesc"],
                --get = function()
                --    return BananaBar3:Get_action_part("action_config", 2)
                --end,
                --set = function(info, v)
                --    BananaBar3:Set_action_part("action_config", 2, v)
                --end,
               
			   -- order = 3
            --},
				--config_alt = {
                --type = "toggle",
                --width = "half",
				--name = L["alt"],
                --desc = L["altdesc"],
                --get = function()
                --    return BananaBar3:Get_action_part("action_config", 3)
                --end,
                --set = function(info, v)
                --    BananaBar3:Set_action_part("action_config", 3, v)
                --end,
                
				--order = 4
            --},
             action_targetsetsymbol = {
                type = "header",
                name = L["action_setTargetsymbol"],
                desc = L["action_setTargetsymboldesc"],
                order = 10
            },
				targetsetsymbol_mouse = {
                type = "select",
                width = "full",
                name = "",
                values = {
                    [10] = "Left mouse button",
                    --[11] = "Right mouse button",
                    --[12] = "Middle mouse button",
                    --[13] = "Mouse 4",
                    --[14] = "Mouse 5",
                },
                get = function()
                    return BananaBar3:Get_action_part_mouse("action_setTargetsymbol", v)
                end,
                set = function(info, v)
                    BananaBar3:Set_action_part_mouse("action_setTargetsymbol", v)
                end,
                order = 11
            },
		--		targetsetsymbol_shift = {
        --        type = "toggle",
        --        width = "half",
        --        name = L["shift"],
        --        desc = L["shiftdesc"],
        --        get = function()
        --            return BananaBar3:Get_action_part("action_setTargetsymbol", 1)
        --        end,
        --        set = function(info, v)
        --            BananaBar3:Set_action_part("action_setTargetsymbol", 1, v)
        --        end,
        --        order = 0
		--		--order = 12
        --    },
		--		targetsetsymbol_control = {
        --        type = "toggle",
        --        width = "half",
        --        name = L["control"],
        --        desc = L["controldesc"],
        --        get = function()
        --            return BananaBar3:Get_action_part("action_setTargetsymbol", 2)
        --        end,
        --        set = function(info, v)
        --            BananaBar3:Set_action_part("action_setTargetsymbol", 2, v)
        --        end,
        --        order = 0
		--		--order = 13
        --    },
		--		targetsetsymbol_alt = {
        --        type = "toggle",
        --        width = "half",
        --        name = L["alt"],
        --        desc = L["altdesc"],
        --        get = function()
        --            return BananaBar3:Get_action_part("action_setTargetsymbol", 3)
        --        end,
        --        set = function(info, v)
        --            BananaBar3:Set_action_part("action_setTargetsymbol", 3, v)
        --        end,
        --        order = 0
		--		--order = 14
        --    },
             action_setsymbol = {
                type = "header",
                name = L["action_setsymbol"],
                desc = L["action_setsymboldesc"],
                order = 20
            },
				setsymbol_mouse = {
                type = "select",
                width = "full",
                name = "",
                values = {
                    --[10] = "Left mouse button",
                    [11] = "Right mouse button",
                    --[12] = "Middle mouse button",
                    --[13] = "Mouse 4",
                    --[14] = "Mouse 5",
                },
                get = function()
                    return BananaBar3:Get_action_part_mouse("action_setsymbol", v)
                end,
                set = function(info, v)
                    BananaBar3:Set_action_part_mouse("action_setsymbol", v)
                end,
                order = 21
            },
		--		setsymbol_shift = {
        --        type = "toggle",
        --        width = "half",
        --        name = L["shift"],
        --        desc = L["shiftdesc"],
        --        get = function()
        --            return BananaBar3:Get_action_part("action_setsymbol", 1)
        --        end,
        --        set = function(info, v)
        --            BananaBar3:Set_action_part("action_setsymbol", 1, v)
        --        end,
        --        order = 0
				--order = 22
        --    },
		--		setsymbol_control = {
        --        type = "toggle",
        --        width = "half",
        --        name = L["control"],
        --        desc = L["controldesc"],
        --        get = function()
        --            return BananaBar3:Get_action_part("action_setsymbol", 2)
        --        end,
        --        set = function(info, v)
        --            BananaBar3:Set_action_part("action_setsymbol", 2, v)
        --        end,
        --        order = 0
		--		--order = 23
        --    },
		--		setsymbol_alt = {
        --        type = "toggle",
        --        width = "half",
        --        name = L["alt"],
        --        desc = L["altdesc"],
        --        get = function()
        --            return BananaBar3:Get_action_part("action_setsymbol", 3)
        --        end,
        --        set = function(info, v)
        --            BananaBar3:Set_action_part("action_setsymbol", 3, v)
        --        end,
        --        order = 0
		--		--order = 24
        --    },
		}
       },
        visibility = {
            type = "group",
            name = L["design"],
            desc = L["designdesc"],
			order = 10,
            args = {
                scale = {
                    type = "range",
                    width = "full",
                    name = L["scale"],
                    desc = L["scaledesc"],
                    get = function()
                        return BananaBar3:Get_scale()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_scale(v)
                    end,
                    min = 10,
                    max = 200,
                    step = 1,
                    order = 1
                },
				shiftCountX = {
                    type = "range",
                    width = "full",
                    name = L["shiftX"],
                    desc = L["shiftXdesc"],
                    get = function()
                        return BananaBar3:Get_shiftCountX()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_shiftCountX(v)
                    end,
                    min = -15,
                    max = 15,
                    step = 1,
                    order = 2,
                },
				shiftCountY = {
                    type = "range",
                    width = "full",
                    name = L["shiftY"],
                    desc = L["shiftYdesc"],
                    get = function()
                        return BananaBar3:Get_shiftCountY()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_shiftCountY(v)
                    end,
                    min = -15,
                    max = 40,
                    step = 1,
                    order = 2,
                },
                scaleassist = {
                    type = "range",
                    width = "full",
                    name = L["scaleassist"],
                    desc = L["scaleassistdesc"],
                    get = function()
                        return BananaBar3:Get_scaleassist()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_scaleassist(v)
                    end,
                    min = 10,
                    max = 200,
                    step = 1,
                    order = 11,
                },
                hideunused = {
                    type = "toggle",
                    width = "full",
                    name = L["hideunused"],
                    desc = L["hideunuseddesc"],
                    get = function()
                        return BananaBar3:Get_hideunused()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_hideunused(v)
                    end,
                    order = 16,
                },
                hideframes = {
                    type = "toggle",
                    width = "full",
                    name = L["hidebuttonframes"],
                    desc = L["hidebuttonframesdesc"],
                    get = function()
                        return BananaBar3:Get_hidebuttonframes()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_hidebuttonframes(v)
                    end,
                    order = 13,
                },
				hideback = {
                    type = "toggle",
                    width = "full",
                    name = L["hidebuttonback"],
                    desc = L["hidebuttonbackdesc"],
                    get = function()
                        return BananaBar3:Get_hidebuttonback()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_hidebuttonback(v)
                    end,
                    order = 14
                },
                markdead = {
                    type = "toggle",
                    width = "full",
                    name = L["markdead"],
                    desc = L["markdeaddesc"],
                    get = function()
                        return BananaBar3:Get_markdead()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_markdead(v)
                    end,
                    order = 15,
                },
				
				showzerotarget = {
                    type = "toggle",
                    width = "full",
                    name = L["showzerotarget"],
                    desc = L["showzerotargetdesc"],
                    get = function()
						return BananaBar3:Get_showzerotarget()
					end,	
                    set = function(info, v)
						BananaBar3:Set_showzerotarget(v)
   
					end,
					order = 12,
                },
                showinraid = {
                    type = "toggle",
                    width = "full",
                    name = L["showinraid"],
                    desc = L["showinraiddesc"],
                    get = function()
                        return BananaBar3:Get_showinraid()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showinraid(v)
                    end,
                    order = 20,
                },
                showinparty = {
                    type = "toggle",
                    width = "full",
                    name = L["showinparty"],
                    desc = L["showinpartydesc"],
                    get = function()
                        return BananaBar3:Get_showinparty()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showinparty(v)
                    end,
                    order = 21,
                },
                showoutofgroup = {
                    type = "toggle",
                    width = "full",
                    name = L["showoutofgroup"],
                    desc = L["showoutofgroupdesc"],
                    get = function()
                        return BananaBar3:Get_showoutofgroup()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showoutofgroup(v)
                    end,
                    order = 22,
                },
                showraidinfoall = {
                    type = "toggle",
                    width = "full",
                    name = L["showraidinfoall"],
                    desc = L["showraidinfoalldesc"],
                    get = function()
                        return BananaBar3:Get_showraidinfoall()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showraidinfoall(v)
                    end,
                    order = 23,
                },
                showraidinfo = {
                    type = "toggle",
                    width = "full",
                    name = L["showraidinfo"],
                    desc = L["showraidinfodesc"],
                    get = function()
                        return BananaBar3:Get_showraidinfo()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showraidinfo(v)
                    end,
                    order = 23,
                },
                showextrainfo = {
                    type = "toggle",
                    width = "full",
                    name = L["showextrainfo"],
                    desc = L["showextrainfodesc"],
                    get = function()
                        return BananaBar3:Get_showextrainfo()
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showextrainfo(v)
                    end,
                    order = 24,
                }
            }
        },
        buttons = {
            type = "group",
            name = L["showbutton"],
            desc = L["showbuttondesc"],
            order = 20,
            args = {
                button1 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(1)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(1, v)
                    end,
                    order = 1
                },
                button2 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(2)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(2, v)
                    end,
                    order = 2
                },
                button3 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(3)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(3, v)
                    end,
                    order = 3
                },
                button4 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(4)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(4, v)
                    end,
                    order = 4
                },
                button5 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(5)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(5, v)
                    end,
                    order = 5
                },
                button6 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(6)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(6, v)
                    end,
                    order = 6
                },
                button7 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(7)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(7, v)
                    end,
                    order = 7
                },
                button8 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r",
                    desc = L["showbuttondesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(8)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(8, v)
                    end,
                    order = 8
                },
                huntersmarkbutton1 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLORHM .. L["unmarked"] .. " 1|r",
                    desc = L["showunmarkeddesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(9)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(9, v)
                    end,
                    order = 9
                },
                huntersmarkbutton2 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLORHM .. L["unmarked"] .. " 2|r",
                    desc = L["showunmarkeddesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(10)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(10, v)
                    end,
                    order = 10
                },
                huntersmarkbutton3 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLORHM .. L["unmarked"] .. " 3|r",
                    desc = L["showunmarkeddesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(11)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(11, v)
                    end,
                    order = 11
                },
                huntersmarkbutton4 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLORHM .. L["unmarked"] .. " 4|r",
                    desc = L["showunmarkeddesc"],
                    get = function()
                        return BananaBar3:Get_showbutton(12)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_showbutton(12, v)
                    end,
                    order = 12
                }
            }
        },
        symbolordermouse = {
            type = "group",
            name = L["symbol_order_mouse"],
            desc = L["symbol_order_mouse_desc"],
            order = 403,
            args = {
                desc0 = {
                    width = "full",
                    type = "description",
                    fontSize = "medium",
                    name = L["symbol_order_mouse_desc"],
                    order = 0
                },
                desc = {
                    width = "full",
                    type = "description",
                    fontSize = "medium",
                    name = L["order_symbols_desc"],
                    order = 1
                },
                button1 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 1",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 1)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 1, v)
                    end,
                    order = 2
                },
                button2 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 2",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 2)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 2, v)
                    end,
                    order = 4
                },
                button3 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 3",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 3)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 3, v)
                    end,
                    order = 6
                },
                button4 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 4",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 4)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 4, v)
                    end,
                    order = 8
                },
                button5 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 5",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 5)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 5, v)
                    end,
                    order = 10
                },
                button6 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 6",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 6)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 6, v)
                    end,
                    order = 12
                },
                button7 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 7",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 7)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 7, v)
                    end,
                    order = 14
                },
                button8 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 8",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordermouse", 8)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordermouse", 8, v)
                    end,
                    order = 16
                }
            }
        },
        ---------------------------------
        symbolorderhotkey = {
            type = "group",
            name = L["symbol_order_hotkey"],
            desc = L["symbol_order_hotkey_desc"],
            order = 402,
            args = {
                desc0 = {
                    width = "full",
                    type = "description",
                    fontSize = "medium",
                    name = L["symbol_order_hotkey_desc"],
                    order = 0
                },
                desc = {
                    width = "full",
                    type = "description",
                    fontSize = "medium",
                    name = L["order_symbols_desc"],
                    order = 1
                },
                button1 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 1",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 1)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 1, v)
                    end,
                    order = 2
                },
                button2 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 2",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 2)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 2, v)
                    end,
                    order = 4
                },
                button3 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 3",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 3)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 3, v)
                    end,
                    order = 6
                },
                button4 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 4",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 4)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 4, v)
                    end,
                    order = 8
                },
                button5 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 5",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 5)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 5, v)
                    end,
                    order = 10
                },
                button6 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 6",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 6)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 6, v)
                    end,
                    order = 12
                },
                button7 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 7",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 7)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 7, v)
                    end,
                    order = 14
                },
                button8 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 8",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolorderhotkey", 8)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolorderhotkey", 8, v)
                    end,
                    order = 16
                }
            }
        },
        ----------------------------------
        symbolordercombat = {
            type = "group",
            name = L["symbol_order_combat"],
            desc = L["symbol_order_combat_desc"],
            order = 401,
            args = {
                desc0 = {
                    width = "full",
                    type = "description",
                    fontSize = "medium",
                    name = L["symbol_order_combat_desc"],
                    order = 0
                },
                desc = {
                    width = "full",
                    type = "description",
                    fontSize = "medium",
                    name = L["order_symbols_desc"],
                    order = 1
                },
                button1 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 1",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 1)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 1, v)
                    end,
                    order = 2
                },
                button2 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 2",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 2)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 2, v)
                    end,
                    order = 4
                },
                button3 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 3",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 3)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 3, v)
                    end,
                    order = 6
                },
                button4 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 4",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 4)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 4, v)
                    end,
                    order = 8
                },
                button5 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 5",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 5)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 5, v)
                    end,
                    order = 10
                },
                button6 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 6",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 6)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 6, v)
                    end,
                    order = 12
                },
                button7 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 7",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 7)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 7, v)
                    end,
                    order = 14
                },
                button8 = {
                    width = "full",
                    type = "select",
                    values = {
                        [1] = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                        [2] = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                        [3] = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                        [4] = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                        [5] = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                        [6] = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                        [7] = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                        [8] = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r"
                    },
                    name = "Symbol 8",
                    style = "dropdown",
                    desc = L["buttonorderdesc"],
                    get = function()
                        return BananaBar3:Get_buttonorder("symbolordercombat", 8)
                    end,
                    set = function(info, v)
                        BananaBar3:Set_buttonorder("symbolordercombat", 8, v)
                    end,
                    order = 16
                }
            }
        }
    }
}

local defaults = {
    profile = {
        mobsettings = {},
        settingsversion = 0,
        scale = 100,
        scaleassist = 50,
        hideunused = false,
        hidebuttonframes = true,
        markdead = true,
        updaterate = 0.3,
        minimapPosition = 170,
        showinraid = true,
        showinparty = true,
        showoutofgroup = true,
        showraidinfo = true,
        showextrainfo = false,
		showzerotarget = true,	

        actions = {
            action_setsymbol = 8,
			action_setTargetsymbol = 0,
			action_config = 16
        },
        showbutton = {
            [1] = true,
            [2] = true,
            [3] = true,
            [4] = true,
            [5] = true,
            [6] = true,
            [7] = true,
            [8] = true,
            [9] = true,
            [10] = true,
            [11] = false,
            [12] = false
        },
        ButtonLayout = {
            Nr1 = {
                DockDir = 0,
                DockTo = "",
                y = -558,
                x = 683
            },
            Nr2 = {
                DockDir = 4,
                DockTo = "Nr1",
                y = 0,
                x = 0
            },
            Nr3 = {
                DockDir = 4,
                DockTo = "Nr2",
                y = 0,
                x = 0
            },
            Nr4 = {
                DockDir = 4,
                DockTo = "Nr3",
                y = 0,
                x = 0
            },
            Nr5 = {
                DockDir = 1,
                DockTo = "Nr1",
                y = 0,
                x = 0
            },
            Nr6 = {
                DockDir = 4,
                DockTo = "Nr5",
                y = 0,
                x = 0
            },
            Nr7 = {
                DockDir = 4,
                DockTo = "Nr6",
                y = 0,
                x = 0
            },
            Nr8 = {
                DockDir = 4,
                DockTo = "Nr7",
                y = 0,
                x = 0
            },
            Nr9 = {
                DockDir = 4,
                DockTo = "Nr8",
                y = 0,
                x = 0
            },
            Nr10 = {
                DockDir = 3,
                DockTo = "Nr9",
                y = 0,
                x = 0
            },
            Nr11 = {
                DockDir = 4,
                DockTo = "Nr10",
                y = 0,
                x = 0
            },
            Nr12 = {
                DockDir = 1,
                DockTo = "Nr11",
                y = 0,
                x = 0
            },
            Assist1 = {
                DockDir = 0,
                DockTo = "",
                y = -100,
                x = 100
            },
            Assist2 = {
                DockDir = 2,
                DockTo = "Assist1",
                y = 0,
                x = 0
            },
            Assist3 = {
                DockDir = 2,
                DockTo = "Assist2",
                y = 0,
                x = 0
            },
            Assist4 = {
                DockDir = 2,
                DockTo = "Assist3",
                y = 0,
                x = 0
            },
            Assist5 = {
                DockDir = 2,
                DockTo = "Assist4",
                y = 0,
                x = 0
            },
            Assist6 = {
                DockDir = 3,
                DockTo = "Assist1",
                y = 0,
                x = 0
            },
            Assist7 = {
                DockDir = 2,
                DockTo = "Assist6",
                y = 0,
                x = 0
            },
            Assist8 = {
                DockDir = 2,
                DockTo = "Assist7",
                y = 0,
                x = 0
            },
            Assist9 = {
                DockDir = 2,
                DockTo = "Assist8",
                y = 0,
                x = 0
            },
            Assist10 = {
                DockDir = 2,
                DockTo = "Assist9",
                y = 0,
                x = 0
            },
            Assist11 = {
                DockDir = 3,
                DockTo = "Assist6",
                y = 0,
                x = 0
            },
            Assist12 = {
                DockDir = 2,
                DockTo = "Assist11",
                y = 0,
                x = 0
            },
            Assist13 = {
                DockDir = 2,
                DockTo = "Assist12",
                y = 0,
                x = 0
            },
            Assist14 = {
                DockDir = 2,
                DockTo = "Assist13",
                y = 0,
                x = 0
            },
            Assist15 = {
                DockDir = 2,
                DockTo = "Assist14",
                y = 0,
                x = 0
            },
            Assist16 = {
                DockDir = 3,
                DockTo = "Assist11",
                y = 0,
                x = 0
            },
            Assist17 = {
                DockDir = 2,
                DockTo = "Assist16",
                y = 0,
                x = 0
            },
            Assist18 = {
                DockDir = 2,
                DockTo = "Assist17",
                y = 0,
                x = 0
            },
            Assist19 = {
                DockDir = 2,
                DockTo = "Assist18",
                y = 0,
                x = 0
            },
            Assist20 = {
                DockDir = 2,
                DockTo = "Assist19",
                y = 0,
                x = 0
            },
            Assist21 = {
                DockDir = 3,
                DockTo = "Assist16",
                y = 0,
                x = 0
            },
            Assist22 = {
                DockDir = 2,
                DockTo = "Assist21",
                y = 0,
                x = 0
            },
            Assist23 = {
                DockDir = 2,
                DockTo = "Assist22",
                y = 0,
                x = 0
            },
            Assist24 = {
                DockDir = 2,
                DockTo = "Assist23",
                y = 0,
                x = 0
            },
            Assist25 = {
                DockDir = 2,
                DockTo = "Assist24",
                y = 0,
                x = 0
            },
            Assist26 = {
                DockDir = 3,
                DockTo = "Assist21",
                y = 0,
                x = 0
            },
            Assist27 = {
                DockDir = 2,
                DockTo = "Assist26",
                y = 0,
                x = 0
            },
            Assist28 = {
                DockDir = 2,
                DockTo = "Assist27",
                y = 0,
                x = 0
            },
            Assist29 = {
                DockDir = 2,
                DockTo = "Assist28",
                y = 0,
                x = 0
            },
            Assist30 = {
                DockDir = 2,
                DockTo = "Assist29",
                y = 0,
                x = 0
            },
            Assist31 = {
                DockDir = 3,
                DockTo = "Assist26",
                y = 0,
                x = 0
            },
            Assist32 = {
                DockDir = 2,
                DockTo = "Assist31",
                y = 0,
                x = 0
            },
            Assist33 = {
                DockDir = 2,
                DockTo = "Assist32",
                y = 0,
                x = 0
            },
            Assist34 = {
                DockDir = 2,
                DockTo = "Assist33",
                y = 0,
                x = 0
            },
            Assist35 = {
                DockDir = 2,
                DockTo = "Assist34",
                y = 0,
                x = 0
            },
            Assist36 = {
                DockDir = 3,
                DockTo = "Assist31",
                y = 0,
                x = 0
            },
            Assist37 = {
                DockDir = 2,
                DockTo = "Assist36",
                y = 0,
                x = 0
            },
            Assist38 = {
                DockDir = 2,
                DockTo = "Assist37",
                y = 0,
                x = 0
            },
            Assist39 = {
                DockDir = 2,
                DockTo = "Assist38",
                y = 0,
                x = 0
            },
            Assist40 = {
                DockDir = 2,
                DockTo = "Assist39",
                y = 0,
                x = 0
            }
        }
    }
}

LibStub("AceConfig-3.0"):RegisterOptionsTable("BananaBar3", options, {"bb2", "bb", "bananabar"})

------------------------------------------
--- OnInitialize
------------------------------------------
function BananaBar3:OnInitialize()
    self.TARGETS = {}
    self.TARGETMARKS = {}
    self.IGNOREMARKS = {}
    self.IGNOREMOBS = {}
    self.AURAINFO = {}

    self.db = LibStub("AceDB-3.0"):New("BananaBarClassicData3", defaults, true)

    self.BananaUpdateTimer = self:ScheduleRepeatingTimer("BananaUpdate", self.db.profile.updaterate, self)
    self.BananaCursorTimer = self:ScheduleRepeatingTimer("BananaCursor", 1, self)

    AceConfigDialog:AddToBlizOptions("BananaBar3")

    --self.dewdrop = AceLibrary("Dewdrop-2.0")

    --self:RegisterChatCommand("bb2", options);
	self:Print("\124cffFF0000Bannabar 3 by Lädygaga-Sulfuron EU Loaded\124r")
	
    self.Buttons = {}
    for i = 1, BANANA_MAX_BUTTONS, 1 do
        self:Debug("create new button ".."Nr"..i);
        self.Buttons[i] = BananaBar3Button:new(self, "Nr" .. i)
        if i > BANANA_RAIDSYMBOL_BUTTON_COUNT then
            self.Buttons[i]:SetButtonSymbolExtra(nil)
        else
            self.Buttons[i]:SetButtonSymbol(i)
		--self:Debug("button"..i)
		end

        if i > 1 then
            self.Buttons[i]:Dock(BANANA_DOCK_LEFT, self.Buttons[i - 1])
        end
    
	end
	
	
	
	
    self.AssistButtons = {}
    for i = 1, 40, 1 do
        self.AssistButtons[i] = BananaBar3AssistButton:new(BananaBar3, "Assist" .. i)
        self.AssistButtons[i]:SetButtonSymbol(4)
        if i > 1 then
            if mod(i, 5) == 1 then
                self.AssistButtons[i]:Dock(BANANA_DOCK_BOTTOM, self.AssistButtons[i - 5])
            else
                self.AssistButtons[i]:Dock(BANANA_DOCK_RIGHT, self.AssistButtons[i - 1])
            end
            self.AssistButtons[i]:SetVisible(true)
			
        end
    end
    BananaBar3AssistButton:UpdateAllButtonFrame(false)

    --self.AssistButtons[1].frame:SetPoint("CENTER", "UIParent", "CENTER",-2,0);

    self:CheckSettingsVersion()

    self:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
    self:RegisterEvent("CHAT_MSG_ADDON")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    self:RegisterEvent("RAID_TARGET_UPDATE")
    self:RegisterEvent("CHAT_MSG_TARGETICONS")
    
    --LibStub("AceConsole-3.0"):InjectAceOptionsTable(self, options) todo

    --self.OnMenuRequest = options;

    --	foo = AceLibrary("FuBarPlugin-2.0"):GetAceOptionsDataTable(self)
    --	local args = AceLibrary("AceDB-2.0"):GetAceOptionsDataTable(self)
    --	for k,v in pairs(args) do
    --		if self.OnMenuRequest.args[k] == nil then
    --		BananaBar3:Print("ä:"..k);
    --			self.OnMenuRequest.args[k] = v
    --		end
    --	end

    self.frame = CreateFrame("Frame", "BananaBar3DummyFrame")
    self.frame:Hide()
    self.GetIcon = function()
        return BananaBar3.hasIcon
    end
    self.GetTitle = function()
        return L["addonname"]
    end
    self.IsDisabled = function()
        return false
    end
    self.OpenMenu = function()
        BananaBar3:Execute_Config()
    end

    self.mouseOverlayFrame = CreateFrame("Frame", "BananaMouseOverlay", UIParent, "SecureActionButtonTemplate")

    self.mouseOverlayFrame:SetFrameStrata("TOOLTIP")
    self.mouseOverlayFrame:SetWidth(32)
    self.mouseOverlayFrame:SetHeight(32)
    self.mouseOverlayFrame:SetMovable(true)
    --self.mouseOverlayFrame.texture = self.mouseOverlayFrame:CreateTexture(nil, "BACKGROUND")
    --self.mouseOverlayFrame.texture:SetAllPoints(true)
    --self.mouseOverlayFrame.texture:SetColorTexture(0, 0, 0, 0)
    self.mouseOverlayFrame:SetPoint("CENTER", 0, 0)
    self.mouseOverlayFrame:Show()
    self.mouseOverlayFrame:EnableMouse(false)
    self.mouseOverlayFrame:SetScript(
        "OnUpdate",
        function(...)
            self:OnMouseOverlayUpdate(...)
        end
    )
    self.mouseOverlayFrameTex = self.mouseOverlayFrame:CreateTexture(nil, "TOOLTIP")
    self.mouseOverlayFrameTex:SetTexture(nil)
    self.mouseOverlayFrameTex:SetAllPoints(self.mouseOverlayFrame)
    self.mouseOverlayFrame.texture = self.mouseOverlayFrameTex
end

local auraTypes = {
    [-1] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Unknown Rank/Duration)",
        ["Icon"] = "Interface\\Icons\\Spell_Nature_Polymorph",
        ["Duration"] = 50
    },
    [-2] = {
        ["CanBreak"] = false,
        ["Name"] = "Banish (Unknown Rank/Duration)",
        ["Icon"] = "Interface\\Icons\\Spell_shadow_cripple",
        ["Duration"] = 30
    },
    [118] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Rank 1)",
        ["Icon"] = "Interface\\Icons\\Spell_Nature_Polymorph",
        ["Duration"] = 20
    },
    [12824] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Rank 2)",
        ["Icon"] = "Interface\\Icons\\Spell_Nature_Polymorph",
        ["Duration"] = 30
    },
    [12825] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Rank 3)",
        ["Icon"] = "Interface\\Icons\\Spell_Nature_Polymorph",
        ["Duration"] = 40
    },
    [12826] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Rank 4)",
        ["Icon"] = "Interface\\Icons\\Spell_Nature_Polymorph",
        ["Duration"] = 50
    },
    [28272] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Pig)",
        ["Icon"] = "Interface\\Icons\\Spell_Magic_PolymorphPig",
        ["Duration"] = 50
    },
    [28271] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Turtle)",
        ["Icon"] = "Interface\\Icons\\Ability_Hunter_Pet_Turtle",
        ["Duration"] = 50
    },
    [61305] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Black Cat)",
        ["Icon"] = "Interface\\Icons\\Achievement_Halloween_Cat_01",
        ["Duration"] = 50
    },
    [61025] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Serpent)",
        ["Icon"] = "Interface\\Icons\\Spell_Nature_Guardianward",
        ["Duration"] = 50
    },
    [61721] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Rabbit)",
        ["Icon"] = "Interface\\Icons\\Spell_Magic_PolymorphRabbit",
        ["Duration"] = 50
    },
    [61780] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Turkey)",
        ["Icon"] = "Interface\\Icons\\Achievement_WorldEvent_Thanksgiving",
        ["Duration"] = 50
    },
    [161372] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Peacock)",
        ["Icon"] = "Interface\\Icons\\Inv_Pet_Peacock_Gold",
        ["Duration"] = 50
    },
    [161354] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Monkey)",
        ["Icon"] = "Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey",
        ["Duration"] = 50
    },
    [161372] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Monkey)",
        ["Icon"] = "Interface\\Icons\\Ability_Hunter_AspectOfTheMonkey",
        ["Duration"] = 50
    },
    [126819] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Porcupine)",
        ["Icon"] = "Interface\\Icons\\Inv_Pet_Porcupine",
        ["Duration"] = 50
    },
    [161355] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Penguin)",
        ["Icon"] = "Interface\\Icons\\Inv_Misc_PenguinPet",
        ["Duration"] = 50
    },
    [161353] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Polar Bear Cub)",
        ["Icon"] = "Interface\\Icons\\Inv_Pet_BabyBlizzardBear",
        ["Duration"] = 50
    },
    [277787] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Direhorn)",
        ["Icon"] = "Interface\\Icons\\Inv_Pet_Direhorn",
        ["Duration"] = 50
    },
    [277792] = {
        ["CanBreak"] = true,
        ["Name"] = "Polymorph (Bumblebee)",
        ["Icon"] = "Interface\\Icons\\Inv_Bee_Default",
        ["Duration"] = 50
    },
    [710] = {
        ["CanBreak"] = false,
        ["Name"] = "Banish (Rank 1)",
        ["Icon"] = "Interface\\Icons\\Spell_shadow_cripple",
        ["Duration"] = 20
    },
    [18647] = {
        ["CanBreak"] = false,
        ["Name"] = "Banish (Rank 2)",
        ["Icon"] = "Interface\\Icons\\Spell_shadow_cripple",
        ["Duration"] = 30
    }
}

local damageEventTypes = {
    ["SWING_DAMAGE"] = true,
    ["RANGE_DAMAGE"] = true,
    ["SPELL_DAMAGE"] = true,
    ["SPELL_PERIODIC_DAMAGE"] = true,
    ["SPELL_BUILDING_DAMAGE"] = true,
    ["ENVIRONMENTAL_DAMAGE"] = true,
    ["DAMAGE_SPLIT"] = true,
    ["DAMAGE_SHIELD"] = true
}

local knownSpellsNameDummyId = nil


function BananaBar3:CHAT_MSG_TARGETICONS(event, a1, a2, a3, a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18,a19, ...)
    BananaBar3:Dump("a-ev",event);
    BananaBar3:Dump("a-a1",a1);
    BananaBar3:Dump("a-a2",a2);
    BananaBar3:Dump("a-a3",a3);
    BananaBar3:Dump("a-a4",a4);
    BananaBar3:Dump("a-a5",a5);
    BananaBar3:Dump("a-a6",a6);
    BananaBar3:Dump("a-a7",a7);
    BananaBar3:Dump("a-a8",a8);
    BananaBar3:Dump("a-a9",a9);
    BananaBar3:Dump("a-a10",a10);
    BananaBar3:Dump("a-a11",a11);
    BananaBar3:Dump("a-a12",a12);
    BananaBar3:Dump("a-a13",a13);
    BananaBar3:Dump("a-a14",a14);
    BananaBar3:Dump("a-a15",a15);
    BananaBar3:Dump("a-a16",a16);
    BananaBar3:Dump("a-a17",a17);
    BananaBar3:Dump("a-a18",a18);
    BananaBar3:Dump("a-a19",a19);
end

function BananaBar3:RAID_TARGET_UPDATE()
end

function BananaBar3:COMBAT_LOG_EVENT_UNFILTERED(event, a1, a2, a3, ...)
    local timestamp,
        eventType,
        hideCaster,
        sourceGUID,
        sourceName,
        sourceFlags,
        sourceFlags2,
        destGUID,
        destName,
        destFlags,
        destFlags2,
        spellId,
        spellName,
        spellSchool = CombatLogGetCurrentEventInfo()
    -- the classic always returns a spell id of zero so we
    -- resolve the spell id using the spell name instead

    --BananaBar3:Print(eventType);

    if knownSpellsNameDummyId == nil then
        knownSpellsNameDummyId = {}
        knownSpellsNameDummyId[GetSpellInfo(12826)] = -1 -- polymorph
        knownSpellsNameDummyId[GetSpellInfo(18647)] = -2 -- banish
        self:Dump("Initialized spellnames/maxtime for combatlog scanning", knownSpellsNameDummyId)
    end

    if not self.AURAINFO then
        self.AURAINFO = {}
    end

    if not destName then
        destName = "<noname>"
    end

    if not sourceName then
        sourceName = "<noname>"
    end

    if not spellId then
        spellId = "<nospellid>"
    end
    if not spellSchool then
        spellSchool = "<nospellSchool>"
    end


    local dummySpellId = knownSpellsNameDummyId[spellName]
    
    
    if dummySpellId then
        local auratype = auraTypes[dummySpellId];

        if eventType == "SPELL_AURA_APPLIED" then
            BananaBar3:Debug("AURA APPLIED " .. auratype.Name .. " on " .. destName .. " from " .. sourceName .. " Max "..auratype.Duration.." Seconds")
            self.AURAINFO[destGUID] = {
                StartTime = GetTime(),
                EndTime = nil,
                BreakTime = nil,
                BreakerGUID = nil,
                BreakeReason = nil,
                DummySpellId = dummySpellId,
                RealSpellId = nil,
                FromGUID = sourceGUID,
                FromName = sourceName,
                Name = destName .. " (" .. sourceName .. ")"}
        elseif eventType == "SPELL_AURA_REMOVED" then
            BananaBar3:Debug("AURA REMOVED " .. spellName .. " on " .. destName .. " from " .. sourceName .. " (max " .. auratype.Duration .. " seconds)" )
            if self.AURAINFO[destGUID] then
                self.AURAINFO[destGUID].EndTime = GetTime()
            end
        elseif eventType == "SPELL_AURA_REFRESH" then
            BananaBar3:Debug("AURA REFRESH " .. auratype.Name .. " on " .. destName .. " from " .. sourceName .. " Max ".. auratype.Duration.." Seconds")
            self.AURAINFO[destGUID] = {
                StartTime = GetTime(),
                EndTime = nil,
                BreakTime = nil,
                BrokeneakerGUID = nil,
                BreakeReason = nil,
                DummySpellId = dummySpellId,
                RealSpellId = nil,
                FromGUID = sourceGUID,
                FromName = sourceName,
                Name = destName .. " (" .. sourceName .. ")"
            }
        elseif eventType == "SPELL_AURA_BROKEN" then
            BananaBar3:Debug(
                "KNOWN AURA BROKEN " ..
                    spellName ..
                        " on " ..
                            destName ..
                                " (" .. destGUID .. ") from " .. sourceName .. " (max " .. dummySpellId .. " seconds)"
            )
            if self.AURAINFO[destGUID] then
                self.AURAINFO[destGUID].BreakTime = GetTime()
            end
        elseif eventType == "SPELL_AURA_BROKEN_SPELL" then
            BananaBar3:Debug("KNOWN AURA BROKEN BY SPELL " .. spellName .. " on " .. destName .. "  from " .. sourceName .. " (max " .. auratype.Duration .. " seconds)" )
            if self.AURAINFO[destGUID] then
                self.AURAINFO[destGUID].BreakTime = GetTime()
            end
        end
    end

    if
        damageEventTypes[eventType] and self.AURAINFO[destGUID] and self.AURAINFO[destGUID].BreakTime ~= nil and
            self.AURAINFO[destGUID].BreakerGUID == nil
     then
        if self.AURAINFO[destGUID] then
            self.AURAINFO[destGUID].BreakerGUID = sourceGUID
            self.AURAINFO[destGUID].BreakReason = (eventType == "SWING_DAMAGE" and "Melee Damage" or spellName)
            local after = math.floor(self.AURAINFO[destGUID].BreakTime - self.AURAINFO[destGUID].StartTime, 1)
            BananaBar3:Debug("Broken Aura " .. destName .. " from " .. sourceName .. " with " .. self.AURAINFO[destGUID].BreakReason .. " after  " .. after .. " seconds" )
        end
    end
end

function BananaBar3:BananaSetCursor(texture)
    self.mouseOverlayFrameTex:SetTexture(texture)
end

function BananaBar3:PLAYER_REGEN_DISABLED(event)
    
    self:Debug("Enter Combat")
    self.IGNOREMARKS = {}
    self.IGNOREMOBS = {}
    for mark, mobguid in pairs(BananaBar3.TARGETMARKS) do
        if mobguid ~= nil and mark < 9 then
            self.IGNOREMARKS[mark] = 1
            self.IGNOREMOBS[mobguid] = 1
        end
    end
    self:Debug(self.IGNOREMARKS)
    self:Debug(self.IGNOREMOBS)
    SecureActionQueue:PLAYER_REGEN_DISABLED();
end

function BananaBar3:PLAYER_REGEN_ENABLED(event)
    self:Debug("Leave Combat")
    for i = 1, 40, 1 do
        self.AssistButtons[i]:SetVisible(true)
    end
    SecureActionQueue:PLAYER_REGEN_ENABLED();
end

function BananaBar3:OnMouseOverlayUpdate(frame)
    local mx, my = GetCursorPosition()
    local uiscale = UIParent:GetEffectiveScale()
    local screenW = GetScreenWidth()
    local screenH = GetScreenHeight()
    local screenScaledW = screenW * uiscale
    local screenScaledH = screenH * uiscale

    local screenWStep = screenW / 100
    local screenHStep = screenH / 100

    local screenScaledWStep = 100 / screenScaledW
    local screenScaledHStep = 100 / screenScaledH

    local tx = screenScaledWStep * mx -- gives: 0 to 100 %
    local ty = screenScaledHStep * my -- gives: 0 to 100 %
    tx = screenWStep * tx -- converts % to actual screenW x
    ty = screenHStep * ty -- converts % to actual screenH y

    ty = ty - 32
    tx = tx + 0
    --tx = tx + containerFrameOffsetX; -- compensate for container size
    --ty = ty + containerFrameOffsetY; -- compensate for container size

    -- NOTE: To prevent taint you can't use frame hide/show in combat so we offset position by a long way
    --tx = tx + DMouse.mouseOverlayFrameXOffset;
    --ty = ty + DMouse.mouseOverlayFrameXOffset;

    --DMouse.mouseOverlayFrame:ClearAllPoints();
    -- DMouse.mouseOverlayFrame:SetPoint("BOTTOMLEFT",DMouse.tx,DMouse.ty);
    frame:SetPoint("BOTTOMLEFT", tx, ty)
end
------------------------------------------
--- OnEnable / OnDisable
------------------------------------------

function BananaBar3:OnEnable()
    self:Debug("OnEnable")
    self:CheckSettingsVersion()
    BananaBar3:OnProfileEnable()
end

function BananaBar3:OnDisable()
    self:Debug("OnDisable")
    self:CheckSettingsVersion()
    BananaBar3Button:UpdateAllVisible()
    BananaBar3AssistButton:UpdateAllVisible()
end

------------------------------------------
--- OnProfileEnable / OnProfileDisable
------------------------------------------

function BananaBar3:OnProfileEnable()
    self:Debug("OnProfileEnable")
    self:CheckSettingsVersion()
    BananaBar3:ProfileUpdated()
end

function BananaBar3:OnProfileDisable()
    self:Debug("OnProfileDisable")
    self:CheckSettingsVersion()
end

------------------------------------------
--- hideunused
------------------------------------------

function BananaBar3:Get_hideunused()
    return self.db.profile.hideunused
end

function BananaBar3:Set_hideunused(value)
    if self.db.profile.hideunused ~= value then
        self.db.profile.hideunused = value
    end
end

------------------------------------------
--- showbutton
------------------------------------------

function BananaBar3:Get_showbutton(index)
    return self.db.profile.showbutton[index]
end

function BananaBar3:Set_showbutton(index, value)
    self.db.profile.showbutton[index] = value
    self.Buttons[index]:SetVisible(value)
end

------------------------------------------
--- scale $ move
------------------------------------------

function BananaBar3:Set_scale(value)
    self.db.profile.scale = value
    BananaBar3Button:UpdateAllScale(self.db.profile.scale / 100)
end

function BananaBar3:Get_scale()
    return self.db.profile.scale
end

function BananaBar3:Set_shiftCountX(value)
    self.db.profile.shiftCountX = value
    BananaBar3Button:ShiftX(self.db.profile.shiftCountX)
end

function BananaBar3:Get_shiftCountX()
    return self.db.profile.shiftCountX
end

function BananaBar3:Set_shiftCountY(value)
    self.db.profile.shiftCountY = value
    BananaBar3Button:ShiftY(self.db.profile.shiftCountY)
end

function BananaBar3:Get_shiftCountY()
    return self.db.profile.shiftCountY
end



------------------------------------------
--- scaleassist
------------------------------------------

function BananaBar3:Set_scaleassist(value)
    self.db.profile.scaleassist = value
    BananaBar3AssistButton:UpdateAllScale(self.db.profile.scaleassist / 100)
end

function BananaBar3:Get_scaleassist()
    return self.db.profile.scaleassist
end

------------------------------------------
--- updaterate
------------------------------------------

function BananaBar3:Set_updaterate(value)
    self.db.profile.updaterate = value
    self:CancelTimer(self.BananaUpdateTimer)
    self.BananaUpdateTimer = self:ScheduleRepeatingTimer("BananaUpdate", self.db.profile.updaterate or 0.3, self)
end

function BananaBar3:Get_updaterate()
    return self.db.profile.updaterate
end

------------------------------------------
--- hidebuttonframes & back
------------------------------------------

function BananaBar3:Set_hidebuttonframes(value)
    self.db.profile.hidebuttonframes = value
    BananaBar3Button:UpdateAllButtonFrame(not self.db.profile.hidebuttonframes)
end

function BananaBar3:Get_hidebuttonframes()
    return self.db.profile.hidebuttonframes
end

function BananaBar3:Set_hidebuttonback(value)
    self.db.profile.hidebuttonback = value
    BananaBar3Button:UpdateAllButtonBack(not self.db.profile.hidebuttonback)
end

function BananaBar3:Get_hidebuttonback()
    return self.db.profile.hidebuttonback
end


------------------------------------------
--- markdead
------------------------------------------

function BananaBar3:Set_markdead(value)
    self.db.profile.markdead = value
    BananaBar3Button:EnableAllDeadSymbol(self.db.profile.markdead)
end

function BananaBar3:Get_markdead()
    return self.db.profile.markdead
end

------------------------------------------
--- showinraid
------------------------------------------

function BananaBar3:Get_showinraid()
    return self.db.profile.showinraid
end

function BananaBar3:Set_showinraid(v)
    self.db.profile.showinraid = v
    BananaBar3Button:UpdateAllVisible()
end
------------------------------------------
--- showzerotarget
------------------------------------------

function BananaBar3:Get_showzerotarget()
    return self.db.profile.showzerotarget
end

function BananaBar3:Set_showzerotarget(v)
    self.db.profile.showzerotarget = v
    --BananaBar3Button:UpdateAllButtonZero(not self.db.profile.showzerotarget)
	BananaBar3Button:UpdateAllVisible()
	--BananaBar3Button:UpdateAllButtonFrame(not self.db.profile.hidebuttonframes)
end
------------------------------------------
--- showinparty
------------------------------------------

function BananaBar3:Get_showinparty()
    return self.db.profile.showinparty
end

function BananaBar3:Set_showinparty(v)
    self.db.profile.showinparty = v
    BananaBar3Button:UpdateAllVisible()
end

------------------------------------------
--- showoutofgroup
------------------------------------------

function BananaBar3:Get_showoutofgroup()
    return self.db.profile.showoutofgroup
end

function BananaBar3:Set_showoutofgroup(v)
    self.db.profile.showoutofgroup = v
    BananaBar3Button:UpdateAllVisible()
end

------------------------------------------
--- showraidinfo
------------------------------------------

function BananaBar3:Get_showraidinfo()
    return self.db.profile.showraidinfo
end

function BananaBar3:Get_showraidinfoall()
    return self.db.profile.showraidinfoall
end

function BananaBar3:Set_showraidinfo(v)
    self.db.profile.showraidinfo = v
    BananaBar3AssistButton:UpdateAllVisible()
end

function BananaBar3:Set_showraidinfoall(v)
    self.db.profile.showraidinfoall = v
    BananaBar3AssistButton:UpdateAllVisible()
end

------------------------------------------
--- showextrainfo
------------------------------------------

function BananaBar3:Get_showextrainfo()
    return self.db.profile.showextrainfo
end

function BananaBar3:Set_showextrainfo(v)
    self.db.profile.showextrainfo = v
    BananaBar3Button:UpdateAllExtraInfo(self.db.profile.showextrainfo)
end

function BananaBar3:Get_buttonorder(table, index)
    table = "order_"..table;
    if self.db.profile[table] == nil then
        self.db.profile[table] = {}
        self.db.profile[table][8] = 1
        self.db.profile[table][7] = 2
        self.db.profile[table][6] = 3
        self.db.profile[table][5] = 4
        self.db.profile[table][4] = 5
        self.db.profile[table][3] = 6
        self.db.profile[table][2] = 7
        self.db.profile[table][1] = 8
    end
    self:Debug("get Button Order for ".. table.." Idx "..index.."  = "..self.db.profile[table][index]);
    return self.db.profile[table][index]
end


function BananaBar3:Set_buttonorder(table, index, v)
    table = "order_"..table;
    if self.db.profile[table] == nil then
        self.db.profile[table] = {}
        self.db.profile[table][8] = 1
        self.db.profile[table][7] = 2
        self.db.profile[table][6] = 3
        self.db.profile[table][5] = 4
        self.db.profile[table][4] = 5
        self.db.profile[table][3] = 6
        self.db.profile[table][2] = 7
        self.db.profile[table][1] = 8
    end

    local oldIndex = nil
    for but = 1, 8, 1 do
        if self.db.profile[table][but] == v then
            oldIndex = but
        end
    end
    local oldValue = self.db.profile[table][index]
    BananaBar3:Debug("Swap Button Order for ".. table.." Idx "..oldIndex.."  <-> "..index);
    BananaBar3:Debug("Swap Button Order for ".. table.." Sym "..self.db.profile[table][oldIndex].."  <-> "..self.db.profile[table][index]);
    self.db.profile[table][index] = v
    self.db.profile[table][oldIndex] = oldValue
    --BananaBar3Button:UpdateAllExtraInfo(self.db.profile.showextrainfo);
end

-----------------------------------------
--- layout
------------------------------------------

function BananaBar3:Set_layoutmode(value)
    self.layoutmode = value
    BananaBar3Button:UpdateAllArrows()
    BananaBar3Button:UpdateAllVisible()
    BananaBar3AssistButton:UpdateAllArrows()
    if self.layoutmode then
        self:HookEscape()
    else
        self:UnhookEscape()
    end
end

function BananaBar3:Get_layoutmode()
    return self.layoutmode
end

function BananaBar3:Set_autosetcombat(value)
    self.db.profile.autosetcombat = value
end

function BananaBar3:Get_autosetcombat()
    return self.db.profile.autosetcombat == true
end

function BananaBar3:Set_showdebugmessages(value)
    self.db.profile.showdebugmessages = value
end

function BananaBar3:Get_showdebugmessages()
    return self.db.profile.showdebugmessages == true
end

function BananaBar3:EscapePressed()
    BananaBarEscapeHookFrame:Hide()
    BananaBar3:Set_layoutmode(false)
end

function BananaBar3:HookEscape()
    BananaBarEscapeHookFrame:Show()
end

function BananaBar3:UnhookEscape()
    BananaBarEscapeHookFrame:Hide()
end

function BananaBar3:Get_action(action)
    return self.db.profile.actions[action]
end

function BananaBar3:Set_action(action, v)
    self.db.profile.actions[action] = v
    BananaBar3:UpdateActions()
end

function BananaBar3:UpdateActions()
    self:Debug("Updating Action List")
    self.Actions = {}
    for key, value in pairs(self.db.profile.actions) do
        self.Actions[value] = key
        self:Debug("click_type_" .. value .. " = " .. key)
    
	
	
	
	end
end
------------------------------------------
--- Execute_XXX
------------------------------------------

function BananaBar3:Execute_Config()
    LibStub("AceConfigDialog-3.0"):Open("BananaBar3")
end

function BananaBar3:ExecuteAction(button, clicktype,Targetunitname)
    local action = self.Actions[clicktype]
    --self:Debug("bouton" .. self.TooltipButton.ButtonId)
	
	if action then
	self:Debug("Action:"..action.."-- clicktype:"..clicktype)
    end
	
	if not action then
        self:Debug("No Action for clicktype " .. clicktype)
        return
    end
		
	 
    if action == "action_config" then
        self:Debug("Config")
		self:Execute_Config()
    elseif action == "action_setsymbol" then
		
		local id = self.TooltipButton.ButtonId
		 u="target"
		
		if UnitExists(u) then 
		Targetunitname=UnitName(u)
		
		BananaBar3:SetSymbol(button.ButtonId,Targetunitname)
		self:Debug("set symbol sur bouton:"..id.." cible="..Targetunitname)
		
		SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[id].frame, "unit", Targetunitname)
        SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[id].frame, "*type1", "target")
		end
		
		--self:Debug("Bouton attribut unit:"..BananaBar3.Buttons[id].frame:GetAttribute("unit") or "<nil>")
		--BananaBar3.AssistButtons[i].frame:GetAttribute("unit")	
	
	elseif action == "action_setTargetsymbol" then
	    local id = self.TooltipButton.ButtonId
		--self:Debug("Action:"..action.."-- clicktype:"..clicktype.."Target"..Targetunitname)
		self:Debug("Bouton attribut unit:"..BananaBar3.Buttons[id].frame:GetAttribute("unit") or "<nil>")
	else
        self:Debug("Unknown action" .. " " .. action)
		self:Debug(Targetname)
    end
end

------------------------------------------
--- Functions
------------------------------------------

function BananaBar3:ResetSettings()
    --self:ResetDB("profile"); todo
    self.db.profile.settingsversion = actual_settings_version
    self:ProfileUpdated()
end

function BananaBar3:CheckSettingsVersion()
    if actual_settings_version ~= self.db.profile.settingsversion then
        self:Print(L["oldprofilemessage"])
        self:ResetSettings()
    end
end

------------------------------------------
--- Called always when any setting is changed
------------------------------------------

function BananaBar3:SettingsChanged()
end

function BananaBar3:ProfileUpdated(layout)
    BananaBar3Button:UpdateAllVisible()
    BananaBar3Button:LoadAllPos()
	BananaBar3Button:ShiftY(self.db.profile.shiftCountY)
	BananaBar3Button:ShiftX(self.db.profile.shiftCountX)	
    BananaBar3Button:UpdateAllArrows()
    BananaBar3Button:UpdateAllButtonFrame(not self.db.profile.hidebuttonframes)
    BananaBar3Button:UpdateAllButtonBack(not self.db.profile.hidebuttonback)
    BananaBar3Button:UpdateAllScale(self.db.profile.scale / 100)
    BananaBar3Button:EnableAllDeadSymbol(self.db.profile.markdead)
    BananaBar3Button:UpdateAllExtraInfo(self.db.profile.showextrainfo)

    for index = 1, BANANA_MAX_BUTTONS, 1 do
        self.Buttons[index]:SetVisible(self.db.profile.showbutton[index])
    end
    BananaBar3:UpdateActions()
    --self:Debug("mobsettings?");

    for zone, mobs in pairs(self.db.profile.mobsettings) do
        for name, mobsetting in pairs(mobs) do
            AddOptionEntry(zone, name)
        end
    end
    -- self.metro:ChangeMetroRate("BananaUpdate",self.db.profile.updaterate); todo

    BananaBar3AssistButton:UpdateAllVisible()
    BananaBar3AssistButton:LoadAllPos()
    BananaBar3AssistButton:UpdateAllArrows()
    BananaBar3AssistButton:UpdateAllScale(self.db.profile.scaleassist / 100)
end
function BananaBar3:SetTooltipButton(button)
    if not button and not self.TooltipButton then
        -- kein button vorher, kein button nachher
        return
    end

    if button and self.TooltipButton then
        -- tooltip update
        self.TooltipButton = button
        BananaBar3:UpdateTooltip()
        return
    end

    if not button then
        -- kein button mehr
        self.TooltipButton = nil
        GameTooltip:Hide()
    else
        -- neuer button
        self.TooltipButton = button
        BananaBar3:UpdateTooltip()
        GameTooltip:Show()
    end
end

local tooltip_sort_array = {
    ["HUNTER"] = {[0] = 0},
    ["WARLOCK"] = {[0] = 0},
    ["PRIEST"] = {[0] = 0},
    ["PALADIN"] = {[0] = 0},
    ["MAGE"] = {[0] = 0},
    ["ROGUE"] = {[0] = 0},
    ["DRUID"] = {[0] = 0},
    ["SHAMAN"] = {[0] = 0},
    ["WARRIOR"] = {[0] = 0},
    [0] = {[0] = 0} --pet
}

function BananaBar3:UpdateTooltip()
    if self.TooltipButton then
        --GameTooltip:Show()
        if self.layoutmode then
            GameTooltip:SetOwner(self.TooltipButton.frame, "ANCHOR_BOTTOMRIGHT")
            GameTooltip:ClearLines()
            GameTooltip:SetText(L["layoutmodetooltip"])
            return
        end

        if self.TooltipButton.AssistButton then
            GameTooltip:SetOwner(self.TooltipButton.frame, "ANCHOR_TOPCENTER")
            GameTooltip:ClearLines()
            if self.TooltipButton.AssistUnit then
                GameTooltip:AddLine(UnitName(self.TooltipButton.AssistUnit), 0.9, 0.9, 0.9)
            else
                return
            end

            if self.TooltipButton.TooltipInfo1 and self.TooltipButton.TooltipInfo2 then
                GameTooltip:AddLine(self.TooltipButton.TooltipInfo1, 0.6, 0.6, 0.6)
                GameTooltip:AddLine(self.TooltipButton.TooltipInfo2, 0.9, 0.9, 0.9)
            elseif self.TooltipButton.TooltipInfo1 then
                GameTooltip:AddLine(self.TooltipButton.TooltipInfo1, 0.8, 0.5, 0.5)
            elseif self.TooltipButton.TooltipInfo2 then
                GameTooltip:AddLine(self.TooltipButton.TooltipInfo2, 0.4, 0.8, 0.5)
            end

            --GameTooltip:Show()
            return
        end

        tooltip_sort_array["HUNTER"][0] = 0
        tooltip_sort_array["WARLOCK"][0] = 0
        tooltip_sort_array["PRIEST"][0] = 0
        tooltip_sort_array["PALADIN"][0] = 0
        tooltip_sort_array["MAGE"][0] = 0
        tooltip_sort_array["ROGUE"][0] = 0
        tooltip_sort_array["DRUID"][0] = 0
        tooltip_sort_array["SHAMAN"][0] = 0
        tooltip_sort_array["WARRIOR"][0] = 0
        tooltip_sort_array[0][0] = 0

        local id = self.TooltipButton.ButtonId

        GameTooltip:SetOwner(self.TooltipButton.frame, "ANCHOR_TOPRIGHT")
        GameTooltip:ClearLines()

        if self.TARGETMARKS[id] then
            local t = self.TARGETS[self.TARGETMARKS[id]]
            GameTooltip:AddLine(UnitName(t.info_unit), 0.7, 0.7, 0.7)
            --GameTooltip:AddLine(UnitName(t.info_unit), 0.9, 0.9, 0.9)
			
			--SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[id].frame, "unit", UnitName(t.info_unit))
			--SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[id].frame, "type1", "target")
			--self:Debug("Tooltip Bouton attribut unit:"..BananaBar3.Buttons[id].frame:GetAttribute("unit") or "<nil>")
			
			
            local i
            for i in pairs(t.from) do
                localizedClass, englishClass = UnitClass(i)
                --
                if UnitIsPlayer(i) then
                    tooltip_sort_array[englishClass][0] = tooltip_sort_array[englishClass][0] + 1
                    tooltip_sort_array[englishClass][tooltip_sort_array[englishClass][0]] = i
                else
                    tooltip_sort_array[0][0] = tooltip_sort_array[0][0] + 1
                    tooltip_sort_array[0][tooltip_sort_array[0][0]] = i
                end
            end
            self:AddToolTipLines("WARRIOR", RAID_CLASS_COLORS["WARRIOR"])
            self:AddToolTipLines("PALADIN", RAID_CLASS_COLORS["PALADIN"])
            self:AddToolTipLines("SHAMAN", RAID_CLASS_COLORS["SHAMAN"])
            self:AddToolTipLines("PRIEST", RAID_CLASS_COLORS["PRIEST"])
            self:AddToolTipLines("DRUID", RAID_CLASS_COLORS["DRUID"])
            self:AddToolTipLines("MAGE", RAID_CLASS_COLORS["MAGE"])
            self:AddToolTipLines("WARLOCK", RAID_CLASS_COLORS["WARLOCK"])
            self:AddToolTipLines("HUNTER", RAID_CLASS_COLORS["HUNTER"])
            self:AddToolTipLines("ROGUE", RAID_CLASS_COLORS["ROGUE"])
            self:AddToolTipLines(0, {r = 0.4, g = 0.4, b = 0.4})
        else
            GameTooltip:AddLine("not used-", 0.7, 0.7, 0.7)
        end
    else
    end
end

function BananaBar3:AddToolTipLines(class, col)
    local i
    for i = 1, tooltip_sort_array[class][0], 1 do
        GameTooltip:AddLine(UnitName(tooltip_sort_array[class][i]), col.r, col.g, col.b)
    end
end

--CT_RAPTGroupUnitButton

function BananaBar3:BananaUpdate()
    local show = false
    if GetNumGroupMembers() ~= 0 then
        if self.db.profile.showinraid then
            show = true
        end
    elseif GetNumGroupMembers() ~= 0 then
        if self.db.profile.showinparty then
            show = true
        end
    else
        if self.db.profile.showoutofgroup then
            show = true
        end
    end

    if show ~= self.ShowButtons then
        self.ShowButtons = show
        BananaBar3Button:UpdateAllVisible()
    end

    show = (UnitInRaid("player") and self.db.profile.showraidinfo) or self.db.profile.showraidinfoall

    if show ~= self.ShowRaidInfo then
        self.ShowRaidInfo = show
        BananaBar3AssistButton:UpdateAllVisible()
    end

    BananaBar3:UpdateTooltip()

    --debugprofilestart()
    BananaBar3:Scan()

    targets = {}
    for guid, info in pairs(self.TARGETS) do
        if BananaBar3:TableCount(info.from) > 0 and info.symbol == nil and UnitCanAttack("PLAYER", info.info_unit) then
            table.insert(targets, guid)
        elseif info.symbol == nil and self.AURAINFO[guid] ~= nil and self.AURAINFO[guid].EndTime == nil then
            table.insert(targets, guid)
        end
    end

    table.sort(
        targets,
        function(c1, c2)
            if BananaBar3:FromCount(self.TARGETS[c1].from) == BananaBar3:FromCount(self.TARGETS[c2].from) then
                return c1 > c2
            end
            return BananaBar3:FromCount(self.TARGETS[c1].from) > BananaBar3:FromCount(self.TARGETS[c2].from)
        end
    )
    local index = BANANA_RAIDSYMBOL_BUTTON_COUNT + 1
    for _, guid in ipairs(targets) do
        self.TARGETMARKS[index] = guid
        index = index + 1
    end

    for but = 1, BANANA_MAX_BUTTONS, 1 do
        if self.TARGETMARKS[but] then
            local guid = self.TARGETMARKS[but]
            local t = self.TARGETS[guid]

            self.Buttons[but]:SetCount(BananaBar3:FromCount(t.from))
            self.Buttons[but]:SetDead(t.info_dead)
            self.Buttons[but]:SetHuntersmark(t.has_huntersmark)

            if self.AURAINFO[guid] ~= nil and self.AURAINFO[guid].EndTime == nil then
                local aura = auraTypes[self.AURAINFO[guid].DummySpellId]
                local temp = true

                if self.AURAINFO[guid].RealSpellId == nil and t.info_unit ~= "none" then
                    -- target nach spell scannen
                    self.AURAINFO[guid].RealSpellId = self:FindSpellId(t.info_unit)
                end

                if self.AURAINFO[guid].RealSpellId ~= nil then
                    aura = auraTypes[self.AURAINFO[guid].RealSpellId]
                    temp = false
                end

                local max = aura.Duration * 100
                local current = max - math.floor((GetTime() - self.AURAINFO[guid].StartTime) * 100)

                self.Buttons[but].HealthBar:SetStatusBarColor(1, 0, 0, 1)

                self.Buttons[but].HealthBar:SetMinMaxValues(0, 1000)
                if current > 1000 then
                    self.Buttons[but].HealthBar:SetValue(1000)
                    self.Buttons[but].HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
                else
                    self.Buttons[but].HealthBar:SetStatusBarTexture(
                        "Interface\\AddOns\\BananaBar3\\Images\\Chess128N"
                    )
                    self.Buttons[but].HealthBar:SetValue(current)
                end
                if but > BANANA_RAIDSYMBOL_BUTTON_COUNT then
                    if t.info_unit == "none" then
                        self.Buttons[but]:SetButtonSymbolExtra(t.info_unit, aura.Icon)
                        self.Buttons[but]:SetSheepSymbol(nil)
                    else
                        self.Buttons[but]:SetButtonSymbolExtra(t.info_unit)
                        self.Buttons[but]:SetSheepSymbol(aura.Icon)
                    end
                else
                    self.Buttons[but]:SetSheepSymbol(aura.Icon)
                end

                self.Buttons[but]:SetStopwatch(temp)

                if temp then
                    self.Buttons[but]:SetTimer()
                else
                    self.Buttons[but]:SetTimer(self.AURAINFO[guid].StartTime, aura.Duration)
                end
            else
                self.Buttons[but]:SetSheepSymbol(null)
                self.Buttons[but]:SetTimer(0, 0)

                --self.Buttons[but].HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
                self.Buttons[but].HealthBar:SetStatusBarTexture(
                    "Interface\\AddOns\\BananaBar3\\Images\\Chess128N"
                )
                self.Buttons[but].HealthBar:SetStatusBarColor(0, 1, 0, 1)
                self.Buttons[but].HealthBar:SetMinMaxValues(0, t.info_healthmax)
                self.Buttons[but].HealthBar:SetValue(t.info_health)
                if but > BANANA_RAIDSYMBOL_BUTTON_COUNT then
                    self.Buttons[but]:SetButtonSymbolExtra(t.info_unit)
                end
                --self.Buttons[but]:Cooldown:
                --SetTimer(nil);
                self.Buttons[but]:SetStopwatch(false)
            end
            self.Buttons[but]:SetMobName(t.info_name)

            if UnitIsUnit("playertarget", t.info_unit) then
                self.Buttons[but]:SetSelected(false)
            else
                self.Buttons[but]:SetSelected(false)
            end
        else
            self.Buttons[but]:SetSheepSymbol(null)
            self.Buttons[but]:SetTimer(0, 0)
            --To do : mettre une condition pour afficher le compteur quand egal à zéro
			-- if showzerocounter=true then 0 else nil
			j = self:Get_showzerotarget()
            
			if j == true then
					self.Buttons[but]:SetCount(0)
				else
					self.Buttons[but]:SetCount(nil)			
			end
			
			self.Buttons[but]:SetDead(false)
            self.Buttons[but]:SetHuntersmark(false)
            self.Buttons[but].HealthBar:SetValue(0)
            self.Buttons[but]:SetMobName(nil)
            self.Buttons[but]:SetSelected(false)
            self.Buttons[but]:SetStopwatch(false)
            

			
			if but > BANANA_RAIDSYMBOL_BUTTON_COUNT then
                self.Buttons[but]:SetButtonSymbolExtra(nil)
            end
      

	   end
    end

    if self:Get_autosetcombat() then
        self:AutoSetSymbols(true)
    end

    if self.SetSymbolsOnNextUpdate then
        self.SetSymbolsOnNextUpdate = false
        if not BananaBar3:CanSetSymbols() then
            self:Print("Autoset symbols fail, cant set symbols")
            return
        end
        self:Debug("Autoset symbols start")
        self:AutoSetSymbols(false)
    end
    local t2 = GetTime()
end

function BananaBar3:SetSymbolsKeyPressed()
    self:Debug("Autoset symbols...")
    self.SetSymbolsOnNextUpdate = true
end

function BananaBar3:AutoSetSymbols(combatOnly)
    if not BananaBar3:CanSetSymbols() then
        return
    end
    targets = {}
    --self:Dump("self.IGNOREMOBS",self.IGNOREMOBS)
    local loop = 0
    for guid, info in pairs(self.TARGETS) do
        if self.IGNOREMOBS[guid] == 1 then
            -- skip
        else
            loop = loop + 1
            if
                BananaBar3:FromCount(info.from) > 0 and info.symbol == nil and UnitCanAttack("PLAYER", info.info_unit) and
                    info.symbol == nil
             then
                if UnitAffectingCombat(info.info_unit) or combatOnly == false then
                    for jj = 1, 8, 1 do
                        local j = nil;

                        if combatOnly then
                            j = self:Get_buttonorder("symbolordercombat",jj)
                            self:Debug("symbolordercombat "..jj.." -> "..j)
                        else
                            j = self:Get_buttonorder("symbolorderhotkey",jj)
                            self:Debug("symbolorderhotkey "..jj.." -> "..j)
                        end

                        

                        if self.IGNOREMARKS[j] == 1 then
                            -- skip
                        else
                            if self.TARGETMARKS[j] == nil then
                                self:Print("Setting Symbol " .. L[("symbolname" .. j)] .. " on " .. info.info_name .." (".. UnitGUID(info.info_unit)..")")
                                BananaBar3:PlaySet()
                                SetRaidTarget(info.info_unit, j)
                                self.IGNOREMARKS[j] = 1
                                self.IGNOREMOBS[guid] = 1
                                self.TARGETMARKS[j] = UnitGUID(info.info_unit)
                                info.symbol = j
                                break
                            end
                        end
                    end
                end
            end
        end
    end

    --    if self.TSRA.ut_count > 0 then
    --        for i=0,self.TSRA.ut_count-1,1 do
    --            local uid = self.TSRA[self.UT_FIRST+i].info_unit;
    --            if settype ~= "sscombat" or UnitAffectingCombat(uid) then
    --                 local name = UnitName(uid);
    --                if self.db.profile.mobsettings[GetLocale()].byname[name] then
    --                    if self.db.profile.mobsettings[GetLocale()].byname[name][settype] then
    --                        local search = true;
    --                        for j=1,8,1 do
    --                            if search and self.TSRB[j].used==0 and self.TSRA[j].used==0 then
    --                                if self.db.profile.mobsettings[GetLocale()].byname[name][j] then
    --                                	BananaBar3:PlaySet();
    --                                    self:Print("Setting Symbol "..L[("symbolname"..j)].." on "..name);
    --                                    SetRaidTarget(uid,j);
    --                                    self.TSRA[j].used = 1;
    --                                    search = false;
    --                                end
    --                            end
    --                        end
    --                    end
    --                end
    --            end
    --        end
    --    end
end

function BananaBar3:Get_mobsetting(zone, name, setting)
    local v = self.db.profile.mobsettings[zone][name][setting] or false
    --BananaBar3:Print("Get_mobsetting '"..zone.."' '"..name.."' '"..setting.."' '"..tostring(v).."'");
    return v
end

function BananaBar3:Set_mobsetting(v, zone, name, setting)
    --BananaBar3:Print("Set_mobsetting '"..zone.."' '"..name.."' '"..setting.."' '"..tostring(v).."'");
    self.db.profile.mobsettings[zone][name][setting] = v
end
--/script BananaBar3:AddNewMob("Area51","Bar");
--/script BananaBar3:Print(GetRealZoneText());
--/script BananaBar3:Print(GetRealZoneText().." /// "..GetZoneText());
function BananaBar3:AddNewMob(zone, name)
    local id = self.db.profile.mobsettings
    if not self.db.profile.mobsettings[zone] then
        self.db.profile.mobsettings[zone] = {}
    end
    if not self.db.profile.mobsettings[zone][name] then
        self.db.profile.mobsettings[zone][name] = {}
        self:Debug("Added new mob: " .. UnitName("mouseover"))
    end

    AddOptionEntry(zone, name)
end

function BananaBar3:CHAT_MSG_ADDON(prefix, message, messagetype, sender)
    if prefix == "CTRA" then
    --BananaBar3:Print("M:"..message.."<:>"..messagetype.."<:>"..sender);
    end
end
function BananaBar3:ZoneText()
    return GetRealZoneText() or "Unknown"
end

function BananaBar3:UPDATE_MOUSEOVER_UNIT(a1, a2, a3)
    if UnitExists("mouseover") then
        if UnitCanAttack("player", "mouseover") and (not UnitIsCivilian("mouseover")) then
            if not UnitIsPlayer("mouseover") then
                self:AddNewMob(self:ZoneText(), UnitName("mouseover"))
            end
        end
    end
end

function AddOptionEntry(zone, name, mobid)
    if not options.args.mobsettings.args[zone] then
        options.args.mobsettings.args[zone] = {
            type = "group",
            name = zone,
            desc = zone,
            args = {}
        }
    end

    if not options.args.mobsettings.args[zone].args[name] then
        options.args.mobsettings.args[zone].args[name] = {
            type = "group",
            name = name,
            desc = name,
            args = {
                combat = {
                    type = "toggle",
                    width = "full",
                    name = L["autosymbolsoncombat"],
                    desc = L["autosymbolsoncombatdesc"],
                    get = function(info)
                        return BananaBar3:Get_mobsetting(zone, name, "sscombat")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sscombat")
                    end,
                    order = 110
                },
                mouseover = {
                    type = "toggle",
                    width = "full",
                    name = L["autosymbolsonmouseover"],
                    desc = L["autosymbolsonmouseoverdesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "ssmo")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "ssmo")
                    end,
                    order = 120
                },
                spacer = {
                    type = "header",
                    name = "-",
                    order = 130
                },
                symbol1 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR1 .. L["symbolname1"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym1")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym1")
                    end,
                    order = 201
                },
                symbol2 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR2 .. L["symbolname2"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym2")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym2")
                    end,
                    order = 202
                },
                symbol3 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR3 .. L["symbolname3"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym3")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym3")
                    end,
                    order = 203
                },
                symbol4 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR4 .. L["symbolname4"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym4")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym4")
                    end,
                    order = 204
                },
                symbol5 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR5 .. L["symbolname5"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym5")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym5")
                    end,
                    order = 205
                },
                symbol6 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR6 .. L["symbolname6"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym6")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym6")
                    end,
                    order = 206
                },
                symbol7 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR7 .. L["symbolname7"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym7")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym7")
                    end,
                    order = 207
                },
                symbol8 = {
                    type = "toggle",
                    name = "|c" .. BANANA_SYMBOL_COLOR8 .. L["symbolname8"] .. "|r",
                    desc = L["autosymboldesc"],
                    get = function()
                        return BananaBar3:Get_mobsetting(zone, name, "sym8")
                    end,
                    set = function(info, v)
                        BananaBar3:Set_mobsetting(v, zone, name, "sym8")
                    end,
                    order = 208
                }
            }
        }
    end
end


function BananaBar3:Get_action_part_mouse(action)
    local a = BananaBar3:Get_action(action)
    self:Debug("Set_action_part_mouse "..action.." "..(math.floor(a / 8)+10).." "..a);
    return math.floor(a / 8)+10
end

function BananaBar3:Set_action_part_mouse(action, v)
    local a = BananaBar3:Get_action(action)
    a = bit.mod(a, 8) + (8 * (v - 10))
    self:Debug("Set_action_part_mouse "..action.." "..v.." "..a);
    BananaBar3:Set_action(action, a)
end


function BananaBar3:Get_action_part(action, x)
    local a = BananaBar3:Get_action(action)
    if x == 1 then
        return bit.band(a, 1) ~= 0
    end
    if x == 2 then
        return bit.band(a, 2) ~= 0
    end
    if x == 3 then
        return bit.band(a, 4) ~= 0
    end
    return math.floor(a / 8) == (x - 10)
end

function BananaBar3:Set_action_part(action, x, v)
    local a = BananaBar3:Get_action(action)
    if x == 1 then
        if v then
            a = bit.bor(a, 1)
        else
            a = bit.band(a, 255 - 1)
        end
    elseif x == 2 then
        if v then
            a = bit.bor(a, 2)
        else
            a = bit.band(a, 255 - 2)
        end
    elseif x == 3 then
        if v then
            a = bit.bor(a, 4)
        else
            a = bit.band(a, 255 - 4)
        end
    else
        a = bit.mod(a, 8) + (8 * (x - 10))
    end
    BananaBar3:Set_action(action, a)
end

function BananaBar3:PlaySet()
    PlaySoundFile(BANANA_SOUND_SET)
end
function BananaBar3:PlayRemove()
    PlaySoundFile(BANANA_SOUND_REMOVE)
end
function BananaBar3:PlayRemoveAll()
    PlaySoundFile(BANANA_SOUND_REMOVE_ALL)
end

function BananaBar3:PlayError()
    PlaySoundFile(BANANA_SOUND_ERROR)
end

function BananaBar3:FindSpellIdByTexture(searchtex)
    local searchid = 1
    local tex
    local resultid = nil
    repeat
        tex = GetSpellTexture(searchid, BOOKTYPE_SPELL)

        if tex == searchtex then
            return searchid
        end
        searchid = searchid + 1
    until tex == nil
    return nil
end

function BananaBar3:OnClick()
    PlaySoundFile("Interface\\AddOns\\BananaBar3\\Sound\\2hh.mp3")
end

function BananaBar3:OnTooltipUpdate()
    Tablet:SetHint("")
end

function BananaBar3:BananaCursor()
    if BananaBar3.Dragging then
        if BananaBar3.DragPreparing then
            local x, y = GetCursorPosition()
            x = x - self.DragCursorPosX
            y = y - self.DragCursorPosY
            dist = math.sqrt(x * x + y * y)

            if BananaBar3.DragMouseButton == "LeftButton" and dist > 10 then
                BananaBar3.DragPreparing = false
            elseif BananaBar3.DragMouseButton == "RightButton" and dist > 20 then
                BananaBar3.CancelTimer(self.BananaCursorTimer)
                BananaBar3.Dragging = false
                self:Print("Starting Layoutmode")
                self:BananaSetCursor(nil)
                self:Set_layoutmode(true)
                return
            else
                return
            end
        end

        if UnitExists("MOUSEOVER") then
            if self.DragStartButton.ButtonId <= 8 then
                self:BananaSetCursor(BANANA_RAID_CURSORS[self.DragStartButton.ButtonId])
            else
                self:BananaSetCursor(BANANA_RAID_CURSORS[9])
            end
        elseif BananaBarButtonUnderMouse and BananaBarButtonUnderMouse ~= self.DragStartButton then
            if self.DragStartButton.ButtonId <= 8 then
                self:BananaSetCursor(BANANA_RAID_CURSORS[self.DragStartButton.ButtonId])
            else
                self:BananaSetCursor(BANANA_RAID_CURSORS[9])
            end
        else
            if self.DragStartButton.ButtonId <= 8 then
                self:BananaSetCursor(BANANA_RAID_CURSORS_GREY[self.DragStartButton.ButtonId])
            else
                self:BananaSetCursor(BANANA_RAID_CURSORS_GREY[9])
            end
        end
    elseif BananaBar3.MouseOverPainting then
        self:BananaSetCursor("Interface\\AddOns\\BananaBar3\\Images\\raidiconcursor")
        self:MouseOverTargeting()
    elseif self.ShowMouseSymbol then
        if UnitExists("MOUSEOVER") then
            local idx = GetRaidTargetIndex("MOUSEOVER")
            if idx and idx >= 1 and idx <= 8 then
                self:BananaSetCursor(BANANA_RAID_CURSORS[idx])
            else
                self:BananaSetCursor(nil)
            end
        else
            self:BananaSetCursor(nil)
        end
    end
end

function BananaBar3:SearchDown()
    if BananaBar3.Dragging or BananaBar3.MouseOverPainting then
        return
    end
    --self:Print("Changing mouse cursor when over marked mob now.");
    self.ShowMouseSymbol = true
    self.BananaCursorTimer = self:ScheduleRepeatingTimer("BananaCursor", 0.1, self)
end

function BananaBar3:SearchUp()
    if self.ShowMouseSymbol then
        --self:Print("No more changing mouse cursor when over marked mob now.");
        self.ShowMouseSymbol = false
        BananaBar3.CancelTimer(self.BananaCursorTimer)
    end
end

local targetingsymbol = 1
function BananaBar3:MouseOverTargeting()
    --self:Print("MouseOverTargeting")
    if UnitExists("MOUSEOVER") then
        if targetingsymbol > 8 then
            BananaBar3:Print("alle symbole verbraucht");
            return
        end

        if not BananaBar3:IsAutoSymbolTarget("MOUSEOVER") then
            BananaBar3:Print("not BananaBar3:CanSetSymbolOn");
            return
        end

        local name = UnitName("MOUSEOVER")
        local zone = self:ZoneText()

        local ms = self:GetMobSettings(zone, name)

        if not ms then
            self:BananaSetCursor("Interface\\AddOns\\BananaBar3\\Images\\raidiconcursorno")
            return
        end
        local guid = UnitGUID("MOUSEOVER")

        local rti = GetRaidTargetIndex("MOUSEOVER") or 0

        if rti == 0 then
            if (targetingduplist[guid]) then
                self:BananaSetCursor("Interface\\AddOns\\BananaBar3\\Images\\raidiconcursorno")
                return
            end

            local realSymbol = self:Get_buttonorder("symbolordermouse",targetingsymbol)
            self:Debug("symbolordermouse "..targetingsymbol.." -> "..realSymbol)

            BananaBar3:PlaySet()
            BananaBar3:Print("Set Symbol " .. L[("symbolname" .. realSymbol)] .. " on " .. UnitName("MOUSEOVER"))
            SetRaidTarget("MOUSEOVER", realSymbol)
            targetingduplist[guid] = realSymbol
            targetingsymbol = targetingsymbol + 1
        else
            self:BananaSetCursor("Interface\\AddOns\\BananaBar3\\Images\\raidiconcursorno")
        end
    end
end

function BananaBar3:GetMobSettings(zone, name)
    if not self.db.profile.mobsettings[zone] then
        self.db.profile.mobsettings[zone] = {}
    end
    if not self.db.profile.mobsettings[zone][name] then
        self.db.profile.mobsettings[zone][name] = {
            symbols = "12345678"
        }
    end

    return self.db.profile.mobsettings[zone][name]
end
function BananaBar3:MouseOverSymbolsDown()
    if BananaBar3.Dragging then
        -- dont start, dragging in progress
        --BananaBar3:Print("dragging in progress, not painting");
    elseif self.ShowMouseSymbol then
        -- dont start, dragging in progress
        --BananaBar3:Print("searching in progress, not painting");
    else
        -- start mouseoverpainting
        BananaBar3.MouseOverPainting = true
        self.BananaCursorTimer = self:ScheduleRepeatingTimer("BananaCursor", 1, self)

        targetingsymbol = 1
        targetingduplist = {}
    end
end

function BananaBar3:MouseOverSymbolsUp()
    if BananaBar3.MouseOverPainting then
        BananaBar3.CancelTimer(self.BananaCursorTimer)
        self:BananaSetCursor(nil)
    end
    BananaBar3.MouseOverPainting = false
end

function BananaBar3:DragPrepare(dragStartButton, mouseButton)
    if BananaBar3.MouseOverPainting then
        --BananaBar3:Print("painting in progress, not dragging");
        -- painting in progress
    elseif self.ShowMouseSymbol then
        --BananaBar3:Print("searching in progress, not dragging");
        -- painting in progress
    else
        --BananaBar3:Print("Dragging Mode", mouseButton);
		local  clicktype = BananaBar3Button:GetClickType(mouseButton)
		--BananaBar3:Print("Clicktype:"..clicktype)
		if clicktype == 10 then
			BananaBar3.Dragging = true
			BananaBar3.DragPreparing = true
			BananaBar3.DragStartButton = dragStartButton
			BananaBar3.DragMouseButton = mouseButton
			self.BananaCursorTimer = self:ScheduleRepeatingTimer("BananaCursor", 0.1, self)
			local x, y = GetCursorPosition()
			self.DragCursorPosX = x
			self.DragCursorPosY = y
		end
	end
end

function BananaBar3:DragStop(dragStopButton, mouseButton)
    if BananaBar3.Dragging then
        BananaBar3.Dragging = false
        BananaBar3.CancelTimer(self.BananaCursorTimer)
        self:BananaSetCursor(nil)
        if BananaBar3.DragPreparing then
            --self:Debug("drag not started, preparing only")
            return
        end
        if dragStopButton == nil or dragStopButton.AssistButton then
            --self:Debug("drag from "..self.DragStartButton.ButtonId.." to nothing")
            if UnitExists("MOUSEOVER") then
                BananaBar3:DragButtonOnUnit(self.DragStartButton, mouseButton)
            else
                local unit = BananaBar3:GetUnitBySymbol(self.DragStartButton.ButtonId)
                if unit then
                    SetRaidTarget(unit, 0)
                    PlayRemove()
                end
            end
        elseif dragStopButton == self.DragStartButton then
            --self:Debug("no drag")
        else
            --self:Debug("drag from "..self.DragStartButton.ButtonId.." to "..dragStopButton.ButtonId)
            BananaBar3:ChangeSymbol(self.DragStartButton.ButtonId, dragStopButton.ButtonId)
        end
    end
end

function BananaBar3:DragButtonOnUnit(button, mouseButton)
    if GetRaidTargetIndex("MOUSEOVER") == button.ButtonId then
        BananaBar3:PlayRemove()
        SetRaidTarget("MOUSEOVER", 0)
    else
        if GetRaidTargetIndex("MOUSEOVER") then
            local old = GetRaidTargetIndex("MOUSEOVER")
            if self.TARGETMARKS[old] then
                BananaBar3:ChangeSymbol(old, button.ButtonId)
            else
                SetRaidTarget("MOUSEOVER", button.ButtonId)
                BananaBar3:PlaySet()
            end
        else
            SetRaidTarget("MOUSEOVER", button.ButtonId)
            BananaBar3:PlaySet()
        end
    end
end

function BananaBar3:InitChatFrame()
    if not self.DebugChatFrame then
        local i = 1
        while _G["ChatFrame" .. i] do
            if _G["ChatFrame" .. i].name == "Debug" then
                self.DebugChatFrame = _G["ChatFrame" .. i]
                self:Debug("Set debug chat frame to '".._G["ChatFrame" .. i].name.."'")
            end
            --_G["ChatFrame" .. i]:AddMessage("I am chatframe " .. i)
            i = i + 1
        end
        if not self.DebugChatFrame then
            self.DebugChatFrame = _G["ChatFrame" .. 1]
            self:Debug("Set debug chat frame to '".._G["ChatFrame" .. 1].name.."'")
        end
    end
end

function BananaBar3:Debug(value)
    self:InitChatFrame()

    if self:Get_showdebugmessages() then
        BananaBar3:Print(self.DebugChatFrame, "[Dbg] "..dump(value))
    end
end
function BananaBar3:Dump(name, value)
    self:InitChatFrame()
    if BananaBar3:Get_showdebugmessages() then
        BananaBar3:Print(self.DebugChatFrame, "[Dmp] "..name .. ": " .. dump(value))
    end
end

function BananaBar3:Dump2(name, value)
    self:InitChatFrame()
    BananaBar3:Print(self.DebugChatFrame, "[Dmp] "..name .. ": " .. dump(value))
end

function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. tostring(k) .. '"'
            end
            s = s .. "[" .. tostring(k) .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    end

    if type(o) == "function" then
        return "F"
    end

    return tostring(o)
end

function BananaBar3:IsActive()
    return true
end

function BananaBar3:TableCount(list)
    local count = 0
    for key in pairs(list) do
        count = count + 1
    end
    return count
end

function BananaBar3:FromCount(list)
    local count = 0
    for key in pairs(list) do
        if key ~= "MOUSEOVER" then
            count = count + 1
        end
    end
    return count
end

function BananaBar3:AssistScan(i, target, unit, raidIndex)
    local tooltipInfo1 = nil
    local tooltipInfo2 = nil
	
    self.AssistButtons[i].AssistUnit = unit
    self.AssistButtons[i].AssistTarget = target
	--UU=BananaBar3.AssistButtons[i].frame:GetAttribute("unit")
	--if UU then 	BananaBar3:Print(i.."//"..UU.."//"..target.."//"..unit) else  BananaBar3:Print("UU nill") end
    
	
	local name, rank = GetRaidRosterInfo(i)
	
	if name  then
		local symbolID = GetRaidTargetIndex("raid" .. i .. "target") or "pas de symbol"
		--self:Debug("Player "..i.." : "..name)
		--self:Debug("La cible de "..name.. " is " .. (UnitInRaid("RAID" .. i .. "TARGET") and "" or "not ") .. "in your raid group.")
		self:Debug("La cible de "..name.. " est marquée du symbol N° " .. symbolID)
	
	--si un joueur cible un NPC qui est marqué change l'attibution target du bouton 
	if symbolID ~= "pas de symbol"  then
			
	    BananaBar3.Buttons[symbolID].frame:SetAttribute("unit", "RAID" .. i .. "TARGET")
        BananaBar3.Buttons[symbolID].frame:SetAttribute("*type1", "target")
		

	
		local uniT = BananaBar3.Buttons[symbolID].frame:GetAttribute("unit");
		if uniT == nil then
		  --self:UnregisterAllEvents();
		else
		--self:Debug("unit target de player reglé sur " .. uniT.." : " ..UnitName(uniT).." par "..name)
		--self:Debug("Le bouton symbol N°"..symbolID.." est reglé sur " .. uniT.." : " ..UnitName(uniT).." par "..name)
		end
	
	
	end

	end	
	
	
	
	
	
	
	
	
	
	if unit then
        if BananaBar3.AssistButtons[i].frame:GetAttribute("unit") ~= target then
            --BananaBar3:Print("set b"..i.."="..(target or "<nil>").." old="..(BananaBar3.AssistButtons[i].frame:GetAttribute("unit") or "<nil>"));
            --self:Debug("set b"..i.."="..(target or "<nil>").." old="..(BananaBar3.AssistButtons[i].frame:GetAttribute("unit") or "<nil>"))
			--BananaBar3:Print(i)
			SecureActionQueue:FrameSetAttribute(BananaBar3.AssistButtons[i].frame, "unit", target)
            SecureActionQueue:FrameSetAttribute(BananaBar3.AssistButtons[i].frame, "type2", "menu")
            SecureActionQueue:FrameSetAttribute(BananaBar3.AssistButtons[i].frame, "*type1", "target")
        	
			if GetRaidTargetIndex(unit) then self:Debug("unit: "..GetRaidTargetIndex(unit)) end
			
			--for i = 1, 8, 1 do
			 
			--SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[i].frame, "unit", target)
            --SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[i].frame, "*type1", "target")
			--end

			--SecureActionQueue:FrameSetAttribute(BananaBar3.BananaBarButton1, "unit", target)
            --SecureActionQueue:FrameSetAttribute(BananaBar3.BananaBarButton1, "*type1", "target")
		--BananaBar3.AssistButtons[i].frame.menu = BananaShowTargetDropDown;
        end
    else
        if BananaBar3.AssistButtons[i].frame:GetAttribute("unit") ~= "" then
           -- BananaBar3:Print(i)
			--self:Debug("set b"..i.."="..(target or "<nil>").." old="..(BananaBar3.AssistButtons[i].frame:GetAttribute("unit") or "<nil>"))
            SecureActionQueue:FrameSetAttribute(BananaBar3.AssistButtons[i].frame, "unit", nil)
            SecureActionQueue:FrameSetAttribute(BananaBar3.AssistButtons[i].frame, "type2", nil)
            SecureActionQueue:FrameSetAttribute(BananaBar3.AssistButtons[i].frame, "*type1", nil)
			
			--SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[8].frame, "unit", target)
            --SecureActionQueue:FrameSetAttribute(BananaBar3.Buttons[8].frame, "*type1", "target")
        --BananaBar3.AssistButtons[i].frame.menu = nil;
        end
    end

    if UnitExists(unit) then
        --self:Debug(i.." "..unit.." "..target.." "..(raidIndex or "nil"))
        BananaBar3.AssistButtons[i].AssistUnit = unit
        BananaBar3.AssistButtons[i].AssistTarget = target
		
        local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(raidIndex)

        if not online then
            BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_OFFLINE)
            tooltipInfo1 = "Offline"
            tooltipInfo2 = nil
        elseif UnitIsGhost(unit) then
            BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_GHOST)
            tooltipInfo1 = "Ghost released"
            tooltipInfo2 = nil
        elseif isDead then
            BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_DEAD)
            tooltipInfo1 = "Dead"
            tooltipInfo2 = nil
        elseif UnitIsAFK(unit) then
            BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_AWAY)
            tooltipInfo1 = "<AFK>"
            tooltipInfo2 = nil
        else
            if UnitExists(target) then
                if UnitIsDead(target) then
                    --self:Debug("UnitIsDead")
                    BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_X)
                    tooltipInfo1 = "has selected a dead target"
                    tooltipInfo2 = UnitName(target)
                elseif UnitCanAttack(unit, target) then
                    --self:Debug("UnitCanAttack : unit :"..unit.." target"..UnitName(target))
                    tooltipInfo1 = "has selected an enemy target"
                    tooltipInfo2 = UnitName(target)
                    local rti = GetRaidTargetIndex(target)
                    if rti then
                        BananaBar3.AssistButtons[i]:SetButtonSymbol(rti)
                    else
                        BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_ENEMY)
                    end
                else
                    tooltipInfo1 = "has selected an friendly target"
                    tooltipInfo2 = UnitName(target)
					--self:Debug("UnitFriendly: unit :"..unit.." target"..target)
                    if fileName == "PRIEST" then
                        BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_PRIEST)
                    elseif fileName == "PALADIN" then
                        BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_PALADIN)
                    elseif fileName == "SHAMAN" then
                        BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_SHAMAN)
                    elseif fileName == "DRUID" then
                        BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_DRUID)
                    else
                        local rti = GetRaidTargetIndex(target)
                        if rti then
                            BananaBar3.AssistButtons[i]:SetButtonSymbol(rti)
                        else
                            BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_FRIEND)
                        end
                    end
                end
            else
                --self:Debug("NotExists")
                BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_X)
                tooltipInfo1 = "has nothing selected"
                tooltipInfo2 = nil
            end
        end
    else
        BananaBar3.AssistButtons[i]:SetButtonTexture(BANANA_TEXTURE_NULL)
        
		tooltipInfo1 = nil
        tooltipInfo2 = nil
    end
    BananaBar3.AssistButtons[i]:SetButtonName2("") -- MT ehemals
    BananaBar3.AssistButtons[i].TooltipInfo1 = tooltipInfo1
    BananaBar3.AssistButtons[i].TooltipInfo2 = tooltipInfo2
end

local gruppen = {
    [1] = {count = 0},
    [2] = {count = 0},
    [3] = {count = 0},
    [4] = {count = 0},
    [5] = {count = 0},
    [6] = {count = 0},
    [7] = {count = 0},
    [8] = {count = 0}
}

function BananaBar3:AssistScanning()
    gruppen = {
        [1] = {count = 0},
        [2] = {count = 0},
        [3] = {count = 0},
        [4] = {count = 0},
        [5] = {count = 0},
        [6] = {count = 0},
        [7] = {count = 0},
        [8] = {count = 0}
    }
    for i = 1, 40, 1 do
        local name, rank, subgroup, level, class, fileName, zone, online, isDead = GetRaidRosterInfo(i)
        gruppen[subgroup][gruppen[subgroup].count] = i
        gruppen[subgroup].count = gruppen[subgroup].count + 1
    end
    for i = 1, 8, 1 do
        if gruppen[i].count < 5 then
            for j = gruppen[i].count, 4, 1 do
                gruppen[i][j] = 0
            end
        end
    end
    for i = 1, 8, 1 do
        --j=0
		for j = 0, 4, 1 do
            
		  --AssistScan     (i            , target                             , unit                   , raidIndex)
			self:AssistScan(i * 5 + j - 4, "RAID" .. gruppen[i][j] .. "TARGET", "RAID" .. gruppen[i][j], gruppen[i][j])
        
		end
    end
end

function BananaBar3:GetUnitsToScan()
    local units = {}
    if UnitInRaid("player") then
        for unitNumber = 1, 40, 1 do
            units["RAID" .. unitNumber] = ""
            units["RAID" .. unitNumber .. "TARGET"] = "RAID" .. unitNumber
            units["RAIDPET" .. unitNumber] = ""
            units["RAIDPET" .. unitNumber .. "TARGET"] = "RAIDPET" .. unitNumber
        end
    else
        units["PLAYER"] = ""
        units["PLAYERTARGET"] = "PLAYER"
        units["PET"] = ""
        units["PETTARGET"] = "PET"

        if UnitInParty("player") then
            for unitNumber = 1, 4, 1 do
                units["PARTY" .. unitNumber] = ""
                units["PARTY" .. unitNumber .. "TARGET"] = "PARTY" .. unitNumber
                units["PARTYPET" .. unitNumber] = ""
                units["PARTYPET" .. unitNumber .. "TARGET"] = "PARTYPET" .. unitNumber
            end
        end
    end
    units["MOUSEOVER"] = "MOUSEOVER"
    return units
end

function BananaBar3:Scan()
    self:ResetScanBlock()

    self:AssistScanning()
	 --BananaBar3:Print("scan ASSIT")
    local unitsToScan = self:GetUnitsToScan()

    for unit, unitparent in pairs(unitsToScan) do
        self:ScanUnit(unit, unitparent)
    end

    for key, value in pairs(self.AURAINFO) do
        local type = auraTypes[value.DummySpellId]
        local realDur = GetTime() - value.StartTime
        if realDur > type.Duration + 5 then
            --BananaBar3:Print("remove "..key)
            self.AURAINFO[key] = nil
        else
            self:AddGuidToList(key, value.Name)
        end
    end
end

function BananaBar3:ResetScanBlock(block)
    --BananaBar3:Print("reset scan")
	self.TARGETS = {}
    self.TARGETMARKS = {}
end

function BananaBar3:ScanUnit(unit, source)
    if source == "" then
        source = nil
    end

    if UnitExists(unit) then
        --BananaBar3:Print("ScanUnit "..unit);
        local rti = GetRaidTargetIndex(unit)

        self:AddTargetToList(rti, unit, source)
    end
end

function BananaBar3:AddTargetToList(rti, unit, source)
    local guid = UnitGUID(unit)

    if rti then
        if self.TARGETMARKS[rti] == nil then
            self.TARGETMARKS[rti] = guid
            self.IGNOREMARKS[rti] = 1
            self.IGNOREMOBS[guid] = 1
        end
    end

    if self.TARGETS[guid] == nil then
        self.TARGETS[guid] = {}
        self.TARGETS[guid].from = {}
        self.TARGETS[guid].symbol = rti
        self.TARGETS[guid].info_unit = unit
        self.TARGETS[guid].info_name = UnitName(unit)
        self.TARGETS[guid].info_dead = UnitIsDead(unit)
        self.TARGETS[guid].info_health = UnitHealth(unit)
        self.TARGETS[guid].info_healthmax = UnitHealthMax(unit)
        self.TARGETS[guid].has_huntersmark = self:UnitHasHuntersMark(unit)
    end

    if source then
        self.TARGETS[guid].from[source] = 1
    end
end

function BananaBar3:AddGuidToList(guid, name)
    if self.TARGETS[guid] == nil then
        self.TARGETS[guid] = {}
        self.TARGETS[guid].from = {}
        self.TARGETS[guid].symbol = nil
        self.TARGETS[guid].info_unit = "none"
        self.TARGETS[guid].info_name = name
        self.TARGETS[guid].info_dead = false
        self.TARGETS[guid].info_health = 0
        self.TARGETS[guid].info_healthmax = 0
        self.TARGETS[guid].has_huntersmark = false
    else
        self.TARGETS[guid].info_name = name
    end
end

function BananaBar3:FindSpellId(unit)
    --self:Print("FindSpellId: "..unit)
    local iIterator = 1
    local debuffName,
        debuffTexture,
        debuffApplications,
        debuffDispelType,
        duration,
        expirationTime,
        source,
        isStealable,
        nameplateShowPersonal,
        spellId,
        canApplyAura,
        isBossDebuff,
        castByPlayer,
        nameplateShowAll,
        timeMod = UnitDebuff(unit, iIterator)
    while (debuffTexture) do
        --timeMod
        if spellId ~= nil and auraTypes[spellId] ~= nil then
            self:Debug("Found Aura Debuff on mob " .. auraTypes[spellId].Name .. " on " .. UnitName(unit))
            return spellId
        end
        iIterator = iIterator + 1
        debuffName, debuffTexture, debuffApplications, debuffDispelType = UnitDebuff(unit, iIterator)
    end
    return nil
end

function BananaBar3:UnitHasHuntersMark(unit)
    local iIterator = 1
    local debuffName, debuffTexture, debuffApplications, debuffDispelType = UnitDebuff(unit, iIterator)
    while (debuffTexture) do
        if debuffTexture == 132212 then
            return true
        end
        iIterator = iIterator + 1
        debuffName, debuffTexture, debuffApplications, debuffDispelType = UnitDebuff(unit, iIterator)
    end
    return false
end

function BananaBar3:IsAutoSymbolTarget(unit)
    if UnitCanAttack("player", unit) and (not UnitIsCivilian(unit)) then
        return true
    else
        return false
    end
    --UnitExists
    --UnitIsDead
    --UnitIsCorpse
end

function BananaBar3:CanSetSymbols()
    if UnitInRaid("player") then
        if UnitIsGroupAssistant("player") or UnitIsGroupLeader("player") then
            return true
        end
    elseif UnitInParty("player") then
        return true
    else
        return true
    end
    return false
end

function BananaBar3:ChangeSymbol(indexFrom, indexTo)
    --BananaBar3:Print("Change Symbol from "..indexFrom.." to "..indextTo);
	local unit1 = BananaBar3:GetUnitBySymbol(indexFrom)
    local unit2 = BananaBar3:GetUnitBySymbol(indexTo)
    if unit1 then
        if unit2 then
            --swap
            SetRaidTarget(unit1, indexTo)
            SetRaidTarget(unit2, indexFrom)
            BananaBar3:PlaySet()
            BananaBar3:PlayRemove()
        else
            --move
            SetRaidTarget(unit1, indexTo)
            BananaBar3:PlaySet()
            BananaBar3:PlayRemove()
        end
    else
        if unit2 then
            --move
            SetRaidTarget(unit2, indexFrom)
            BananaBar3:PlaySet()
            BananaBar3:PlayRemove()
        else
            BananaBar3:PlayError()
        end
    end
end

function BananaBar3:GetUnitBySymbol(index)
    if self.TARGETMARKS[index] then
        BananaBar3:Print("Symbol"..self.TARGETS[self.TARGETMARKS[index]].info_unit);
		return self.TARGETS[self.TARGETMARKS[index]].info_unit
    end
    return nil
end

function BananaBar3:SetSymbol(index,Targetunitname)
	u="target"
		
		if UnitExists(u) then 
		Targetunitname=UnitName(u)
		end
	
	if GetRaidTargetIndex("target") == index then
        BananaBar3:PlayRemove()
        SetRaidTarget("target", 0)
		self:Debug("Remove targetname sur "..Targetunitname)	
	else
        SetRaidTarget("target", index)
		if Targetuniname  then
		self:Debug("index targetname N:"..index.."sur "..Targetunitname)
        end
		BananaBar3:PlaySet()
    end
end

function BananaBar3:SetOrRemoveSymbol()
    if not UnitExists("target") then
        Banana_TargetRaidSymbol(index)
        if not UnitExists("target") then
            self.Addon:Debug("keine target ausgewählt und kein mob gefunden um target zu entfernen")
            return
        end
    end

    local oldindex = (Banana_GetSymbol("TARGET") or 0)
    if oldindex == index then
        SetRaidTarget("TARGET", 0)
        Banana_PlayRemove1()
    else
        SetRaidTarget("TARGET", index)
        BananaBar3:PlaySet()
    end
    Banana_UpdateStatus()
end
