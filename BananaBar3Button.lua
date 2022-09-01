

--ActionButtonTemplate


local MAJOR_VERSION = "BananaBar3Button-2.0"
local MINOR_VERSION = "$Rev: 101 $"
--Locale
local L = LibStub("AceLocale-3.0"):GetLocale("BananaBar3")

local BananaBar3Button = LibStub:NewLibrary("BananaBar3Button-2.0", 1)
local SecureActionQueue = LibStub("SecureActionQueue-2.0")

function prnt(text)
    DEFAULT_CHAT_FRAME:AddMessage(tostring(text))
end

local BananaBarAllButtons = {};
local BananaBarButtonNameCounter = 1;
BananaBarButtonUnderMouse = nil;

function BananaBar3Button:new(addon, name)
    o = {}
    setmetatable(o, self)
    self.__index = self
    o:init(addon,name)
	
    return o
end


function BananaBar3Button:init(addon,name)
    self.Name = name;
    self.Addon = addon;
    self.FrameName = "BananaBarButton"..BananaBarButtonNameCounter;
    self.ButtonId = BananaBarButtonNameCounter;
	self.Unit = "raid"..self.ButtonId;
    
	BananaBarAllButtons[BananaBarButtonNameCounter] = self;
    BananaBarButtonNameCounter = BananaBarButtonNameCounter +1;
    --self.frame = CreateFrame("CheckButton",self.FrameName,UIParent,"BananaBar3ButtonTemplate","SecureActionButtonTemplate"); 
    self.frame = CreateFrame("CheckButton",self.FrameName,UIParent,"BananaBar3ButtonTemplate" , "SecureActionButtonTemplate"); 	
			
		self.frame:SetAttribute("*type1", "target")
		self.frame:EnableMouse(true)
   
	
    self.frame:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonUp", "Button4Up", "Button5Up");
	self.selected = false;
    self.frame.Id="1"
    self.frame:SetPoint("CENTER",0,0)
    self.frame:Hide();
    --self.Addon:Print("initFrame ",self.FrameName);s

    self.TargetSymbol = getglobal(self.FrameName.."TargetSymbol");
    self.Icon = getglobal(self.FrameName.."Icon");
    self.DeadSymbol = getglobal(self.FrameName.."DeadSymbol");
    self.HuntersmarkSymbol = getglobal(self.FrameName.."HuntersmarkSymbol");
    self.Arrow1 = getglobal(self.FrameName.."Arrow1");
    self.Arrow2 = getglobal(self.FrameName.."Arrow2");
    self.Arrow3 = getglobal(self.FrameName.."Arrow3");
    self.Arrow4 = getglobal(self.FrameName.."Arrow4");
    self.Selected = getglobal(self.FrameName.."Selected");
    self.NormalTexture = getglobal(self.FrameName.."NormalTexture");
    self.PushedTexture = getglobal(self.FrameName.."PushedTexture");   
    self.Buttonback = getglobal(self.FrameName.."Buttonback");   
    
    self.Stopwatch = getglobal(self.FrameName.."Stopwatch");   
    self.HealthBar = getglobal(self.FrameName.."HealthBar");
    self.HealthBarSpark = getglobal(self.FrameName.."HealthBarSpark"); 	

    self.SubIcon =  getglobal(self.FrameName.."SubIcon");  
    self.Cooldown =  getglobal(self.FrameName.."Cooldown");  
    self.Cooldown:SetSwipeTexture("Interface\\AddOns\\BananaBar3\\Images\\Swite_Circle.blp",0,0,0,0.5);
    self.Cooldown:SetUseCircularEdge(true)
    self.Cooldown:SetAlpha(0.7);
    self.Cooldown:SetReverse(true)
    self.Cooldown:SetSwipeTexture([[Interface\PlayerFrame\DK-Frost-Rune-CDFill]])
    self.Cooldown:SetEdgeTexture([[Interface\PlayerFrame\DK-BloodUnholy-Rune-CDSpark]])

    self.Timer = getglobal(self.FrameName.."Timer");   
    self.Cooldown:SetDrawEdge(true)
    self.Cooldown:SetDrawBling(false)
    self.Cooldown:SetHideCountdownNumbers(false)
    
