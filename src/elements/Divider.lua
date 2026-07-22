-- Leviathan UI — Divider
-- Fixed: taller hit area (20px) so it's never swallowed by section gap
-- The visible line is still 1px but centered in a proper-height frame

local Creator = require("../modules/Creator")
local New     = Creator.New

local Element = {}

function Element:New(Config)
	local isGroup = Config.ParentType == "Group" or Config.ParentType == "HStack"

	-- Visible 1px line with optional title label
	local LineFrame = New("Frame", {
		Size                   = isGroup
			and UDim2.new(0, 1, 1, 0)
			or  UDim2.new(1, 0, 0, 1),
		AnchorPoint            = Vector2.new(0.5, 0.5),
		Position               = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0.82,
		ThemeTag               = { BackgroundColor3 = "Text" },
	})

	-- Optional title centred on the divider line
	local TitleLabel
	if Config.Title and Config.Title ~= "" and not isGroup then
		-- White pill behind the text so line doesn't bleed through
		TitleLabel = New("Frame", {
			AnchorPoint            = Vector2.new(0.5, 0.5),
			Position               = UDim2.new(0.5, 0, 0.5, 0),
			AutomaticSize          = "X",
			Size                   = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = 1,
		}, {
			New("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize          = "XY",
				TextSize               = 12,
				FontFace               = Font.new(Creator.Font, Enum.FontWeight.SemiBold),
				ThemeTag               = { TextColor3 = "Text" },
				TextTransparency       = 0.45,
				Text                   = Config.Title,
			}),
			New("UIPadding", {
				PaddingLeft  = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			}),
		})
		TitleLabel.Parent = LineFrame.Parent  -- placed after, handled below
	end

	-- Container: 20px tall so the Gap layout never crushes it
	local MainDivider = New("Frame", {
		Parent                 = Config.Parent,
		Size                   = isGroup
			and UDim2.new(0, 20, 1, -8)
			or  UDim2.new(1, -8, 0, 20),
		BackgroundTransparency = 1,
		ClipsDescendants       = false,
	}, {
		LineFrame,
		TitleLabel,
	})

	return "Divider", { __type = "Divider", ElementFrame = MainDivider }
end

return Element
