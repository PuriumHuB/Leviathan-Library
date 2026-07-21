-- ╔══════════════════════════════════════════════════╗
-- ║       Leviathan UI — DynamicShape Module         ║
-- ║  Modern squircle system, soft outlines, depth    ║
-- ╚══════════════════════════════════════════════════╝

local Creator

local DynamicShapeModule = {
	New             = nil,
	Init            = nil,
	-- Global stroke thickness for all soft-outline shapes (px)
	StrokeThickness = 1.4,
	-- Default outline transparency when SoftOutline = true
	DefaultOutlineTransparency = 0.82,
	-- Default outline ThemeTag colour key
	DefaultOutlineColor = "Outline",

	Shapes = {
		-- ── Circles ──────────────────────────────────────────────
		Circle = {
			Image  = "rbxassetid://111665032676235",
			Rect   = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius = 1024/2,
		},
		CircleOutline = {
			Image  = "rbxassetid://108556680453287",
			Rect   = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius = 1024/2,
		},
		CircleGlass = {
			Image  = "rbxassetid://95600044758841",
			Rect   = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius = 1024/2,
		},

		-- ── Apple Squircles (horizontal stretch) ─────────────────
		SquircleH = {
			Image  = "rbxassetid://125083578015333",
			Rect   = Rect.new(1024/2, 650/2, 1024/2, 650/2),
			Radius = 650/2,
		},
		SquircleHOutline = {
			Image  = "rbxassetid://107043713170567",
			Rect   = Rect.new(1024/2, 650/2, 1024/2, 650/2),
			Radius = 650/2,
		},
		SquircleHGlass = {
			Image  = "rbxassetid://84819521201001",
			Rect   = Rect.new(1024/2, 650/2, 1024/2, 650/2),
			Radius = 650/2,
		},
		["SquircleH-TL-TR"] = {
			Image      = "rbxassetid://90680657206619",
			Rect       = Rect.new(807, 1024/2, 807, 1024/2),
			Radius     = 650/2,
			AutoChange = false,
		},
		["SquircleH-BL-BR"] = {
			Image      = "rbxassetid://99216342056719",
			Rect       = Rect.new(0, 1024/2, 0, 1024/2),
			Radius     = 650/2,
			AutoChange = false,
		},

		-- ── Squircles (vertical stretch) ──────────────────────────
		SquircleV = {
			Image  = "rbxassetid://124965260437653",
			Rect   = Rect.new(650/2, 1024/2, 650/2, 1024/2),
			Radius = 650/2,
		},
		SquircleVOutline = {
			Image  = "rbxassetid://88808835404198",
			Rect   = Rect.new(650/2, 1024/2, 650/2, 1024/2),
			Radius = 650/2,
		},
		SquircleVGlass = {
			Image  = "rbxassetid://124982801466667",
			Rect   = Rect.new(650/2, 1024/2, 650/2, 1024/2),
			Radius = 650/2,
		},

		-- ── Squircles (square / default) ──────────────────────────
		Squircle = {
			Image  = "rbxassetid://89641024074289",
			Rect   = Rect.new(460, 460, 460, 460),
			Radius = 620/2,
		},
		SquircleOutline = {
			Image  = "rbxassetid://74029063732681",
			Rect   = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius = 620/2,
		},
		SquircleGlass = {
			Image  = "rbxassetid://131126436897551",
			Rect   = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius = 620/2,
		},
		["Squircle-TL-TR"] = {
			Image      = "rbxassetid://75712142040725",
			Rect       = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius     = 620/2,
			AutoChange = false,
		},
		["Squircle-BL-BR"] = {
			Image      = "rbxassetid://83676684425544",
			Rect       = Rect.new(1024/2, 0, 1024/2, 0),
			Radius     = 620/2,
			AutoChange = false,
		},

		-- ── Flat square (no rounding) ─────────────────────────────
		["Square"] = {
			Image      = "rbxassetid://82909646051652",
			Rect       = Rect.new(1024/2, 1024/2, 1024/2, 1024/2),
			Radius     = 1024/2,
			AutoChange = false,
		},

		-- ── Leviathan shadow card ─────────────────────────────────
		["Shadow-sm"] = {
			Image      = "rbxassetid://84825982946844",
			Rect       = Rect.new(512, 512, 512, 512),
			Radius     = 512,
			AutoChange = false,
		},

		-- ── Leviathan medium shadow ───────────────────────────────
		["Shadow-md"] = {
			Image      = "rbxassetid://84825982946844",
			Rect       = Rect.new(256, 256, 256, 256),
			Radius     = 512,
			AutoChange = false,
		},
	},
}