--    <Size x="36" y="36"/>
--    <Anchors>
--        <Anchor point="CENTER" relativePoint="LEFT">
--            <Offset>
--                <AbsDimension x="0" y="-1"/>
--            </Offset>
--        </Anchor>
--    </Anchors> 

    self.MobName = getglobal(self.FrameName.."MobName");   
    self.Count = getglobal(self.FrameName.."Count");   
    self.Arrows = {};
    self.Arrows[1] = self.Arrow1;
    self.Arrows[2] = self.Arrow2;
    self.Arrows[3] = self.Arrow3;
    self.Arrows[4] = self.Arrow4;
    
    self.dockFrame = nil;
    self.dockDirection = 0;
    self.showButtonFrame = true;
    self.visible = true;
    
    self.HealthBar:SetValue(0)
    self.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
    --self.HealthBar:SetStatusBarTexture("Interface\\AddOns\\BananaBar3\\Images\\Chess128N");
	self.HealthBar:SetStatusBarColor(0, 1, 1)
	
	self.HealthBarSpark:SetValue(0)
    self.HealthBarSpark:SetStatusBarTexture("Interface\\CastingBar\\UI-CastingBar-Spark");
    self.HealthBarSpark:SetStatusBarColor(1, 1, 1, 40/100); 



    self.dead = false;
    self.showDead = false;
    self:SetHuntersmark(false);

    --self.frame:RegisterForClicks("LeftButtonUp", "RightButtonUp", "MiddleButtonDown", "MiddleButtonUp");
	self.frame:SetScript("OnLoad", function(frame) self:OnLoad(frame) end)
	--self.frame:SetScript("OnClick", function(frame,button) self:OnClick(button, frame) end)
	self.frame:SetScript("OnMouseUp", function(frame,button) self:OnMouseUp(button, frame) end)
	self.frame:SetScript("OnMouseDown", function(frame,button) self:OnMouseDown(button, frame) end)
	self.frame:SetScript("OnEnter", function(frame,button) self:OnEnter(button, frame) end)
	self.frame:SetScript("OnLeave", function(frame,button) self:OnLeave(button, frame) end)

    

end

 --  self.Addon:Debug(PlayerMenu(1).frame.."unit"..self.Unit.."target")

-- Functions




function BananaBar3Button:SetButtonSymbol(index, unit)
    BananaBar3Button:SetSymbolTexture(self.Icon,index);
	
	--self.Addon:Print("initFrame: index ",index,"  unit:", unit, " icon :",self.Icon);
end

function BananaBar3Button:SetStopwatch(set)
    if set then
        self.Stopwatch:Show()
    else
        self.Stopwatch:Hide()
    end
end

function BananaBar3Button:SetButtonSymbolExtra(unit, icon)
    BananaBar3Button:SetSymbolTexture(self.Icon,0, unit, icon);
	--self.Addon:Print("init",self.Icon,0, unit, icon);
end

function BananaBar3Button:SetSheepSymbol(icon)
    if icon == nil then
        self.SubIcon:Hide()
    else
        self.SubIcon:SetTexture(icon)
        self.SubIcon:Show()
    end
end

function BananaBar3Button:SetTimer(start, seconds)
    if start then
        local left = start + seconds - GetTime()+1
        if left > 0 then
            self.Timer:SetText(tostring(math.floor(left)));
        else    
            self.Timer:SetText("");
        end
    else
        self.Timer:SetText("");
    end
    --BananaBar3Button:SetSymbolTexture(self.Icon,0, unit, icon);
end

function BananaBar3Button:SetSymbolTexture(frame, index, unit, icon)

	
	if unit then
        
		if unit == "none" then
            if icon then
                frame:SetTexture(icon);            
                frame:SetTexCoord(0, 1, 0, 1);
                return;
            end
		
            return;
        else
        
		
		SetPortraitTexture(frame,unit)
            frame:SetTexCoord(0, 1, 0, 1);
            return;
        end
    end
    if index <= 0 then
        frame:SetTexture(nil);
        return;
    end
    if index >= 9  then
		
        --frame:SetTexture(BANANA_TEXTURE_HUNTERSMARK);            
        --frame:SetTexCoord(0, 1, 0, 1);
    else
        frame:SetTexture(BANANA_TEXTURE_RAIDICONS);            
        --grayscale option
		--self.Addon:Print("initFrame: ", frame, "index : ",index,"  unit:", unit,"  icone: ",icone);
		
		frame:SetDesaturated(1);
		frame:SetVertexColor(0.5, 0.5, 0.5);
		
		local raidTargetIconButtons = UnitPopupMenuRaidTargetIcon.GetMenuButtons()[1]["GetButtons"]()[9 - index]
		
		local coords = raidTargetIconButtons["GetTextureCoords"]()
	    local tCoordLeft, tCoordRight, tCoordTop, tCoordBottom = coords["tCoordLeft"], coords["tCoordRight"], coords["tCoordTop"], coords["tCoordBottom"]
		
		--print (tCoordLeft, tCoordRight, tCoordTop, tCoordBottom)
		frame:SetTexCoord(
             tCoordLeft, 
             tCoordRight, 
             tCoordTop, 
             tCoordBottom
        );

    end

