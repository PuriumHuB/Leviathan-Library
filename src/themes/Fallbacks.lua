-- Leviathan UI — Fallbacks
-- Every theme key falls back through a logical chain ending at "Button" or "Accent".
-- This means ANY theme that defines just Background/Accent/Button/Text/Icon
-- will automatically colour EVERY component correctly — notifications, toggles,
-- sliders, checkboxes, tabs, section borders, progress bars — all of it.

return function(Creator)
	return {
		-- ── Core ──────────────────────────────────────────────────
		Primary  = "Button",
		White    = Color3.new(1, 1, 1),
		Black    = Color3.new(0, 0, 0),
		SubText  = "Text",

		-- ── Dialog / overlay ──────────────────────────────────────
		Dialog   = "Accent",

		-- ── Backgrounds ───────────────────────────────────────────
		Background                = "Accent",
		BackgroundTransparency    = 0,
		Hover                     = "Text",

		WindowBackground          = "Background",
		WindowShadow              = "Black",

		PanelBackground           = "White",
		PanelBackgroundTransparency = 0.95,
		LabelBackground           = "White",
		LabelBackgroundTransparency = 0.95,

		-- ── Topbar ────────────────────────────────────────────────
		WindowTopbarTitle         = "Text",
		WindowTopbarAuthor        = "Text",
		WindowTopbarIcon          = "Icon",
		WindowTopbarButtonIcon    = "Icon",
		WindowSearchBarBackground = "Dialog",

		-- ── Tabs (sidebar) ────────────────────────────────────────
		TabBackground                   = "Hover",
		TabBackgroundHover              = "Hover",
		TabBackgroundHoverTransparency  = 0.97,
		TabBackgroundActive             = "Hover",
		TabBackgroundActiveTransparency = 0.93,
		TabText                         = "Text",
		TabTextTransparency             = 0.30,
		TabTextTransparencyActive       = 0,
		TabTitle                        = "Text",
		TabIcon                         = "Icon",
		TabIconTransparency             = 0.40,
		TabIconTransparencyActive       = 0.10,
		TabBorderTransparency           = 1,
		TabBorderTransparencyActive     = 0.75,
		TabBorder                       = "White",

		-- ── Element cards ─────────────────────────────────────────
		ElementBackground             = "Text",
		ElementBackgroundTransparency = 0.93,
		ElementTitle                  = "Text",
		ElementDesc                   = "Text",
		ElementIcon                   = "Icon",

		-- ── Popups ────────────────────────────────────────────────
		PopupBackground             = "Background",
		PopupBackgroundTransparency = "BackgroundTransparency",
		PopupTitle                  = "Text",
		PopupContent                = "Text",
		PopupIcon                   = "Icon",

		-- ── Dialogs ───────────────────────────────────────────────
		DialogBackground             = "Dialog",
		DialogBackgroundTransparency = "BackgroundTransparency",
		DialogTitle                  = "Text",
		DialogContent                = "Text",
		DialogIcon                   = "Icon",

		-- ── Toggle — falls back to Button (theme accent) ──────────
		Toggle    = "Button",
		ToggleBar = "White",

		-- ── Checkbox — falls back to Button ───────────────────────
		Checkbox               = "Button",
		CheckboxIcon           = "White",
		CheckboxBorder         = "White",
		CheckboxBorderTransparency = 0.75,

		-- ── Slider — falls back to Button ─────────────────────────
		Slider      = "Button",
		SliderThumb = "White",
		SliderIcon  = "Icon",
		SliderIconFrom = "SliderIcon",
		SliderIconTo   = "SliderIcon",

		-- ── Progress bar — falls back to Button ───────────────────
		ProgressBar             = "Button",
		ProgressBarTrack        = "Text",
		ProgressBarTrackTransparency = 0.90,
		ProgressBarText         = "Text",

		-- ── Tooltips ──────────────────────────────────────────────
		Tooltip              = Color3.fromHex("#4C4C4C"),
		TooltipText          = "White",
		TooltipBackground    = "Background",
		TooltipSecondary     = "Button",
		TooltipSecondaryText = "White",

		-- ── Sections ──────────────────────────────────────────────
		SectionIcon              = "Icon",
		TabSectionIcon           = "Icon",
		SectionExpandIcon        = "Icon",
		SectionExpandIconTransparency = 0.40,

		-- Section Box fill — very subtle tint of Text colour
		SectionBox                      = "Text",
		SectionBoxTransparency          = 0.95,
		SectionBoxBackground            = "Text",
		SectionBoxBackgroundTransparency = 0.97,
		-- BoxBorder glow — inherits Button (theme accent) automatically
		SectionBoxBorder                = "Button",
		SectionBoxBorderTransparency    = 0.72,

		-- ── Search bar ────────────────────────────────────────────
		SearchBarBorder              = "White",
		SearchBarBorderTransparency  = 0.75,

		-- ── Notifications — all fall back to theme accent ─────────
		Notification             = "Background",
		Notification2            = "White",
		Notification2Transparency = 0.92,
		NotificationTitle        = "Text",
		NotificationTitleTransparency = 0,
		NotificationContent      = "Text",
		NotificationContentTransparency = 0.40,
		-- Duration / progress bar uses Button (theme accent colour)
		NotificationDuration     = "Button",
		NotificationDurationTransparency = 0.45,
		NotificationBorder       = "White",
		NotificationBorderTransparency = 0.75,

		-- ── Dropdowns ─────────────────────────────────────────────
		DropdownTabBorder     = "White",
		DropdownTabBackground = "ElementBackground",
		DropdownBackground    = "Background",

		-- ── Viewport ──────────────────────────────────────────────
		ViewportBackground             = "ElementBackground",
		ViewportBackgroundTransparency = "ElementBackgroundTransparency",
	}
end