-- ─────────────────────────────────────────────────────────────
--  Legacy alias map: old type strings → canonical type strings
--  Keeps every old script working with zero changes.
-- ─────────────────────────────────────────────────────────────
local ShapeFallbacks = {
	["Glass-0.7"]        = "SquircleGlass",
	["Glass-1"]          = "SquircleGlass",
	["Glass-1.4"]        = "SquircleGlass",
	["Squircle-Outline"] = "SquircleOutline",
	["SquircleOutline2"] = "SquircleOutline",
}

-- ─────────────────────────────────────────────────────────────
--  Internal: resolve type string → shape table
-- ─────────────────────────────────────────────────────────────
local function GetShape(T)
	return DynamicShapeModule.Shapes[ShapeFallbacks[T] or T]
		or DynamicShapeModule.Shapes.Circle
end

-- ─────────────────────────────────────────────────────────────
--  Init  — called once by Creator.Init
-- ─────────────────────────────────────────────────────────────
function DynamicShapeModule:Init(CreatorObj)
	Creator = CreatorObj
	return self.New
end

-- ─────────────────────────────────────────────────────────────
--  DynamicShapeModule:New
--
--  Args  (same as original, fully backward-compatible):
--    Radius     number   — corner radius in logical pixels
--    Type       string   — shape key (e.g. "Squircle", "Circle")
--    Properties table    — properties forwarded to Creator.New
--                           + Leviathan extras (see below)
--    Children   table    — child instances
--    IsButton   bool     — use ImageButton instead of ImageLabel
--    IsSlice    bool     — force-disable ScaleType=Slice when false
--
--  Leviathan extra property keys (stripped before Creator.New):
--    SoftOutline          bool   — attach a UIStroke for depth
--    OutlineColor         string — ThemeTag colour key (default "Outline")
--    OutlineTransparency  number — stroke alpha   (default 0.82)
--    OutlineThickness     number — stroke px      (default StrokeThickness)
--
--  Returns:
--    ImageLabel (or ImageButton), Wrapper
-- ─────────────────────────────────────────────────────────────
function DynamicShapeModule:New(Radius, Type, Properties, Children, IsButton, IsSlice)
	-- ── Wrapper state ─────────────────────────────────────────
	local Wrapper = {
		Radius    = Radius or 0,
		Type      = Type   or "Circle",
		GetRadius = nil,
		GetType   = nil,
		SetRadius = nil,
		SetType   = nil,
	}

	-- ── Strip Leviathan-only keys from Properties ─────────────
	local SoftOutline       = Properties and Properties.SoftOutline       or false
	local OutlineColor      = Properties and Properties.OutlineColor      or DynamicShapeModule.DefaultOutlineColor
	local OutlineTransp     = Properties and Properties.OutlineTransparency
	local OutlineThickness  = Properties and Properties.OutlineThickness   or DynamicShapeModule.StrokeThickness
	if OutlineTransp == nil then OutlineTransp = DynamicShapeModule.DefaultOutlineTransparency end

	local SafeProps = {}
	if Properties then
		for k, v in pairs(Properties) do
			if k ~= "SoftOutline"
			and k ~= "OutlineColor"
			and k ~= "OutlineTransparency"
			and k ~= "OutlineThickness" then
				SafeProps[k] = v
			end
		end
	end

	-- Force-set shape infrastructure fields
	SafeProps.Image                  = ""
	SafeProps.BackgroundTransparency = SafeProps.BackgroundTransparency ~= nil and SafeProps.BackgroundTransparency or 1
	SafeProps.SliceScale             = 1

	-- ScaleType: "Slice" unless caller passes IsSlice = false
	if IsSlice ~= false then
		SafeProps.ScaleType = "Slice"
	end

	-- SliceCenter default — will be overwritten by SetType below
	SafeProps.SliceCenter = Rect.new(512, 512, 512, 512)

	-- ── Build the ImageLabel / ImageButton ────────────────────
	local ImageLabel = Creator.New(
		IsButton and "ImageButton" or "ImageLabel",
		SafeProps,
		Children
	)

	-- ── Optional soft-outline UIStroke (Leviathan depth layer) ─
	--    UIStroke with ApplyStrokeMode.Border works cleanly inside
	--    image-sliced frames on Roblox; it does NOT require a
	--    UICorner — the squircle asset clips it naturally.
	local _Stroke = nil
	if SoftOutline then
		_Stroke = Instance.new("UIStroke")
		_Stroke.Name            = "LeviathanOutline"
		_Stroke.Thickness       = OutlineThickness
		_Stroke.Transparency    = OutlineTransp
		_Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		_Stroke.LineJoinMode    = Enum.LineJoinMode.Round
		Creator.AddThemeObject(_Stroke, { Color = OutlineColor }, true)
		_Stroke.Parent = ImageLabel
	end

	-- ── Public Wrapper API ────────────────────────────────────
	function Wrapper:SetRadius(NewRadius)
		Wrapper.Radius = NewRadius
		local shape = GetShape(Wrapper.Type)
		local scale = math.max(NewRadius / shape.Radius, 0.0001)
		ImageLabel.SliceScale = scale
		return Wrapper
	end

	function Wrapper:SetType(NewType)
		Wrapper.Type = NewType
		local Shape = GetShape(NewType)
		ImageLabel.Image       = Shape.Image
		ImageLabel.SliceCenter = Shape.Rect
		Wrapper:SetRadius(Wrapper.Radius)
		return Wrapper
	end

	function Wrapper:GetRadius() return Wrapper.Radius end
	function Wrapper:GetType()   return Wrapper.Type   end

	-- Leviathan extras on Wrapper
	function Wrapper:SetOutlineTransparency(t)
		if _Stroke then _Stroke.Transparency = t end
	end
	function Wrapper:SetOutlineThickness(t)
		if _Stroke then _Stroke.Thickness = t end
	end
	function Wrapper:GetStroke() return _Stroke end

	-- ── Bootstrap shape ───────────────────────────────────────
	Wrapper:SetRadius(Radius or 0)
	Wrapper:SetType(Type or "Circle")

	-- ── Auto aspect-correction on resize ─────────────────────
	--    When the frame is a plain "Squircle" (or variant), swap
	--    to the correct horizontal/vertical atlas automatically
	--    so the corners never look squashed.
	Creator.AddSignal(ImageLabel:GetPropertyChangedSignal("AbsoluteSize"), function()
		local Shape = GetShape(Wrapper.Type)
		if Shape.AutoChange == false then return end
		if not string.find(Wrapper.Type, "Squircle") then return end

		local Glass   = string.find(Wrapper.Type, "Glass")   and "Glass"   or nil
		local Outline = string.find(Wrapper.Type, "Outline") and "Outline" or nil
		local suffix  = Outline or Glass or ""

		local X = math.round(ImageLabel.AbsoluteSize.X / Creator.UIScale)
		local Y = math.round(ImageLabel.AbsoluteSize.Y / Creator.UIScale)
		if X == 0 or Y == 0 then return end

		local effectiveRadius = Wrapper.Radius ~= 0 and Wrapper.Radius or math.min(X, Y) / 2
		local SquircleRatio   = DynamicShapeModule.Shapes.Squircle.Radius / 1024
		local RadiusRatio     = effectiveRadius / math.min(X, Y)

		local newType
		if X > Y then
			newType = RadiusRatio >= SquircleRatio
				and ("SquircleH" .. suffix)
				or  ("Squircle"  .. suffix)
		elseif X < Y then
			newType = RadiusRatio >= SquircleRatio
				and ("SquircleV" .. suffix)
				or  ("Squircle"  .. suffix)
		else
			newType = RadiusRatio >= SquircleRatio
				and ("Circle"   .. suffix)
				or  ("Squircle" .. suffix)
		end

		if newType ~= Wrapper:GetType() then
			Wrapper:SetType(newType)
		end
	end)

	return ImageLabel, Wrapper
end

-- ─────────────────────────────────────────────────────────────
--  Utility: register a custom shape at runtime
--    DynamicShapeModule:RegisterShape("MyShape", {
--        Image = "rbxassetid://...",
--        Rect  = Rect.new(...),
--        Radius = 512,
--    })
-- ─────────────────────────────────────────────────────────────
function DynamicShapeModule:RegisterShape(name, data)
	assert(type(name) == "string", "RegisterShape: name must be string")
	assert(type(data) == "table",  "RegisterShape: data must be table")
	assert(data.Image,  "RegisterShape: data.Image required")
	assert(data.Rect,   "RegisterShape: data.Rect required")
	assert(data.Radius, "RegisterShape: data.Radius required")
	DynamicShapeModule.Shapes[name] = data
end

-- ─────────────────────────────────────────────────────────────
--  Utility: register a legacy alias
--    DynamicShapeModule:RegisterAlias("OldName", "NewName")
-- ─────────────────────────────────────────────────────────────
function DynamicShapeModule:RegisterAlias(oldName, newName)
	ShapeFallbacks[oldName] = newName
end

return DynamicShapeModule