end


function BananaBar3Button:SetTargetSymbol(index)
    
	if index <= 0 then
        self.TargetSymbol:Hide();            
        BananaBar3Button:SetSymbolTexture(self.TargetSymbol,index);
    else
        BananaBar3Button:SetSymbolTexture(self.TargetSymbol,index);
        self.TargetSymbol:Show();            
    end

end


function BananaBar3Button:SetDead(isdead)
    self.dead = isdead;
    self:UpdateDeadSymbol();
end

function BananaBar3Button:UpdateDeadSymbol()
    if self.dead and self.showDead then
        self.DeadSymbol:Show();
    else
        self.DeadSymbol:Hide();
    end
end

function BananaBar3Button:SetHuntersmark(huntersmark)
    self.huntersmark = huntersmark;
    self:UpdateHuntersmarkSymbol();
end

function BananaBar3Button:UpdateHuntersmarkSymbol()
    if self.huntersmark then
        self.HuntersmarkSymbol:Show();
    else
        self.HuntersmarkSymbol:Hide();
    end
end

function BananaBar3Button:EnableDeadSymbol(showDead)
    self.showDead = showDead;
    self:UpdateDeadSymbol();
end


function BananaBar3Button:UpdateLayoutArrows(direction)
    if self.dockDirection == 1 then
        self.Arrows[3]:Show();
    else
        self.Arrows[3]:Hide();
    end
    if self.dockDirection == 2 then
        self.Arrows[4]:Show();
    else
        self.Arrows[4]:Hide();
    end
    if self.dockDirection == 3 then
        self.Arrows[1]:Show();
    else
        self.Arrows[1]:Hide();
    end
    if self.dockDirection == 4 then
        self.Arrows[2]:Show();
    else
        self.Arrows[2]:Hide();
    end
end

function BananaBar3Button:UpdateNormalArrows()
    self.Arrows[1]:Hide();
    self.Arrows[2]:Hide();
    self.Arrows[3]:Hide();
    self.Arrows[4]:Hide();
end

function BananaBar3Button:UpdateArrows()
    if self.Addon.layoutmode then
        self:UpdateLayoutArrows()
    else
        self:UpdateNormalArrows()
    end
end



function BananaBar3Button:Dock(direction, other)

    --self.Addon:Debug("Dock called");
    --self.Addon:Debug(direction);
    --self.Addon:Debug(self.Name);
    

    self.dockFrame = other;       
    self.dockDirection = direction;       
    self:UpdateArrows();
    
    self.frame:ClearAllPoints();

    if other then
        --self.Addon:Debug(other.Name);
        if direction == 0 then
            error("Docking direction=NONE but other dockung frame given.");
            return;
        end
        local oldDockFrame = self.dockFrame;
        if self  == other then
            error("Try to dock on myself");
        end
        if not self:GetMoveFrame() then
            self.dockFrame = nil;       
            self.dockDirection = 0;       
            self:UpdateArrows();
            self.Addon:Print("Can not set docking frame, recursion detected.");
            return;
        end
    else
        if direction ~= 0 then
            error("Docking direction~=NONE but no other dockung frame given.");
        end
    end

    if direction == BANANA_DOCK_TOP then
        --self.Addon:Debug("Docking "..self.FrameName.." on top of "..other.FrameName)
    	self.frame:SetPoint("BOTTOM", other.frame, "TOP",0,4);
    elseif direction == BANANA_DOCK_RIGHT then
        --self.Addon:Debug("Docking "..self.FrameName.." at the right side of "..other.FrameName)
    	self.frame:SetPoint("LEFT", other.frame, "RIGHT",4,0);
    elseif direction == BANANA_DOCK_BOTTOM then
        --self.Addon:Debug("Docking "..self.FrameName.." at the bottom of "..other.FrameName)
    	self.frame:SetPoint("TOP", other.frame, "BOTTOM",0,-4);
    elseif direction == BANANA_DOCK_LEFT then
        --self.Addon:Debug("Docking "..self.FrameName.." at the left side of "..other.FrameName)
    	self.frame:SetPoint("RIGHT", other.frame, "LEFT",-4,0);
    elseif direction == BANANA_DOCK_NONE then
        --self.Addon:Debug("UnDocking "..self.FrameName)
    else        
        error("Invalid docking direction.");
    end
