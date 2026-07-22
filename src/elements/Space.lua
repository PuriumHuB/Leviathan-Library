-- Leviathan UI — Space
-- Fixed: minimum 16px so it's never invisible inside section Gap

local Creator = require("../modules/Creator")
local New     = Creator.New

local Element = {}

function Element:New(Config)
	local cols   = Config.Columns or 1
	local isH    = Config.ParentType == "Group" or Config.ParentType == "HStack"

	-- Base size: 16px minimum (was 7px — too small to survive Gap spacing)
	local baseSize = math.max(16, 8 * cols)

	local MainSpace = New("Frame", {
		Parent                 = Config.Parent,
		Size                   = isH
			and UDim2.new(0, baseSize, 0, 0)
			or  UDim2.new(1, -8, 0, baseSize),
		BackgroundTransparency = 1,
	})

	return "Space", { __type = "Space", ElementFrame = MainSpace }
end

return Element