end

function BananaBar3Button:OnLoad(frame)
    --self.Addon:Print("OnLoad:"..self.FrameName);
end

function BananaBar3Button:OnClick(mouseButton)
	--self.Addon:Debug("Click quoi:"..self.FrameName.." "..(mouseButton or 'null'));
	--self.Addon:Debug(BananaBar3Button:GetClickType(mouseButton));

	
    if not self.Addon.layoutmode then
	    local  clicktype = BananaBar3Button:GetClickType(mouseButton);
	    u="target"
		--u = BananaBar3.AssistButtons[i].frame:GetAttribute("unit")
		if UnitExists(u) then 
		Targetunitname=UnitName(u)
		end
		self.Addon:ExecuteAction(self, clicktype,Targetunitname);
	end
end

function BananaBar3Button:OnMouseDown(mouseButton, frame)
    --self.Addon:Debug("OnMouseDown:"..self.FrameName.." "..(mouseButton or 'null'));
	
	--print("OnMouseDown:",self.FrameName,(mouseButton or 'null'),"Sur",Targetunitname)
	--print(self.ButtonId, BananaBar3.AssistButtons[self.ButtonId].frame:GetAttribute("unit"))
	--print(UnitName(BananaBar3.AssistButtons[self.ButtonId].frame:GetAttribute("unit")))
	local  clicktype = BananaBar3Button:GetClickType(mouseButton);
	    u="target"
		if UnitExists(u) then 
		Targetunitname=UnitName(u)
		self.Addon:Debug("OnMouseDown:"..self.FrameName.." "..(mouseButton or 'null').."Sur"..Targetunitname);
		
		
		end
	
	if self.Addon.layoutmode then
        if mouseButton == "RightButton" then
            self:Dock(BANANA_DOCK_NONE);
            self:DragStart();
        elseif mouseButton == "LeftButton" then
            self:DragStart();
        elseif mouseButton == "MiddleButton" then
            self.Addon:Set_layoutmode(false);
        elseif mouseButton == "Button4" then
            self.Addon:Set_layoutmode(false);
        elseif mouseButton == "Button5" then
            BananaBar3Button:UndockAll();
        else
            --self.Addon:Debug("OnMouseDown:"..self.FrameName.." "..(mouseButton or 'null')); 
        end
        return;
    else
    
	BananaBar3:DragPrepare(self,mouseButton);
    local  clicktype = BananaBar3Button:GetClickType(mouseButton);
		if  mouseButton == "RightButton" then -- Target Unit
				self.Addon:ExecuteAction(self, clicktype, self.FrameName, Targetunitname); 
			elseif mouseButton == "LeftButton" then -- Set Target
				self.Addon:ExecuteAction(self, clicktype, Targetunitname);  
			elseif mouseButton == "MiddleButton" then -- Config Menu
				self.Addon:ExecuteAction(self, clicktype);  
			elseif mouseButton == "Button4" then
				self.Addon:Set_layoutmode(false);
			elseif mouseButton == "Button5" then
					
			else
					--self.Addon:Debug("OnMouseDown:"..self.FrameName.." "..(mouseButton or 'null')); 
		end
	end
end
function BananaBar3Button:OnMouseUp(mouseButton, frame)
    if self.Addon.layoutmode then
        self:DragStop();
        BananaBar3Button:SaveAllPos();
    else
    	BananaBar3:DragStop(BananaBarButtonUnderMouse,mouseButton);
    end
end

function BananaBar3Button:GetClickType(mouseButton, frame)
    local b = 0;
    if mouseButton == "LeftButton" then
        b = 0*8;
    elseif mouseButton == "RightButton" then
        b = 1*8;
    elseif mouseButton == "MiddleButton" then
        b = 2*8;
    elseif mouseButton == "Button4" then
        b = 3*8;
    elseif mouseButton == "Button5" then
        b = 4*8;
    else
        return 0;
    end
    if IsShiftKeyDown() then
        b = b + 1;
    end
    if IsControlKeyDown() then
        b = b + 2;
    end
    if IsAltKeyDown() then
        b = b + 4;
    end
    return b;
end

function BananaBar3Button:OnEnter()
    --self.Addon:Print("BananaBar3Button:OnEnter")
	BananaBarButtonUnderMouse = self;
    self.Addon:SetTooltipButton(self);
end


function BananaBar3Button:OnLeave()
    --self.Addon:Print("BananaBar3Button:OnLeave")
	self.Addon:BananaSetCursor(nil)
	BananaBarButtonUnderMouse = nil;
    self.Addon:SetTooltipButton(nil);
end

function BananaBar3Button:DragStart()
    moveButton = self:GetMoveFrame();
    moveButton.frame:SetMovable(true);
    moveButton.frame:StartMoving();
    self.moving = true;
end

function BananaBar3Button:DragStop()
    if self.moving then
        moveButton = self:GetMoveFrame();
        moveButton.frame:StopMovingOrSizing();
        moveButton.frame:SetMovable(false);
        self.moving = false;
        self:AutoDock();
    end
end

function BananaBar3Button:AutoDock()
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        if self.ButtonId ~= i then
            local dx = self.frame:GetLeft()-BananaBarAllButtons[i].frame:GetLeft();
            local dy = self.frame:GetTop()-BananaBarAllButtons[i].frame:GetTop();
            if i == 5 then
                --self.Addon:Debug("xy:"..dx.." "..dy);
            end
            if BananaBar3Button:TestDiff(dx,dy,0,25,9) then
                --self.Addon:Debug("AutoDock:"..self.ButtonId.." oberhalb von "..i);
                self:Dock(BANANA_DOCK_TOP,BananaBarAllButtons[i]);
                return;
            end
            if BananaBar3Button:TestDiff(dx,dy,25,0,9) then
                --self.Addon:Debug("AutoDock:"..self.ButtonId.." rechts von "..i);
                self:Dock(BANANA_DOCK_RIGHT,BananaBarAllButtons[i]);
                return;
            end
            if BananaBar3Button:TestDiff(dx,dy,0,-25,9) then
                --self.Addon:Debug("AutoDock:"..self.ButtonId.." unterhalb von "..i);
                self:Dock(BANANA_DOCK_BOTTOM,BananaBarAllButtons[i]);
                return;
            end
            if BananaBar3Button:TestDiff(dx,dy,-25,0,9) then
                --self.Addon:Debug("AutoDock:"..self.ButtonId.." links von "..i);
                self:Dock(BANANA_DOCK_LEFT,BananaBarAllButtons[i]);
                return;
            end
        end
    end
end


function BananaBar3Button:SavePos()
	if self.dockFrame then
        --dock settings speichern
        self.Addon.db.profile.ButtonLayout[self.Name].DockTo = self.dockFrame.Name;
        self.Addon.db.profile.ButtonLayout[self.Name].DockDir = self.dockDirection;
        self.Addon.db.profile.ButtonLayout[self.Name].x = 0;
        self.Addon.db.profile.ButtonLayout[self.Name].y = 0;
    else
        --position speichern
		local x = self.frame:GetLeft()*self.frame:GetScale()
		local y = self.frame:GetTop()*self.frame:GetScale()-GetScreenHeight()
        self.Addon.db.profile.ButtonLayout[self.Name].DockTo = "";
        self.Addon.db.profile.ButtonLayout[self.Name].DockDir = 0;
        self.Addon.db.profile.ButtonLayout[self.Name].x = x;
        self.Addon.db.profile.ButtonLayout[self.Name].y = y;
    end
end


function BananaBar3Button:LoadPos()
    if self.Addon.db.profile.ButtonLayout[self.Name] then
        if self.Addon.db.profile.ButtonLayout[self.Name].DockDir ~= 0 then
            local other = BananaBar3Button:FindButtonByName(self.Addon.db.profile.ButtonLayout[self.Name].DockTo);
            if other then
                --self.Addon:Print("other= "..other.Name);
                self:Dock(self.Addon.db.profile.ButtonLayout[self.Name].DockDir,other)
            else
                --self.Addon:Debug(self.Name.." kein other");
            end
        else
            if self.Addon.db.profile.ButtonLayout[self.Name].x then
                local x = self.Addon.db.profile.ButtonLayout[self.Name].x;
                local y = self.Addon.db.profile.ButtonLayout[self.Name].y;
                --self.Addon:Print("o "..(x or "xxx").." "..(y or "yyy"));
                self.dockFrame = nil;
                self.dockDirection = 0;
                self.frame:ClearAllPoints();
                self.frame:SetPoint("TOPLEFT",UIParent,"TOPLEFT",x/self.frame:GetScale(),y/self.frame:GetScale())
            else
                --self.Addon:Debug(self.Name.." kein pos");
            end
        end
    else
        --self.Addon:Debug(self.Name.." kein lay");
    end
end

function BananaBar3Button:UpdateVisible()
    if (self.visible and self.Addon:IsActive() and self.Addon.ShowButtons) or self.Addon.layoutmode then
        
		--SecureActionQueue:FRAME_VISIBLE(self.frame,show);
		self.frame:Show();
    else
		--SecureActionQueue:FRAME_VISIBLE(self.frame,hide);
        self.frame:Hide();
	end
end

function BananaBar3Button:SetVisible(visible)
    self.visible = visible;
    self:UpdateVisible();
end


function BananaBar3Button:GetMoveFrame()
    local moveFrame = self;
    for i= 1,BANANA_MAX_BUTTONS,1 do
        if moveFrame.dockFrame then
            --self.Addon:Print(moveFrame.Name.." -> "..moveFrame.dockFrame.Name);
            moveFrame = moveFrame.dockFrame;
        else
            --self.Addon:Print(moveFrame.Name.." -> nil");
            return moveFrame;    
        end
    end
    return nil;
end

function BananaBar3Button:SetCount(number,but)
    if number then
        self.Count:SetText(tostring(number));
		if number >=1 then
		
			BananaBarAllButtons[but].Icon:SetDesaturated();
			BananaBarAllButtons[but].Icon:SetVertexColor(1, 1, 1);
		
		end	    
	else
        self.Count:SetText("");
    

	
	
	
	
	end


	
	for bt =  1, 8, 1 do
		--self.Addon:Debug("Count bt ".. bt.. " : ".. tostring(BananaBarAllButtons[bt].Count));
		if BananaBarAllButtons[bt].Count == tostring(0) then
		BananaBarAllButtons[bt].Icon:SetDesaturated(1);
		BananaBarAllButtons[bt].Icon:SetVertexColor(0.5, 0.5, 0.5);
		end
	end
	
	
end



function BananaBar3Button:UpdateScale(scale)
    if self.frame.dockFrame then
		self.frame:SetScale(scale);
	else
		self:SavePos()
		self.frame:SetScale(scale);
		self:LoadPos()
	end
	
end


-- STATIC Functions


function BananaBar3Button:TestDiff(dx1,dy1,dx2,dy2,diff)
    local dx = dx1-dx2;
    local dy = dy1-dy2;
    if dx < 0 then 
        dx = 0-dx;
    end
    if dy < 0 then 
        dy = 0-dy;
    end
    if dx > diff then 
        return false;
    end
    if dy > diff then 
        return false;
    end
    return true;
end

function BananaBar3Button:FindButtonByName(name)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        if BananaBarAllButtons[i].Name == name then
            return BananaBarAllButtons[i];
        end
    end
    return nil;
end

function BananaBar3Button:UpdateAllArrows()
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i]:UpdateArrows();
    end
end

function BananaBar3Button:UpdateAllExtraInfo(show)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
		if show then
			BananaBarAllButtons[i].HealthBar:Show();
			BananaBarAllButtons[i].HealthBarSpark:Show();
			--BananaBarAllButtons[i].MobName:Show();
		else
			BananaBarAllButtons[i].HealthBar:Hide();
			BananaBarAllButtons[i].HealthBarSpark:Hide();
			--BananaBarAllButtons[i].MobName:Hide();
		end
    end
end


function BananaBar3Button:UpdateAllScale(scale)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i]:UpdateScale(scale);
    end
end

function BananaBar3Button:ShiftX(ShiftXscale)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
       
		local point, relativeTo, relativePoint, xOfs, yOfs = BananaBarAllButtons[i].Count:GetPoint()
		--xOfs then self:Debug(xOfs) end
		--self:Debug(yOfs)		
		--self:Debug(point)
		
		BananaBarAllButtons[i].Count:SetPoint(point, relativeTo, relativePoint, ShiftXscale, yOfs);
			
    end
end
function BananaBar3Button:ShiftY(ShiftYscale)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
       
		local point, relativeTo, relativePoint, xOfs, yOfs = BananaBarAllButtons[i].Count:GetPoint()
		--xOfs then self:Debug(xOfs) end
		--self:Debug(yOfs)		
		--self:Debug(point)
		
		BananaBarAllButtons[i].Count:SetPoint(point, relativeTo, relativePoint, xOfs, ShiftYscale);
				
    end
end

function BananaBar3Button:UndockAll()
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i]:Dock(BANANA_DOCK_NONE);
    end
end
function BananaBar3Button:SaveAllPos()
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i]:SavePos()
    end
end
function BananaBar3Button:LoadAllPos()
    BananaBar3Button:UndockAll();
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i]:LoadPos()
    end
end
function BananaBar3Button:UpdateAllVisible()
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i]:UpdateVisible();
    end
end
function BananaBar3Button:HideAllButton()
   
	
	for i = 1, 12, 1 do
    --BananaBarAllButtons[i].frame:Hide();
		if BananaBarAllButtons[i].frame:IsVisible() == true then
		SecureActionQueue:FRAME_VISIBLE(BananaBarAllButtons[i].frame,hide); 
		--BananaBarAllButtons[i].frame:Hide();
		else
		--BananaBarAllButtons[i].frame:SetVisible(self.db.profile.showbutton[i])
		--BananaBarAllButtons[i].frame:Show();
		if UnitAffectingCombat("player") then return end	
		BananaBarAllButtons[i]:UpdateVisible();
		end	
	end
end
function BananaBar3Button:EnableAllDeadSymbol(showDead)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        BananaBarAllButtons[i].showDead = showDead;
        BananaBarAllButtons[i]:UpdateDeadSymbol();
    end
end 

function BananaBar3Button:UpdateAllButtonFrame(show)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        if show then
            BananaBarAllButtons[i].NormalTexture:SetAlpha(1);
            BananaBarAllButtons[i].frame:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress");            
            showButtonFrame = true;
        else
            BananaBarAllButtons[i].NormalTexture:SetAlpha(0);
            BananaBarAllButtons[i].frame:SetPushedTexture("Interface\\AddOns\\BananaBar3\\Images\\Pressed");            
            showButtonFrame = false;
        end
    end
end
function BananaBar3Button:GrayscaleAllButtonFrame(show)
    if show then 
	--self:Debug(show);
	end	
	for i = 1, 8, 1 do
        if show then
            BananaBarAllButtons[i].Icon:SetDesaturated();
			BananaBarAllButtons[i].Icon:SetVertexColor(1, 1, 1);
               
            grayscale = true;
        else
            BananaBarAllButtons[i].Icon:SetDesaturated(1);
			BananaBarAllButtons[i].Icon:SetVertexColor(0.5, 0.5, 0.5);
            
            grayscale = false;
        end
    end
end







function BananaBar3Button:UpdateAllButtonBack(show)
    for i = 1, BananaBarButtonNameCounter-1, 1 do
        if show then
            BananaBarAllButtons[i].Buttonback:SetAlpha(0.75);
        else
            BananaBarAllButtons[i].Buttonback:SetAlpha(0);
        end
    end
end

function BananaBar3Button:SetMobName(name)
    if name then
        --self.MobName:SetText(name);
		self.MobName:SetText("");
    else
        self.MobName:SetText("");
    end
end

function CanSetSymbols()
    if GetNumGroupMembers() > 0 then
        if IsRaidOfficer() or IsRaidLeader() then
            return true;
        end
    elseif GetNumGroupMembers() > 0 then
        if IsPartyLeader() then
            return true;
        end
    end
    return false;
end

function BananaBar3Button:SetSelected(value)
	if self.selected == value then
		return;
	end
	self.selected = value;
	if value then
		self.Selected:Show();
		self.Addon:Print(" -> Selected");
	else
		self.Selected:Hide();
	end
end






