local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()




local b

local d={
New=nil,
Init=nil,

StrokeThickness=1.4,

DefaultOutlineTransparency=0.82,

DefaultOutlineColor="Outline",

Shapes={

Circle={
Image="rbxassetid://111665032676235",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleOutline={
Image="rbxassetid://108556680453287",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleGlass={
Image="rbxassetid://95600044758841",
Rect=Rect.new(512,512,512,512),
Radius=512,
},


SquircleH={
Image="rbxassetid://125083578015333",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHOutline={
Image="rbxassetid://107043713170567",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHGlass={
Image="rbxassetid://84819521201001",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
["SquircleH-TL-TR"]={
Image="rbxassetid://90680657206619",
Rect=Rect.new(807,512,807,512),
Radius=325,
AutoChange=false,
},
["SquircleH-BL-BR"]={
Image="rbxassetid://99216342056719",
Rect=Rect.new(0,512,0,512),
Radius=325,
AutoChange=false,
},


SquircleV={
Image="rbxassetid://124965260437653",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVOutline={
Image="rbxassetid://88808835404198",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVGlass={
Image="rbxassetid://124982801466667",
Rect=Rect.new(325,512,325,512),
Radius=325,
},


Squircle={
Image="rbxassetid://89641024074289",
Rect=Rect.new(460,460,460,460),
Radius=310,
},
SquircleOutline={
Image="rbxassetid://74029063732681",
Rect=Rect.new(512,512,512,512),
Radius=310,
},
SquircleGlass={
Image="rbxassetid://131126436897551",
Rect=Rect.new(512,512,512,512),
Radius=310,
},
["Squircle-TL-TR"]={
Image="rbxassetid://75712142040725",
Rect=Rect.new(512,512,512,512),
Radius=310,
AutoChange=false,
},
["Squircle-BL-BR"]={
Image="rbxassetid://83676684425544",
Rect=Rect.new(512,0,512,0),
Radius=310,
AutoChange=false,
},Square=


{
Image="rbxassetid://82909646051652",
Rect=Rect.new(512,512,512,512),
Radius=512,
AutoChange=false,
},


["Shadow-sm"]={
Image="rbxassetid://84825982946844",
Rect=Rect.new(512,512,512,512),
Radius=512,
AutoChange=false,
},


["Shadow-md"]={
Image="rbxassetid://84825982946844",
Rect=Rect.new(256,256,256,256),
Radius=512,
AutoChange=false,
},
},
}





local e={
["Glass-0.7"]="SquircleGlass",
["Glass-1"]="SquircleGlass",
["Glass-1.4"]="SquircleGlass",
["Squircle-Outline"]="SquircleOutline",SquircleOutline2=
"SquircleOutline",
}




local function GetShape(f)
return d.Shapes[e[f]or f]
or d.Shapes.Circle
end




function d.Init(f,g)
b=g
return f.New
end






















function d.New(f,g,h,i,j,l,m)

local p={
Radius=g or 0,
Type=h or"Circle",
GetRadius=nil,
GetType=nil,
SetRadius=nil,
SetType=nil,
}


local r=i and i.SoftOutline or false
local u=i and i.OutlineColor or d.DefaultOutlineColor
local v=i and i.OutlineTransparency
local x=i and i.OutlineThickness or d.StrokeThickness
if v==nil then v=d.DefaultOutlineTransparency end

local z={}
if i then
for A,B in pairs(i)do
if A~="SoftOutline"
and A~="OutlineColor"
and A~="OutlineTransparency"
and A~="OutlineThickness"then
z[A]=B
end
end
end


z.Image=""
z.BackgroundTransparency=z.BackgroundTransparency~=nil and z.BackgroundTransparency or 1
z.SliceScale=1


if m~=false then
z.ScaleType="Slice"
end


z.SliceCenter=Rect.new(512,512,512,512)


local A=b.New(
l and"ImageButton"or"ImageLabel",
z,
j
)





local B
if r then
B=Instance.new"UIStroke"
B.Name="LeviathanOutline"
B.Thickness=x
B.Transparency=v
B.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
B.LineJoinMode=Enum.LineJoinMode.Round
b.AddThemeObject(B,{Color=u},true)
B.Parent=A
end


function p.SetRadius(C,F)
p.Radius=F
local G=GetShape(p.Type)
local H=math.max(F/G.Radius,0.0001)
A.SliceScale=H
return p
end

function p.SetType(C,F)
p.Type=F
local G=GetShape(F)
A.Image=G.Image
A.SliceCenter=G.Rect
p:SetRadius(p.Radius)
return p
end

function p.GetRadius(C)return p.Radius end
function p.GetType(C)return p.Type end


function p.SetOutlineTransparency(C,F)
if B then B.Transparency=F end
end
function p.SetOutlineThickness(C,F)
if B then B.Thickness=F end
end
function p.GetStroke(C)return B end


p:SetRadius(g or 0)
p:SetType(h or"Circle")





b.AddSignal(A:GetPropertyChangedSignal"AbsoluteSize",function()
local C=GetShape(p.Type)
if C.AutoChange==false then return end
if not string.find(p.Type,"Squircle")then return end

local F=string.find(p.Type,"Glass")and"Glass"or nil
local G=string.find(p.Type,"Outline")and"Outline"or nil
local H=G or F or""

local J=math.round(A.AbsoluteSize.X/b.UIScale)
local L=math.round(A.AbsoluteSize.Y/b.UIScale)
if J==0 or L==0 then return end

local M=p.Radius~=0 and p.Radius or math.min(J,L)/2
local N=d.Shapes.Squircle.Radius/1024
local O=M/math.min(J,L)

local P
if J>L then
P=O>=N
and("SquircleH"..H)
or("Squircle"..H)
elseif J<L then
P=O>=N
and("SquircleV"..H)
or("Squircle"..H)
else
P=O>=N
and("Circle"..H)
or("Squircle"..H)
end

if P~=p:GetType()then
p:SetType(P)
end
end)

return A,p
end









function d.RegisterShape(f,g,h)
assert(type(g)=="string","RegisterShape: name must be string")
assert(type(h)=="table","RegisterShape: data must be table")
assert(h.Image,"RegisterShape: data.Image required")
assert(h.Rect,"RegisterShape: data.Rect required")
assert(h.Radius,"RegisterShape: data.Radius required")
d.Shapes[g]=h
end





function d.RegisterAlias(f,g,h)
e[g]=h
end

return d end function a.b()

local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"ReplicatedStorage":WaitForChild("GetIcons",99999):InvokeServer())

local function parseIconString(e)
if type(e)=="string"then
local f=e:find":"
if f then
local g=e:sub(1,f-1)
local h=e:sub(f+1)
return g,h
end
end
return nil,e
end

function d.AddIcons(e,f)
if type(e)~="string"or type(f)~="table"then
error"AddIcons: packName must be string, iconsData must be table"
return
end

if not d.Icons[e]then
d.Icons[e]={
Icons={},
Spritesheets={}
}
end

for g,h in pairs(f)do
if type(h)=="number"or(type(h)=="string"and h:match"^rbxassetid://")then
local i=h
if type(h)=="number"then
i="rbxassetid://"..tostring(h)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=Vector2.new(0,0),
ImageRectPosition=Vector2.new(0,0),
Parts=nil
}
d.Icons[e].Spritesheets[i]=i

elseif type(h)=="table"then
if h.Image and h.ImageRectSize and h.ImageRectPosition then
local i=h.Image
if type(i)=="number"then
i="rbxassetid://"..tostring(i)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=h.ImageRectSize,
ImageRectPosition=h.ImageRectPosition,
Parts=h.Parts
}

if not d.Icons[e].Spritesheets[i]then
d.Icons[e].Spritesheets[i]=i
end
else
warn("AddIcons: Invalid spritesheet data format for icon '"..g.."'")
end
else
warn("AddIcons: Unsupported data type for icon '"..g.."': "..type(h))
end
end
end

function d.SetIconsType(e)
d.IconsType=e
end

local e
function d.Init(f,g)
d.New=f
d.IconThemeTag=g

e=f
return d
end

function d.Icon(f,g,h)
h=h~=false
local i,j=parseIconString(f)

local l=i or g or d.IconsType
local m=j

local p=d.Icons[l]

if p and p.Icons and p.Icons[m]then
return{
p.Spritesheets[tostring(p.Icons[m].Image)],
p.Icons[m],
}
elseif p and p[m]and string.find(p[m],"rbxassetid://")then
return h and{
p[m],
{ImageRectSize=Vector2.new(0,0),ImageRectPosition=Vector2.new(0,0)}
}or p[m]
end
return nil
end

function d.GetIcon(f,g)
return d.Icon(f,g,false)
end


function d.Icon2(f,g,h)
return d.Icon(f,g,true)
end

function d.Image(f)
local g={
Icon=f.Icon or nil,
Type=f.Type,
Colors=f.Colors or{(d.IconThemeTag or Color3.new(1,1,1)),Color3.new(1,1,1)},
Transparency=f.Transparency or{0,0},
Size=f.Size or UDim2.new(0,24,0,24),

IconFrame=nil,
}

local h={}
local i={}

for j,l in next,g.Colors do
h[j]={
ThemeTag=typeof(l)=="string"and l,
Color=typeof(l)=="Color3"and l,
}
end

for m,p in next,g.Transparency do
i[m]={
ThemeTag=typeof(p)=="string"and p,
Value=typeof(p)=="number"and p,
}
end


local r=d.Icon2(g.Icon,g.Type)
local u=typeof(r)=="string"and string.find(r,'rbxassetid://')

if d.New then
local v=e or d.New



local x=v("ImageLabel",{
Size=g.Size,
BackgroundTransparency=1,
ImageColor3=h[1].Color or nil,
ImageTransparency=i[1].Value or nil,
ThemeTag=h[1].ThemeTag and{
ImageColor3=h[1].ThemeTag,
ImageTransparency=i[1].ThemeTag,
},
Image=u and r or r[1],
ImageRectSize=u and nil or r[2].ImageRectSize,
ImageRectOffset=u and nil or r[2].ImageRectPosition,
})


if not u and r[2].Parts then
for z,A in next,r[2].Parts do
local B=d.Icon(A,g.Type)

v("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ImageColor3=h[1+z].Color or nil,
ImageTransparency=i[1+z].Value or nil,
ThemeTag=h[1+z].ThemeTag and{
ImageColor3=h[1+z].ThemeTag,
ImageTransparency=i[1+z].ThemeTag,
},
Image=B[1],
ImageRectSize=B[2].ImageRectSize,
ImageRectOffset=B[2].ImageRectPosition,
Parent=x,
})
end
end

g.IconFrame=x
else
local v=Instance.new"ImageLabel"
v.Size=g.Size
v.BackgroundTransparency=1
v.ImageColor3=h[1].Color
v.ImageTransparency=i[1].Value or nil
v.Image=u and r or r[1]
v.ImageRectSize=u and nil or r[2].ImageRectSize
v.ImageRectOffset=u and nil or r[2].ImageRectPosition


if not u and r[2].Parts then
for x,z in next,r[2].Parts do
local A=d.Icon(z,g.Type)

local B=Instance.New"ImageLabel"
B.Size=UDim2.new(1,0,1,0)
B.BackgroundTransparency=1
B.ImageColor3=h[1+x].Color
B.ImageTransparency=i[1+x].Value or nil
B.Image=A[1]
B.ImageRectSize=A[2].ImageRectSize
B.ImageRectOffset=A[2].ImageRectPosition
B.Parent=v
end
end

g.IconFrame=v
end


return g
end

return d end function a.c()
return function(b)
return{


Primary="Icon",

White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),

Dialog="Accent",

Background="Accent",
BackgroundTransparency=0,
Hover="Text",

PanelBackground="White",
PanelBackgroundTransparency=0.95,

WindowBackground="Background",

WindowShadow="Black",


WindowTopbarTitle="Text",
WindowTopbarAuthor="Text",
WindowTopbarIcon="Icon",
WindowTopbarButtonIcon="Icon",


WindowSearchBarBackground="Dialog",

TabBackground="Hover",
TabBackgroundHover="Hover",
TabBackgroundHoverTransparency=0.97,
TabBackgroundActive="Hover",
TabBackgroundActiveTransparency=0.93,
TabText="Text",
TabTextTransparency=0.3,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.4,
TabIconTransparencyActive=0.1,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",

ElementBackground="Text",
ElementBackgroundTransparency=0.93,
ElementBackgroundHover=b:AddColor("ElementBackground","#ffffff",0.1),
ElementTitle="Text",
ElementDesc="Text",
ElementIcon="Icon",

PopupBackground="Background",
PopupBackgroundTransparency="BackgroundTransparency",
PopupTitle="Text",
PopupContent="Text",
PopupIcon="Icon",

DialogBackground="Dialog",
DialogBackgroundTransparency="BackgroundTransparency",
DialogTitle="Text",
DialogContent="Text",
DialogIcon="Icon",

Toggle="Button",
ToggleBar="White",

Checkbox="Primary",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=0.75,

SliderIcon="Icon",

Slider="Primary",
SliderThumb="White",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",

ProgressBar="Primary",
ProgressBarTrack="Text",
ProgressBarTrackTransparency=0.9,
ProgressBarText="Text",

Tooltip=Color3.fromHex"4C4C4C",
TooltipText="White",
TooltipSecondary="Primary",
TooltipSecondaryText="White",

TabSectionIcon="Icon",

SectionIcon="Icon",

SectionExpandIcon="Icon",
SectionExpandIconTransparency=0.4,
SectionBox="Text",
SectionBoxTransparency=0.95,
SectionBoxBorder="White",
SectionBoxBorderTransparency=0.75,
SectionBoxBackground="Text",
SectionBoxBackgroundTransparency=0.97,

SearchBarBorder="White",
SearchBarBorderTransparency=0.75,

Notification="Background",
Notification2="White",
Notification2Transparency=0.92,
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=0.4,
NotificationDuration="White",
NotificationDurationTransparency=0.95,
NotificationBorder="White",
NotificationBorderTransparency=0.75,

DropdownTabBorder="White",
DropdownTabBackground="ElementBackground",
DropdownBackground="Background",

LabelBackground="White",
LabelBackgroundTransparency=0.95,

ViewportBackground="ElementBackground",
ViewportBackgroundTransparency="ElementBackgroundTransparency",
}
end end function a.d()







local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"RunService")
local e=b(game:GetService"UserInputService")
local f=b(game:GetService"TweenService")
local g=b(game:GetService"LocalizationService")
local h=b(game:GetService"HttpService")

local i=a.load'a'

local m="https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

local p
if d:IsStudio()or not writefile then
p=a.load'b'
else
p=loadstring(
game.HttpGet and game:HttpGet(m)or h:GetAsync(m)
)()
end

p.SetIconsType"lucide"


local r




local u
u={


LibraryName="Leviathan UI",
Version="1.0.0",


Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Icons=p,
Signals={},
Objects={},
LocalizationObjects={},
UIScale=1,
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
ThemeChangeCallbacks={},
ThemeFallbacks=nil,


Anim={
Instant=0,
Fast=0.10,
Normal=0.20,
Slow=0.35,
Spring=0.45,
},


Ease={
Out=Enum.EasingStyle.Quint,
In=Enum.EasingStyle.Quint,
InOut=Enum.EasingStyle.Quint,
Back=Enum.EasingStyle.Back,
Bounce=Enum.EasingStyle.Bounce,
Sine=Enum.EasingStyle.Sine,
Cubic=Enum.EasingStyle.Cubic,
},


Space={
XS=4,
S=8,
M=12,
L=16,
XL=20,
XXL=28,
XXXL=36,
},


Radius={
XS=6,
S=8,
M=12,
L=16,
XL=20,
Full=999,
},


Type={
DisplayLG=28,
DisplayMD=22,
TitleLG=18,
TitleMD=16,
BodyLG=15,
BodyMD=14,
BodySM=13,
Caption=12,
},


Colors={

Red="#F04040",
Orange="#F07020",
Green="#30C070",
Blue="#4A90E8",
Purple="#8B5CF6",
White="#FFFFFF",
Grey="#6B7280",

Accent="#4F80FF",

Success="#22C55E",
Warning="#F59E0B",
Error="#EF4444",
Info="#3B82F6",

Muted="#9CA3AF",
},


DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
},
},
}




function u.Init(v)
r=v
u.ThemeFallbacks=a.load'c'(u)
u.UIScale=v.UIScale
i:Init(u)
end




function u.AddSignal(v,x)
local z=v:Connect(x)
table.insert(u.Signals,z)
return z
end

function u.DisconnectAll()
for v in next,u.Signals do
local x=table.remove(u.Signals,v)
if x then x:Disconnect()end
end
end




function u.SafeCallback(v,...)
if not v then return end
local x,z=pcall(v,...)
if not x then
if r and r.Window and r.Window.Debug then local
A, B=z:find":%d+: "
warn("[ LeviathanUI DEBUG ] "..tostring(z))
return r:Notify{
Title="DEBUG: Error",
Content=not B and z or z:sub(B+1),
Type="Error",
Duration=8,
}
end
end
end




function u.Gradient(v,x)
if r and r.Gradient then
return r:Gradient(v,x)
end
local z,A={},{}
for B,C in next,v do
local F=tonumber(B)
if F then
F=math.clamp(F/100,0,1)
table.insert(z,ColorSequenceKeypoint.new(F,C.Color))
table.insert(A,NumberSequenceKeypoint.new(F,C.Transparency or 0))
end
end
table.sort(z,function(F,G)return F.Time<G.Time end)
table.sort(A,function(F,G)return F.Time<G.Time end)
if#z<2 then error"ColorSequence requires at least 2 keypoints"end
local F={
Color=ColorSequence.new(z),
Transparency=NumberSequence.new(A),
}
if x then
for G,H in pairs(x)do F[G]=H end
end
return F
end




function u.SetTheme(v)
local x=u.Theme
u.Theme=v
u.UpdateTheme(nil,false)
for z,A in next,u.ThemeChangeCallbacks do
u.SafeCallback(A,v,x)
end
end

function u.AddFontObject(v)
table.insert(u.FontObjects,v)
u.UpdateFont(u.Font)
end

function u.UpdateFont(v)
u.Font=v
for x,z in next,u.FontObjects do
z.FontFace=Font.new(v,z.FontFace.Weight,z.FontFace.Style)
end
end

function u.GetThemeProperty(v,x)
local function getValue(z,A)
local B=A[z]
if B==nil then return nil end
if typeof(B)=="string"and string.sub(B,1,1)=="#"then
return Color3.fromHex(B)
end
if typeof(B)=="Color3"then return B end
if typeof(B)=="number"then return B end
if typeof(B)=="table"and B.Color and B.Transparency then return B end
if typeof(B)=="function"then return B(A)end
return B
end

local z=getValue(v,x)
if z~=nil then
if typeof(z)=="string"and string.sub(z,1,1)~="#"then
local A=u.GetThemeProperty(z,x)
if A~=nil then return A end
else
return z
end
end

local A=u.ThemeFallbacks[v]
if A~=nil then
if typeof(A)=="string"and string.sub(A,1,1)~="#"then
return u.GetThemeProperty(A,x)
else
return getValue(v,{[v]=A})
end
end

z=getValue(v,u.Themes.Dark)
if z~=nil then
if typeof(z)=="string"and string.sub(z,1,1)~="#"then
local B=u.GetThemeProperty(z,u.Themes.Dark)
if B~=nil then return B end
else
return z
end
end

if A~=nil then
if typeof(A)=="string"and string.sub(A,1,1)~="#"then
return u.GetThemeProperty(A,u.Themes.Dark)
else
return getValue(v,{[v]=A})
end
end

return nil
end

function u.AddThemeObject(v,x,z)
if u.Objects[v]then
for A,B in pairs(x)do
u.Objects[v].Properties[A]=B
end
else
u.Objects[v]={Object=v,Properties=x}
end
if not z then
u.UpdateTheme(v,false)
end
return v
end

function u.AddLangObject(v)
local x=u.LocalizationObjects[v]
if not x then return end
u.SetLangForObject(v)
return x.Object
end

function u.UpdateTheme(v,x,z,A,B,C)
local function ApplyTheme(F)
for G,H in pairs(F.Properties or{})do
local J=u.GetThemeProperty(H,u.Theme)
if J~=nil then
if typeof(J)=="Color3"then
local L=F.Object:FindFirstChild"LibraryGradient"
if L then L:Destroy()end
if z then
u.Tween(
F.Object,
A or 0.2,
{[G]=J},
B or Enum.EasingStyle.Quint,
C or Enum.EasingDirection.Out
):Play()
elseif x then
u.Tween(F.Object,0.08,{[G]=J}):Play()
else
F.Object[G]=J
end

elseif typeof(J)=="table"and J.Color and J.Transparency then
F.Object[G]=Color3.new(1,1,1)
local L=F.Object:FindFirstChild"LibraryGradient"
if not L then
L=Instance.new"UIGradient"
L.Name="LibraryGradient"
L.Parent=F.Object
end
L.Color=J.Color
L.Transparency=J.Transparency
for M,N in pairs(J)do
if M~="Color"and M~="Transparency"and L[M]~=nil then
L[M]=N
end
end

elseif typeof(J)=="number"then
if z then
u.Tween(
F.Object,
A or 0.2,
{[G]=J},
B or Enum.EasingStyle.Quint,
C or Enum.EasingDirection.Out
):Play()
elseif x then
u.Tween(F.Object,0.08,{[G]=J}):Play()
else
F.Object[G]=J
end
end
else
local L=F.Object:FindFirstChild"LibraryGradient"
if L then L:Destroy()end
end
end
end

if v then
local F=u.Objects[v]
if F then ApplyTheme(F)end
else
for F,G in pairs(u.Objects)do ApplyTheme(G)end
end
end

function u.SetThemeTag(v,x,z,A,B)
u.AddThemeObject(v,x)
u.UpdateTheme(v,false,true,z,A,B)
end

function u.SetLangForObject(v)
if u.Localization and u.Localization.Enabled then
local x=u.LocalizationObjects[v]
if not x then return end
local z=x.Object
local A=x.TranslationId
local B=u.Localization.Translations[u.Language]
if B and B[A]then
z.Text=B[A]
else
local C=u.Localization
and u.Localization.Translations
and u.Localization.Translations.en
or nil
if C and C[A]then
z.Text=C[A]
else
z.Text="["..A.."]"
end
end
end
end

function u.ChangeTranslationKey(v,x,z)
if u.Localization and u.Localization.Enabled then
local A=string.match(z,"^"..u.Localization.Prefix.."(.+)")
if A then
for B,C in ipairs(u.LocalizationObjects)do
if C.Object==x then
C.TranslationId=A
u.SetLangForObject(B)
return
end
end
table.insert(u.LocalizationObjects,{
TranslationId=A,
Object=x,
})
u.SetLangForObject(#u.LocalizationObjects)
end
end
end

function u.UpdateLang(v)
if v then u.Language=v end
for x=1,#u.LocalizationObjects do
local z=u.LocalizationObjects[x]
if z.Object and z.Object.Parent~=nil then
u.SetLangForObject(x)
else
u.LocalizationObjects[x]=nil
end
end
end

function u.SetLanguage(v)
u.Language=v
u.UpdateLang()
end




function u.Icon(v,x)
return p.Icon2(v,nil,x~=false)
end

function u.AddIcons(v,x)
return p.AddIcons(v,x)
end




function u.New(v,x,z)
local A=Instance.new(v)

for B,C in next,u.DefaultProperties[v]or{}do
A[B]=C
end

for F,G in next,x or{}do
if F~="ThemeTag"then
A[F]=G
end
if u.Localization and u.Localization.Enabled and F=="Text"then
local H=string.match(G,"^"..u.Localization.Prefix.."(.+)")
if H then
local J=#u.LocalizationObjects+1
u.LocalizationObjects[J]={
TranslationId=H,
Object=A,
}
u.SetLangForObject(J)
end
end
end

for H,J in next,z or{}do
if J then J.Parent=A end
end

if x and x.ThemeTag then
u.AddThemeObject(A,x.ThemeTag)
end
if x and x.FontFace then
u.AddFontObject(A)
end

return A
end




function u.Tween(v,x,z,...)
return f:Create(v,TweenInfo.new(x,...),z)
end





function u.SpringTween(v,x,z)
z=z or u.Anim.Spring
return f:Create(
v,
TweenInfo.new(z,Enum.EasingStyle.Spring,Enum.EasingDirection.Out,0,false,0),
x
)
end






function u.QuickTween(v,x,z,A,F)
A=A or Enum.EasingStyle.Quint
F=F or Enum.EasingDirection.Out
f:Create(
v,
TweenInfo.new(x,A,F),
z
):Play()
end




function u.NewRoundFrame(v,x,z,A,F,G)
return i:New(v,x,z,A,F,nil)
end


local v=u.New local x=
u.Tween




function u.SetDraggable(z)
u.CanDraggable=z
end

function u.Drag(z,A,F)
local G=r.GenerateGUID()

local H
local J=false
local L,M
local N

local O={
CanDraggable=true,
}

if not A or typeof(A)~="table"then
A={z}
end

local function update(P)
if not J or not O.CanDraggable then return end
local Q=P.Position-L
u.Tween(z,0.02,{
Position=UDim2.new(
M.X.Scale,M.X.Offset+Q.X,
M.Y.Scale,M.Y.Offset+Q.Y
),
}):Play()
end

for P,Q in pairs(A)do
Q.InputBegan:Connect(function(R)
if not O.CanDraggable or J then return end
if R.UserInputType==Enum.UserInputType.MouseButton1
or R.UserInputType==Enum.UserInputType.Touch
then
if r and r.CurrentInput and r.CurrentInput~=G then return end
r.CurrentInput=G
J=true
N=R
H=Q
L=R.Position
M=z.Position
if F and typeof(F)=="function"then
F(true,H)
end
end
end)
end

e.InputChanged:Connect(function(R)
if not J then return end
if r.CurrentInput and r.CurrentInput~=G then return end
if N.UserInputType==Enum.UserInputType.MouseButton1 then
if R.UserInputType==Enum.UserInputType.MouseMovement then update(R)end
elseif N.UserInputType==Enum.UserInputType.Touch then
if R==N then update(R)end
end
end)

e.InputEnded:Connect(function(R)
if not J or r.CurrentInput~=G then return end
if R==N
or(
N.UserInputType==Enum.UserInputType.MouseButton1
and R.UserInputType==Enum.UserInputType.MouseButton1
)
then
r.CurrentInput=nil
J=false
N=nil
H=nil
if F and typeof(F)=="function"then
F(false,nil)
end
end
end)

function O.Set(R,S)
O.CanDraggable=S
end

return O
end


p.Init(v,"Icon")




function u.SanitizeFilename(z)
local A=z:match"([^/]+)$"or z
A=A:gsub("%.[^%.]+$","")
A=A:gsub("[^%w%-_]","_")
if#A>50 then A=A:sub(1,50)end
return A
end

function u.Image(z,A,F,G,H,J,L,M)
G=G or"Temp"
A=u.SanitizeFilename(A)

local N=v("Frame",{
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
v("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(u.Icon(z)or L)and{
ImageColor3=J and(M or"Icon")or nil,
}or nil,
},{
v("UICorner",{CornerRadius=UDim.new(0,F)}),
}),
})

if u.Icon(z)then
N.ImageLabel:Destroy()
local O=p.Image{
Icon=z,
Size=UDim2.new(1,0,1,0),
Colors={
(J and(M or"Icon")or false),
"Button",
},
}.IconFrame
O.Parent=N

elseif string.find(z,"http")and not string.find(z,"roblox.com")then
local O="LeviathanUI/"..G.."/assets/."..H.."-"..A..".png"
local P=pcall(function()
task.spawn(function()
local P=u.Request
and u.Request{Url=z,Method="GET"}.Body
or{}
if not d:IsStudio()and writefile then
writefile(O,P)
end
local Q,R=pcall(getcustomasset,O)
if Q then
N.ImageLabel.Image=R
else
warn(string.format(
"[ LeviathanUI.Creator ] Failed custom asset '%s': %s",
O,tostring(R)
))
N:Destroy()
end
end)
end)
if not P then
N:Destroy()
end

elseif z==""then
N.Visible=false
else
N.ImageLabel.Image=z
end

return N
end




function u.Color3ToHSB(z)
local A,F,G=z.R,z.G,z.B
local H=math.max(A,F,G)
local J=math.min(A,F,G)
local L=H-J
local M=0
if L~=0 then
if H==A then
M=(F-G)/L%6
elseif H==F then
M=(G-A)/L+2
else
M=(A-F)/L+4
end
M=M*60
end
return{
h=math.floor(M+0.5),
s=H==0 and 0 or L/H,
b=H,
}
end

function u.GetPerceivedBrightness(z)
return 0.299*z.R+0.587*z.G+0.114*z.B
end

function u.GetTextColorForHSB(z,A)
local F=u.Color3ToHSB(z)
if u.GetPerceivedBrightness(z)>(A or 0.5)then
return Color3.fromHSV(F.h/360,0,0.05)
else
return Color3.fromHSV(F.h/360,0,0.98)
end
end

function u.GetAverageColor(z)
local A,F,G=0,0,0
local H=z.Color.Keypoints
for J,L in ipairs(H)do
A=A+L.Value.R
F=F+L.Value.G
G=G+L.Value.B
end
local M=#H
return Color3.new(A/M,F/M,G/M)
end




function u.LerpColor(z,A,F)
F=math.clamp(F,0,1)
return Color3.new(
z.R+(A.R-z.R)*F,
z.G+(A.G-z.G)*F,
z.B+(A.B-z.B)*F
)
end





function u.AdjustBrightness(z,A)
return Color3.new(
math.clamp(z.R+A,0,1),
math.clamp(z.G+A,0,1),
math.clamp(z.B+A,0,1)
)
end




function u.GenerateUniqueID(z)
return h:GenerateGUID(false)
end

function u.OnThemeChange(z,A)
if typeof(A)~="function"then return end
local F=h:GenerateGUID(false)
u.ThemeChangeCallbacks[F]=A
return{
Disconnect=function()
u.ThemeChangeCallbacks[F]=nil
end,
}
end





function u.AddColor(z,A,F,G)
G=math.clamp(G or 1,0,1)
if typeof(F)=="string"then F=Color3.fromHex(F)end
return function(H)
local J
if typeof(A)=="string"and string.sub(A,1,1)~="#"then
J=u.GetThemeProperty(A,H)
elseif typeof(A)=="string"then
J=Color3.fromHex(A)
else
J=A
end
if not J or typeof(J)~="Color3"then return nil end
return Color3.new(
math.clamp(J.R+F.R*G,0,1),
math.clamp(J.G+F.G*G,0,1),
math.clamp(J.B+F.B*G,0,1)
)
end
end






function u.GetElementPosition(z,A,F,G)
if type(F)~="number"or F~=math.floor(F)then
return nil,1
end

local H=#A
if H==0 or F<1 or F>H then
return nil,2
end

local function isDelimiter(J)
if J==nil then return true end
local L=J.__type
return L=="Divider"or L=="Space"or L=="Section"
end

if isDelimiter(A[F])then return nil,3 end

local function calculate(J,L)
if L==1 then return"Squircle"end
if J==1 then
return G and"SquircleH-TL-TR"or"Squircle-TL-TR"
end
if J==L then
return G and"SquircleH-BL-BR"or"Squircle-BL-BR"
end
return"Square"
end

local J=1
local L=0

for M=1,H do
local N=A[M]
if isDelimiter(N)then
if F>=J and F<=M-1 then
local O=F-J+1
return calculate(O,L)
end
J=M+1
L=0
else
L=L+1
end
end

if F>=J and F<=H then
local M=F-J+1
return calculate(M,L)
end

return nil,4
end












function u.HoverEffect(z,A)
A=A or{}
local F=A.HoverTransparency~=nil and A.HoverTransparency or 0.88
local G=A.NormalTransparency~=nil and A.NormalTransparency or 1
local H=A.Duration or u.Anim.Fast
local J=A.Property or"ImageTransparency"

local L=z.MouseEnter:Connect(function()
u.QuickTween(z,H,{[J]=F})
end)
local M=z.MouseLeave:Connect(function()
u.QuickTween(z,H,{[J]=G})
end)

return function()
L:Disconnect()
M:Disconnect()
end
end







function u.PressEffect(z,A,F)
F=F or{}
local G=F.PressScale or 0.97
local H=F.NormalScale or 1.00
local J=F.Duration or u.Anim.Fast


local L=A:FindFirstChildOfClass"UIScale"
if not L then
L=Instance.new"UIScale"
L.Scale=H
L.Parent=A
end

z.MouseButton1Down:Connect(function()
u.QuickTween(L,J,{Scale=G},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
end)
z.MouseButton1Up:Connect(function()
u.QuickTween(L,J*1.5,{Scale=H},
Enum.EasingStyle.Back,Enum.EasingDirection.Out)
end)
z.MouseLeave:Connect(function()
u.QuickTween(L,J,{Scale=H},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
end)
end

return u end function a.e()

local b={}







function b.New(d,e,f)
local g={
Enabled=e.Enabled or false,
Translations=e.Translations or{},
Prefix=e.Prefix or"loc:",
DefaultLanguage=e.DefaultLanguage or"en"
}

f.Localization=g

return g
end



return b end function a.f()




local b=a.load'd'
local d=b.New
local e=b.Tween


local f={
Info={Icon="info",Color=b.Colors.Info,ThemeKey="NotificationInfo"},
Success={Icon="check-circle",Color=b.Colors.Success,ThemeKey="NotificationSuccess"},
Warning={Icon="alert-triangle",Color=b.Colors.Warning,ThemeKey="NotificationWarning"},
Error={Icon="x-circle",Color=b.Colors.Error,ThemeKey="NotificationError"},
}

local g={
UICorner=18,
UIPadding=14,
Holder=nil,
NotificationIndex=0,
Notifications={},

MaxVisible=5,
_ActiveCount=0,
}


function g.Init(h)
local i={Lower=false}

local function getSize()
return i.Lower
and UDim2.new(0,300,1,-56)
or UDim2.new(0,300,1,-156)
end

function i.SetLower(m)
i.Lower=m
i.Frame.Size=getSize()
end

i.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=getSize(),
Parent=h,
BackgroundTransparency=1,
},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29),
}),
})

return i
end


function g.New(h)
local i=g.UIPadding
local m=g.UICorner

local p=h.Type or"Info"
local r=f[p]or f.Info

local u={
Title=h.Title or"Notification",
Content=h.Content or nil,
Icon=h.Icon or r.Icon,
IconThemed=h.IconThemed,
Type=p,
Duration=h.Duration~=nil and h.Duration or 5,
Buttons=h.Buttons or{},
CanClose=h.CanClose~=false,
UIElements={},
Closed=false,
}

g.NotificationIndex=g.NotificationIndex+1
g.Notifications[g.NotificationIndex]=u


local v=d("Frame",{
Size=UDim2.new(0,3,1,-(i*2)),
Position=UDim2.new(0,i/2,0,i),
BackgroundColor3=Color3.fromHex(r.Color),
BackgroundTransparency=0,
},{
d("UICorner",{CornerRadius=UDim.new(0,999)}),
})


local x
do
local z=u.Icon
local A=b.Icon(z)
if A then
x=d("ImageLabel",{
Size=UDim2.new(0,20,0,20),
BackgroundTransparency=1,
Image=A[1],
ImageRectSize=A[2].ImageRectSize,
ImageRectOffset=A[2].ImageRectPosition,
ImageColor3=Color3.fromHex(r.Color),
})
end
end


local z
if u.CanClose then
local A=b.Icon"x"
z=d("ImageButton",{
Image=A and A[1]or"",
ImageRectSize=A and A[2].ImageRectSize or Vector2.new(0,0),
ImageRectOffset=A and A[2].ImageRectPosition or Vector2.new(0,0),
BackgroundTransparency=1,
Size=UDim2.new(0,14,0,14),
Position=UDim2.new(1,-i,0,i),
AnchorPoint=Vector2.new(1,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=0.5,
},{
d("TextButton",{
Size=UDim2.new(1,10,1,10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})
end


local A=b.NewRoundFrame(m,"Squircle",{
Size=UDim2.new(0,0,1,0),
ImageColor3=Color3.fromHex(r.Color),
ImageTransparency=0.65,
})

local F=d("Frame",{
Size=UDim2.new(1,0,0,3),
Position=UDim2.new(0,0,1,-3),
BackgroundTransparency=1,
ClipsDescendants=true,
Name="ProgressClip",
},{
A,
})


local G=u.CanClose and(14+i+6)or 0
local H=x and(28)or 0

local J=d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-(G+H),0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=b.Type.TitleMD,
ThemeTag={TextColor3="NotificationTitle",TextTransparency="NotificationTitleTransparency"},
Text=u.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
})

local L={J}

if u.Content then
table.insert(L,d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=b.Type.BodyMD,
ThemeTag={TextColor3="NotificationContent",TextTransparency="NotificationContentTransparency"},
Text=u.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
}))
end

table.insert(L,d("UIListLayout",{
Padding=UDim.new(0,i/3),
}))

local M=d("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},L)


local N=d("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
x,
M,
d("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Top",
Padding=UDim.new(0,8),
}),
})


local O=b.NewRoundFrame(m,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
ImageTransparency=0.05,
ThemeTag={ImageColor3="Notification"},
},{

b.NewRoundFrame(m,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={ImageColor3="Notification2",ImageTransparency="Notification2Transparency"},
}),

d("ImageLabel",{
Name="Background",
Image=h.Background or"",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=h.BackgroundImageTransparency or 1,
},{
d("UICorner",{CornerRadius=UDim.new(0,m)}),
}),

d("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Name="Inner",
},{
v,
N,
z,
d("UIPadding",{
PaddingTop=UDim.new(0,i),
PaddingLeft=UDim.new(0,i+3+i/2),
PaddingRight=UDim.new(0,i),
PaddingBottom=UDim.new(0,i),
}),
d("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,6),
}),
}),
F,
})

local P=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=h.Holder,
},{
O,
})


function u.Close(Q)
if u.Closed then return end
u.Closed=true
e(P,0.38,{Size=UDim2.new(1,0,0,-8)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(O,0.45,{Position=UDim2.new(2,0,1,0)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(0.45)
P:Destroy()
end


task.spawn(function()
task.wait()
local Q=O.AbsoluteSize.Y
e(P,0.42,{Size=UDim2.new(1,0,0,Q)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(O,0.42,{Position=UDim2.new(0,0,1,0)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if u.Duration and u.Duration>0 then
local R=O.ProgressClip.AbsoluteSize.X
A.Size=UDim2.new(0,R,1,0)
e(A,u.Duration,{Size=UDim2.new(0,0,1,0)},
Enum.EasingStyle.Linear):Play()
task.wait(u.Duration)
u:Close()
end
end)

if z then
b.AddSignal(z.TextButton.MouseButton1Click,function()
u:Close()
end)

z.MouseEnter:Connect(function()
e(z,0.08,{ImageTransparency=0.1}):Play()
end)
z.MouseLeave:Connect(function()
e(z,0.08,{ImageTransparency=0.5}):Play()
end)
end

return u
end

return g end function a.g()












local b=4294967296;local d=b-1;local function c(e,f)local g,h=0,1;while e~=0 or f~=0 do local i,m=e%2,f%2;local p=(i+m)%2;g=g+p*h;e=math.floor(e/2)f=math.floor(f/2)h=h*2 end;return g%b end;local function k(e,f,g,...)local h;if f then e=e%b;f=f%b;h=c(e,f)if g then h=k(h,g,...)end;return h elseif e then return e%b else return 0 end end;local function n(e,f,g,...)local h;if f then e=e%b;f=f%b;h=(e+f-c(e,f))/2;if g then h=n(h,g,...)end;return h elseif e then return e%b else return d end end;local function o(e)return d-e end;local function q(e,f)if f<0 then return lshift(e,-f)end;return math.floor(e%4294967296/2^f)end;local function s(e,f)if f>31 or f<-31 then return 0 end;return q(e%b,f)end;local function lshift(e,f)if f<0 then return s(e,-f)end;return e*2^f%4294967296 end;local function t(e,f)e=e%b;f=f%32;local g=n(e,2^f-1)return s(e,f)+lshift(g,32-f)end;local e={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(f)return string.gsub(f,".",function(g)return string.format("%02x",string.byte(g))end)end;local function y(f,g)local h=""for i=1,g do local m=f%256;h=string.char(m)..h;f=(f-m)/256 end;return h end;local function D(f,g)local h=0;for i=g,g+3 do h=h*256+string.byte(f,i)end;return h end;local function E(f,g)local h=64-(g+9)%64;g=y(8*g,8)f=f.."\128"..string.rep("\0",h)..g;assert(#f%64==0)return f end;local function I(f)f[1]=0x6a09e667;f[2]=0xbb67ae85;f[3]=0x3c6ef372;f[4]=0xa54ff53a;f[5]=0x510e527f;f[6]=0x9b05688c;f[7]=0x1f83d9ab;f[8]=0x5be0cd19;return f end;local function K(f,g,h)local i={}for m=1,16 do i[m]=D(f,g+(m-1)*4)end;for m=17,64 do local p=i[m-15]local r=k(t(p,7),t(p,18),s(p,3))p=i[m-2]i[m]=(i[m-16]+r+i[m-7]+k(t(p,17),t(p,19),s(p,10)))%b end;local m,p,r,u,v,x,z,A=h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]for F=1,64 do local G=k(t(m,2),t(m,13),t(m,22))local H=k(n(m,p),n(m,r),n(p,r))local J=(G+H)%b;local L=k(t(v,6),t(v,11),t(v,25))local M=k(n(v,x),n(o(v),z))local N=(A+L+M+e[F]+i[F])%b;A=z;z=x;x=v;v=(u+N)%b;u=r;r=p;p=m;m=(N+J)%b end;h[1]=(h[1]+m)%b;h[2]=(h[2]+p)%b;h[3]=(h[3]+r)%b;h[4]=(h[4]+u)%b;h[5]=(h[5]+v)%b;h[6]=(h[6]+x)%b;h[7]=(h[7]+z)%b;h[8]=(h[8]+A)%b end;local function Z(f)f=E(f,#f)local g=I{}for h=1,#f,64 do K(f,h,g)end;return w(y(g[1],4)..y(g[2],4)..y(g[3],4)..y(g[4],4)..y(g[5],4)..y(g[6],4)..y(g[7],4)..y(g[8],4))end;local f;local g={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local h={["/"]="/"}for i,m in pairs(g)do h[m]=i end;local p=function(p)return"\\"..(g[p]or string.format("u%04x",p:byte()))end;local r=function(r)return"null"end;local u=function(u,v)local x={}v=v or{}if v[u]then error"circular reference"end;v[u]=true;if rawget(u,1)~=nil or next(u)==nil then local z=0;for A in pairs(u)do if type(A)~="number"then error"invalid table: mixed or invalid key types"end;z=z+1 end;if z~=#u then error"invalid table: sparse array"end;for F,G in ipairs(u)do table.insert(x,f(G,v))end;v[u]=nil;return"["..table.concat(x,",").."]"else for z,A in pairs(u)do if type(z)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(x,f(z,v)..":"..f(A,v))end;v[u]=nil;return"{"..table.concat(x,",").."}"end end;local v=function(v)return'"'..v:gsub('[%z\1-\31\\"]',p)..'"'end;local x=function(x)if x~=x or x<=-math.huge or x>=math.huge then error("unexpected number value '"..tostring(x).."'")end;return string.format("%.14g",x)end;local z={["nil"]=r,table=u,string=v,number=x,boolean=tostring}f=function(A,F)local G=type(A)local H=z[G]if H then return H(A,F)end;error("unexpected type '"..G.."'")end;local A=function(A)return f(A)end;local F;local G=function(...)local G={}for H=1,select("#",...)do G[select(H,...)]=true end;return G end;local H=G(" ","\t","\r","\n")local J=G(" ","\t","\r","\n","]","}",",")local L=G("\\","/",'"',"b","f","n","r","t","u")local M=G("true","false","null")local N={["true"]=true,["false"]=false,null=nil}local O=function(O,P,Q,R)for S=P,#O do if Q[O:sub(S,S)]~=R then return S end end;return#O+1 end;local P=function(P,Q,R)local S=1;local T=1;for U=1,Q-1 do T=T+1;if P:sub(U,U)=="\n"then S=S+1;T=1 end end;error(string.format("%s at line %d col %d",R,S,T))end;local Q=function(Q)local R=math.floor;if Q<=0x7f then return string.char(Q)elseif Q<=0x7ff then return string.char(R(Q/64)+192,Q%64+128)elseif Q<=0xffff then return string.char(R(Q/4096)+224,R(Q%4096/64)+128,Q%64+128)elseif Q<=0x10ffff then return string.char(R(Q/262144)+240,R(Q%262144/4096)+128,R(Q%4096/64)+128,Q%64+128)end;error(string.format("invalid unicode codepoint '%x'",Q))end;local R=function(R)local S=tonumber(R:sub(1,4),16)local T=tonumber(R:sub(7,10),16)if T then return Q((S-0xd800)*0x400+T-0xdc00+0x10000)else return Q(S)end end;local S=function(S,T)local U=""local V=T+1;local W=V;while V<=#S do local X=S:byte(V)if X<32 then P(S,V,"control character in string")elseif X==92 then U=U..S:sub(W,V-1)V=V+1;local Y=S:sub(V,V)if Y=="u"then local _=S:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",V+1)or S:match("^%x%x%x%x",V+1)or P(S,V-1,"invalid unicode escape in string")U=U..R(_)V=V+#_ else if not L[Y]then P(S,V-1,"invalid escape char '"..Y.."' in string")end;U=U..h[Y]end;W=V+1 elseif X==34 then U=U..S:sub(W,V-1)return U,V+1 end;V=V+1 end;P(S,T,"expected closing quote for string")end;local T=function(T,U)local V=O(T,U,J)local W=T:sub(U,V-1)local X=tonumber(W)if not X then P(T,U,"invalid number '"..W.."'")end;return X,V end;local U=function(U,V)local W=O(U,V,J)local X=U:sub(V,W-1)if not M[X]then P(U,V,"invalid literal '"..X.."'")end;return N[X],W end;local aa=function(V,W)local X={}local Y=1;W=W+1;while 1 do local _;W=O(V,W,H,true)if V:sub(W,W)=="]"then W=W+1;break end;_,W=F(V,W)X[Y]=_;Y=Y+1;W=O(V,W,H,true)local aa=V:sub(W,W)W=W+1;if aa=="]"then break end;if aa~=","then P(V,W,"expected ']' or ','")end end;return X,W end;local ab=function(V,W)local X={}W=W+1;while 1 do local Y,_;W=O(V,W,H,true)if V:sub(W,W)=="}"then W=W+1;break end;if V:sub(W,W)~='"'then P(V,W,"expected string for key")end;Y,W=F(V,W)W=O(V,W,H,true)if V:sub(W,W)~=":"then P(V,W,"expected ':' after key")end;W=O(V,W+1,H,true)_,W=F(V,W)X[Y]=_;W=O(V,W,H,true)local ab=V:sub(W,W)W=W+1;if ab=="}"then break end;if ab~=","then P(V,W,"expected '}' or ','")end end;return X,W end;local V={['"']=S,["0"]=T,["1"]=T,["2"]=T,["3"]=T,["4"]=T,["5"]=T,["6"]=T,["7"]=T,["8"]=T,["9"]=T,["-"]=T,t=U,f=U,n=U,["["]=aa,["{"]=ab}F=function(W,X)local Y=W:sub(X,X)local _=V[Y]if _ then return _(W,X)end;P(W,X,"unexpected character '"..Y.."'")end;local W=function(W)if type(W)~="string"then error("expected argument of type string, got "..type(W))end;local X,Y=F(W,O(W,1,H,true))Y=O(W,Y,H,true)if Y<=#W then P(W,Y,"trailing garbage")end;return X end;
local X,Y,_=A,W,Z;





local ac={}

local ad=(cloneref or clonereference or function(ad)return ad end)


function ac.New(ae,af)

local ag=ae;
local ah=af;
local ai=true;


local aj=function(aj)end;


repeat task.wait(1)until game:IsLoaded();


local ak=false;
local al,am,an,ao,ap,aq,ar,as,at=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return ad(game:GetService"Players").LocalPlayer.UserId end
local au,av="",0;


local aw="https://api.platoboost.app";
local ax=am{
Url=aw.."/public/connectivity",
Method="GET"
};
if ax.StatusCode~=200 and ax.StatusCode~=429 then
aw="https://api.platoboost.net";
end


function cacheLink()
if av+(600)<aq()then
local ay=am{
Url=aw.."/public/start",
Method="POST",
Body=X{
service=ag,
identifier=_(at())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if ay.StatusCode==200 then
local az=Y(ay.Body);

if az.success==true then
au=az.data.url;
av=aq();
return true,au
else
aj(az.message);
return false,az.message
end
elseif ay.StatusCode==429 then
local az="you are being rate limited, please wait 20 seconds and try again.";
aj(az);
return false,az
end

local az="Failed to cache link.";
aj(az);
return false,az
else
return true,au
end
end

cacheLink();


local ay=function()
local ay=""
for az=1,16 do
ay=ay..an(as(ar()*(26))+97)
end
return ay
end


for az=1,5 do
local aA=ay();
task.wait(0.2)
if ay()==aA then
local aB="platoboost nonce error.";
aj(aB);
error(aB);
end
end


local az=function()
local az,aA=cacheLink();

if az then
al(aA);
end
end


local aA=function(aA)
local aB=ay();
local aC=aw.."/public/redeem/"..ao(ag);

local aD={
identifier=_(at()),
key=aA
}

if ai then
aD.nonce=aB;
end

local aE=am{
Url=aC,
Method="POST",
Body=X(aD),
Headers={
["Content-Type"]="application/json"
}
};

if aE.StatusCode==200 then
local aF=Y(aE.Body);

if aF.success==true then
if aF.data.valid==true then
if ai then
if aF.data.hash==_("true".."-"..aB.."-"..ah)then
return true
else
aj"failed to verify integrity.";
return false
end
else
return true
end
else
aj"key is invalid.";
return false
end
else
if ap(aF.message,1,27)=="unique constraint violation"then
aj"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
aj(aF.message);
return false
end
end
elseif aE.StatusCode==429 then
aj"you are being rate limited, please wait 20 seconds and try again.";
return false
else
aj"server returned an invalid status code, please try again later.";
return false
end
end


local aB=function(aB)
if ak==true then
return false,("A request is already being sent, please slow down.")
else
ak=true;
end

local aC=ay();
local aD=aw.."/public/whitelist/"..ao(ag).."?identifier=".._(at()).."&key="..aB;

if ai then
aD=aD.."&nonce="..aC;
end

local aE=am{
Url=aD,
Method="GET",
};

ak=false;

if aE.StatusCode==200 then
local aF=Y(aE.Body);

if aF.success==true then
if aF.data.valid==true then
if ai then
if aF.data.hash==_("true".."-"..aC.."-"..ah)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if ap(aB,1,4)=="KEY_"then
return true,aA(aB)
else
return false,("Key is invalid.")
end
end
else
return false,(aF.message)
end
elseif aE.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local aC=function(aC)
local aD=ay();
local aE=aw.."/public/flag/"..ao(ag).."?name="..aC;

if ai then
aE=aE.."&nonce="..aD;
end

local aF=am{
Url=aE,
Method="GET",
};

if aF.StatusCode==200 then
local aG=Y(aF.Body);

if aG.success==true then
if ai then
if aG.data.hash==_(ao(aG.data.value).."-"..aD.."-"..ah)then
return aG.data.value
else
aj"failed to verify integrity.";
return nil
end
else
return aG.data.value
end
else
aj(aG.message);
return nil
end
else
return nil
end
end


return{
Verify=aB,
GetFlag=aC,
Copy=az,
}
end


return ac end function a.h()






local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ab=aa(game:GetService"HttpService")
local ac={}

function ac.New(ad)
local ae=gethwid or function()
return aa(game:GetService"Players").LocalPlayer.UserId
end
local af,ag=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ah)
local ai="https://api.pandauth.com/api/v1/keys/validate"

local aj={
ServiceID=ad,
HWID=tostring(ae()),
Key=tostring(ah),
}

local ak=ab:JSONEncode(aj)
local al,am=pcall(function()
return af{
Url=ai,
Method="POST",
Headers={
["User-Agent"]="Roblox/Exploit",
["Content-Type"]="application/json",
},
Body=ak,
}
end)

if al and am then
if am.Success then
local an,ao=pcall(function()
return ab:JSONDecode(am.Body)
end)

if an and ao then
if ao.Authenticated_Status and ao.Authenticated_Status=="Success"then
return true,"Authenticated"
else
local ap=ao.Note or"Unknown reason"
return false,"Authentication failed: "..ap
end
else
return false,"JSON decode error"
end
else
warn(
" HTTP request was not successful. Code: "
..tostring(am.StatusCode)
.." Message: "
..am.StatusMessage
)
return false,"HTTP request failed: "..am.StatusMessage
end
else
return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://new.pandadevelopment.net/getkey/"..tostring(ad).."?hwid="..tostring(ae())
end

function CopyLink()
return ag(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return ac end function a.i()







local aa={}

function aa.New(ab,ac)
local ad="https://sdkapi-public.luarmor.net/library.lua"

local ae=loadstring(game.HttpGet and game:HttpGet(ad)or HttpService:GetAsync(ad))()
local af=setclipboard or toclipboard

ae.script_id=ab

function ValidateKey(ag)
local ah=ae.check_key(ag)


if ah.code=="KEY_VALID"then
return true,"Whitelisted!"
elseif ah.code=="KEY_HWID_LOCKED"then
return false,"Key linked to a different HWID. Please reset it using our bot"
elseif ah.code=="KEY_INCORRECT"then
return false,"Key is wrong or deleted!"
else
return false,"Key check failed:"..ah.message.." Code: "..ah.code
end
end

function CopyLink()
af(tostring(ac))
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return aa end function a.j()









local aa={}

function aa.New(ab,ac,ad)
JunkieProtected.API_KEY=ac
JunkieProtected.PROVIDER=ad
JunkieProtected.SERVICE_ID=ab

local function ValidateKey(ae)
if not ae or ae==""then
print"No key provided!"

return false,"No key provided. Please get a key."
end

local af=JunkieProtected.IsKeylessMode()
if af and af.keyless_mode then
print"Keyless mode enabled. Starting script..."
return true,"Keyless mode enabled. Starting script..."
end

local ag=JunkieProtected.ValidateKey{Key=ae}
if ag=="valid"then
print"Key is valid! Starting script..."
load()
if _G.JD_IsPremium then
print"Premium user detected!"
else
print"Standard user"
end

return true,"Key is valid!"
else
local ah=JunkieProtected.GetKeyLink()
print"Invalid key!"

return false,"Invalid key. Get one from:"..ah
end
end

local function copyLink()
local ae=JunkieProtected.GetKeyLink()

if setclipboard then
setclipboard(ae)
end
end
return{
Verify=ValidateKey,
Copy=copyLink
}
end

return aa end function a.k()



return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},

New=a.load'g'.New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},

New=a.load'h'.New
},
luarmor={
Name="Luarmor",
Icon="rbxassetid://130918283130165",
Args={"ScriptId","Discord"},

New=a.load'i'.New
},
junkiedevelopment={
Name="Junkie Development",
Icon="rbxassetid://106310347705078",
Args={"ServiceId","ApiKey","Provider"},

New=a.load'j'.New
},


}end function a.l()





local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween













local ae={
Primary={bg="Button",text=nil,textFixed=Color3.new(1,1,1)},
Secondary={bg=nil,text="Text",textFixed=nil},
White={bg=nil,text=nil,textFixed=Color3.new(0,0,0)},
Danger={bg=nil,text=nil,textFixed=Color3.new(1,1,1)},
Success={bg=nil,text=nil,textFixed=Color3.new(1,1,1)},
}

function aa.New(af,ag,ah,ai,aj,ak,al,am)
ai=ai or"Primary"
local an=am or(al and 999 or 10)


local ao
if ai=="Danger"then ao=Color3.fromHex(ab.Colors.Error)end
if ai=="Success"then ao=Color3.fromHex(ab.Colors.Success)end
if ai=="White"then ao=Color3.new(1,1,1)end


local ap
if ag and ag~=""then
local aq=ab.Icon(ag)
if aq then
ap=ac("ImageLabel",{
Image=aq[1],
ImageRectSize=aq[2].ImageRectSize,
ImageRectOffset=aq[2].ImageRectPosition,
Size=UDim2.new(0,16,0,16),
BackgroundTransparency=1,
ImageColor3=ai=="White"and Color3.new(0,0,0)or nil,
ThemeTag=ai~="White"and{ImageColor3="Icon"}or nil,
})
end
end


local aq=ac("Frame",{
Size=UDim2.new(0,16,0,16),
BackgroundTransparency=1,
Visible=false,
Name="Spinner",
},{
ac("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image="rbxassetid://4965945816",
ThemeTag={ImageColor3=ai=="Primary"and"White"or"Text"},
}),
})


local ar=ae[ai]or ae.Primary
local as=ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=af or"Button",
ThemeTag=ar.text and{TextColor3=ar.text}or nil,
TextColor3=ar.textFixed or nil,
AutomaticSize="XY",
TextSize=ab.Type.TitleMD,
Name="Label",
})


local at=ab.NewRoundFrame(an,"Squircle",{
Name="Squircle",
Size=UDim2.new(1,0,1,0),
ThemeTag=ar.bg and{ImageColor3=ar.bg}or nil,
ImageColor3=ao,
ImageTransparency=(ai=="Primary"or ao)and 0
or ai=="Secondary"and 0.92
or 0,
})


local au=ab.NewRoundFrame(an,"Squircle",{
Name="HoverLayer",
Size=UDim2.new(1,0,1,0),
ImageColor3=ai=="White"and Color3.new(0,0,0)or Color3.new(1,1,1),
ImageTransparency=1,
})


local av=ab.NewRoundFrame(an,"SquircleGlass",{
Name="Outline",
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={ImageColor3="White"},
ImageTransparency=ai=="Primary"and 0.82 or 0.92,
})


local aw=ab.NewRoundFrame(an,"Squircle",{
Name="Frame",
Size=UDim2.new(1,0,1,0),
ThemeTag=ar.text and{ImageColor3=ar.text}or nil,
ImageTransparency=1,
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,14),
PaddingRight=UDim.new(0,14),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,7),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
ap,
aq,
as,
})


local ax=ac("UIScale",{Scale=1,Name="BtnScale"})

local ay=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=aj,
BackgroundTransparency=1,
Name="LevButton",
},{
at,
au,
av,
aw,
ax,
})


local az=false
local aA=false

local function setInteractable(aB)
ay.Active=aB
end
setInteractable(true)


ab.AddSignal(ay.MouseEnter,function()
if aA or az then return end
ad(au,ab.Anim.Fast,{ImageTransparency=0.90}):Play()
end)
ab.AddSignal(ay.MouseLeave,function()
ad(au,ab.Anim.Fast,{ImageTransparency=1}):Play()
ad(ax,ab.Anim.Fast,{Scale=1}):Play()
end)
ab.AddSignal(ay.MouseButton1Down,function()
if aA or az then return end
ad(ax,ab.Anim.Fast,{Scale=0.96},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
ab.AddSignal(ay.MouseButton1Up,function()
ab.SpringTween(ax,{Scale=1},0.30):Play()
end)

ab.AddSignal(ay.MouseButton1Click,function()
if aA or az then return end
if ak then ak:Close()()end
if ah then ab.SafeCallback(ah)end
end)


local aB={}

function aB.SetLoading(aC,aD)
az=aD
aq.Visible=aD
if ap then ap.Visible=not aD end
as.TextTransparency=aD and 0.5 or 0
setInteractable(not aD and not aA)
if aD then

local aE
aE=game:GetService"RunService".Heartbeat:Connect(function(aF)
if not aD or not aq.Parent then aE:Disconnect()return end
aq.Spinner.Rotation=(aq.Spinner.Rotation+aF*220)%360
end)
end
end

function aB.SetDisabled(aC,aD)
aA=aD
ad(at,ab.Anim.Normal,{ImageTransparency=aD and 0.55 or
((ai=="Primary"or ao)and 0 or ai=="Secondary"and 0.92 or 0)}):Play()
ad(as,ab.Anim.Normal,{TextTransparency=aD and 0.5 or 0}):Play()
setInteractable(not aD and not az)
end

function aB.SetTitle(aC,aD)
as.Text=aD
end

ay._API=aB
return ay
end

return aa end function a.m()

local aa={}

local ab=a.load'd'
local ac=ab.New local ad=
ab.Tween

function aa.New(ae,af,ag,ah,ai,aj,ak,al,am)
ah=ah or"Input"
local an=ak or 10
local ao
if af and af~=""then
ao=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local ap=ah=="Textarea"

local aq=ac("TextBox",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ao and-29 or 0,1,0),
PlaceholderText=ae,
ClearTextOnFocus=al or false,
ClipsDescendants=true,
TextWrapped=ap,
MultiLine=ap,
TextXAlignment="Left",
TextYAlignment=ah~="Textarea"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local ar=ac("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(an,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not am and ab.NewRoundFrame(an-1,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
})or nil,
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingTop=UDim.new(0,ah~="Textarea"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ah~="Textarea"and 0 or 12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ah~="Textarea"and"Center"or"Top",
HorizontalAlignment="Left",
}),
ao,
aq,
}),
}),
})










if aj then
ab.AddSignal(aq:GetPropertyChangedSignal"Text",function()
if ai then
ab.SafeCallback(ai,aq.Text)
end
end)
else
ab.AddSignal(aq.FocusLost,function()
if ai then
ab.SafeCallback(ai,aq.Text)
end
end)
end

return ar
end

return aa end function a.n()





local aa=a.load'd'
local ab=aa.New
local ac=aa.Tween

local ad=(cloneref or clonereference or function(ad)return ad end)
local ae=ad(game:GetService"UserInputService")

local af={
Holder=nil,
Parent=nil,
}

function af.Create(ag,ah,ai,aj,ak)
local al={
UICorner=ag and 26 or 28,
UIPadding=ag and 0 or 12,

Window=ai,
WindUI=aj,

UIElements={},
_ESCConn=nil,
}

ah=ah or"Dialog"


if not ag then
al.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=af.Parent
or(ai and ai.UIElements and ai.UIElements.Main and ai.UIElements.Main.Main),
},{
ab("UICorner",{CornerRadius=UDim.new(0,ai.UICorner)}),
})
end


local am=ab("ImageLabel",{
Name="Blur",
Image="rbxassetid://8992230677",
ThemeTag={ImageColor3="WindowShadow"},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
})


al.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={BackgroundColor3=ah.."Background"},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,al.UIPadding),
PaddingLeft=UDim.new(0,al.UIPadding),
PaddingRight=UDim.new(0,al.UIPadding),
PaddingBottom=UDim.new(0,al.UIPadding),
}),
})


al.UIElements.MainContainer=aa.NewRoundFrame(al.UICorner,"Squircle",{
Visible=false,
ImageTransparency=ag and 0.15 or 0,
Parent=ak or(not ag and al.UIElements.FullScreen)or nil,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3=ah.."Background",
ImageTransparency=ah.."BackgroundTransparency",
},
ZIndex=9999,
},{
am,
al.UIElements.Main,

ab("UIScale",{Scale=0.92,Name="DialogScale"}),
})


function al.Open(an)
if not ag then
al.UIElements.FullScreen.Visible=true
al.UIElements.FullScreen.Active=true
end

al.UIElements.MainContainer.Visible=true

if not ag then
ac(al.UIElements.FullScreen,0.18,
{BackgroundTransparency=0.55}):Play()
end


al.UIElements.MainContainer.ImageTransparency=1
ac(al.UIElements.MainContainer,0.18,
{ImageTransparency=ag and 0.15 or 0}):Play()
aa.SpringTween(
al.UIElements.MainContainer.DialogScale,
{Scale=1},0.38
):Play()

task.delay(0.06,function()
al.UIElements.Main.Visible=true
end)


if al._ESCConn then al._ESCConn:Disconnect()end
al._ESCConn=ae.InputBegan:Connect(function(ao,ap)
if ap then return end
if ao.KeyCode==Enum.KeyCode.Escape then
al:Close()
end
end)
end


function al.Close(an)
if al._ESCConn then
al._ESCConn:Disconnect()
al._ESCConn=nil
end

al.UIElements.Main.Visible=false


aa.SpringTween(
al.UIElements.MainContainer.DialogScale,
{Scale=0.92},0.22
):Play()
ac(al.UIElements.MainContainer,0.18,
{ImageTransparency=1}):Play()

if not ag then
ac(al.UIElements.FullScreen,0.18,
{BackgroundTransparency=1}):Play()
al.UIElements.FullScreen.Active=false
end

task.delay(0.22,function()
if not ag then
al.UIElements.FullScreen.Visible=false
al.UIElements.FullScreen:Destroy()
else
al.UIElements.MainContainer:Destroy()
end
end)

return function()end
end

return al
end

return af end function a.o()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=a.load'l'.New
local af=a.load'm'.New

function aa.new(ag,ah,ai,aj)
local ak=a.load'n'
local al=ak.Create(true,"Popup",ag.Window,ag.WindUI,ag.WindUI.ScreenGui.KeySystem)

local am={}

local an

local ao=(ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Width)or 200

local ap=430
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
ap=430+(ao/2)
end

al.UIElements.Main.AutomaticSize="Y"
al.UIElements.Main.Size=UDim2.new(0,ap,0,0)

local aq

if ag.Icon then
aq=
ab.Image(ag.Icon,ag.Title..":"..ag.Icon,0,"Temp","KeySystem",ag.IconThemed)
aq.Size=UDim2.new(0,24,0,24)
aq.LayoutOrder=-1
end

local ar=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ag.KeySystem.Title or ag.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20,
})

local as=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16,
})

local at=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aq,
ar,
})

local au=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





at,
as,
})

local av=af("Enter Key","key",nil,"Input",function(av)
an=av
end)

local aw
if ag.KeySystem.Note and ag.KeySystem.Note~=""then
aw=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.KeySystem.Note,
TextSize=18,
TextTransparency=0.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ax=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
}),
}),
})

local ay
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
local az
if ag.KeySystem.Thumbnail.Title then
az=ac("TextLabel",{
Text=ag.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ay=ac("ImageLabel",{
Image=ag.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ao,1,-12),
Position=UDim2.new(0,6,0,6),
Parent=al.UIElements.Main,
ScaleType="Crop",
},{
az,
ac("UICorner",{
CornerRadius=UDim.new(0,20),
}),
})
end

ac("Frame",{

Size=UDim2.new(1,ay and-ao or 0,1,0),
Position=UDim2.new(0,ay and ao or 0,0,0),
BackgroundTransparency=1,
Parent=al.UIElements.Main,
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
au,
aw,
av,
ax,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
}),
}),
})





local az=ae("Exit","log-out",function()
al:Close()()
end,"Tertiary",ax.Frame)

if ay then
az.Parent=ay
az.Size=UDim2.new(0,0,0,42)
az.Position=UDim2.new(0,10,1,-10)
az.AnchorPoint=Vector2.new(0,1)
end

if ag.KeySystem.URL then
ae("Get key","key",function()
setclipboard(ag.KeySystem.URL)
end,"Secondary",ax.Frame)
end

if ag.KeySystem.API then








local aA=240
local aB=false
local aC=ae("Get key","key",nil,"Secondary",ax.Frame)

local aD=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
})

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=aC.Frame,
},{
aD,
ac("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
}),
})

local aE=ab.Image("chevron-down","chevron-down",0,"Temp","KeySystem",true)

aE.Size=UDim2.new(1,0,1,0)

ac("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=aC.Frame,
BackgroundTransparency=1,
},{
aE,
})

local aF=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Background",
},
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
}),
})

local aG=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,aA,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=aC,
Position=UDim2.new(1,0,1,15),
},{
aF,
})

ac("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=aF,
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
})

for b,d in next,ag.KeySystem.API do
local f=ag.WindUI.Services[d.Type]
if f then
local g={}
for h,i in next,f.Args do
table.insert(g,d[i])
end

local m=f.New(table.unpack(g))
m.Type=d.Type
table.insert(am,m)

local p=ab.Image(
d.Icon or f.Icon or Icons[d.Type]or"user",
d.Icon or f.Icon or Icons[d.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
p.Size=UDim2.new(0,24,0,24)

local r=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=aF,
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,10),
VerticalAlignment="Center",
}),
p,
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,0,0),
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ac("TextLabel",{
Text=d.Title or f.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
}),
ac("TextLabel",{
Text=d.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=d.Desc and true or false,
TextXAlignment="Left",
}),
}),
},true)

ab.AddSignal(r.MouseEnter,function()
ad(r,0.08,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(r.InputEnded,function()
ad(r,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(r.MouseButton1Click,function()
m.Copy()
ag.WindUI:Notify{
Title="Key System",
Content="Key link copied to clipboard.",
Image="key",
}
end)
end
end

ab.AddSignal(aC.MouseButton1Click,function()
if not aB then
ad(
aG,
0.3,
{Size=UDim2.new(0,aA,0,aF.AbsoluteSize.Y+1)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(aE,0.3,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ad(
aG,
0.25,
{Size=UDim2.new(0,aA,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(aE,0.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
aB=not aB
end)
end

local function handleSuccess(aA)
al:Close()()
writefile((ag.Folder or"Temp").."/"..ah..".key",tostring(aA))
task.wait(0.4)
ai(true)
end

local aA=ae("Submit","arrow-right",function()
local aA=tostring(an or"empty")local aB=
ag.Folder or ag.Title

if ag.KeySystem.KeyValidator then
local aC=ag.KeySystem.KeyValidator(aA)

if aC then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
al:Close()()
task.wait(0.4)
ai(true)
end
else
ag.WindUI:Notify{
Title="Key System. Error",
Content="Invalid key.",
Icon="triangle-alert",
}
end
elseif not ag.KeySystem.API then
local aC=type(ag.KeySystem.Key)=="table"and table.find(ag.KeySystem.Key,aA)
or ag.KeySystem.Key==aA

if aC then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
al:Close()()
task.wait(0.4)
ai(true)
end
end
else
local aC,aD
for aE,aF in next,am do
local aG,b=aF.Verify(aA)
if aG then
aC,aD=true,b
break
end
aD=b
end

if aC then
handleSuccess(aA)
else
ag.WindUI:Notify{
Title="Key System. Error",
Content=aD,
Icon="triangle-alert",
}
end
end
end,"Primary",ax)

aA.AnchorPoint=Vector2.new(1,0.5)
aA.Position=UDim2.new(1,0,0.5,0)










al:Open()
end

return aa end function a.p()




local aa=(cloneref or clonereference or function(aa)return aa end)


local function map(ab,ac,ad,ae,af)
return(ab-ac)*(af-ae)/(ad-ac)+ae
end

local function viewportPointToWorld(ab,ac)
local ad=aa(game:GetService"Workspace").CurrentCamera:ScreenPointToRay(ab.X,ab.Y)
return ad.Origin+ad.Direction*ac
end

local function getOffset()
local ab=aa(game:GetService"Workspace").CurrentCamera.ViewportSize.Y
return map(ab,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}end function a.q()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=a.load'd'
local ac=ab.New


local ad,ae=unpack(a.load'p')
local af=Instance.new("Folder",aa(game:GetService"Workspace").CurrentCamera)


local function createAcrylic()
local ag=ac("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ac("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
}),
})

return ag
end


local function createAcrylicBlur(ag)
local ah={}

ag=ag or 0.001
local ai={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local aj=createAcrylic()
aj.Parent=af

local function updatePositions(ak,al)
ai.topLeft=al
ai.topRight=al+Vector2.new(ak.X,0)
ai.bottomRight=al+ak
end

local function render()
local ak=aa(game:GetService"Workspace").CurrentCamera
if ak then
ak=ak.CFrame
end
local al=ak
if not al then
al=CFrame.new()
end

local am=al
local an=ai.topLeft
local ao=ai.topRight
local ap=ai.bottomRight

local aq=ad(an,ag)
local ar=ad(ao,ag)
local as=ad(ap,ag)

local at=(ar-aq).Magnitude
local au=(ar-as).Magnitude

aj.CFrame=
CFrame.fromMatrix((aq+as)/2,am.XVector,am.YVector,am.ZVector)
aj.Mesh.Scale=Vector3.new(at,au,0)
end

local function onChange(ak)
local al=ae()
local am=ak.AbsoluteSize-Vector2.new(al,al)
local an=ak.AbsolutePosition+Vector2.new(al/2,al/2)

updatePositions(am,an)
task.spawn(render)
end

local function renderOnChange()
local ak=aa(game:GetService"Workspace").CurrentCamera
if not ak then
return
end

table.insert(ah,ak:GetPropertyChangedSignal"CFrame":Connect(render))
table.insert(ah,ak:GetPropertyChangedSignal"ViewportSize":Connect(render))
table.insert(ah,ak:GetPropertyChangedSignal"FieldOfView":Connect(render))
task.spawn(render)
end

aj.Destroying:Connect(function()
for ak,al in ah do
pcall(function()
al:Disconnect()
end)
end
end)

renderOnChange()

return onChange,aj
end

return function(ag)
local ah={}
local ai,aj=createAcrylicBlur(ag)

local ak=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ab.AddSignal(ak:GetPropertyChangedSignal"AbsolutePosition",function()
ai(ak)
end)

ab.AddSignal(ak:GetPropertyChangedSignal"AbsoluteSize",function()
ai(ak)
end)

ah.AddParent=function(al)
ab.AddSignal(al:GetPropertyChangedSignal"Visible",function()

end)
end

ah.SetVisibility=function(al)
aj.Transparency=al and 0.98 or 1
end

ah.Frame=ak
ah.Model=aj

return ah
end end function a.r()


local aa=a.load'd'
local ab=a.load'q'

local ac=aa.New

return function(ad)
local ae={}

ae.Frame=ac("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{












ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{










}),

ac("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{










}),
})


local af

task.wait()
if ad.UseAcrylic then
af=ab()

af.Frame.Parent=ae.Frame
ae.Model=af.Model
ae.AddParent=af.AddParent
ae.SetVisibility=af.SetVisibility
end

return ae,af
end end function a.s()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab={
AcrylicBlur=a.load'q',

AcrylicPaint=a.load'r',
}

function ab.init()
local ac=Instance.new"DepthOfFieldEffect"
ac.FarIntensity=0
ac.InFocusRadius=0.1
ac.NearIntensity=1

local ad={}

function ab.Enable()
for ae,af in pairs(ad)do
af.Enabled=false
end
ac.Parent=aa(game:GetService"Lighting")
end

function ab.Disable()
for ae,af in pairs(ad)do
af.Enabled=af.enabled
end
ac.Parent=nil
end

local function registerDefaults()
local function register(ae)
if ae:IsA"DepthOfFieldEffect"then
ad[ae]={enabled=ae.Enabled}
end
end

for ae,af in pairs(aa(game:GetService"Lighting"):GetChildren())do
register(af)
end

if aa(game:GetService"Workspace").CurrentCamera then
for ag,ah in pairs(aa(game:GetService"Workspace").CurrentCamera:GetChildren())do
register(ah)
end
end
end

registerDefaults()
ab.Enable()
end

return ab end function a.t()

local aa={}

local ab=a.load'd'
local ac=ab.New local ad=
ab.Tween


function aa.new(ae,af)
local ag={
Title=ae.Title or"Dialog",
Content=ae.Content,
Icon=ae.Icon,
IconThemed=ae.IconThemed,
Thumbnail=ae.Thumbnail,
Buttons=ae.Buttons,

IconSize=22,
}

local ah=a.load'n'
local ai=ah.Create(true,"Popup",ae.WindUI.Window,ae.WindUI,af)

local aj=200

local ak=430
if ag.Thumbnail and ag.Thumbnail.Image then
ak=430+(aj/2)
end

ai.UIElements.Main.AutomaticSize="Y"
ai.UIElements.Main.Size=UDim2.new(0,ak,0,0)



local al

if ag.Icon then
al=ab.Image(
ag.Icon,
ag.Title..":"..ag.Icon,
0,
ae.WindUI.Window,
"Popup",
true,
ae.IconThemed,
"PopupIcon"
)
al.Size=UDim2.new(0,ag.IconSize,0,ag.IconSize)
al.LayoutOrder=-1
end


local am=ac("TextLabel",{
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ag.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="PopupTitle",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,al and-ag.IconSize-14 or 0,0,0)
})

local an=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
al,am
})

local ao=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





an,
})

local ap
if ag.Content and ag.Content~=""then
ap=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="PopupContent",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local aq=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local ar
if ag.Thumbnail and ag.Thumbnail.Image then
local as
if ag.Thumbnail.Title then
as=ac("TextLabel",{
Text=ag.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ar=ac("ImageLabel",{
Image=ag.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,aj,1,0),
Parent=ai.UIElements.Main,
ScaleType="Crop"
},{
as,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,ar and-aj or 0,1,0),
Position=UDim2.new(0,ar and aj or 0,0,0),
BackgroundTransparency=1,
Parent=ai.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
ao,
ap,
aq,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local as=a.load'l'.New

for at,au in next,ag.Buttons do
as(au.Title,au.Icon,au.Callback,au.Variant,aq,ai)
end

ai:Open()


return ag
end

return aa end function a.u()
return function(aa,ab)
return{
Dark={
Name="Dark",

Accent=Color3.fromHex"#18181b",
Dialog=Color3.fromHex"#1a1a1a",
Outline=Color3.fromHex"#FFFFFF",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#a1a1a1",
Background=Color3.fromHex"#101010",
Button=Color3.fromHex"#52525b",
Icon=Color3.fromHex"#a1a1aa",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

SliderIcon=Color3.fromHex"#908F95",
Primary=Color3.fromHex"#0091FF",


LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.83,

ElementBackground=Color3.fromHex"#2A2A2C",
ElementBackgroundTransparency=0,
},

Light={
Name="Light",

Accent=Color3.fromHex"#efefef",
Dialog=Color3.fromHex"#f4f4f5",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#000000",
Placeholder=Color3.fromHex"#555555",
Background=Color3.fromHex"#FFFFFF",
Button=Color3.fromHex"#18181b",
Icon=Color3.fromHex"#52525b",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

DropdownTabBackground=Color3.fromHex"#bebebe",
DropdownBackground=Color3.fromHex"#ffffff",

TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#f3f3f3",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#efefef",
TabBackgroundActiveTransparency=0,

PanelBackground=Color3.fromHex"#efefef",
PanelBackgroundTransparency=0,

LabelBackground=Color3.fromHex"#efefef",
LabelBackgroundTransparency=0,

ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0,
},

Rose={
Name="Rose",

Accent=Color3.fromHex"#be185d",
Dialog=Color3.fromHex"#4c0519",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#d67aa6",
Background=Color3.fromHex"#1f0308",
Button=Color3.fromHex"#e95f74",
Icon=Color3.fromHex"#fb7185",

ElementBackground=Color3.fromHex"#381E23",
ElementBackgroundTransparency=0,
},

Plant={
Name="Plant",

Accent=Color3.fromHex"#166534",
Dialog=Color3.fromHex"#052e16",

Text=Color3.fromHex"#f0fdf4",
Placeholder=Color3.fromHex"#4fbf7a",
Background=Color3.fromHex"#0a1b0f",
Button=Color3.fromHex"#16a34a",
Icon=Color3.fromHex"#4ade80",

ElementBackground=Color3.fromHex"#28342A",
ElementBackgroundTransparency=0,
},

Red={
Name="Red",

Accent=Color3.fromHex"#991b1b",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#d95353",
Background=Color3.fromHex"#1c0606",
Button=Color3.fromHex"#dc2626",
Icon=Color3.fromHex"#ef4444",

ElementBackground=Color3.fromHex"#322221",
ElementBackgroundTransparency=0,
},

Indigo={
Name="Indigo",

Accent=Color3.fromHex"#3730a3",
Dialog=Color3.fromHex"#1e1b4b",

Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#7078d9",
Background=Color3.fromHex"#0f0a2e",
Button=Color3.fromHex"#4f46e5",
Icon=Color3.fromHex"#6366f1",

ElementBackground=Color3.fromHex"#282543",
ElementBackgroundTransparency=0,
},

Sky={
Name="Sky",

Accent=Color3.fromHex"#00d4ff",
Dialog=Color3.fromHex"#0a4d66",

Text=Color3.fromHex"#e6f7ff",
Placeholder=Color3.fromHex"#66b3cc",
Background=Color3.fromHex"#051a26",
Button=Color3.fromHex"#00a8cc",
Icon=Color3.fromHex"#2db8d9",

Toggle=Color3.fromHex"#00d9d9",
Slider=Color3.fromHex"#00d4ff",
Checkbox=Color3.fromHex"#00d4ff",

PanelBackground=Color3.fromHex"#0d3a47",
PanelBackgroundTransparency=0.8,

ElementBackground=Color3.fromHex"#172E3B",
ElementBackgroundTransparency=0,
},

Violet={
Name="Violet",

Accent=Color3.fromHex"#6d28d9",
Dialog=Color3.fromHex"#3c1361",

Text=Color3.fromHex"#faf5ff",
Placeholder=Color3.fromHex"#8f7ee0",
Background=Color3.fromHex"#1e0a3e",
Button=Color3.fromHex"#7c3aed",
Icon=Color3.fromHex"#8b5cf6",

ElementBackground=Color3.fromHex"#342650",
ElementBackgroundTransparency=0,
},

Amber={
Name="Amber",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#b45309",Transparency=0},
["100"]={Color=Color3.fromHex"#d97706",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#451a03",Transparency=0},
["100"]={Color=Color3.fromHex"#6b2e05",Transparency=0},
},{Rotation=90}),






Text=aa:Gradient({
["0"]={Color=Color3.fromHex"#fffbeb",Transparency=0},
["100"]={Color=Color3.fromHex"#fff7ed",Transparency=0},
},{Rotation=45}),

Placeholder=aa:Gradient({
["0"]={Color=Color3.fromHex"#d1a326",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#1c1003",Transparency=0},
["100"]={Color=Color3.fromHex"#3f210d",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Icon=Color3.fromHex"#f59e0b",

Toggle=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Slider=Color3.fromHex"#d97706",

Checkbox=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

ElementBackground=Color3.fromHex"#3A2E22",
ElementBackgroundTransparency=0,
},

Emerald={
Name="Emerald",

Accent=Color3.fromHex"#047857",
Dialog=Color3.fromHex"#022c22",

Text=Color3.fromHex"#ecfdf5",
Placeholder=Color3.fromHex"#3fbf8f",
Background=Color3.fromHex"#011411",
Button=Color3.fromHex"#059669",
Icon=Color3.fromHex"#10b981",

ElementBackground=Color3.fromHex"#202E2A",
ElementBackgroundTransparency=0,
},

Midnight={
Name="Midnight",

Accent=Color3.fromHex"#1e3a8a",
Dialog=Color3.fromHex"#0c1e42",

Text=Color3.fromHex"#dbeafe",
Placeholder=Color3.fromHex"#2f74d1",
Background=Color3.fromHex"#0a0f1e",
Button=Color3.fromHex"#2563eb",
Primary=Color3.fromHex"#2563eb",
Icon=Color3.fromHex"#5591f4",

ElementBackground=Color3.fromHex"#242836",
ElementBackgroundTransparency=0,
},

Crimson={
Name="Crimson",

Accent=Color3.fromHex"#b91c1c",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#6f757b",
Background=Color3.fromHex"#0c0404",
Button=Color3.fromHex"#991b1b",
Icon=Color3.fromHex"#dc2626",

ElementBackground=Color3.fromHex"#251F1F",
ElementBackgroundTransparency=0,
},

MonokaiPro={
Name="Monokai Pro",

Accent=Color3.fromHex"#fc9867",
Dialog=Color3.fromHex"#1e1e1e",

Text=Color3.fromHex"#fcfcfa",
Placeholder=Color3.fromHex"#afafaf",
Background=Color3.fromHex"#191622",
Button=Color3.fromHex"#ab9df2",
Icon=Color3.fromHex"#a9dc76",

ElementBackground=Color3.fromHex"#323039",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=23,
},
},

CottonCandy={
Name="Cotton Candy",

Accent=Color3.fromHex"#ec4899",
Dialog=Color3.fromHex"#2d1b3d",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#8a5fd3",
Background=Color3.fromHex"#1a0b2e",
Button=Color3.fromHex"#d946ef",
Slider=Color3.fromHex"#d946ef",
Icon=Color3.fromHex"#06b6d4",

ElementBackground=Color3.fromHex"#312643",
ElementBackgroundTransparency=0,
},

Mellowsi={
Name="Mellowsi",

Accent=Color3.fromHex"#342A1E",
Dialog=Color3.fromHex"#291C13",

Text=Color3.fromHex"#F5EBDD",
Placeholder=Color3.fromHex"#9C8A73",
Background=Color3.fromHex"#1C1002",
Button=Color3.fromHex"#342A1E",
Icon=Color3.fromHex"#C9B79C",

Toggle=Color3.fromHex"#a9873f",
Slider=Color3.fromHex"#C9A24D",
Checkbox=Color3.fromHex"#C9A24D",

ElementBackground=Color3.fromHex"#33291E",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=52,
},
},

Rainbow={
Name="Rainbow",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#00ff41",Transparency=0},
["33"]={Color=Color3.fromHex"#00ffff",Transparency=0},
["66"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["100"]={Color=Color3.fromHex"#8000ff",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#8000ff",Transparency=0},
["50"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["75"]={Color=Color3.fromHex"#00ff80",Transparency=0},
["100"]={Color=Color3.fromHex"#ff8000",Transparency=0},
},{Rotation=135}),


Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#00ff80",

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0040",Transparency=0},
["20"]={Color=Color3.fromHex"#ff4000",Transparency=0},
["40"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["60"]={Color=Color3.fromHex"#00ff40",Transparency=0},
["80"]={Color=Color3.fromHex"#0040ff",Transparency=0},
["100"]={Color=Color3.fromHex"#4000ff",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#ff8000",Transparency=0},
["50"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["75"]={Color=Color3.fromHex"#80ff00",Transparency=0},
["100"]={Color=Color3.fromHex"#00ffff",Transparency=0},
},{Rotation=60}),

Icon=Color3.fromHex"#ffffff",
},
}
end end function a.v()

local aa={}

local ab=a.load'd'
local ac=ab.New local ad=
ab.Tween

function aa.New(ae,af,ag,ah,ai,aj)
local ak=ai or 10
local al
if af and af~=""then
al=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local am=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,al and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3=ah and"Placeholder"or"Text",
},
Text=ae,
})

local an=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(ak,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not aj and ab.NewRoundFrame(ak,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})or nil,
ab.NewRoundFrame(ak,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
al,
am,
}),
}),
})

return an
end

return aa end function a.w()

local aa={}

local ab=cloneref or clonereference or function(ab)
return ab
end
local ac=ab(game:GetService"UserInputService")

local ad=a.load'd'
local ae=ad.New

function aa.New(af,ag,ah,ai,aj)
local ak=ae("Frame",{
Size=UDim2.new(0,ai,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ag,
ZIndex=999,
Active=true,
})

local al=ad.NewRoundFrame(ai/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=ak,
})

local am=ae("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=al,
})

local an=ad:GenerateUniqueID()
local ao=false
local ap,aq

local function UpdateVisuals()
local ar=af.AbsoluteCanvasSize.Y
local as=af.AbsoluteWindowSize.Y

if ar<=as then
al.Visible=false
return
end

al.Visible=true

local at=math.clamp(as/ar,0.05,1)
al.Size=UDim2.new(1,0,at,0)

local au=ar-as
local av=1-at

if au>0 then
local aw=af.CanvasPosition.Y/au
al.Position=UDim2.new(0,0,math.clamp(aw*av,0,av),0)
else
al.Position=UDim2.new(0,0,0,0)
end
end

local function StopDrag()
if aj.CurrentInput==an then
aj.CurrentInput=nil
end
ao=false
af.ScrollingEnabled=true
if ap then
ap:Disconnect()
end
if aq then
aq:Disconnect()
end
end

ad.AddSignal(am.InputBegan,function(ar)
if
ar.UserInputType~=Enum.UserInputType.MouseButton1
and ar.UserInputType~=Enum.UserInputType.Touch
then
return
end
if ao then
return
end
if aj.CurrentInput and aj.CurrentInput~=an then
return
end

aj.CurrentInput=an

ao=true
af.ScrollingEnabled=false

local as=ar.Position.Y
local at=af.CanvasPosition.Y

ap=ac.InputChanged:Connect(function(au)
if
au.UserInputType==Enum.UserInputType.MouseMovement
or au.UserInputType==Enum.UserInputType.Touch
then
local av=au.Position.Y-as

local aw=af.AbsoluteCanvasSize.Y
local ax=af.AbsoluteWindowSize.Y
local ay=math.max(aw-ax,0)

local az=ak.AbsoluteSize.Y
local aA=al.AbsoluteSize.Y
local aB=math.max(az-aA,1)

local aC=av*(ay/aB)

af.CanvasPosition=
Vector2.new(af.CanvasPosition.X,math.clamp(at+aC,0,ay))
end
end)

aq=ac.InputEnded:Connect(function(au)
if au.UserInputType==ar.UserInputType then
if aj.CurrentInput and aj.CurrentInput~=an then
return
end

aj.CurrentInput=nil

StopDrag()
end
end)
end)

ad.AddSignal(af:GetPropertyChangedSignal"AbsoluteWindowSize",UpdateVisuals)
ad.AddSignal(af:GetPropertyChangedSignal"AbsoluteCanvasSize",UpdateVisuals)
ad.AddSignal(af:GetPropertyChangedSignal"CanvasPosition",UpdateVisuals)

UpdateVisuals()

return ak
end

return aa end function a.x()





local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween










local ae={
Default=nil,
Solid=ab.Colors.Accent,
Outline=ab.Colors.Accent,
Success=ab.Colors.Success,
Warning=ab.Colors.Warning,
Error=ab.Colors.Error,
Info=ab.Colors.Info,
}

local af=999
local ag=10
local ah=4
local ai=24

function aa.New(aj,ak,al)
local am=aj.Label or aj.Text or"Tag"
local an=aj.Variant or"Default"
local ao=aj.Icon
local ap=aj.Removable==true

local aq=ae[an]
local ar=aq and Color3.fromHex(aq)or nil


local as
if ao and ao~=""then
local at=ab.Icon(ao)
if at then
as=ac("ImageLabel",{
Size=UDim2.new(0,12,0,12),
BackgroundTransparency=1,
Image=at[1],
ImageRectSize=at[2].ImageRectSize,
ImageRectOffset=at[2].ImageRectPosition,
ImageColor3=ar or nil,
ThemeTag=not ar and{ImageColor3="Text"}or nil,
ImageTransparency=not ar and 0.3 or 0,
})
end
end


local at
if ap then
local au=ab.Icon"x"
at=ac("ImageButton",{
Size=UDim2.new(0,10,0,10),
BackgroundTransparency=1,
Image=au and au[1]or"",
ImageRectSize=au and au[2].ImageRectSize or Vector2.new(0,0),
ImageRectOffset=au and au[2].ImageRectPosition or Vector2.new(0,0),
ImageColor3=ar or nil,
ThemeTag=not ar and{ImageColor3="Text"}or nil,
ImageTransparency=0.35,
Name="Remove",
})
end


local au=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
TextXAlignment="Center",
TextSize=ab.Type.Caption,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=am,
ImageColor3=ar or nil,
ThemeTag=not ar and{TextColor3="Text"}or nil,
TextColor3=an=="Solid"and Color3.new(1,1,1)
or ar or nil,
TextTransparency=0.1,
Name="Label",
})


local av
if an=="Solid"then
av=0
elseif an=="Outline"then
av=1
else
av=0.85
end

local aw=ab.NewRoundFrame(af,"Squircle",{
Size=UDim2.new(0,0,0,ai),
AutomaticSize="X",
ImageTransparency=av,
ImageColor3=ar,
ThemeTag=(not ar)and{ImageColor3="ElementBackground"}or nil,
Parent=ak,
Name="Tag",
},{

an=="Outline"and ab.NewRoundFrame(af,"SquircleOutline",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=ar,
ImageTransparency=0.45,
})or nil,

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
AutomaticSize="X",
},{
as,
au,
at,
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,5),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,ag),
PaddingRight=UDim.new(0,ag),
PaddingTop=UDim.new(0,ah),
PaddingBottom=UDim.new(0,ah),
}),
}),
})


local ax={}

function ax.Remove(ay)
ad(aw,ab.Anim.Normal,{
Size=UDim2.new(0,0,0,0),
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.delay(ab.Anim.Normal+0.02,function()
aw:Destroy()
end)
if al then ab.SafeCallback(al,am)end
end

function ax.SetLabel(ay,az)
au.Text=az
end

if at then
at.MouseEnter:Connect(function()
ad(at,ab.Anim.Fast,{ImageTransparency=0.05}):Play()
end)
at.MouseLeave:Connect(function()
ad(at,ab.Anim.Fast,{ImageTransparency=0.35}):Play()
end)
ab.AddSignal(at.MouseButton1Click,function()
ax:Remove()
end)
end

aw._API=ax
return aw,ax
end

return aa end function a.y()

local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=aa(game:GetService"RunService")
local ac=aa(game:GetService"HttpService")

local ad

local ae
ae={
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(af)
return{
__type=af.__type,
value=af.Default:ToHex(),
transparency=af.Transparency or nil,
}
end,
Load=function(af,ag)
if af and af.Update then
af:Update(Color3.fromHex(ag.value),ag.transparency or nil)
end
end
},
Dropdown={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Select then
af:Select(ag.value)
end
end
},
Input={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
Keybind={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
Slider={
Save=function(af)
return{
__type=af.__type,
value=af.Value.Default,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(tonumber(ag.value))
end
end
},
Toggle={
Save=function(af)
return{
__type=af.__type,
value=af.Value,
}
end,
Load=function(af,ag)
if af and af.Set then
af:Set(ag.value)
end
end
},
}
}

function ae.Init(af,ag)
if not ag.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end
if ab:IsStudio()or not writefile then
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return false
end

ad=ag
ae.Folder=ad.Folder
ae.Path="WindUI/"..tostring(ae.Folder).."/config/"

if not isfolder(ae.Path)then
makefolder(ae.Path)
end

local ah=ae:AllConfigs()

for ai,aj in next,ah do
if isfile and readfile and isfile(aj..".json")then
ae.Configs[aj]=readfile(aj..".json")
end
end

return ae
end

function ae.SetPath(af,ag)
if not ag then
warn"[ WindUI.ConfigManager ] Custom path is not specified."
return false
end

ae.Path=ag
if not ag:match"/$"then
ae.Path=ag.."/"
end

if not isfolder(ae.Path)then
makefolder(ae.Path)
end

return true
end

function ae.CreateConfig(af,ag,ah)
local ai={
Path=ae.Path..ag..".json",
Elements={},
CustomData={},
AutoLoad=ah or false,
Version=1.2,
}

if not ag then
return false,"No config file is selected"
end

function ai.SetAsCurrent(aj)
ad:SetCurrentConfig(ai)
end

function ai.Register(aj,ak,al)
ai.Elements[ak]=al
end

function ai.Set(aj,ak,al)
ai.CustomData[ak]=al
end

function ai.Get(aj,ak)
return ai.CustomData[ak]
end

function ai.SetAutoLoad(aj,ak)
ai.AutoLoad=ak
end

function ai.Save(aj)
if ad.PendingFlags then
for ak,al in next,ad.PendingFlags do
ai:Register(ak,al)
end
end

local ak={
__version=ai.Version,
__elements={},
__autoload=ai.AutoLoad,
__custom=ai.CustomData
}

for al,am in next,ai.Elements do
if ae.Parser[am.__type]then
ak.__elements[tostring(al)]=ae.Parser[am.__type].Save(am)
end
end

local an=ac:JSONEncode(ak)
if writefile then
writefile(ai.Path,an)
end

return ak
end

function ai.Load(aj)
if isfile and not isfile(ai.Path)then
return false,"Config file does not exist"
end

local ak,al=pcall(function()
local ak=readfile or function()
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return nil
end
return ac:JSONDecode(ak(ai.Path))
end)

if not ak then
return false,"Failed to parse config file"
end

if not al.__version then
local am={
__version=ai.Version,
__elements=al,
__custom={}
}
al=am
end

if ad.PendingFlags then
for am,an in next,ad.PendingFlags do
ai:Register(am,an)
end
end

for am,an in next,(al.__elements or{})do
if ai.Elements[am]and ae.Parser[an.__type]then
task.spawn(function()
ae.Parser[an.__type].Load(ai.Elements[am],an)
end)
end
end

ai.CustomData=al.__custom or{}

return ai.CustomData
end

function ai.Delete(aj)
if not delfile then
return false,"delfile function is not available"
end

if not isfile(ai.Path)then
return false,"Config file does not exist"
end

local ak,al=pcall(function()
delfile(ai.Path)
end)

if not ak then
return false,"Failed to delete config file: "..tostring(al)
end

ae.Configs[ag]=nil

if ad.CurrentConfig==ai then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function ai.GetData(aj)
return{
elements=ai.Elements,
custom=ai.CustomData,
autoload=ai.AutoLoad
}
end


if isfile(ai.Path)then
local aj,ak=pcall(function()
return ac:JSONDecode(readfile(ai.Path))
end)

if aj and ak and ak.__autoload then
ai.AutoLoad=true

task.spawn(function()
task.wait(0.5)
local al,am=pcall(function()
return ai:Load()
end)
if al then
if ad.Debug then print("[ WindUI.ConfigManager ] AutoLoaded config: "..ag)end
else
warn("[ WindUI.ConfigManager ] Failed to AutoLoad config: "..ag.." - "..tostring(am))
end
end)
end
end


ai:SetAsCurrent()
ae.Configs[ag]=ai
return ai
end

function ae.Config(af,ag,ah)
return ae:CreateConfig(ag,ah)
end

function ae.GetAutoLoadConfigs(af)
local ag={}

for ah,ai in pairs(ae.Configs)do
if ai.AutoLoad then
table.insert(ag,ah)
end
end

return ag
end

function ae.DeleteConfig(af,ag)
if not delfile then
return false,"delfile function is not available"
end

local ah=ae.Path..ag..".json"

if not isfile(ah)then
return false,"Config file does not exist"
end

local ai,aj=pcall(function()
delfile(ah)
end)

if not ai then
return false,"Failed to delete config file: "..tostring(aj)
end

ae.Configs[ag]=nil

if ad.CurrentConfig and ad.CurrentConfig.Path==ah then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function ae.AllConfigs(af)
if not listfiles then return{}end

local ag={}
if not isfolder(ae.Path)then
makefolder(ae.Path)
return ag
end

for ah,ai in next,listfiles(ae.Path)do
local aj=ai:match"([^\\/]+)%.json$"
if aj then
table.insert(ag,aj)
end
end

return ag
end

function ae.GetConfig(af,ag)
return ae.Configs[ag]
end

return ae end function a.z()
local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween


local ae=(cloneref or clonereference or function(ae)return ae end)


ae(game:GetService"UserInputService")


function aa.New(af)
local ag={
Button=nil
}

local ah













local ai=ac("TextLabel",{
Text=af.Title,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local aj=ac("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.3,
})
})
local ak=ac("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local al=ac("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=af.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})


local am=ac("UIScale",{
Scale=1,
})

local an=ac("Frame",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=al,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{
am,
ac("UICorner",{
CornerRadius=UDim.new(1,0)
}),
ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
ac("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
aj,
ak,

ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

ac("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
ah,
ac("UIListLayout",{
Padding=UDim.new(0,af.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ai,
ac("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
}),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

ag.Button=an



function ag.SetIcon(ao,ap)
if ah then
ah:Destroy()
end
if ap then
ah=ab.Image(
ap,
af.Title,
0,
af.Folder,
"OpenButton",
true,
af.IconThemed
)
ah.Size=UDim2.new(0,22,0,22)
ah.LayoutOrder=-1
ah.Parent=ag.Button.TextButton
end
end

if af.Icon then
ag:SetIcon(af.Icon)
end



ab.AddSignal(an:GetPropertyChangedSignal"AbsoluteSize",function()
al.Size=UDim2.new(
0,an.AbsoluteSize.X,
0,an.AbsoluteSize.Y
)
end)

ab.AddSignal(an.TextButton.MouseEnter,function()
ad(an.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
ab.AddSignal(an.TextButton.MouseLeave,function()
ad(an.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local ao=ab.Drag(al)


function ag.Visible(ap,aq)
al.Visible=aq
end

function ag.SetScale(ap,aq)
am.Scale=aq
end

function ag.Edit(ap,aq)
local ar={
Title=aq.Title,
Icon=aq.Icon,
Enabled=aq.Enabled,
Position=aq.Position,
OnlyIcon=aq.OnlyIcon or false,
Draggable=aq.Draggable or nil,
OnlyMobile=aq.OnlyMobile,
CornerRadius=aq.CornerRadius or UDim.new(1,0),
StrokeThickness=aq.StrokeThickness or 2,
Scale=aq.Scale or 1,
Color=aq.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if ar.Enabled==false then
af.IsOpenButtonEnabled=false
end

if ar.OnlyMobile~=false then
ar.OnlyMobile=true
else
af.IsPC=false
end


if ar.Draggable==false and aj and ak then
aj.Visible=ar.Draggable
ak.Visible=ar.Draggable

if ao then
ao:Set(ar.Draggable)
end
end

if ar.Position and al then
al.Position=ar.Position
end

if ar.OnlyIcon==true and ai then
ai.Visible=false
an.TextButton.UIPadding.PaddingLeft=UDim.new(0,7)
an.TextButton.UIPadding.PaddingRight=UDim.new(0,7)
elseif ar.OnlyIcon==false then
ai.Visible=true
an.TextButton.UIPadding.PaddingLeft=UDim.new(0,11)
an.TextButton.UIPadding.PaddingRight=UDim.new(0,11)
end





if ai then
if ar.Title then
ai.Text=ar.Title
ab:ChangeTranslationKey(ai,ar.Title)
elseif ar.Title==nil then

end
end

if ar.Icon then
ag:SetIcon(ar.Icon)
end

an.UIStroke.UIGradient.Color=ar.Color
if Glow then
Glow.UIGradient.Color=ar.Color
end

an.UICorner.CornerRadius=ar.CornerRadius
an.TextButton.UICorner.CornerRadius=UDim.new(ar.CornerRadius.Scale,ar.CornerRadius.Offset-4)
an.UIStroke.Thickness=ar.StrokeThickness

ag:SetScale(ar.Scale)
end

return ag
end



return aa end function a.A()




local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=(cloneref or clonereference or function(ae)return ae end)
local af=ae(game:GetService"RunService")
local ag=ae(game:GetService"UserInputService")

local ah=10
local ai=12
local aj=7
local ak=12


local al,am,an

local function EnsureFrame()
if al and al.Parent then return end

an=ab.New and ac("ScreenGui",{
Name="LeviathanTooltip",
ZIndexBehavior="Sibling",
DisplayOrder=9999,
ResetOnSpawn=false,
})or nil

local ao=ab.NewRoundFrame(ah,"Squircle",{
Size=UDim2.new(0,0,0,0),
AutomaticSize="XY",
ImageTransparency=1,
ThemeTag={ImageColor3="TooltipBackground"},
Visible=false,
ZIndex=9999,
Name="TooltipFrame",
},{
ab.NewRoundFrame(ah,"SquircleOutline",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={ImageColor3="Outline"},
ImageTransparency=0.82,
ZIndex=9999,
}),
ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ab.Type.BodySM,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="TooltipText"},
TextTransparency=1,
Text="",
Name="Label",
ZIndex=9999,
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,ai),
PaddingRight=UDim.new(0,ai),
PaddingTop=UDim.new(0,aj),
PaddingBottom=UDim.new(0,aj),
}),
})

if an then
ao.Parent=an
an.Parent=game:GetService"CoreGui"
end

al=ao
am=ao.Label
end


local function SmartPosition(ao,ap,aq)
local ar=ao.X+ak
local as=ao.Y-ap.Y/2


if ar+ap.X>aq.X-10 then
ar=ao.X-ap.X-ak
end

if as+ap.Y>aq.Y-10 then
as=aq.Y-ap.Y-10
end

if as<10 then as=10 end

return UDim2.new(0,ar,0,as)
end


local ao


function aa.Show(ap,aq)
EnsureFrame()
if not ap or ap==""then return end

am.Text=ap
al.Visible=true
al.ImageTransparency=1
am.TextTransparency=1


local function reposition()
local ar=ag:GetMouseLocation()
local as=workspace.CurrentCamera.ViewportSize
local at=al.AbsoluteSize
al.Position=SmartPosition(ar,at,as)
end

task.spawn(function()
task.wait()
reposition()
ad(al,ab.Anim.Fast,{ImageTransparency=0.06}):Play()
ad(am,ab.Anim.Fast,{TextTransparency=0.10}):Play()
end)

if ao then ao:Disconnect()end
ao=af.RenderStepped:Connect(reposition)
end


function aa.Hide()
if ao then ao:Disconnect();ao=nil end
if not al then return end
ad(al,ab.Anim.Fast,{ImageTransparency=1}):Play()
ad(am,ab.Anim.Fast,{TextTransparency=1}):Play()
task.delay(ab.Anim.Fast+0.01,function()
if al then al.Visible=false end
end)
end


function aa.Attach(ap,aq)
local ar=ap.MouseEnter:Connect(function()
aa.Show(aq,ap)
end)
local as=ap.MouseLeave:Connect(function()
aa.Hide()
end)

return function()
ar:Disconnect()
as:Disconnect()
aa.Hide()
end
end


function aa.New(ap,aq)
local ar=ap.Text or ap.Content or""


local as
task.defer(function()
local at=aq
if not at then return end
as=aa.Attach(at,ar)
end)

return{
Text=ar,
Detach=function()
if as then as()end
end,
}
end

return aa end function a.B()





local aa={}

local ab=a.load'd'
local ac=ab.New









function aa.New(ad,ae)
local af=ad.Title or nil
local ag=ad.Content or ad.Text or""
local ah=ad.Mode or"Body"


local ai,aj,ak,al

if ah=="Title"then
ai=ab.Type.TitleLG
aj=ab.Type.BodyMD
ak=Enum.FontWeight.Regular
al=0.30
elseif ah=="Description"then
ai=ab.Type.BodyLG
aj=ab.Type.BodySM
ak=Enum.FontWeight.Regular
al=0.40
else
ai=ab.Type.TitleMD
aj=ab.Type.BodyMD
ak=Enum.FontWeight.Regular
al=0.25
end


local am
if af and af~=""then
am=ac("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
Text=af,
TextSize=ai,
FontFace=Font.new(ab.Font,Enum.FontWeight.Bold),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
Name="Title",
})
end


local an=ac("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
Text=ag,
TextSize=aj,
FontFace=Font.new(ab.Font,ak),
ThemeTag={TextColor3="Text"},
TextTransparency=al,
LineHeight=1.4,
Name="Body",
})


local ao={
an,
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
SortOrder="LayoutOrder",
}),
}

if am then
table.insert(ao,1,am)
end

local ap=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Parent=ae,
Name="Paragraph",
},ao)


if ad.MaxWidth then
local aq=ac("UISizeConstraint",{
MaxSize=Vector2.new(ad.MaxWidth,math.huge),
})
aq.Parent=ap
end


local aq={}

function aq.SetTitle(ar,as)
if am then am.Text=as end
end

function aq.SetContent(ar,as)
an.Text=as
end

function aq.SetMode(ar,as)
if as=="Title"then
if am then am.TextSize=ab.Type.TitleLG end
an.TextSize=ab.Type.BodyMD
an.TextTransparency=0.30
elseif as=="Description"then
if am then am.TextSize=ab.Type.BodyLG end
an.TextSize=ab.Type.BodySM
an.TextTransparency=0.40
else
if am then am.TextSize=ab.Type.TitleMD end
an.TextSize=ab.Type.BodyMD
an.TextTransparency=0.25
end
end

ap._API=aq
return ap
end

return aa end function a.C()

game:GetService"ReplicatedStorage"
local aa=a.load'd'
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

local ae=(cloneref or clonereference or function(ae)
return ae
end)

ae(game:GetService"UserInputService")

local af=a.load'x'

local function Color3ToHSB(ag)
local ah,ai,aj=ag.R,ag.G,ag.B
local ak=math.max(ah,ai,aj)
local al=math.min(ah,ai,aj)
local am=ak-al

local an=0
if am~=0 then
if ak==ah then
an=(ai-aj)/am%6
elseif ak==ai then
an=(aj-ah)/am+2
else
an=(ah-ai)/am+4
end
an=an*60
else
an=0
end

local ao=(ak==0)and 0 or(am/ak)
local ap=ak

return{
h=math.floor(an+0.5),
s=ao,
b=ap,
}
end

local function GetPerceivedBrightness(ag)
local ah=ag.R
local ai=ag.G
local aj=ag.B
return 0.299*ah+0.587*ai+0.114*aj
end

local function GetTextColorForHSB(ag)
local ah=Color3ToHSB(ag)local
ai, aj, ak=ah.h, ah.s, ah.b
if GetPerceivedBrightness(ag)>0.5 then
return Color3.fromHSV(ai/360,0,0.05)
else
return Color3.fromHSV(ai/360,0,0.98)
end
end

return function(ag)
local ah={
Title=ag.Title,
Desc=ag.Desc or nil,
Hover=ag.Hover,
Thumbnail=ag.Thumbnail,
ThumbnailSize=ag.ThumbnailSize or 80,
Image=ag.Image,
IconThemed=ag.IconThemed or false,
ImageSize=ag.ImageSize or 30,
Color=ag.Color,
Scalable=ag.Scalable,
Parent=ag.Parent,
Justify=ag.Justify or"Between",
UIPadding=ag.Window.ElementConfig.UIPadding,
UICorner=ag.Window.ElementConfig.UICorner,
Size=ag.Size or"Default",
Tags=ag.Tags or{},
UIElements={},

Index=ag.Index,
}

local ai=ah.Size=="Small"and-4 or ah.Size=="Large"and 4 or 0
local aj=ah.Size=="Small"and-4 or ah.Size=="Large"and 4 or 0

local ak=ah.ImageSize
local al=ah.ThumbnailSize
local am=true


local an=0

local ao
local ap
if ah.Thumbnail then
ao=aa.Image(
ah.Thumbnail,
ah.Title,
ag.Window.NewElements and ah.UICorner-11 or(ah.UICorner-4),
ag.Window.Folder,
"Thumbnail",
false,
ah.IconThemed
)
ao.Size=UDim2.new(1,0,0,al)
end
if ah.Image then
ap=aa.Image(
ah.Image,
ah.Title,
ag.Window.NewElements and ah.UICorner-11 or(ah.UICorner-4),
ag.Window.Folder,
"Image",
ah.IconThemed,
not ah.Color and true or false,
"ElementIcon"
)

if typeof(ah.Color)=="string"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
elseif typeof(ah.Color)=="Color3"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=GetTextColorForHSB(ah.Color)
end

ap.Size=UDim2.new(0,ak,0,ak)

an=ak
end

local function CreateText(aq,ar)
local as=typeof(ah.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
or typeof(ah.Color)=="Color3"and GetTextColorForHSB(ah.Color)

return ab("TextLabel",{
BackgroundTransparency=1,
Text=aq or"",
TextSize=ar=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not ah.Color and("Element"..ar)or nil,
},
TextColor3=ah.Color and as or nil,
TextTransparency=ar=="Desc"and 0.3 or 0,
TextWrapped=true,
Size=UDim2.new(ah.Justify=="Between"and 1 or 0,0,0,0),
AutomaticSize=ah.Justify=="Between"and"Y"or"XY",
FontFace=Font.new(aa.Font,ar=="Desc"and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold),
})
end

local aq=CreateText(ah.Title,"Title")
local ar=CreateText(ah.Desc,"Desc")
if not ah.Title or ah.Title==""then
ar.Visible=false
end
if not ah.Desc or ah.Desc==""then
ar.Visible=false
end

ah.UIElements.Title=aq
ah.UIElements.Desc=ar

ah.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,ah.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment=ah.Justify=="Between"and"Left"or"Center",
}),
ao,
ab("Frame",{
Size=UDim2.new(
ah.Justify=="Between"and 1 or 0,
ah.Justify=="Between"and-ag.TextOffset or 0,
0,
0
),
AutomaticSize=ah.Justify=="Between"and"Y"or"XY",
BackgroundTransparency=1,
Name="TitleFrame",
},{
ab("UIListLayout",{
Padding=UDim.new(0,ah.UIPadding),
FillDirection="Horizontal",
VerticalAlignment=ag.Window.NewElements and(ah.Justify=="Between"and"Top"or"Center")
or"Center",
HorizontalAlignment=ah.Justify~="Between"and ah.Justify or"Center",
}),
ap,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize=ah.Justify=="Between"and"Y"or"XY",
Size=UDim2.new(
ah.Justify=="Between"and 1 or 0,
ah.Justify=="Between"and(ap and-an-ah.UIPadding or-an)
or 0,
1,
0
),
Name="TitleFrame",
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,(ag.Window.NewElements and ah.UIPadding/2 or 0)+aj),
PaddingLeft=UDim.new(0,(ag.Window.NewElements and ah.UIPadding/2 or 0)+ai),
PaddingRight=UDim.new(
0,
(ag.Window.NewElements and ah.UIPadding/2 or 0)+ai
),
PaddingBottom=UDim.new(
0,
(ag.Window.NewElements and ah.UIPadding/2 or 0)+aj
),
}),
ab("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ab("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=-99,
BackgroundTransparency=1,
ScrollingDirection="X",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
Visible=false,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ag.Window.UIPadding/2),
}),
}),
ab("Frame",{
Name="Space",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Visible=false,
}),
aq,
ar,
}),
}),
})

for as,at in next,ag.Tags or{}do
if not ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible then
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible=true
ah.UIElements.Container.TitleFrame.TitleFrame.Space.Visible=true
end
af:New(at,ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame)
end

aa.AddSignal(
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout:GetPropertyChangedSignal
"AbsoluteContentSize"
,
function()
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Size=UDim2.new(
1,
0,
0,
ah.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y
/ag.ParentConfig.UIScale
)
end
)





local au=aa.Image("lock","lock",0,ag.Window.Folder,"Lock",false)
au.Size=UDim2.new(0,20,0,20)
au.ImageLabel.ImageColor3=Color3.new(1,1,1)
au.ImageLabel.ImageTransparency=0.4

local av=ab("TextLabel",{
Text="Locked",
TextSize=18,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
AutomaticSize="XY",
BackgroundTransparency=1,
TextColor3=Color3.new(1,1,1),
TextTransparency=0.05,
})

local aw=ab("Frame",{
Size=UDim2.new(1,ah.UIPadding*2,1,ah.UIPadding*2),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ZIndex=9999999,
})

local ax,ay=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.25,
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
Parent=aw,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
au,
av,
},nil,true)local

az, aA=ac(ah.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aw,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local aB,aC=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aw,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)local

aD, aE=ac(ah.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Visible=false,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aw,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
},nil,true)

local aF,aG=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=aw,
},{
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local b,d=ac(ah.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=ah.Color and 0.05 or(not ag.Window.NewElements and 0.93 or nil),



Parent=ag.Parent,
ThemeTag={
ImageColor3=not ah.Color and(ag.Window.NewElements and"ElementBackground"or"Text")or nil,
ImageTransparency=not ah.Color
and(ag.Window.NewElements and"ElementBackgroundTransparency"or nil)
or nil,
},
ImageColor3=ah.Color and(typeof(ah.Color)=="string"and Color3.fromHex(
aa.Colors[ah.Color]
)or typeof(ah.Color)=="Color3"and ah.Color)or nil,
},{
ah.UIElements.Container,
aw,
ab("UIPadding",{
PaddingTop=UDim.new(0,ah.UIPadding),
PaddingLeft=UDim.new(0,ah.UIPadding),
PaddingRight=UDim.new(0,ah.UIPadding),
PaddingBottom=UDim.new(0,ah.UIPadding),
}),
},true,true)

ah.UIElements.Main=b
ah.UIElements.Locked=ax

if ah.Hover then
aa.AddSignal(b.MouseEnter,function()
if am then

ad(aF,0.12,{ImageTransparency=0.9}):Play()
ad(aD,0.12,{ImageTransparency=0.8}):Play()
aa.AddSignal(b.MouseMoved,function(f,g)
aF.HoverGradient.Offset=
Vector2.new(((f-b.AbsolutePosition.X)/b.AbsoluteSize.X)-0.5,0)
aD.HoverGradient.Offset=
Vector2.new(((f-b.AbsolutePosition.X)/b.AbsoluteSize.X)-0.5,0)
end)
end
end)
aa.AddSignal(b.InputEnded,function()
if am then

ad(aF,0.12,{ImageTransparency=1}):Play()
ad(aD,0.12,{ImageTransparency=1}):Play()
end
end)
end

function ah.SetTitle(f,g)
ah.Title=g
aq.Text=g
end

function ah.SetDesc(f,g)
ah.Desc=g
ar.Text=g or""
if not g then
ar.Visible=false
elseif not ar.Visible then
ar.Visible=true
end
end

function ah.Colorize(f,g,h)
if ah.Color then
g[h]=typeof(ah.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
or typeof(ah.Color)=="Color3"and GetTextColorForHSB(ah.Color)
or nil
end
end

if ag.ElementTable then
aa.AddSignal(aq:GetPropertyChangedSignal"Text",function()
if ah.Title~=aq.Text then
ah:SetTitle(aq.Text)
ag.ElementTable.Title=aq.Text
end
end)
aa.AddSignal(ar:GetPropertyChangedSignal"Text",function()
if ah.Desc~=ar.Text then
ah:SetDesc(ar.Text)
ag.ElementTable.Desc=ar.Text
end
end)
end





function ah.SetThumbnail(f,g,h)
ah.Thumbnail=g
if h then
ah.ThumbnailSize=h
al=h
end

if ao then
if g then
ao:Destroy()
ao=aa.Image(
g,
ah.Title,
ah.UICorner-3,
ag.Window.Folder,
"Thumbnail",
false,
ah.IconThemed
)
if ao then
ao.Size=UDim2.new(1,0,0,al)
ao.Parent=ah.UIElements.Container
local i=ah.UIElements.Container:FindFirstChild"UIListLayout"
if i then
ao.LayoutOrder=-1
end
end
else
ao.Visible=false
end
else
if g then
ao=aa.Image(
g,
ah.Title,
ah.UICorner-3,
ag.Window.Folder,
"Thumbnail",
false,
ah.IconThemed
)
if ao then
ao.Size=UDim2.new(1,0,0,al)
ao.Parent=ah.UIElements.Container
local i=ah.UIElements.Container:FindFirstChild"UIListLayout"
if i then
ao.LayoutOrder=-1
end
end
end
end
end

function ah.SetImage(f,g,h)
ah.Image=g
if h then
ah.ImageSize=h
ak=h
end

if g then
local i=ap and ap.Parent or ah.UIElements.Container.TitleFrame
if ap then
ap:Destroy()
end

ap=aa.Image(
g,
g,
ah.UICorner-3,
ag.Window.Folder,
"Image",
not ah.Color and true or false
)
if ap then
if typeof(ah.Color)=="string"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=
GetTextColorForHSB(Color3.fromHex(aa.Colors[ah.Color]))
elseif typeof(ah.Color)=="Color3"and not string.find(ah.Image,"rbxthumb")then
ap.ImageLabel.ImageColor3=GetTextColorForHSB(ah.Color)
end

ap.Visible=true
ap.Parent=i
ap.LayoutOrder=-99

ap.Size=UDim2.new(0,ak,0,ak)
an=ah.ImageSize+ah.UIPadding
end
else
if ap then
ap.Visible=true
end
an=0
end

ah.UIElements.Container.TitleFrame.TitleFrame.Size=UDim2.new(1,-an,1,0)
end

function ah.Destroy(f)
b:Destroy()
end

function ah.Lock(f,g)
am=false
ax.Active=true
ax.Visible=true
av.Text=g or"Locked"
end

function ah.Unlock(f)
am=true
ax.Active=false
ax.Visible=false
end

function ah.Highlight(f)
local g=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.1,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.9,0.9),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=az,
})

local h=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.15,0.8),
NumberSequenceKeypoint.new(0.5,0.1),
NumberSequenceKeypoint.new(0.85,0.8),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=aB,
})

az.ImageTransparency=0.65
aB.ImageTransparency=0.88

ad(g,0.75,{
Offset=Vector2.new(1,0),
}):Play()

ad(h,0.75,{
Offset=Vector2.new(1,0),
}):Play()

task.spawn(function()
task.wait(0.75)
az.ImageTransparency=1
aB.ImageTransparency=1
g:Destroy()
h:Destroy()
end)
end

function ah.UpdateShape(f)
if ag.Window.NewElements then
local g=aa:GetElementPosition(
f.Elements,
ah.Index,
ag.ParentConfig.ParentTable.__type=="HStack"or ag.ParentConfig.ParentTable.__type=="Group"
)

if g and b then
d:SetType(g)
ay:SetType(g)
aC:SetType(g)

aG:SetType(g)

end
end
end





return ah
end end function a.D()

local aa=a.load'd'local ab=
aa.New

local ac={}

function ac.New(ad,ae)
local af={
__type="Button",
Title=ae.Title or"Button",
Desc=ae.Desc or nil,
Icon=ae.Icon or"mouse-pointer-click",
IconThemed=ae.IconThemed or false,
IconColor=ae.IconColor or nil,
Color=ae.Color,
Justify=ae.Justify or"Between",
IconAlign=ae.IconAlign or"Right",
Locked=ae.Locked or false,
LockedTitle=ae.LockedTitle,
Callback=ae.Callback or function()end,
UIElements={},
}

local ag=true

af.ButtonFrame=a.load'C'{
Title=af.Title,
Desc=af.Desc,
Parent=ae.Parent,




Window=ae.Window,
Color=af.Color,
Justify=af.Justify,
TextOffset=20,
Hover=true,
Scalable=true,
Tab=ae.Tab,
Index=ae.Index,
ElementTable=af,
ParentConfig=ae,
Size=ae.Size,
Tags=ae.Tags,
}














af.UIElements.ButtonIcon=aa.Image(
af.Icon,
af.Icon,
0,
ae.Window.Folder,
"Button",
not(af.Color or af.IconColor)and true or nil,
af.IconThemed
)

if af.IconColor then
af.UIElements.ButtonIcon.ImageLabel.ImageColor3=af.IconColor
end

af.UIElements.ButtonIcon.Size=UDim2.new(0,20,0,20)
af.UIElements.ButtonIcon.Parent=af.Justify=="Between"and af.ButtonFrame.UIElements.Main
or af.ButtonFrame.UIElements.Container.TitleFrame
af.UIElements.ButtonIcon.LayoutOrder=af.IconAlign=="Left"and-99999 or 99999
af.UIElements.ButtonIcon.AnchorPoint=Vector2.new(1,0.5)
af.UIElements.ButtonIcon.Position=UDim2.new(1,0,0.5,0)

af.ButtonFrame:Colorize(af.UIElements.ButtonIcon.ImageLabel,"ImageColor3")

function af.Lock(ah)
af.Locked=true
ag=false
return af.ButtonFrame:Lock(af.LockedTitle)
end
function af.Unlock(ah)
af.Locked=false
ag=true
return af.ButtonFrame:Unlock()
end

if af.Locked then
af:Lock()
end

aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ag then
task.spawn(function()
aa.SafeCallback(af.Callback)
end)
end
end)
return af.__type,af
end

return ac end function a.E()





local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=(cloneref or clonereference or function(ae)return ae end)
local af=ae(game:GetService"UserInputService")

function aa.New(ag,ah,ai,aj,ak,al,am)
local an={

GlassSpritesheet={
Id="rbxassetid://77297718671545",
MirroredId="rbxassetid://92258969882244",
Size=Vector2.new(102,128),
Total=80,
Cols=10,
},
}

function an.GetGlassFrame(ao,ap)
local aq=an.GlassSpritesheet
local ar
if ap<=0.4 then
ar=math.floor((ap/0.4)*(aq.Total-1))
elseif ap<0.6 then
ar=aq.Total-1
else
ar=math.floor(((ap-0.6)/0.4)*(aq.Total-1))
end
ar=math.clamp(ar,0,aq.Total-1)
local as=ap>=0.6
if as then ar=(aq.Total-1)-ar end
local at=as and aq.MirroredId or aq.Id
return at,aq.Size,
Vector2.new((ar%aq.Cols)*aq.Size.X,math.floor(ar/aq.Cols)*aq.Size.Y)
end


local ao=al and(52)or 44
local ap=26
local aq=al and 30 or 22
local ar=22
local as=2
local at=999


local au
if ah and ah~=""then
local av=ab.Icon(ah)
if av then
au=ac("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=av[1],
ImageRectOffset=av[2].ImageRectPosition,
ImageRectSize=av[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end
end


local av=ac("ImageLabel",{
Name="Glass",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ImageTransparency=0.85,
})

local aw=ab.NewRoundFrame(at,"Squircle",{
Name="GlassBackground",
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
ThemeTag={ImageColor3="ElementBackground"},
ZIndex=-1,
})

local ax=ab.NewRoundFrame(at,"Squircle",{
Name="BarOverlay",
Size=UDim2.new(1,0,1,0),
ThemeTag={ImageColor3="ToggleBar"},
ZIndex=999,
})

local ay=ab.NewRoundFrame(at,"SquircleGlass",{
Name="SquircleGlass",
Size=UDim2.new(1,1,1,1),
ImageColor3=Color3.new(1,1,1),
ImageTransparency=0.5,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})

local az=ac("Frame",{
Name="Highlight",
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=1,
},{
ay,
aw,
av,
ax,
})

local aA=ab.NewRoundFrame(at,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Bar",
},{
az,
au,
ac("UIScale",{Scale=1,Name="ThumbScale"}),
})

local aB=ab.NewRoundFrame(at,"Squircle",{
Size=UDim2.new(0,aq,0,ar),
Position=UDim2.new(0,as,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=1,
Name="Frame",
},{
aA,
})


local aC=ab.NewRoundFrame(at,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={ImageColor3="Toggle"},
ImageTransparency=1,
})

local aD=ab.NewRoundFrame(at,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
}),
})

local aE=ac("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Name="Hitbox",
Text="",
})

local aF=ab.NewRoundFrame(at,"Squircle",{
ImageTransparency=0.82,
ThemeTag={ImageColor3="Text"},
Parent=aj,
Size=UDim2.new(0,ao,0,ap),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,0,0.5,0),
Name="ToggleFrame",
},{
aC,
aD,
aB,
aE,
})

local aG=ac("Frame",{
Size=UDim2.new(0,2,0,ap+2),
BackgroundTransparency=1,
Parent=aj,
})

aF.Parent=aG


local function ApplyGlass(b)
local d,f,g=an:GetGlassFrame(b)
av.Image=d
av.ImageRectSize=f
av.ImageRectOffset=g
end


local b=ao-aq-as
local d=as

function an.Set(f,g,h,i)
local m=g and b or d

if not i then

ad(aB,0.32,{
Position=UDim2.new(0,m,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
else

aB.Position=UDim2.new(0,m,0.5,0)
end

if g then
ad(aC,0.12,{ImageTransparency=0}):Play()
ab.SetThemeTag(av,{ImageColor3="Toggle"},0.12)
ad(av,0.12,{ImageTransparency=0}):Play()
if au then
ad(au,0.12,{ImageTransparency=0}):Play()
end
ApplyGlass(1)
else
ad(aC,0.12,{ImageTransparency=1}):Play()
ab.SetThemeTag(av,{ImageColor3="Text"},0.12)
ad(av,0.12,{ImageTransparency=0.82}):Play()
if au then
ad(au,0.12,{ImageTransparency=1}):Play()
end
ApplyGlass(0)
end

h=h~=false
if ak and h then
task.spawn(function()
ab.SafeCallback(ak,g)
end)
end
end


local f,g

function an.Animate(h,i,m)
if am.Window.IsToggleDragging then return end
am.Window.IsToggleDragging=true

local p=i.Position.X
local r=aB.Position.X.Offset
local u=false


ad(aA.ThumbScale,0.22,{Scale=1.45},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ax,0.22,{ImageTransparency=0.82}):Play()

if f then f:Disconnect()end
f=af.InputChanged:Connect(function(v)
if not am.Window.IsToggleDragging then return end
if v.UserInputType~=Enum.UserInputType.MouseMovement
and v.UserInputType~=Enum.UserInputType.Touch then return end

local x=v.Position.X-p
if math.abs(x)>5 then u=true end

local z=math.clamp(r+x,d,b)
local A=(z-d)/(b-d)
ApplyGlass(A)

ad(aB,0.10,{
Position=UDim2.new(0,z,0.5,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

if g then g:Disconnect()end
g=af.InputEnded:Connect(function(v)
if not am.Window.IsToggleDragging then return end
if v.UserInputType~=Enum.UserInputType.MouseButton1
and v.UserInputType~=Enum.UserInputType.Touch then return end

am.Window.IsToggleDragging=false
if f then f:Disconnect();f=nil end
if g then g:Disconnect();g=nil end
am.WindUI.CurrentInput=nil


ad(aA.ThumbScale,0.20,{Scale=1},
Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ad(ax,0.20,{ImageTransparency=0}):Play()

if not u then
m:Set(not m.Value,true,false)
else
local x=aB.Position.X.Offset
local z=x+aq/2
m:Set(z>ao/2,true,false)
end
end)
end

return aG,an
end

return aa end function a.F()

local aa={}

local ab=a.load'd'local ac=
ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj)
local ak={}

af=af or"sfsymbols:checkmark"

local al=9

local am=ab.Image(
af,
af,
0,
(aj and aj.Window.Folder or"Temp"),
"Checkbox",
true,
false,
"CheckboxIcon"
)
am.Size=UDim2.new(1,-26+ag,1,-26+ag)
am.AnchorPoint=Vector2.new(0.5,0.5)
am.Position=UDim2.new(0.5,0,0.5,0)


local an=ab.NewRoundFrame(al,"Squircle",{
ImageTransparency=.85,
ThemeTag={
ImageColor3="Text"
},
Parent=ah,
Size=UDim2.new(0,26,0,26),
},{
ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Checkbox",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(al,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ThemeTag={
ImageColor3="CheckboxBorder",
ImageTransparency="CheckboxBorderTransparency",
},
},{







}),

am,
},true)

function ak.Set(ao,ap)
if ap then
ad(an.Layer,0.06,{
ImageTransparency=0,
}):Play()



ad(am.ImageLabel,0.06,{
ImageTransparency=0,
}):Play()
else
ad(an.Layer,0.05,{
ImageTransparency=1,
}):Play()



ad(am.ImageLabel,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if ai then
ab.SafeCallback(ai,ap)
end
end)
end

return an,ak
end


return aa end function a.G()
local aa=a.load'd'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'E'.New
local ae=a.load'F'.New

local af={}

function af.New(ag,ah)
local ai={
__type="Toggle",
Title=ah.Title or"Toggle",
Desc=ah.Desc or nil,
Locked=ah.Locked or false,
LockedTitle=ah.LockedTitle,
Value=ah.Value,
Icon=ah.Icon or nil,
IconSize=ah.IconSize or 23,
Type=ah.Type or"Toggle",
Callback=ah.Callback or function()end,
UIElements={},
}
ai.ToggleFrame=a.load'C'{
Title=ai.Title,
Desc=ai.Desc,




Window=ah.Window,
Parent=ah.Parent,
TextOffset=(52),
Hover=false,
Tab=ah.Tab,
Index=ah.Index,
ElementTable=ai,
ParentConfig=ah,
Tags=ah.Tags,
}

local aj=true

if ai.Value==nil then
ai.Value=false
end

function ai.Lock(ak)
ai.Locked=true
aj=false
return ai.ToggleFrame:Lock(ai.LockedTitle)
end
function ai.Unlock(ak)
ai.Locked=false
aj=true
return ai.ToggleFrame:Unlock()
end

if ai.Locked then
ai:Lock()
end

local ak=ai.Value

local al,am
if ai.Type=="Toggle"then
al,am=ad(
ak,
ai.Icon,
ai.IconSize,
ai.ToggleFrame.UIElements.Main,
ai.Callback,
ah.Window.NewElements,
ah
)
elseif ai.Type=="Checkbox"then
al,am=ae(
ak,
ai.Icon,
ai.IconSize,
ai.ToggleFrame.UIElements.Main,
ai.Callback,
ah
)
else
error("Unknown Toggle Type: "..tostring(ai.Type))
end

al.AnchorPoint=Vector2.new(1,ah.Window.NewElements and 0 or 0.5)
al.Position=UDim2.new(1,0,ah.Window.NewElements and 0 or 0.5,0)

function ai.Set(an,ao,ap,aq)
if aj then
am:Set(ao,ap,aq or false)
ak=ao
ai.Value=ao
end
end

ai:Set(ak,false,ah.Window.NewElements)

local an=ah.WindUI.GenerateGUID()

if ah.Window.NewElements and am.Animate then
if ai.Type=="Toggle"then
aa.AddSignal(al.ToggleFrame.Hitbox.InputBegan,function(ao)
if
not ah.Window.IsToggleDragging
and(
ao.UserInputType==Enum.UserInputType.MouseButton1
or ao.UserInputType==Enum.UserInputType.Touch
)
then
if ah.WindUI.CurrentInput and ah.WindUI.CurrentInput~=an then
return
end

ah.WindUI.CurrentInput=an
am:Animate(ao,ai)
end
end)
end





else
if ai.Type=="Toggle"then
aa.AddSignal(al.ToggleFrame.Hitbox.MouseButton1Click,function()
ai:Set(not ai.Value,nil,ah.Window.NewElements)
end)
elseif ai.Type=="Checkbox"then
aa.AddSignal(al.MouseButton1Click,function()
ai:Set(not ai.Value,nil,ah.Window.NewElements)
end)
end
end

return ai.__type,ai
end

return af end function a.H()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ac=aa(game:GetService"UserInputService")
local ad=aa(game:GetService"RunService")

local ae=a.load'd'
local af=ae.New
local ag=ae.Tween

local ah={}

local ai=false

function ah.New(aj,ak)
local al={
__type="Slider",
Title=ak.Title or nil,
Desc=ak.Desc or nil,
Locked=ak.Locked or nil,
LockedTitle=ak.LockedTitle,
Value=ak.Value or{},
Icons=ak.Icons or nil,
IsTooltip=ak.IsTooltip or false,
IsTextbox=ak.IsTextbox,
Step=ak.Step or 1,
Callback=ak.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=ak.Width or 130,
TextBoxWidth=ak.Window.NewElements and 40 or 30,
ThumbSize=13,
IconSize=26,
}
if al.Icons=={}then
al.Icons={
From="sfsymbols:sunMinFill",
To="sfsymbols:sunMaxFill",
}
end
if al.IsTextbox==nil and al.Title==nil then
al.IsTextbox=false
else
al.IsTextbox=al.IsTextbox~=false
end

local am
local an
local ao
local ap=al.Value.Default or al.Value.Min or 0

local aq=ap
local ar=(ap-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0))

local as=true
local at=al.Step%1~=0

local function FormatValue(au)
if at then
return tonumber(string.format("%.2f",au))
end
return math.floor(au+0.5)
end

local function CalculateValue(au)
if at then
return math.floor(au/al.Step+0.5)*al.Step
else
return math.floor(au/al.Step+0.5)*al.Step
end
end

local au,av
local aw=32
if al.Icons then
if al.Icons.From then
au=ae.Image(
al.Icons.From,
al.Icons.From,
0,
ak.Window.Folder,
"SliderIconFrom",
true,
true,
"SliderIconFrom"
)
au.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
aw=aw+al.IconSize-2
end
if al.Icons.To then
av=ae.Image(
al.Icons.To,
al.Icons.To,
0,
ak.Window.Folder,
"SliderIconTo",
true,
true,
"SliderIconTo"
)
av.Size=UDim2.new(0,al.IconSize,0,al.IconSize)
aw=aw+al.IconSize-2
end
end
al.SliderFrame=a.load'C'{
Title=al.Title,
Desc=al.Desc,
Parent=ak.Parent,
TextOffset=al.Width,
Hover=false,
Tab=ak.Tab,
Index=ak.Index,
Window=ak.Window,
ElementTable=al,
ParentConfig=ak,
Tags=ak.Tags,
}

al.UIElements.SliderIcon=ae.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.95,
Size=UDim2.new(1,not al.IsTextbox and-aw or(-al.TextBoxWidth-8),0,4),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
ae.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(ar,0,1,0),
ImageTransparency=0.1,
ThemeTag={
ImageColor3="Slider",
},
},{
ae.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(
0,
ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize+2),
0,
ak.Window.NewElements and(al.ThumbSize+4)or(al.ThumbSize+2)
),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="SliderThumb",
},
Name="Thumb",
},{
ae.NewRoundFrame(999,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
Name="Highlight",
ImageTransparency=0.5,
}),
}),
}),
})

al.UIElements.SliderContainer=af("Frame",{
Size=UDim2.new(al.Title==nil and 1 or 0,al.Title==nil and 0 or al.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,al.IsTextbox and(ak.Window.NewElements and-16 or 0)or 0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=al.SliderFrame.UIElements.Main,
},{
af("UIListLayout",{
Padding=UDim.new(0,al.Title~=nil and 8 or 12),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=al.Icons
and(al.Icons.From and(al.Icons.To and"Center"or"Left")or al.Icons.To and"Right")
or"Center",
}),
au,
al.UIElements.SliderIcon,
av,
af("TextBox",{
Size=UDim2.new(0,al.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(ap),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
Visible=al.IsTextbox,
}),
})

local ax
if al.IsTooltip then
ax=a.load'A'.New(
ap,
al.UIElements.SliderIcon.Frame.Thumb,
true,
"Secondary",
"Small",
false
)
ax.Container.AnchorPoint=Vector2.new(0.5,1)
ax.Container.Position=UDim2.new(0.5,0,0,-8)
end

function al.Lock(ay)
al.Locked=true
as=false
return al.SliderFrame:Lock(al.LockedTitle)
end
function al.Unlock(ay)
al.Locked=false
as=true
return al.SliderFrame:Unlock()
end

if al.Locked then
al:Lock()
end


local ay=ak.Tab.UIElements.ContainerFrame

function al.Set(az,aA,aB)
if as then
if
not al.IsFocusing
and not ai
and(
not aB
or(
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
)
)
then
if aB then
am=(aB.UserInputType==Enum.UserInputType.Touch)
ay.ScrollingEnabled=false
ai=true

local aC=am and aB.Position.X or ac:GetMouseLocation().X
local aD=math.clamp(
(aC-al.UIElements.SliderIcon.AbsolutePosition.X)
/al.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aA=CalculateValue(al.Value.Min+aD*(al.Value.Max-al.Value.Min))
aA=math.clamp(aA,al.Value.Min or 0,al.Value.Max or 100)

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(aD,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then
ax.TitleFrame.Text=FormatValue(aA)
end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end

an=ad.RenderStepped:Connect(function()
local aE=am and aB.Position.X or ac:GetMouseLocation().X
local aF=math.clamp(
(aE-al.UIElements.SliderIcon.AbsolutePosition.X)
/al.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aA=CalculateValue(al.Value.Min+aF*(al.Value.Max-al.Value.Min))

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(aF,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then
ax.TitleFrame.Text=FormatValue(aA)
end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end
end)


ao=ac.InputEnded:Connect(function(aE)
if
(
aE.UserInputType==Enum.UserInputType.MouseButton1
or aE.UserInputType==Enum.UserInputType.Touch
)and aB==aE
then
an:Disconnect()
ao:Disconnect()
ai=false
ay.ScrollingEnabled=true

ak.WindUI.CurrentInput=nil

if ak.Window.NewElements then
ag(al.UIElements.SliderIcon.Frame.Thumb,0.2,{
ImageTransparency=0,
Size=UDim2.new(
0,
ak.Window.NewElements and(al.ThumbSize*2)or(al.ThumbSize+2),
0,
ak.Window.NewElements and(al.ThumbSize+4)or(al.ThumbSize+2)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end
if ax then
ax:Close(false)
end
end
end)
else
aA=math.clamp(aA,al.Value.Min or 0,al.Value.Max or 100)

local aC=math.clamp(
(aA-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0)),
0,
1
)
aA=CalculateValue(al.Value.Min+aC*(al.Value.Max-al.Value.Min))

if aA~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(aC,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aA)
if ax then
ax.TitleFrame.Text=FormatValue(aA)
end
al.Value.Default=FormatValue(aA)
aq=aA
ae.SafeCallback(al.Callback,FormatValue(aA))
end
end
end
end
end

function al.SetMax(az,aA)
al.Value.Max=aA

local aB=tonumber(al.Value.Default)or aq
if aB>aA then
al:Set(aA)
else
local aC=
math.clamp((aB-(al.Value.Min or 0))/(aA-(al.Value.Min or 0)),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(aC,0,1,0)}):Play()
end
end

function al.SetMin(az,aA)
al.Value.Min=aA

local aB=tonumber(al.Value.Default)or aq
if aB<aA then
al:Set(aA)
else
local aC=math.clamp((aB-aA)/((al.Value.Max or 100)-aA),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(aC,0,1,0)}):Play()
end
end

ae.AddSignal(al.UIElements.SliderContainer.TextBox.FocusLost,function(az)
local aA=tonumber(al.UIElements.SliderContainer.TextBox.Text)
if aA then
al:Set(aA)
else
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aq)
if ax then
ax.TitleFrame.Text=FormatValue(aq)
end
end
end)

local az=ak.WindUI.GenerateGUID()

ae.AddSignal(al.UIElements.SliderContainer.InputBegan,function(aA)
if al.Locked or ai then
return
end
if
aA.UserInputType==Enum.UserInputType.MouseButton1
or aA.UserInputType==Enum.UserInputType.Touch
then
if ak.WindUI.CurrentInput and ak.WindUI.CurrentInput~=az then
return
end
ak.WindUI.CurrentInput=az

al:Set(ap,aA)


if ak.Window.NewElements then
ag(al.UIElements.SliderIcon.Frame.Thumb,0.24,{
ImageTransparency=0.85,
Size=UDim2.new(
0,
(ak.Window.NewElements and(al.ThumbSize*2)or al.ThumbSize)+8,
0,
al.ThumbSize+8
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
if ax then
ax:Open()
end

end
end)

return al.__type,al
end

return ah end function a.I()

local aa=a.load'd'
local ac=aa.New
local ad=aa.Tween

local ae={}

local function ToFiniteNumber(af)
local ag=tonumber(af)
if ag==nil or ag~=ag or math.abs(ag)==math.huge then
return nil
end

return ag
end

local function FormatNumber(af)
if af%1==0 then
return tostring(af)
end

return tostring(tonumber(string.format("%.2f",af)))
end

function ae.New(af,ag)
local ah=typeof(ag.Value)=="table"and ag.Value or{}
local ai=ToFiniteNumber(ah.Min)or ToFiniteNumber(ag.Min)or 0
local aj=ToFiniteNumber(ah.Max)or ToFiniteNumber(ag.Max)or 100

if ai>aj then
ai,aj=aj,ai
end

local ak=typeof(ag.Value)=="number"and ag.Value
or ToFiniteNumber(ah.Default)
or ToFiniteNumber(ag.Default)
or ai
ak=ToFiniteNumber(ak)or ai

local al=ag.Indeterminate==true

local am=ag.ShowValue
if am==nil then
am=not al
end

local an=math.max(ToFiniteNumber(ag.ValueWidth)or 44,0)

local ao={
__type="ProgressBar",
Title=ag.Title or"Progress",
Desc=ag.Desc or nil,
Value={
Min=ai,
Max=aj,
Default=math.clamp(ak,ai,aj),
},
ShowValue=am,
DisplayMode=ag.DisplayMode or"Percent",
Format=ag.Format,
Animate=ag.Animate~=false,
AnimationDuration=math.max(ToFiniteNumber(ag.AnimationDuration)or 0.15,0),
Indeterminate=al,
IndeterminateText=ag.IndeterminateText or"",
Speed=math.max(ToFiniteNumber(ag.Speed)or 1,0.01),
ControlGap=math.max(ToFiniteNumber(ag.ControlGap)or 16,0),
UIElements={},

Width=math.max(ToFiniteNumber(ag.Width)or 160,0),
ValueWidth=an,
}

local function GetRatio(ap)
if ao.Value.Max==ao.Value.Min then
return ap>=ao.Value.Max and 1 or 0
end

return math.clamp((ap-ao.Value.Min)/(ao.Value.Max-ao.Value.Min),0,1)
end

local function GetValueText(ap,aq)
if ao.Indeterminate then
return tostring(ao.IndeterminateText)
end

local ar=aq*100

if typeof(ao.Format)=="function"then
local as,at=
pcall(ao.Format,ap,ar,ao.Value.Min,ao.Value.Max)

if as and at~=nil then
return tostring(at)
end
end

if ao.DisplayMode=="Value"then
return FormatNumber(ap)
elseif ao.DisplayMode=="Fraction"then
return FormatNumber(ap).."/"..FormatNumber(ao.Value.Max)
end

return tostring(math.floor(ar+0.5)).."%"
end

ao.ProgressBarFrame=a.load'C'{
Title=ao.Title,
Desc=ao.Desc,
Parent=ag.Parent,
TextOffset=ao.Width+ao.ControlGap,
Hover=false,
Tab=ag.Tab,
Index=ag.Index,
Window=ag.Window,
ElementTable=ao,
ParentConfig=ag,
Tags=ag.Tags,
}

ao.UIElements.Fill=aa.NewRoundFrame(99,"Squircle",{
Name="Fill",
Size=ao.Indeterminate and UDim2.new(0.3,0,1,0)
or UDim2.new(GetRatio(ao.Value.Default),0,1,0),
Position=ao.Indeterminate and UDim2.new(-0.3,0,0,0)or UDim2.new(0,0,0,0),
ThemeTag={
ImageColor3="ProgressBar",
},
})

ao.UIElements.Bar=aa.NewRoundFrame(99,"Squircle",{
Name="Bar",
Size=UDim2.new(1,ao.ShowValue and-(ao.ValueWidth+8)or 0,0,6),
ClipsDescendants=true,
ImageTransparency=0.9,
ThemeTag={
ImageColor3="ProgressBarTrack",
ImageTransparency="ProgressBarTrackTransparency",
},
},{
ao.UIElements.Fill,
})

ao.UIElements.Value=ac("TextLabel",{
Name="Value",
Size=UDim2.new(0,ao.ValueWidth,0,20),
BackgroundTransparency=1,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Text=GetValueText(ao.Value.Default,GetRatio(ao.Value.Default)),
TextSize=14,
TextTransparency=0.25,
TextTruncate="AtEnd",
TextXAlignment="Right",
Visible=ao.ShowValue,
ThemeTag={
TextColor3="ProgressBarText",
},
})

ao.UIElements.Container=ac("Frame",{
Name="ProgressBarContainer",
Size=UDim2.new(0,ao.Width,0,36),
Position=UDim2.new(1,0,ag.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ag.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ao.ProgressBarFrame.UIElements.Main,
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Right",
VerticalAlignment="Center",
}),
ao.UIElements.Bar,
ao.UIElements.Value,
})

if ao.Indeterminate then
local ap=ad(
ao.UIElements.Fill,
1/ao.Speed,
{Position=UDim2.new(1,0,0,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut,-1

)
aa.AddSignal(ao.UIElements.Bar.Destroying,function()
ap:Cancel()
end)
ap:Play()
end

local function Update(ap,aq)
local ar=ToFiniteNumber(ap)
if ar==nil then
return ao.Value.Default
end

ar=math.clamp(ar,ao.Value.Min,ao.Value.Max)
ao.Value.Default=ar

local as=GetRatio(ar)
local at=UDim2.new(as,0,1,0)

if ao.UIElements.Fill and not ao.Indeterminate then
if aq or not ao.Animate or ao.AnimationDuration<=0 then
ao.UIElements.Fill.Size=at
else
ad(
ao.UIElements.Fill,
ao.AnimationDuration,
{Size=at},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end

ao.UIElements.Value.Text=GetValueText(ar,as)

return ar
end

function ao.Set(ap,aq)
return Update(aq,false)
end

function ao.Get(ap)
return ao.Value.Default
end

function ao.GetPercentage(ap)
return GetRatio(ao.Value.Default)*100
end

function ao.SetRange(ap,aq,ar)
aq=ToFiniteNumber(aq)
ar=ToFiniteNumber(ar)

if aq==nil or ar==nil then
return ao.Value.Min,ao.Value.Max
end

if aq>ar then
aq,ar=ar,aq
end

ao.Value.Min=aq
ao.Value.Max=ar
Update(ao.Value.Default,false)

return aq,ar
end

function ao.SetMin(ap,aq)
aq=ToFiniteNumber(aq)
if aq==nil then
return ao.Value.Min
end

ao:SetRange(aq,math.max(aq,ao.Value.Max))
return ao.Value.Min
end

function ao.SetMax(ap,aq)
aq=ToFiniteNumber(aq)
if aq==nil then
return ao.Value.Max
end

ao:SetRange(math.min(ao.Value.Min,aq),aq)
return ao.Value.Max
end

Update(ao.Value.Default,true)

return ao.__type,ao
end

return ae end function a.J()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ac=aa(game:GetService"UserInputService")

local ad=a.load'd'
local ae=ad.New local af=
ad.Tween

local ag={
UICorner=6,
UIPadding=8,
}

local ah=a.load'v'.New

function ag.New(ai,aj)
local function NormalizeKeyCode(ak)
if typeof(ak)=="EnumItem"then
return ak.Name
elseif type(ak)=="string"then
return ak
else
return"F"
end
end

local ak={
__type="Keybind",
Title=aj.Title or"Keybind",
Desc=aj.Desc or nil,
Locked=aj.Locked or false,
LockedTitle=aj.LockedTitle,
Value=NormalizeKeyCode(aj.Value)or"F",
Callback=aj.Callback or function()end,
CanChange=aj.CanChange~=false,
Blacklist=aj.Blacklist or{},
Picking=false,
UIElements={},
}

local al={}

for am,an in next,ak.Blacklist do
table.insert(al,Enum.KeyCode[NormalizeKeyCode(an)])
end
table.insert(al,Enum.KeyCode[NormalizeKeyCode"Escape"])

local ao=true

ak.KeybindFrame=a.load'C'{
Title=ak.Title,
Desc=ak.Desc,
Parent=aj.Parent,
TextOffset=85,
Hover=ak.CanChange,
Tab=aj.Tab,
Index=aj.Index,
Window=aj.Window,
ElementTable=ak,
ParentConfig=aj,
Tags=aj.Tags,
}

ak.UIElements.Keybind=ah(
ak.Value,
nil,
ak.KeybindFrame.UIElements.Main,
nil,
aj.Window.NewElements and 12 or 10
)

ak.UIElements.Keybind.Size=
UDim2.new(0,24+ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
ak.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
ak.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)
ak.UIElements.Keybind.Interactable=false

ae("UIScale",{
Parent=ak.UIElements.Keybind,
Scale=0.85,
})

ad.AddSignal(
ak.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",
function()
ak.UIElements.Keybind.Size=
UDim2.new(0,24+ak.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
end
)

function ak.Lock(ap)
ak.Locked=true
ao=false
return ak.KeybindFrame:Lock(ak.LockedTitle)
end
function ak.Unlock(ap)
ak.Locked=false
ao=true
return ak.KeybindFrame:Unlock()
end

function ak.Set(ap,aq)
local ar=NormalizeKeyCode(aq)
ak.Value=ar
ak.UIElements.Keybind.Frame.Frame.TextLabel.Text=ar
end

if ak.Locked then
ak:Lock()
end

local ap

ad.AddSignal(ak.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if ao then
if ak.CanChange then
ak.Picking=true
ak.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."



local aq
aq=ac.InputBegan:Connect(function(ar)
local as

if ar.UserInputType==Enum.UserInputType.Keyboard then
if table.find(al,ar.KeyCode)then
as=nil
return
else
as=ar.KeyCode.Name
end
elseif
ar.UserInputType==Enum.UserInputType.MouseButton1
and not table.find(al,"MouseLeftButton")
then
as="MouseLeftButton"
elseif
ar.UserInputType==Enum.UserInputType.MouseButton2
and not table.find(al,"MouseRightButton")
then
as="MouseRightButton"
end

if ap then
ap:Disconnect()
end

ap=ac.InputEnded:Connect(function(at)
if
as
and(
at.KeyCode.Name==as
or as=="MouseLeft"and at.UserInputType==Enum.UserInputType.MouseButton1
or as=="MouseRight"and at.UserInputType==Enum.UserInputType.MouseButton2
)
then
ak.Picking=false

ak.UIElements.Keybind.Frame.Frame.TextLabel.Text=as
ak.Value=as

aq:Disconnect()
ap:Disconnect()
end
end)
end)
end
end
end)

ad.AddSignal(ac.InputBegan,function(aq,ar)
if ac:GetFocusedTextBox()then
return
end
if not ao then
return
end
if ak.Picking then
return
end

if aq.UserInputType==Enum.UserInputType.Keyboard then
if aq.KeyCode.Name==ak.Value then
ad.SafeCallback(ak.Callback,aq.KeyCode.Name)
end
elseif aq.UserInputType==Enum.UserInputType.MouseButton1 and ak.Value=="MouseLeft"then
ad.SafeCallback(ak.Callback,"MouseLeft")
elseif aq.UserInputType==Enum.UserInputType.MouseButton2 and ak.Value=="MouseRight"then
ad.SafeCallback(ak.Callback,"MouseRight")
end
end)

return ak.__type,ak
end

return ag end function a.K()

local aa=a.load'd'local ac=
aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'l'

.New
local ag=a.load'm'.New

function ae.New(ah,ai)
local aj={
__type="Input",
Title=ai.Title or"Input",
Desc=ai.Desc or nil,
Type=ai.Type or"Input",
Locked=ai.Locked or false,
LockedTitle=ai.LockedTitle,
InputIcon=ai.InputIcon or false,
Placeholder=ai.Placeholder or"Enter Text...",
Value=ai.Value or"",
Callback=ai.Callback or function()end,
ClearTextOnFocus=ai.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local ak=true

aj.InputFrame=a.load'C'{
Title=aj.Title,
Desc=aj.Desc,
Parent=ai.Parent,
TextOffset=aj.Width,
Hover=false,
Tab=ai.Tab,
Index=ai.Index,
Window=ai.Window,
ElementTable=aj,
ParentConfig=ai,
Tags=ai.Tags,
}

local al=ag(
aj.Placeholder,
aj.InputIcon,
aj.Type=="Textarea"and aj.InputFrame.UIElements.Container or aj.InputFrame.UIElements.Main,
aj.Type,
function(al)
aj:Set(al,true)
end,
nil,
ai.Window.NewElements and 12 or 10,
aj.ClearTextOnFocus
)

if aj.Type~="Textarea"then
al.Size=UDim2.new(0,aj.Width,0,36)
al.Position=UDim2.new(1,0,ai.Window.NewElements and 0 or 0.5,0)
al.AnchorPoint=Vector2.new(1,ai.Window.NewElements and 0 or 0.5)
else
al.Size=UDim2.new(1,0,0,148)
end






function aj.Lock(am)
aj.Locked=true
ak=false
return aj.InputFrame:Lock(aj.LockedTitle)
end
function aj.Unlock(am)
aj.Locked=false
ak=true
return aj.InputFrame:Unlock()
end

function aj.Set(am,an,ao)
if ak then
aj.Value=an
aa.SafeCallback(aj.Callback,an)

if not ao then
al.Frame.Frame.TextBox.Text=an
end
end
end

function aj.SetPlaceholder(am,an)
al.Frame.Frame.TextBox.PlaceholderText=an
aj.Placeholder=an
end

aj:Set(aj.Value)

if aj.Locked then
aj:Lock()
end

return aj.__type,aj
end

return ae end function a.L()





local aa={}

local ae=a.load'd'
local af=ae.New
local ag=ae.Tween

local ah=(cloneref or clonereference or function(ah)return ah end)
local ai=ah(game:GetService"UserInputService")

local aj=12
local ak=34
local al=180
local am=6

function aa.New(an,ao,ap,aq,ar,as,at,au,av,aw)
an=an or{}
aq=aq or"Select..."
ap=ap==true

local ax={
Options=an,
Value=ap and{}or nil,
Opened=false,
Disabled=false,
}


if ao then
if ap then
if type(ao)=="table"then
for ay,az in ipairs(ao)do ax.Value[az]=true end
else
ax.Value[ao]=true
end
else
ax.Value=ao
end
end


local function GetLabel()
if ap then
local ay={}
for az,aA in pairs(ax.Value)do
if aA then table.insert(ay,tostring(az))end
end
if#ay==0 then return aq end
table.sort(ay)
return table.concat(ay,", ")
else
return ax.Value~=nil and tostring(ax.Value)or aq
end
end


local ay=ae.Icon"chevron-down"
local az=af("ImageLabel",{
Size=UDim2.new(0,14,0,14),
BackgroundTransparency=1,
Image=ay and ay[1]or"",
ImageRectSize=ay and ay[2].ImageRectSize or Vector2.new(0,0),
ImageRectOffset=ay and ay[2].ImageRectPosition or Vector2.new(0,0),
ThemeTag={ImageColor3="Icon"},
ImageTransparency=0.45,
Name="Chevron",
})


local aA=af("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,1,0),
TextXAlignment="Left",
ThemeTag={TextColor3="Text"},
TextTransparency=ax.Value~=nil and 0.15 or 0.5,
TextSize=ae.Type.BodyLG,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
TextTruncate=Enum.TextTruncate.AtEnd,
Text=GetLabel(),
Name="Value",
})


local aB=ae.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,0,38),
ImageTransparency=0.84,
ThemeTag={ImageColor3="ElementBackground"},
Name="Header",
},{
ae.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={ImageColor3="Outline"},
ImageTransparency=0.88,
Name="Outline",
}),
af("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Text="",
Name="HitBox",
},{
aA,
az,
af("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Right",
SortOrder="LayoutOrder",
Padding=UDim.new(0,6),
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,10),
}),
}),
})


local aC=af("TextBox",{
Size=UDim2.new(1,0,0,32),
BackgroundTransparency=1,
PlaceholderText="Search...",
Text="",
TextXAlignment="Left",
ThemeTag={TextColor3="Text",PlaceholderColor3="SubText"},
TextTransparency=0.15,
TextSize=ae.Type.BodyMD,
FontFace=Font.new(ae.Font,Enum.FontWeight.Regular),
ClearTextOnFocus=false,
Name="Search",
},{
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
}),
ae.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,1,0),
ZIndex=-1,
ThemeTag={ImageColor3="ElementBackground"},
ImageTransparency=0.78,
}),
})


local aD=af("ScrollingFrame",{
Size=UDim2.new(1,0,1,-38),
BackgroundTransparency=1,
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollBarThickness=3,
ScrollBarImageColor3=Color3.new(1,1,1),
ScrollBarImageTransparency=0.7,
ScrollingDirection="Y",
Name="List",
},{
af("UIListLayout",{
Padding=UDim.new(0,2),
SortOrder="LayoutOrder",
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,6),
PaddingRight=UDim.new(0,6),
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,4),
}),
})


local aE=ae.NewRoundFrame(aj,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0,0,1,am),
ThemeTag={ImageColor3="ElementBackground"},
ImageTransparency=0.06,
ClipsDescendants=false,
Visible=false,
ZIndex=99,
Name="Popup",
},{
ae.NewRoundFrame(aj,"SquircleOutline",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={ImageColor3="Outline"},
ImageTransparency=0.82,
}),
af("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Inner",
ClipsDescendants=true,
},{
aC,
aD,
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,4),
}),
af("UIPadding",{
PaddingTop=UDim.new(0,6),
PaddingBottom=UDim.new(0,6),
}),
}),
})

local aF=af("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,38),
AutomaticSize="None",
ClipsDescendants=false,
Parent=as,
Name="Dropdown",
},{
aB,
aE,
})


local function SyncLabel()
local aG=GetLabel()
aA.Text=aG
aA.TextTransparency=aG==aq and 0.5 or 0.15
end


local aG={}

local function BuildItems(b)

for d,f in pairs(aG)do f:Destroy()end
aG={}

for g,h in ipairs(ax.Options)do
local i=tostring(h)
local m=i:lower()
local p=b and b:lower()or""
if p~=""and not m:find(p,1,true)then continue end


local function IsSelected()
if ap then return ax.Value[h]==true
else return ax.Value==h end
end

local r=ae.Icon"check"
local u=af("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
Image=r and r[1]or"",
ImageRectSize=r and r[2].ImageRectSize or Vector2.new(0,0),
ImageRectOffset=r and r[2].ImageRectPosition or Vector2.new(0,0),
ThemeTag={ImageColor3="Toggle"},
ImageTransparency=IsSelected()and 0 or 1,
Name="Check",
LayoutOrder=999,
})

local v=af("TextLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,-26,1,0),
TextXAlignment="Left",
ThemeTag={TextColor3="Text"},
TextTransparency=IsSelected()and 0.05 or 0.25,
TextSize=ae.Type.BodyMD,
FontFace=Font.new(ae.Font,
IsSelected()and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium),
Text=i,
TextTruncate=Enum.TextTruncate.AtEnd,
})

local x=ae.NewRoundFrame(aj-4,"Squircle",{
Size=UDim2.new(1,0,0,ak),
ThemeTag={ImageColor3="ElementBackground"},
ImageTransparency=IsSelected()and 0.72 or 1,
Name="Item_"..g,
},{
af("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Text="",
Name="Hit",
},{
v,
u,
af("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,8),
}),
af("UIPadding",{
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,8),
}),
}),
})


x.Hit.MouseEnter:Connect(function()
ag(x,ae.Anim.Fast,{
ImageTransparency=IsSelected()and 0.60 or 0.82,
}):Play()
end)
x.Hit.MouseLeave:Connect(function()
ag(x,ae.Anim.Fast,{
ImageTransparency=IsSelected()and 0.72 or 1,
}):Play()
end)


ae.AddSignal(x.Hit.MouseButton1Click,function()
if ax.Disabled then return end
if ap then
ax.Value[h]=not ax.Value[h]
local z=ax.Value[h]
ag(u,ae.Anim.Fast,{ImageTransparency=z and 0 or 1}):Play()
ag(x,ae.Anim.Fast,{ImageTransparency=z and 0.72 or 1}):Play()
v.TextTransparency=z and 0.05 or 0.25
v.FontFace=Font.new(ae.Font,
z and Enum.FontWeight.SemiBold or Enum.FontWeight.Medium)
else
ax.Value=h

for z,A in pairs(aG)do
if A~=x then
ag(A,ae.Anim.Fast,{ImageTransparency=1}):Play()
if A:FindFirstChild"Hit"then
local F=A.Hit:FindFirstChildOfClass"TextLabel"
local G=A.Hit:FindFirstChild"Check"
if F then F.TextTransparency=0.25;F.FontFace=Font.new(ae.Font,Enum.FontWeight.Medium)end
if G then ag(G,ae.Anim.Fast,{ImageTransparency=1}):Play()end
end
end
end
ag(x,ae.Anim.Fast,{ImageTransparency=0.72}):Play()
ag(u,ae.Anim.Fast,{ImageTransparency=0}):Play()
v.TextTransparency=0.05
v.FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold)
end
SyncLabel()
ae.SafeCallback(at,ap and ax.Value or ax.Value)
end)

x.Parent=aD
table.insert(aG,x)
end
end

BuildItems()


aC:GetPropertyChangedSignal"Text":Connect(function()
BuildItems(aC.Text)
end)


local function CalcPopupH()
local b=#aG
return math.clamp(b*(ak+2)+38+14,42,al)
end

local function OpenPopup()
if ax.Opened or ax.Disabled then return end
ax.Opened=true
aE.Visible=true
aE.ZIndex=99

local b=CalcPopupH()
ag(aE,ae.Anim.Normal,{
Size=UDim2.new(1,0,0,b),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ag(aE,ae.Anim.Fast,{ImageTransparency=0.06}):Play()
ag(az,ae.Anim.Normal,{
Rotation=180,ImageTransparency=0.15,
}):Play()
end

local function ClosePopup()
if not ax.Opened then return end
ax.Opened=false
ag(aE,ae.Anim.Normal,{
Size=UDim2.new(1,0,0,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ag(aE,ae.Anim.Fast,{ImageTransparency=1}):Play()
ag(az,ae.Anim.Normal,{
Rotation=0,ImageTransparency=0.45,
}):Play()
task.delay(ae.Anim.Normal,function()
if not ax.Opened then
aE.Visible=false
end
end)
aC.Text=""
end

ae.AddSignal(aB.HitBox.MouseButton1Click,function()
if ax.Opened then ClosePopup()else OpenPopup()end
end)


ae.AddSignal(ai.InputBegan,function(b)
if b.UserInputType~=Enum.UserInputType.MouseButton1 then return end
if not ax.Opened then return end
local d=b.Position
local f=aE.AbsolutePosition
local g=aE.AbsoluteSize
if d.X<f.X or d.X>f.X+g.X
or d.Y<f.Y or d.Y>f.Y+g.Y then
ClosePopup()
end
end)


aB.HitBox.MouseEnter:Connect(function()
ag(aB,ae.Anim.Fast,{ImageTransparency=0.72}):Play()
end)
aB.HitBox.MouseLeave:Connect(function()
ag(aB,ae.Anim.Fast,{ImageTransparency=0.84}):Play()
end)


local b={}

function b.SetOptions(d,f)
ax.Options=f or{}
BuildItems(aC.Text)
end

function b.SetValue(d,f)
if ap then
if type(f)=="table"then
ax.Value={}
for g,h in ipairs(f)do ax.Value[h]=true end
end
else
ax.Value=f
end
SyncLabel()
BuildItems(aC.Text)
end

function b.GetValue(d)
return ax.Value
end

function b.SetDisabled(d,f)
ax.Disabled=f
ag(aB,ae.Anim.Normal,{
ImageTransparency=f and 0.55 or 0.84,
}):Play()
ag(aA,ae.Anim.Normal,{
TextTransparency=f and 0.6 or(ax.Value~=nil and 0.15 or 0.5),
}):Play()
end

function b.Open(d)OpenPopup()end
function b.Close(d)ClosePopup()end

aF._API=b
return aF
end

return aa end function a.M()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")
aa(game:GetService"Players").LocalPlayer:GetMouse()local ae=
aa(game:GetService"Workspace").CurrentCamera

local af=a.load'd'
local ag=af.New local ah=
af.Tween

local ai=a.load'v'.New local aj=a.load'm'
.New
local ak=a.load'L'.New local al=

workspace.CurrentCamera

local am={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
SearchBarHeight=39,
TabIcon=18,
}

function am.New(an,ao)
local ap={
__type="Dropdown",
Title=ao.Title or"Dropdown",
Desc=ao.Desc or nil,
Locked=ao.Locked or false,
LockedTitle=ao.LockedTitle,
Values=ao.Values or{},
MenuWidth=ao.MenuWidth or 180,
Value=ao.Value,
AllowNone=ao.AllowNone,
SearchBarEnabled=ao.SearchBarEnabled or false,
Multi=ao.Multi,
Callback=ao.Callback or nil,

UIElements={},

Opened=false,
Tabs={},

Width=150,
}

if ap.Multi and not ap.Value then
ap.Value={}
end
if ap.Values and typeof(ap.Value)=="number"then
ap.Value=ap.Values[ap.Value]
end

ap.DropdownFrame=a.load'C'{
Title=ap.Title,
Desc=ap.Desc,
Parent=ao.Parent,
TextOffset=ap.Callback and ap.Width or 20,
Hover=not ap.Callback and true or false,
Tab=ao.Tab,
Index=ao.Index,
Window=ao.Window,
ElementTable=ap,
ParentConfig=ao,
Tags=ao.Tags,
}

if ap.Callback then
ap.UIElements.Dropdown=
ai("",nil,ap.DropdownFrame.UIElements.Main,nil,ao.Window.NewElements and 12 or 10)

ap.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
ap.UIElements.Dropdown.Frame.Frame.TextLabel.Size=
UDim2.new(1,ap.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

ap.UIElements.Dropdown.Size=UDim2.new(0,ap.Width,0,36)
ap.UIElements.Dropdown.Position=UDim2.new(1,0,ao.Window.NewElements and 0 or 0.5,0)
ap.UIElements.Dropdown.AnchorPoint=Vector2.new(1,ao.Window.NewElements and 0 or 0.5)





end

ap.DropdownMenu=ak(ao,ap,am,"Dropdown")

ap.Display=ap.DropdownMenu.Display
ap.Refresh=ap.DropdownMenu.Refresh
ap.Select=ap.DropdownMenu.Select
ap.Open=ap.DropdownMenu.Open
ap.Close=ap.DropdownMenu.Close

ag("ImageLabel",{
Image=af.Icon"chevrons-up-down"[1],
ImageRectOffset=af.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=af.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,ap.UIElements.Dropdown and-12 or 0,0.5,0),
ThemeTag={
ImageColor3="Icon",
},
AnchorPoint=Vector2.new(1,0.5),
Parent=ap.UIElements.Dropdown and ap.UIElements.Dropdown.Frame
or ap.DropdownFrame.UIElements.Main,
})

function ap.Lock(aq)
ap.Locked=true
if ap.Opened or ap.UIElements.MenuCanvas.Visible then
ap:Close()
end
return ap.DropdownFrame:Lock(ap.LockedTitle)
end
function ap.Unlock(aq)
ap.Locked=false
return ap.DropdownFrame:Unlock()
end

if ap.Locked then
ap:Lock()
end

return ap.__type,ap
end

return am end function a.N()




local aa={}
local af={
lua={
"and",
"break",
"or",
"else",
"elseif",
"if",
"then",
"until",
"repeat",
"while",
"do",
"for",
"in",
"end",
"local",
"return",
"function",
"export",
},
rbx={
"game",
"workspace",
"script",
"math",
"string",
"table",
"task",
"wait",
"select",
"next",
"Enum",
"tick",
"assert",
"shared",
"loadstring",
"tonumber",
"tostring",
"type",
"typeof",
"unpack",
"Instance",
"CFrame",
"Vector3",
"Vector2",
"Color3",
"UDim",
"UDim2",
"Ray",
"BrickColor",
"OverlapParams",
"RaycastParams",
"Axes",
"Random",
"Region3",
"Rect",
"TweenInfo",
"collectgarbage",
"not",
"utf8",
"pcall",
"xpcall",
"_G",
"setmetatable",
"getmetatable",
"os",
"pairs",
"ipairs",
},
operators={
"#",
"+",
"-",
"*",
"%",
"/",
"^",
"=",
"~",
"=",
"<",
">",
},
}

local ag={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(ai)
local ak={}
for al,am in ipairs(ai)do
ak[am]=true
end
return ak
end

local ai=createKeywordSet(af.lua)
local ak=createKeywordSet(af.rbx)
local al=createKeywordSet(af.operators)

local function getHighlight(am,an)
local ao=am[an]

if ag[ao.."_color"]then
return ag[ao.."_color"]
end

if tonumber(ao)then
return ag.numbers
elseif ao=="nil"then
return ag.null
elseif ao:sub(1,2)=="--"then
return ag.comment
elseif al[ao]then
return ag.operator
elseif ai[ao]then
return ag.lua
elseif ak[ao]then
return ag.rbx
elseif ao:sub(1,1)=='"'or ao:sub(1,1)=="'"then
return ag.str
elseif ao=="true"or ao=="false"then
return ag.boolean
end

if am[an+1]=="("then
if am[an-1]==":"then
return ag.self_call
end

return ag.call
end

if am[an-1]=="."then
if am[an-2]=="Enum"then
return ag.rbx
end

return ag.local_property
end
end

function aa.run(am,an)
if an~=nil then
for ao,ap in next,an do
ag[ao]=ap
end
end

local ao={}
local ap=""

local aq=false
local ar=false
local as=false

for at=1,#am do
local au=am:sub(at,at)

if ar then
if au=="\n"and not as then
table.insert(ao,ap)
table.insert(ao,au)
ap=""

ar=false
elseif am:sub(at-1,at)=="]]"and as then
ap=ap.."]"

table.insert(ao,ap)
ap=""

ar=false
as=false
else
ap=ap..au
end
elseif aq then
if au==aq and am:sub(at-1,at-1)~="\\"or au=="\n"then
ap=ap..au
aq=false
else
ap=ap..au
end
else
if am:sub(at,at+1)=="--"then
table.insert(ao,ap)
ap="-"
ar=true
as=am:sub(at+2,at+3)=="[["
elseif au=='"'or au=="'"then
table.insert(ao,ap)
ap=au
aq=au
elseif al[au]then
table.insert(ao,ap)
table.insert(ao,au)
ap=""
elseif au:match"[%w_]"then
ap=ap..au
else
table.insert(ao,ap)
table.insert(ao,au)
ap=""
end
end
end

table.insert(ao,ap)

local at={}

for au,av in ipairs(ao)do
local aw=getHighlight(ao,au)

if aw then
local ax=string.format(
'<font color = "#%s">%s</font>',
aw:ToHex(),
av:gsub("<","&lt;"):gsub(">","&gt;")
)

table.insert(at,ax)
else
table.insert(at,av)
end
end

return table.concat(at)
end

return aa end function a.O()

local aa={}

local af=a.load'd'
local ag=af.New
local ai=af.Tween

local ak=a.load'N'

function aa.New(al,am,an,ao,ap)
local aq={
Radius=am.ElementConfig.UICorner,
Padding=am.NewElements and am.ElementConfig.UIPadding+4 or am.ElementConfig.UIPadding,

CodeFrame=nil,
}

local ar=ag("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=al.CodeSize,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding+3),
PaddingLeft=UDim.new(0,aq.Padding+3),
PaddingRight=UDim.new(0,aq.Padding+3),
PaddingBottom=UDim.new(0,aq.Padding+3),
}),
})
ar.Font="Code"

local as=ag("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize=al.Height~=nil and"XY"or"X",
ScrollingDirection=al.Height~=nil and"XY"or"X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
ar,
})

local at=al.CanCopied
and ag("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,35,0,35),
Position=UDim2.new(1,-aq.Padding/2,0,aq.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ao and true or false,
},{
af.NewRoundFrame(aq.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ag("UIScale",{
Scale=1,
}),
ag("ImageLabel",{
Image=af.Icon"copy"[1],
ImageRectSize=af.Icon"copy"[2].ImageRectSize,
ImageRectOffset=af.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.1,
}),
}),
})
or nil

local au,av=af.NewRoundFrame(aq.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.955,
Visible=false,
})

local aw,ax=af.NewRoundFrame(aq.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.96,
Size=UDim2.new(1,0,0,20+(aq.Padding*2)),
Visible=al.Title and true or false,
},{










ag("TextLabel",{
Text=al.Title,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=0.2,
TextSize=18,
AutomaticSize="Y",
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,at and-20-(aq.Padding*2),0,0),
}),
ag("UIPadding",{

PaddingLeft=UDim.new(0,aq.Padding+3),
PaddingRight=UDim.new(0,aq.Padding+3),

}),
ag("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local ay,az=af.NewRoundFrame(aq.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=0.035,
Size=al.Height~=nil
and UDim2.new(1,0,al.Height.Scale,al.Height.Offset==0 and-40 or al.Height.Offset)
or UDim2.new(1,0,0,20+(aq.Padding*2)),
AutomaticSize=al.Height~=nil and"None"or"Y",
Parent=an,
},{
au,
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,al.Height~=nil and 1 or 0,0),
AutomaticSize=al.Height~=nil and"None"or"Y",
},{
aw,
as,
ag("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
at,
},nil,true)

aq.CodeFrame=ay
aq.CodeFrameModule=az
aq.OutlineFrame=au
aq.OutlineFrameModule=av
aq.TopbarFrame=aw
aq.TopbarFrameModule=ax

af.AddSignal(ar:GetPropertyChangedSignal"TextBounds",function()
if al.Height~=nil then
as.Size=UDim2.new(1,0,1,al.Title~=nil and-(20+(aq.Padding*2))or nil)
else
as.Size=
UDim2.new(1,0,0,(ar.TextBounds.Y/(ap or 1))+((aq.Padding+3)*2))
end
end)

function aq.Set(aA)
ar.Text=ak.run(aA,al.CodeTheme)
end

function aq.Destroy()
ay:Destroy()
aq=nil
end

aq.Set(al.Code)

if at then
af.AddSignal(at.InputBegan,function(aA:InputObject)
if
aA.UserInputType==Enum.UserInputType.MouseButton1
or aA.UserInputType==Enum.UserInputType.Touch
then
ai(at.Button,0.05,{ImageTransparency=0.95}):Play()
ai(at.Button.UIScale,0.05,{Scale=0.9}):Play()
end
end)
af.AddSignal(at.InputEnded,function()
ai(at.Button,0.08,{ImageTransparency=1}):Play()
ai(at.Button.UIScale,0.08,{Scale=1}):Play()
end)
af.AddSignal(at.MouseButton1Click,function()
if ao then
ao()
local aA=af.Icon"check"
at.Button.ImageLabel.Image=aA[1]
at.Button.ImageLabel.ImageRectSize=aA[2].ImageRectSize
at.Button.ImageLabel.ImageRectOffset=aA[2].ImageRectPosition

task.delay(1,function()
local aB=af.Icon"copy"
at.Button.ImageLabel.Image=aB[1]
at.Button.ImageLabel.ImageRectSize=aB[2].ImageRectSize
at.Button.ImageLabel.ImageRectOffset=aB[2].ImageRectPosition
end)
end
end)
end

return aq
end

return aa end function a.P()

local aa=a.load'd'local af=
aa.New


local ag=a.load'O'

local ai={}

function ai.New(ak,al)
local am={
__type="Code",
Title=al.Title,
Code=al.Code,
CodeSize=al.CodeSize or 18,
Height=al.Height,
CodeTheme=al.CodeTheme,
Locked=false,
CanCopied=al.CanCopied~=false,
OnCopy=al.OnCopy,

Index=al.Index,
}

local an=not am.Locked











local ao=ag.New(am,al.Window,al.Parent,function()
if an then
local ao=am.Title or"code"
local ap,aq=pcall(function()
if toclipboard then
toclipboard(am.Code)
end
if setclipboard then
setclipboard(am.Code)
end

if am.OnCopy then
am.OnCopy()
end
end)
if not ap then
al.WindUI:Notify{
Title="Error",
Content="The "..ao.." is not copied. Error: "..aq,
Icon="x",
Duration=5,
}
end
end
end,al.WindUI.UIScale)

function am.SetCode(ap,aq)
ao.Set(aq)
am.Code=aq
end

function am.Set(ap,aq)
return am.SetCode(aq)
end

function am.Destroy(ap)
ao.Destroy()
am=nil
end

function am.UpdateShape(ap)
if al.Window.NewElements then
local aq=aa:GetElementPosition(
ap.Elements,
am.Index,
al.ParentType=="HStack"or al.ParentType=="Group"
)

if aq and ao.CodeFrameModule then
ao.CodeFrameModule:SetType(aq)

print(aq)
ao.TopbarFrameModule:SetType(
table.find({"Squircle-BL-BR","SquircleH-BL-BR"},aq)~=nil and"Square"or aq
)
end
end
end

am.UIElements={Main=ao.CodeFrame}
am.ElementFrame=ao.CodeFrame

return am.__type,am
end

return ai end function a.Q()

local aa=a.load'd'
local af=aa.New local ag=
aa.Tween

local ai=(cloneref or clonereference or function(ai)
return ai
end)

local ak=ai(game:GetService"UserInputService")
ai(game:GetService"TouchInputService")
local al=ai(game:GetService"RunService")
local am=ai(game:GetService"Players")local an=

al.RenderStepped
local ao=am.LocalPlayer
local ap=ao:GetMouse()

local aq=a.load'l'.New
local ar=a.load'm'.New

local as={
UICorner=9,

}

local at

function as.Colorpicker(au,av,aw,ax,ay)
local az={
__type="Colorpicker",
Title=av.Title,
Desc=av.Desc,
Default=av.Value or av.Default,
Callback=av.Callback,
Transparency=av.Transparency,
UIElements=av.UIElements,

TextPadding=10,
}

local aA={}
local aB=az.Transparency~=nil

function az.SetHSVFromRGB(aC,aD)
local aE,aF,aG=Color3.toHSV(aD)
az.Hue=aE
az.Sat=aF
az.Vib=aG
end

az:SetHSVFromRGB(az.Default)

local aC=a.load'n'
local aD=aC.Create(nil,"Dialog",aw,ax,aw.UIElements.Main.Main)

az.ColorpickerFrame=aD

aD.UIElements.Main.Size=UDim2.new(1,0,0,0)



local aE,aF,aG=az.Hue,az.Sat,az.Vib

az.UIElements.Title=af("TextLabel",{
Text=az.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=aD.UIElements.Main,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,az.TextPadding/2),
PaddingLeft=UDim.new(0,az.TextPadding/2),
PaddingRight=UDim.new(0,az.TextPadding/2),
PaddingBottom=UDim.new(0,az.TextPadding/2),
}),
})





local b=af("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local d=af("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=b,
BackgroundColor3=az.Default,
},{
af("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

az.UIElements.SatVibMap=af("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+az.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(aE,1,1),
BackgroundTransparency=0,
Parent=aD.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
af("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),

d,
})

az.UIElements.Inputs=af("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(
aB and 240 or 210,
40+az.TextPadding
),
BackgroundTransparency=1,
Parent=aD.UIElements.Main,
},{
af("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
}),
})





local f=af("Frame",{
BackgroundColor3=az.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=az.Transparency,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

af("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+az.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=aD.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
af("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),







f,
})

local g=af("Frame",{
BackgroundColor3=az.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

af("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+az.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=aD.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
af("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
g,
})

local h={}

for i=0,1,0.1 do
table.insert(h,ColorSequenceKeypoint.new(i,Color3.fromHSV(i,1,1)))
end

local i=af("UIGradient",{
Color=ColorSequence.new(h),
Rotation=90,
})

local m=af("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=b,


BackgroundColor3=az.Default,
},{
af("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

local p=af("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+az.TextPadding),
Parent=aD.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
i,
b,
})

local function CreateNewInput(r,u)
local v=ar(r,nil,az.UIElements.Inputs,nil,nil,nil,nil,nil,true)

af("TextLabel",{
BackgroundTransparency=1,
TextTransparency=0.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=v.Frame,
Text=r,
})

af("UIScale",{
Parent=v,
Scale=0.85,
})

v.Frame.Frame.TextBox.Text=u
v.Size=UDim2.new(0,150,0,42)

return v
end

local function ToRGB(r)
return{
R=math.floor(r.R*255),
G=math.floor(r.G*255),
B=math.floor(r.B*255),
}
end

local r=CreateNewInput("Hex","#"..az.Default:ToHex())

local u=CreateNewInput("Red",ToRGB(az.Default).R)
local v=CreateNewInput("Green",ToRGB(az.Default).G)
local x=CreateNewInput("Blue",ToRGB(az.Default).B)
local z
if aB then
z=CreateNewInput("Alpha",((1-az.Transparency)*100).."%")
end

local A=af("Frame",{
Size=UDim2.new(0,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+az.TextPadding),
BackgroundTransparency=1,
Parent=aD.UIElements.Main,
LayoutOrder=4,
},{
af("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

aa.AddSignal(aD.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",function()
az.UIElements.Title.Size=UDim2.new(
0,
aD.UIElements.Main.AbsoluteSize.X/av.UIScale-(aD.UIPadding*2),
0,
0
)
A.Size=UDim2.new(
0,
aD.UIElements.Main.AbsoluteSize.X/av.UIScale-aD.UIPadding*2,
0,
40
)
end)

local F={
{
Title="Cancel",
Variant="Secondary",
Callback=function()
av.IsShowed=false
for F,G in next,aA do
G:Disconnect()
end
aA={}
end,
},
{
Title="Apply",

Variant="Primary",
Callback=function()
av.IsShowed=false
for F,G in next,aA do
G:Disconnect()
end
aA={}

ay(Color3.fromHSV(az.Hue,az.Sat,az.Vib),az.Transparency)
end,
},
}

for G,H in next,F do
local J=aq(
H.Title,
H.Icon,
H.Callback,
H.Variant,
A,
aD,
true
)
J.Size=UDim2.new(0.5,-3,0,40)
J.AutomaticSize="None"
end

local J,L,M
if aB then
local N=af("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

L=af("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=N,
},{
af("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

M=af("Frame",{
Size=UDim2.fromScale(1,1),
},{
af("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
af("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

J=af("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+az.TextPadding),
Parent=aD.UIElements.Main,
BackgroundTransparency=1,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
af("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
M,
N,
})
end

function az.Round(N,O,P)
if P==0 then
return math.floor(O)
end
O=tostring(O)
return O:find"%."and tonumber(O:sub(1,O:find"%."+P))or O
end

function az.Update(N,O,P)
if O then
aE,aF,aG=Color3.toHSV(O)
else
aE,aF,aG=az.Hue,az.Sat,az.Vib
end

az.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(aE,1,1)
d.Position=UDim2.new(aF,0,1-aG,0)
d.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
g.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
m.BackgroundColor3=Color3.fromHSV(aE,1,1)
m.Position=UDim2.new(0.5,0,aE,0)

r.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(aE,aF,aG):ToHex()
u.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aE,aF,aG)).R
v.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aE,aF,aG)).G
x.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aE,aF,aG)).B

if P or aB then
g.BackgroundTransparency=az.Transparency or P
M.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
L.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
L.BackgroundTransparency=az.Transparency or P
L.Position=UDim2.new(0.5,0,1-az.Transparency or P,0)
z.Frame.Frame.TextBox.Text=az:Round(
(1-az.Transparency or P)*100,
0
).."%"
end
end

az:Update(az.Default,az.Transparency)

local function GetRGB()
local N=Color3.fromHSV(az.Hue,az.Sat,az.Vib)
return{R=math.floor(N.r*255),G=math.floor(N.g*255),B=math.floor(N.b*255)}
end



local function clamp(N,O,P)
return math.clamp(tonumber(N)or 0,O,P)
end

table.insert(
aA,
aa.AddSignal(r.Frame.Frame.TextBox.FocusLost,function(N)
if N then
local O=r.Frame.Frame.TextBox.Text:gsub("#","")
local P,Q=pcall(Color3.fromHex,O)
if P and typeof(Q)=="Color3"then
az.Hue,az.Sat,az.Vib=Color3.toHSV(Q)
az:Update()
az.Default=Q
end
end
end)
)

local function updateColorFromInput(N,O)
aa.AddSignal(N.Frame.Frame.TextBox.FocusLost,function(P)
if P then
local Q=N.Frame.Frame.TextBox
local R=GetRGB()
local S=clamp(Q.Text,0,255)
Q.Text=tostring(S)

R[O]=S
local T=Color3.fromRGB(R.R,R.G,R.B)
az.Hue,az.Sat,az.Vib=Color3.toHSV(T)
az:Update()
end
end)
end

updateColorFromInput(u,"R")
updateColorFromInput(v,"G")
updateColorFromInput(x,"B")

if aB then
aa.AddSignal(z.Frame.Frame.TextBox.FocusLost,function(N)
if N then
local O=z.Frame.Frame.TextBox
local P=clamp(O.Text,0,100)
O.Text=tostring(P)

az.Transparency=1-P*0.01
az:Update(nil,az.Transparency)
end
end)
end



local function UpdateSatVib(N,O)
local P=N.AbsolutePosition.X
local Q=P+N.AbsoluteSize.X
local R=N.AbsolutePosition.Y
local S=R+N.AbsoluteSize.Y

local T=math.clamp(ap.X,P,Q)
local U=math.clamp(ap.Y,R,S)

O.Sat=(T-P)/(Q-P)
O.Vib=1-((U-R)/(S-R))

O:Update()
end

local function UpdateHue(N,O)
local P=N.AbsolutePosition.Y
local Q=P+N.AbsoluteSize.Y

local R=math.clamp(ap.Y,P,Q)

O.Hue=(R-P)/(Q-P)

O:Update()
end

local function UpdateTransparency(N,O)
local P=N.AbsolutePosition.Y
local Q=P+N.AbsoluteSize.Y

local R=math.clamp(ap.Y,P,Q)

O.Transparency=1-((R-P)/(Q-P))

O:Update()
end

local N=ax.GenerateGUID()

table.insert(
aA,
ak.InputChanged:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseMovement
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if at=="SatVib"then
UpdateSatVib(az.UIElements.SatVibMap,az)
elseif at=="Hue"then
UpdateHue(p,az)
elseif at=="Transparency"then
UpdateTransparency(J,az)
end
end)
)

table.insert(
aA,
az.UIElements.SatVibMap.InputBegan:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseButton1
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=N

if at and at~="SatVib"then
return
end

at="SatVib"

UpdateSatVib(az.UIElements.SatVibMap,az)
end)
)

table.insert(
aA,
p.InputBegan:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseButton1
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=N

if at and at~="Hue"then
return
end

at="Hue"

UpdateHue(p,az)
end)
)

if J then
table.insert(
aA,
J.InputBegan:Connect(function(O)
if
O.UserInputType~=Enum.UserInputType.MouseButton1
and O.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=N

if at and at~="Transparency"then
return
end

at="Transparency"

UpdateTransparency(J,az)
end)
)
end

table.insert(
aA,
ak.InputEnded:Connect(function(O)
at=nil

if ax.CurrentInput and ax.CurrentInput~=N then
return
end
ax.CurrentInput=nil
end)
)

return az
end

function as.New(au,av)
local aw={
__type="Colorpicker",
Title=av.Title or"Colorpicker",
Desc=av.Desc or nil,
Locked=av.Locked or false,
LockedTitle=av.LockedTitle,
Default=av.Default or Color3.new(1,1,1),
Callback=av.Callback or function()end,

UIScale=av.UIScale,
Transparency=av.Transparency,
UIElements={},

IsShowed=false,
}

local ax=true



aw.ColorpickerFrame=a.load'C'{
Title=aw.Title,
Desc=aw.Desc,
Parent=av.Parent,
TextOffset=40,
Hover=false,
Tab=av.Tab,
Index=av.Index,
Window=av.Window,
ElementTable=aw,
ParentConfig=av,
Tags=av.Tags,
}

aw.UIElements.Colorpicker=aa.NewRoundFrame(as.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=aw.Default,
Parent=aw.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,26,0,26),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
ZIndex=2,
},{
aa.NewRoundFrame(as.UICorner,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=0.55,
}),
},true)

function aw.Lock(ay)
aw.Locked=true
ax=false
return aw.ColorpickerFrame:Lock(aw.LockedTitle)
end
function aw.Unlock(ay)
aw.Locked=false
ax=true
return aw.ColorpickerFrame:Unlock()
end

if aw.Locked then
aw:Lock()
end

function aw.Update(ay,az,aA)
aw.UIElements.Colorpicker.ImageTransparency=aA or 0
aw.UIElements.Colorpicker.ImageColor3=az
aw.Default=az
if aA then
aw.Transparency=aA
end
end

function aw.Set(ay,az,aA)
return aw:Update(az,aA)
end

aa.AddSignal(aw.UIElements.Colorpicker.MouseButton1Click,function()
if ax and not aw.IsShowed then
aw.IsShowed=true

as:Colorpicker(aw,av.Window,av.WindUI,function(ay,az)
aw:Update(ay,az)
aw.Default=ay
aw.Transparency=az
aa.SafeCallback(aw.Callback,ay,az)
end).ColorpickerFrame
:Open()
end
end)

return aw.__type,aw
end

return as end function a.R()

local aa=a.load'd'
local af=aa.New
local ai=aa.Tween

local ak={}

function ak.New(al,am)
local an={
__type="Section",
Title=am.Title or"Section",
Desc=am.Desc,
Icon=am.Icon,
IconThemed=am.IconThemed,
TextXAlignment=am.TextXAlignment or"Left",
TextSize=am.TextSize or 19,
DescTextSize=am.DescTextSize or 16,
Box=am.Box or false,
BoxBorder=am.BoxBorder or false,
FontWeight=am.FontWeight or Enum.FontWeight.SemiBold,
DescFontWeight=am.DescFontWeight or Enum.FontWeight.Medium,
TextTransparency=am.TextTransparency or 0.05,
DescTextTransparency=am.DescTextTransparency or 0.4,
Opened=am.Opened or false,
UIElements={},

HeaderSize=48,
IconSize=20,
Padding=10,

Elements={},

Expandable=false,
}

local ao

function an.SetIcon(ap,aq)
an.Icon=aq or nil
if ao then
ao:Destroy()
end
if aq then
ao=aa.Image(
aq,
aq..":"..an.Title,
0,
am.Window.Folder,
an.__type,
true,
an.IconThemed,
"SectionIcon"
)
ao.Size=UDim2.new(0,an.IconSize,0,an.IconSize)
end
end

local ap=af("Frame",{
Size=UDim2.new(0,an.IconSize,0,an.IconSize),
BackgroundTransparency=1,
Visible=false,
},{
af("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageTransparency="SectionExpandIconTransparency",
ImageColor3="SectionExpandIcon",
},
}),
})

if an.Icon then
an:SetIcon(an.Icon)
end

local aq=af("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
af("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment=an.TextXAlignment,
VerticalAlignment="Center",
Padding=UDim.new(0,4),
}),
})

local ar,as

local function createTitle(at,au)
return af("TextLabel",{
BackgroundTransparency=1,
TextXAlignment=an.TextXAlignment,
AutomaticSize="Y",
TextSize=au=="Title"and an.TextSize or an.DescTextSize,
TextTransparency=au=="Title"and an.TextTransparency or an.DescTextTransparency,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,au=="Title"and an.FontWeight or an.DescFontWeight),


Text=at,
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
Parent=aq,
})
end

ar=createTitle(an.Title,"Title")
if an.Desc then
as=createTitle(an.Desc,"Desc")
end

local function UpdateTitleSize()
local at=0
if ao then
at=at-(an.IconSize+8)
end
if ap.Visible then
at=at-(an.IconSize+8)
end
aq.Size=UDim2.new(1,at,0,0)
end

local at=aa.NewRoundFrame(am.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Parent=am.Parent,

AutomaticSize="Y",
ThemeTag={
ImageTransparency=an.Box and"SectionBoxBackgroundTransparency"or nil,
ImageColor3="SectionBoxBackground",
},
ImageTransparency=not an.Box and 1 or nil,
},{
aa.NewRoundFrame(am.Window.ElementConfig.UICorner-1,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ThemeTag={

ImageColor3="SectionBoxBorder",
},
ImageTransparency=an.Box and an.BoxBorder and 0.92 or 1,
Name="Outline",
ClipsDescendants=true,
},{
af("TextButton",{
Size=UDim2.new(1,0,0,an.Expandable and 0 or(not as and an.HeaderSize or 0)),
BackgroundTransparency=1,
AutomaticSize=(not an.Expandable or as)and"Y"or nil,
Text="",
Name="Top",
},{
an.Box and af("UIPadding",{
PaddingTop=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
PaddingLeft=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
PaddingRight=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
PaddingBottom=UDim.new(
0,
am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)
),
})or nil,
ao,
aq,
af("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ap,
}),
af("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=false,
Position=UDim2.new(0,0,0,an.HeaderSize+10),
},{
an.Box and af("UIPadding",{
PaddingLeft=UDim.new(0,am.Window.ElementConfig.UIPadding/1.5),
PaddingRight=UDim.new(0,am.Window.ElementConfig.UIPadding/1.5),
PaddingBottom=UDim.new(0,am.Window.ElementConfig.UIPadding/1.5),
})or nil,
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,am.Tab.Gap),
VerticalAlignment="Top",
}),
}),
}),
})





an.ElementFrame=at

at.Outline.Top:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
at.Outline.Content.Position=UDim2.new(0,0,0,(at.Outline.Top.AbsoluteSize.Y/am.UIScale)+10)

if an.Opened then
an:Open(true)
else
an.Close(true)
end
end)

local au=am.ElementsModule

au.Load(an,at.Outline.Content,au.Elements,am.Window,am.WindUI,function()
if not an.Expandable then
an.Expandable=true
ap.Visible=true
UpdateTitleSize()
end
end,au,am.UIScale,am.Tab)

UpdateTitleSize()

function an.SetTitle(av,aw)
an.Title=aw
ar.Text=aw
end

function an.SetDesc(av,aw)
an.Desc=aw
if not as then
as=createTitle(aw,"Desc")
end
as.Text=aw
end

function an.Destroy(av)
for aw,ax in next,an.Elements do
ax:Destroy()
end








at:Destroy()
end

function an.Open(av,aw)
if an.Expandable then
an.Opened=true
if aw then
at.Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
at.Outline.Top.AbsoluteSize.Y/am.UIScale
+(at.Outline.Content.AbsoluteSize.Y/am.UIScale)
+10
)
ap.ImageLabel.Rotation=180
else
ai(at,0.33,{
Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
at.Outline.Top.AbsoluteSize.Y/am.UIScale
+(at.Outline.Content.AbsoluteSize.Y/am.UIScale)
+10
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ai(
ap.ImageLabel,
0.2,
{Rotation=180},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end
function an.Close(av,aw)
if an.Expandable then
an.Opened=false
if aw then
at.Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
(at.Outline.Top.AbsoluteSize.Y/am.UIScale)
)
ap.ImageLabel.Rotation=0
else
ai(at,0.26,{
Size=UDim2.new(
at.Size.X.Scale,
at.Size.X.Offset,
0,
(at.Outline.Top.AbsoluteSize.Y/am.UIScale)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ai(
ap.ImageLabel,
0.2,
{Rotation=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end

aa.AddSignal(at.Outline.Top.MouseButton1Click,function()
if an.Expandable then
if an.Opened then
an:Close()
else
an:Open()
end
end
end)

aa.AddSignal(at.Outline.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if an.Opened then
an:Open(true)
else
an:Close(true)
end
end)

task.defer(function()
if an.Expandable then








at.Size=
UDim2.new(at.Size.X.Scale,at.Size.X.Offset,0,at.Outline.Top.AbsoluteSize.Y/am.UIScale)
at.AutomaticSize="None"
at.Outline.Top.Size=UDim2.new(1,0,0,(not as and an.HeaderSize or 0))
at.Outline.Top.AutomaticSize=(not an.Expandable or as)and"Y"or"None"
at.Outline.Content.Visible=true
end
if an.Opened then
an:Open()
else
an:Close(true)
end
end)

return an.__type,an
end

return ak end function a.S()

local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am=af("Frame",{
Size=al.ParentType~="Group"and UDim2.new(1,0,0,1)or UDim2.new(0,1,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local an=af("Frame",{
Parent=al.Parent,
Size=al.ParentType~="Group"and UDim2.new(1,-7,0,7)or UDim2.new(0,7,1,-7),
BackgroundTransparency=1,
},{
am
})

return"Divider",{__type="Divider",ElementFrame=an}
end

return ai end function a.T()
local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am=af("Frame",{
Parent=al.Parent,
Size=not table.find({"Group","HStack"},al.ParentType)and UDim2.new(1,-7,0,7*(al.Columns or 1))or UDim2.new(0,7*(al.Columns or 1),0,0),
BackgroundTransparency=1,
})

return"Space",{__type="Space",ElementFrame=am}
end

return ai end function a.U()
local aa=a.load'd'
local af=aa.New

local ai={}

local function ParseAspectRatio(ak)
if type(ak)=="string"then
local al,am=ak:match"(%d+):(%d+)"
if al and am then
return tonumber(al)/tonumber(am)
end
elseif type(ak)=="number"then
return ak
end
return nil
end

function ai.New(ak,al)
local am={
__type="Image",
Image=al.Image or"",
AspectRatio=al.AspectRatio or"16:9",
Radius=al.Radius or al.Window.ElementConfig.UICorner,
}
local an=aa.Image(
am.Image,
am.Image,
am.Radius,
al.Window.Folder,
"Image",
false
)
if an and an.Parent then
an.Parent=al.Parent
an.Size=UDim2.new(1,0,0,0)
an.BackgroundTransparency=1












local ao=ParseAspectRatio(am.AspectRatio)
local ap

if ao then
ap=af("UIAspectRatioConstraint",{
Parent=an,
AspectRatio=ao,
AspectType="ScaleWithParentSize",
DominantAxis="Width"
})
end

function am.Destroy(aq)
an:Destroy()
end
end

return am.__type,am
end

return ai end function a.V()
local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am={
__type="Group",
Elements={},
ElementFrame=nil,
}

local an=af("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=al.Parent,
},{
af("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6))
}),
})

am.ElementFrame=an

local ao=al.ElementsModule
ao.Load(
am,
an,
ao.Elements,
al.Window,
al.WindUI,
function(ap,aq)
local ar=al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6)

local as={}
local at=0

for au,av in next,aq do
if av.__type=="Space"then
at=at+(av.ElementFrame.Size.X.Offset or 6)
elseif av.__type=="Divider"then
at=at+(av.ElementFrame.Size.X.Offset or 1)
else
table.insert(as,av)
end
end

local aw=#as
if aw==0 then return end

local ax=1/aw

local ay=ar*(aw-1)

local az=-(ay+at)

local aA=math.floor(az/aw)
local aB=az-(aA*aw)

for aC,aD in next,as do
local aE=aA
if aC<=math.abs(aB)then
aE=aE-1
end

if aD.ElementFrame then
aD.ElementFrame.Size=UDim2.new(ax,aE,1,0)
end
end
end,
ao,
al.UIScale,
al.Tab
)



return am.__type,am
end

return ai end function a.W()
local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am={
__type="HStack",
AutoSpace=al.AutoSpace or false,
Elements={},
ElementFrame=nil,
}

local an=af("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=al.Parent,
},{
af("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6)),
}),
})

am.ElementFrame=an

local ao=al.ElementsModule
ao.Load(
am,
an,
ao.Elements,
al.Window,
al.WindUI,
function(ap,aq)
local ar=al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6)

local as={}
local at=0

for au,aw in next,aq do
if aw.__type=="Space"then
at=at+(aw.ElementFrame.Size.X.Offset or 6)
elseif aw.__type=="Divider"then
at=at+(aw.ElementFrame.Size.X.Offset or 1)
else
table.insert(as,aw)
end
end

local ax=#as
if ax==0 then
return
end

local ay=1/ax

local az=ar*(ax-1)

local aA=-(az+at)

local aB=math.floor(aA/ax)
local aC=aA-(aB*ax)

for aD,aE in next,as do
local aF=aB
if aD<=math.abs(aC)then
aF=aF-1
end

if aE.ElementFrame then
aE.ElementFrame.Size=UDim2.new(ay,aF,1,0)
end
end
end,
ao,
al.UIScale,
al.Tab
)

if am.AutoSpace then
for ap in next,ao.Elements do
if ap~="Space"and ap~="Divider"then
local aq=am[ap]
am[ap]=function(ar,as)
if#am.Elements>0 then
am:Space()
end
return aq(ar,as)
end
end
end
end

return am.__type,am
end

return ai end function a.X()

local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am={
__type="VStack",
Elements={},
ElementFrame=nil,
}

local an=af("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=al.Parent,
},{
af("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment="Center",

Padding=UDim.new(0,al.Tab and al.Tab.Gap or(al.Window.NewElements and 1 or 6))
}),
})

am.ElementFrame=an

local ao=al.ElementsModule
ao.Load(
am,
an,
ao.Elements,
al.Window,
al.WindUI,







































nil,
ao,
al.UIScale,
al.Tab
)



return am.__type,am
end

return ai end function a.Y()





local aa={}

local af=a.load'd'
local ai=af.New
local ak=af.Tween

local al=(cloneref or clonereference or function(al)return al end)
local am=al(game:GetService"RunService")


local function ModelBounds(an)
local ao={}
for ap,aq in ipairs(an:GetDescendants())do
if aq:IsA"BasePart"then
table.insert(ao,aq)
end
end
if#ao==0 then
local ar=an:IsA"Model"and an:GetPivot()or CFrame.new()
return ar.Position,2
end

local ar,as,at=math.huge,math.huge,math.huge
local au,ax,ay=-math.huge,-math.huge,-math.huge

for az,aA in ipairs(ao)do
local aB=aA.Position
local aC=aA.Size/2
ar=math.min(ar,aB.X-aC.X)
as=math.min(as,aB.Y-aC.Y)
at=math.min(at,aB.Z-aC.Z)
au=math.max(au,aB.X+aC.X)
ax=math.max(ax,aB.Y+aC.Y)
ay=math.max(ay,aB.Z+aC.Z)
end

local aB=Vector3.new(
(ar+au)/2,
(as+ax)/2,
(at+ay)/2
)
local aC=(Vector3.new(au,ax,ay)-aB).Magnitude

return aB,math.max(aC,0.5)
end


local function FitCamera(an,ao,aq,ar)
local as,at=ModelBounds(ao)
aq=aq or 35
ar=ar or 0

local au=math.rad(aq)
local ax=at/math.tan(au/2)*1.15

local ay=as+Vector3.new(0,at*0.25+ar,-ax)
an.CurrentCamera.CFrame=CFrame.lookAt(ay,as+Vector3.new(0,ar,0))
an.CurrentCamera.FieldOfView=aq
end


function aa.New(an,ao)
local aq=an.Width or 100
local ar=an.Height or 100
local as=an.Radius or af.Radius.M
local at=an.FOV or 35
local au=an.AutoRotate~=false
local ax=an.RotateSpeed or 30
local ay=an.YOffset or 0
local az=an.LightDirection or Vector3.new(-1,-2,-1)


local aA=ai("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Loading",
Visible=true,
},{
ai("UICorner",{CornerRadius=UDim.new(0,as)}),

ai("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0.45,0,0,3),
BackgroundTransparency=0.6,
ThemeTag={BackgroundColor3="Outline"},
},{
ai("UICorner",{CornerRadius=UDim.new(0,999)}),
}),
})


local aB=ai("ViewportFrame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
LightColor=Color3.new(1,1,1),
LightDirection=az,
ImageTransparency=1,
Name="VP",
})


local aC=af.NewRoundFrame(as,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
ZIndex=10,
})

local aD=ai("Frame",{
Size=UDim2.new(0,aq,0,ar),
BackgroundTransparency=1,
ClipsDescendants=true,
Parent=ao,
Name="Viewport",
},{
af.NewRoundFrame(as,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={ImageColor3="ElementBackground"},
ImageTransparency=0.75,
}),
aA,
aB,
aC,
})


ai("UICorner",{CornerRadius=UDim.new(0,as)}).Parent=aD


local aE=Instance.new"Camera"
aE.Parent=aB
aB.CurrentCamera=aE


local aF
local aG

local b={}

function b.Load(d,f)
if not f then return end


if aF then aF:Disconnect();aF=nil end
for g,h in ipairs(aB:GetChildren())do
if h~=aE then h:Destroy()end
end


aG=f:Clone()
aG.Parent=aB


task.spawn(function()
task.wait()
FitCamera(aB,aG,at,ay)


aA.Visible=false
ak(aB,af.Anim.Normal,{ImageTransparency=0}):Play()


local i=aG:IsA"Model"and aG
or(function()
local i=Instance.new"Model"
aG.Parent=i
i.Parent=aB
return i
end)()

if au then local
m, p=ModelBounds(i)
local r=0
aF=am.RenderStepped:Connect(function(u)
r=r+u*ax
if i and i.Parent then
i:PivotTo(
CFrame.new(m)
*CFrame.Angles(0,math.rad(r),0)
*CFrame.new(-m)
)
end
end)
end
end)
end

function b.SetRotateSpeed(d,f)
ax=f
end

function b.SetAutoRotate(d,f)
au=f
if not f and aF then
aF:Disconnect()
aF=nil
end
end

function b.FitCamera(d)
if aG then FitCamera(aB,aG,at,ay)end
end

function b.GetViewportFrame(d)
return aB
end


if an.Model then
task.defer(function()b:Load(an.Model)end)
end

aD._API=b
return aD
end

return aa end function a.Z()

return{
Elements={
Paragraph=a.load'B',
Button=a.load'D',
Toggle=a.load'G',
Slider=a.load'H',
ProgressBar=a.load'I',
Keybind=a.load'J',
Input=a.load'K',
Dropdown=a.load'M',
Code=a.load'P',
Colorpicker=a.load'Q',
Section=a.load'R',
Divider=a.load'S',
Space=a.load'T',
Image=a.load'U',
Group=a.load'V',
HStack=a.load'W',
VStack=a.load'X',
Viewport=a.load'Y',

},
Load=function(aa,af,ai,ak,al,am,an,ao,aq)
for ar,as in next,ai do
aa[ar]=function(at,au)
au=au or{}
au.Tab=aq or aa
au.ParentType=aa.__type
au.ParentTable=aa
au.Index=#aa.Elements+1
au.GlobalIndex=#ak.AllElements+1
au.Parent=af
au.Window=ak
au.WindUI=al
au.UIScale=ao
au.ElementsModule=an local

ax, ay=as:New(au)

if au.Flag and typeof(au.Flag)=="string"then
if ak.CurrentConfig then
ak.CurrentConfig:Register(au.Flag,ay)

if ak.PendingConfigData and ak.PendingConfigData[au.Flag]then
local az=ak.PendingConfigData[au.Flag]

local aA=ak.ConfigManager
if aA.Parser[az.__type]then
task.defer(function()
local aB,aC=pcall(function()
aA.Parser[az.__type].Load(ay,az)
end)

if aB then
ak.PendingConfigData[au.Flag]=nil
else
warn(
"[ WindUI ] Failed to apply pending config for '"
..au.Flag
.."': "
..tostring(aC)
)
end
end)
end
end
else
ak.PendingFlags=ak.PendingFlags or{}
ak.PendingFlags[au.Flag]=ay
end
end

local az
for aA,aB in next,ay do
if typeof(aB)=="table"and aA~="ElementFrame"and aA:match"Frame$"then
az=aB
break
end
end

if az then
ay.ElementFrame=az.UIElements.Main
function ay.SetTitle(aC,aD)
return az.SetTitle and az:SetTitle(aD)
end
function ay.SetDesc(aC,aD)
return az.SetDesc and az:SetDesc(aD)
end
function ay.SetImage(aC,aD,aE)
return az.SetImage and az:SetImage(aD,aE)
end
function ay.SetThumbnail(aC,aD,aE)
return az.SetThumbnail and az:SetThumbnail(aD,aE)
end
function ay.Highlight(aC)
az:Highlight()
end
function ay.Destroy(aC)
az:Destroy()

table.remove(ak.AllElements,au.GlobalIndex)
table.remove(aa.Elements,au.Index)
table.remove(aq.Elements,au.Index)
aa:UpdateAllElementShapes(aa)
end
end

ak.AllElements[au.Index]=ay
aa.Elements[au.Index]=ay
if aq then
aq.Elements[au.Index]=ay
end

if ak.NewElements then
aa:UpdateAllElementShapes(aa)
end

if am then
am(ay,aa.Elements)
end
return ay
end
end
function aa.UpdateAllElementShapes(at,au)
for ax,ay in next,au.Elements do
local az
for aA,aB in pairs(ay)do
if typeof(aB)=="table"and aA:match"Frame$"then
az=aB
break
end
end

if not az and ay.UpdateShape then
az=ay
end

if az then

az.Index=ax
if az.UpdateShape then

az.UpdateShape(au)
end
end
end
end
end,
}end function a._()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=game:GetService"Players"

aa(game:GetService"UserInputService")
local ai=af.LocalPlayer:GetMouse()

local ak=a.load'd'
local al=ak.New

local am=a.load'A'.New
local an=a.load'w'.New



local ao={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ao)end,
}

function ao.Init(aq,ar,as,at)
Window=aq
WindUI=ar
ao.ToolTipParent=as
ao.TabHighlight=at
return ao
end

function ao.New(aq,ar)
local as={
__type="Tab",
Title=aq.Title or"Tab",
Desc=aq.Desc,
Icon=aq.Icon,
IconColor=aq.IconColor,
IconShape=aq.IconShape,
IconThemed=aq.IconThemed,
Locked=aq.Locked,
ShowTabTitle=aq.ShowTabTitle,
TabTitleAlign=aq.TabTitleAlign or"Left",
CustomEmptyPage=(aq.CustomEmptyPage and next(aq.CustomEmptyPage)~=nil)and aq.CustomEmptyPage
or{Icon="lucide:frown",IconSize=48,Title="This tab is Empty",Desc=nil},
Border=aq.Border,
Selected=false,
Index=nil,
Parent=aq.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),

Gap=Window.NewElements and 1 or 6,

TabPaddingX=4+(Window.UIPadding/2),
TabPaddingY=3+(Window.UIPadding/2),
TitlePaddingY=0,
}









if as.IconShape then
as.TabPaddingX=2+(Window.UIPadding/4)
as.TabPaddingY=2+(Window.UIPadding/4)
as.TitlePaddingY=2+(Window.UIPadding/4)
end

ao.TabCount=ao.TabCount+1

local at=ao.TabCount
as.Index=at

as.UIElements.Main=ak.NewRoundFrame(as.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=aq.Parent,
ThemeTag={
ImageColor3="TabBackground",
},
ImageTransparency=1,
},{
ak.NewRoundFrame(as.UICorner-1,"Glass-1.4",{
Size=UDim2.new(1,1,1,1),
ThemeTag={
ImageColor3="TabBorder",
},
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=1,
Name="Outline",
},{













}),
ak.NewRoundFrame(as.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,2+(Window.UIPadding/2)),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("TextLabel",{
Text=as.Title,
ThemeTag={
TextColor3="TabTitle",
},
TextTransparency=not as.Locked and 0.4 or 0.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
},{
al("UIPadding",{
PaddingTop=UDim.new(0,as.TitlePaddingY),


PaddingBottom=UDim.new(0,as.TitlePaddingY),
}),
}),
al("UIPadding",{
PaddingTop=UDim.new(0,as.TabPaddingY),
PaddingLeft=UDim.new(0,as.TabPaddingX),
PaddingRight=UDim.new(0,as.TabPaddingX),
PaddingBottom=UDim.new(0,as.TabPaddingY),
}),
}),
},true)

local au=0
local ax
local ay

if as.Icon then
ax=ak.Image(
as.Icon,
as.Icon..":"..as.Title,
0,
Window.Folder,
as.__type,
as.IconColor and false or true,
as.IconThemed,
"TabIcon"
)
ax.Size=UDim2.new(0,16,0,16)
if as.IconColor then
ax.ImageLabel.ImageColor3=as.IconColor
end
if not as.IconShape then
ax.Parent=as.UIElements.Main.Frame
as.UIElements.Icon=ax
ax.ImageLabel.ImageTransparency=not as.Locked and 0 or 0.7
au=-18-(Window.UIPadding/2)
as.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,au,0,0)
elseif as.IconColor then
ak.NewRoundFrame(
as.IconShape~="Circle"and(as.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Squircle",
{
Size=UDim2.new(0,26,0,26),
ImageColor3=as.IconColor,
Parent=as.UIElements.Main.Frame,
},
{
ax,
ak.NewRoundFrame(
as.IconShape~="Circle"and(as.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Glass-1.4",
{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0,
Name="Outline",
},
{













}
),
}
)
ax.AnchorPoint=Vector2.new(0.5,0.5)
ax.Position=UDim2.new(0.5,0,0.5,0)
ax.ImageLabel.ImageTransparency=0
ax.ImageLabel.ImageColor3=ak.GetTextColorForHSB(as.IconColor,0.68)
au=-28-(Window.UIPadding/2)
as.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,au,0,0)
end

ay=
ak.Image(as.Icon,as.Icon..":"..as.Title,0,Window.Folder,as.__type,true,as.IconThemed)
ay.Size=UDim2.new(0,16,0,16)
ay.ImageLabel.ImageTransparency=not as.Locked and 0 or 0.7
au=-30




end

as.UIElements.ContainerFrame=al("ScrollingFrame",{
Size=UDim2.new(1,0,1,as.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
al("UIPadding",{
PaddingTop=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingLeft=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingRight=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingBottom=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
}),
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,as.Gap),
HorizontalAlignment="Center",
}),
})





as.UIElements.ContainerFrameCanvas=al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
as.UIElements.ContainerFrame,
al("Frame",{
Size=UDim2.new(1,-14,1,-14),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Name="ScrollSliderHolder",
}),
al("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=as.ShowTabTitle or false,
Name="TabTitle",
},{
ay,
al("TextLabel",{
Text=as.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=20,
TextTransparency=0.1,
Size=UDim2.new(0,0,1,0),
FontFace=Font.new(ak.Font,Enum.FontWeight.SemiBold),

RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
AutomaticSize="X",
}),
al("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
al("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=as.TabTitleAlign,
}),
}),
al("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=as.ShowTabTitle or false,
}),
})

ao.Containers[at]=as.UIElements.ContainerFrameCanvas
ao.Tabs[at]=as

as.ContainerFrame=as.UIElements.ContainerFrameCanvas

ak.AddSignal(as.UIElements.Main.MouseButton1Click,function()
if not as.Locked then
ao:SelectTab(at)
end
end)

if Window.ScrollBarEnabled then
an(
as.UIElements.ContainerFrame,
as.UIElements.ContainerFrameCanvas.ScrollSliderHolder,
Window,
4,
WindUI
)
end

local az
local aA
local aB
local aC=false


if as.Desc then
ak.AddSignal(as.UIElements.Main.InputBegan,function()
aC=true
aA=task.spawn(function()
task.wait(0.35)
if aC and not az then
az=am(as.Desc,ao.ToolTipParent,true)
az.Container.AnchorPoint=Vector2.new(0.5,0.5)

local function updatePosition()
if az then
az.Container.Position=UDim2.new(0,ai.X,0,ai.Y-4)
end
end

updatePosition()
aB=ai.Move:Connect(updatePosition)
az:Open()
end
end)
end)
end

ak.AddSignal(as.UIElements.Main.MouseEnter,function()
if not as.Locked then
ak.SetThemeTag(as.UIElements.Main.Frame,{
ImageTransparency="TabBackgroundHoverTransparency",
ImageColor3="TabBackgroundHover",
},0.1)
end
end)
ak.AddSignal(as.UIElements.Main.InputEnded,function()
if as.Desc then
aC=false
if aA then
task.cancel(aA)
aA=nil
end
if aB then
aB:Disconnect()
aB=nil
end
if az then
az:Close()
az=nil
end
end

if not as.Locked then
ak.SetThemeTag(as.UIElements.Main.Frame,{
ImageTransparency="TabBorderTransparency",
},0.1)
end
end)

function as.ScrollToTheElement(aD,aE)
as.UIElements.ContainerFrame.ScrollingEnabled=false

ak.Tween(as.UIElements.ContainerFrame,0.45,{
CanvasPosition=Vector2.new(
0,
as.Elements[aE].ElementFrame.AbsolutePosition.Y
-as.UIElements.ContainerFrame.AbsolutePosition.Y
-as.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.48)

if as.Elements[aE].Highlight then
as.Elements[aE]:Highlight()
end
as.UIElements.ContainerFrame.ScrollingEnabled=true
end)

return as
end



local aD=a.load'Z'

aD.Load(
as,
as.UIElements.ContainerFrame,
aD.Elements,
Window,
WindUI,
nil,
aD,
ar,
as
)

function as.LockAll(aE)

for aF,aG in next,Window.AllElements do
if aG.Tab and aG.Tab.Index and aG.Tab.Index==as.Index and aG.Lock then
aG:Lock()
end
end
end
function as.UnlockAll(aE)
for aF,aG in next,Window.AllElements do
if aG.Tab and aG.Tab.Index and aG.Tab.Index==as.Index and aG.Unlock then
aG:Unlock()
end
end
end
function as.GetLocked(aE)
local aF={}

for aG,b in next,Window.AllElements do
if b.Tab and b.Tab.Index and b.Tab.Index==as.Index and b.Locked==true then
table.insert(aF,b)
end
end

return aF
end
function as.GetUnlocked(aE)
local aF={}

for aG,b in next,Window.AllElements do
if b.Tab and b.Tab.Index and b.Tab.Index==as.Index and b.Locked==false then
table.insert(aF,b)
end
end

return aF
end

function as.Select(aE)
return ao:SelectTab(as.Index)
end

task.spawn(function()
local aE
if as.CustomEmptyPage.Icon then
aE=
ak.Image(as.CustomEmptyPage.Icon,as.CustomEmptyPage.Icon,0,"Temp","EmptyPage",true)
aE.Size=
UDim2.fromOffset(as.CustomEmptyPage.IconSize or 48,as.CustomEmptyPage.IconSize or 48)
end

local aF=al("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=as.UIElements.ContainerFrame,
},{
al("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),











aE,
as.CustomEmptyPage.Title and al("TextLabel",{
AutomaticSize="XY",
Text=as.CustomEmptyPage.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
TextTransparency=0.5,
BackgroundTransparency=1,
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
})or nil,
as.CustomEmptyPage.Desc and al("TextLabel",{
AutomaticSize="XY",
Text=as.CustomEmptyPage.Desc,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.65,
BackgroundTransparency=1,
FontFace=Font.new(ak.Font,Enum.FontWeight.Regular),
})or nil,
})





local aG
aG=ak.AddSignal(as.UIElements.ContainerFrame.ChildAdded,function()
aF.Visible=false
aG:Disconnect()
end)
end)

return as
end

function ao.OnChange(aq,ar)
ao.OnChangeFunc=ar
end

function ao.SelectTab(aq,ar)
if not ao.Tabs[ar].Locked then
ao.SelectedTab=ar

for as,at in next,ao.Tabs do
if not at.Locked then
ak.SetThemeTag(at.UIElements.Main,{
ImageTransparency="TabBorderTransparency",
},0.15)
if at.Border then
ak.SetThemeTag(at.UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparency",
},0.15)
end
ak.SetThemeTag(at.UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparency",
},0.15)
if at.UIElements.Icon and not at.IconColor then
ak.SetThemeTag(at.UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparency",
},0.15)
end
at.Selected=false
end
end
ak.SetThemeTag(ao.Tabs[ar].UIElements.Main,{
ImageColor3="TabBackgroundActive",
ImageTransparency="TabBackgroundActiveTransparency",
},0.15)
if ao.Tabs[ar].Border then
ak.SetThemeTag(ao.Tabs[ar].UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparencyActive",
},0.15)
end
ak.SetThemeTag(ao.Tabs[ar].UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparencyActive",
},0.15)
if ao.Tabs[ar].UIElements.Icon and not ao.Tabs[ar].IconColor then
ak.SetThemeTag(ao.Tabs[ar].UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparencyActive",
},0.15)
end
ao.Tabs[ar].Selected=true

task.spawn(function()
for au,ax in next,ao.Containers do
ax.AnchorPoint=Vector2.new(0,0.05)
ax.Visible=false
end
ao.Containers[ar].Visible=true
local ay=game:GetService"TweenService"

local az=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local aA=ay:Create(ao.Containers[ar],az,{
AnchorPoint=Vector2.new(0,0),
})
aA:Play()
end)

ao.OnChangeFunc(ar)
end
end

return ao end function a.aa()





local aa={}

local af=a.load'd'
local ai=af.New
local ak=af.Tween

local al=a.load'_'

function aa.New(am,an,ao,aq,ar)
local as={
Title=am.Title or"Section",
Subtitle=am.Subtitle or nil,
Icon=am.Icon,
IconThemed=am.IconThemed,
Opened=am.Opened or false,

HeaderSize=am.Subtitle and 56 or 42,
IconSize=18,

Expandable=false,
}


local at
if as.Icon then
at=af.Image(
as.Icon,
as.Icon,
0,
ao,
"Section",
true,
as.IconThemed,
"TabSectionIcon"
)
at.Size=UDim2.new(0,as.IconSize,0,as.IconSize)
at.ImageLabel.ImageTransparency=0.25
end


local au=ai("Frame",{
Size=UDim2.new(0,16,0,16),
BackgroundTransparency=1,
Visible=false,
},{
ai("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=af.Icon"chevron-down"[1],
ImageRectSize=af.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=af.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={ImageColor3="Icon"},
ImageTransparency=0.55,
}),
})


local ax=ai("TextLabel",{
Text=as.Title,
TextXAlignment="Left",
Size=UDim2.new(1,0,0,18),
ThemeTag={TextColor3="Text"},
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
TextSize=af.Type.BodyLG,
BackgroundTransparency=1,
TextTransparency=0.35,
TextWrapped=false,
TextTruncate=Enum.TextTruncate.AtEnd,
})

local ay
if as.Subtitle then
ay=ai("TextLabel",{
Text=as.Subtitle,
TextXAlignment="Left",
Size=UDim2.new(1,0,0,14),
ThemeTag={TextColor3="SubText"},
FontFace=Font.new(af.Font,Enum.FontWeight.Regular),
TextSize=af.Type.Caption,
BackgroundTransparency=1,
TextTransparency=0.55,
TextWrapped=false,
TextTruncate=Enum.TextTruncate.AtEnd,
})
end

local az=ai("Frame",{
Size=UDim2.new(1,-32,1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
ax,
ay,
ai("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,2),
VerticalAlignment="Center",
}),
})


local aA=ai("Frame",{
Size=UDim2.new(1,-22,0,1),
Position=UDim2.new(0,11,0,as.HeaderSize-1),
BackgroundTransparency=0.88,
ThemeTag={BackgroundColor3="Outline"},
})


local aB=ai("Frame",{
Size=UDim2.new(1,0,0,as.HeaderSize),
BackgroundTransparency=1,
Parent=an,
ClipsDescendants=true,
},{

ai("TextButton",{
Size=UDim2.new(1,0,0,as.HeaderSize),
BackgroundTransparency=1,
Text="",
Name="HeaderButton",
},{
at,
az,
au,
ai("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10),
}),
ai("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
}),
}),
aA,

ai("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,as.HeaderSize),
},{
ai("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ar.Gap),
VerticalAlignment="Bottom",
}),
}),
})


local aC=aB.HeaderButton
aC.MouseEnter:Connect(function()
ak(ax,af.Anim.Fast,{TextTransparency=0.15}):Play()
if ay then
ak(ay,af.Anim.Fast,{TextTransparency=0.35}):Play()
end
end)
aC.MouseLeave:Connect(function()
ak(ax,af.Anim.Fast,{TextTransparency=0.35}):Play()
if ay then
ak(ay,af.Anim.Fast,{TextTransparency=0.55}):Play()
end
end)


function as.Open(aD)
if not as.Expandable then return end
as.Opened=true
local aE=aB.Content.AbsoluteSize.Y/aq
ak(aB,0.33,{
Size=UDim2.new(1,0,0,as.HeaderSize+aE),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ak(au.ImageLabel,0.22,{
Rotation=180,ImageTransparency=0.15,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ak(aA,0.22,{BackgroundTransparency=0.72}):Play()
end

function as.Close(aD)
if not as.Expandable then return end
as.Opened=false
ak(aB,0.26,{
Size=UDim2.new(1,0,0,as.HeaderSize),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ak(au.ImageLabel,0.18,{
Rotation=0,ImageTransparency=0.55,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ak(aA,0.22,{BackgroundTransparency=0.88}):Play()
end


function as.Tab(aD,aE)
if not as.Expandable then
as.Expandable=true
au.Visible=true
end
aE.Parent=aB.Content
return al.New(aE,aq)
end


af.AddSignal(aC.MouseButton1Click,function()
if not as.Expandable then return end
if as.Opened then
as:Close()
else
as:Open()
end
end)


af.AddSignal(
aB.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",
function()
if as.Opened then as:Open()end
end
)


if as.Opened then
task.spawn(function()
task.wait()
as:Open()
end)
end

return as
end

return aa end function a.ab()

return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}end function a.ac()
local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")

local af={
Margin=8,
Padding=9,
}

local ai=a.load'd'
local ak=ai.New
local al=ai.Tween

function af.new(am,an,ao)
local aq={
IconSize=18,
Padding=14,
Radius=22,
Width=400,
MaxHeight=380,

Icons=a.load'ab',
}

local ar=ak("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(1,-((aq.IconSize*2)+(aq.Padding*2)),0,0),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Regular),
TextSize=18,
})

local as=ak("ImageLabel",{
Image=ai.Icon"x"[1],
ImageRectSize=ai.Icon"x"[2].ImageRectSize,
ImageRectOffset=ai.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
},{
ak("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})

local at=ak("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false,
},{
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ak("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding),
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
PaddingBottom=UDim.new(0,aq.Padding),
}),
})

local au=ai.NewRoundFrame(aq.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="WindowSearchBarBackground",
},
ImageTransparency=0,
},{
ai.NewRoundFrame(aq.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Frame",
},{
ak("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ak("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ak("ImageLabel",{
Image=ai.Icon"search"[1],
ImageRectSize=ai.Icon"search"[2].ImageRectSize,
ImageRectOffset=ai.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
}),
ar,
as,
ak("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ak("UIPadding",{
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
}),
}),
}),
ak("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ak("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=0.9,
Visible=false,
}),
at,
ak("UISizeConstraint",{
MaxSize=Vector2.new(aq.Width,aq.MaxHeight),
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
})

local ax=ak("Frame",{
Size=UDim2.new(0,aq.Width,0,0),
AutomaticSize="Y",
Parent=an,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ak("UIScale",{
Scale=0.9,
}),
au,















})

local function CreateSearchTab(ay,az,aA,aB,aC,aD)
local aE=ak("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=aB or nil,
},{
ai.NewRoundFrame(aq.Radius-11,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main",
},{
ai.NewRoundFrame(aq.Radius-11,"Glass-1",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Outline",
},{








ak("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding-2),
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
PaddingBottom=UDim.new(0,aq.Padding-2),
}),
ak("ImageLabel",{
Image=ai.Icon(aA)[1],
ImageRectSize=ai.Icon(aA)[2].ImageRectSize,
ImageRectOffset=ai.Icon(aA)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
}),
ak("Frame",{
Size=UDim2.new(1,-aq.IconSize-aq.Padding,0,0),
BackgroundTransparency=1,
},{
ak("TextLabel",{
Text=ay,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title",
}),
ak("TextLabel",{
Text=az or"",
Visible=az and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.3,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc",
})or nil,
ak("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
}),
}),
},true),
ak("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-aq.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=aC,

},{
ai.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
}),
ak("Frame",{
Size=UDim2.new(1,-aq.Padding-2,0,0),
Position=UDim2.new(0,aq.Padding+2,0,0),
BackgroundTransparency=1,
},{
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right",
}),
})



aE.Main.Size=UDim2.new(
1,
0,
0,
aE.Main.Outline.Frame.Desc.Visible
and(((aq.Padding-2)*2)+aE.Main.Outline.Frame.Title.TextBounds.Y+6+aE.Main.Outline.Frame.Desc.TextBounds.Y)
or(((aq.Padding-2)*2)+aE.Main.Outline.Frame.Title.TextBounds.Y)
)

ai.AddSignal(aE.Main.MouseEnter,function()
al(aE.Main,0.04,{ImageTransparency=0.95}):Play()

end)
ai.AddSignal(aE.Main.InputEnded,function()
al(aE.Main,0.08,{ImageTransparency=1}):Play()

end)
ai.AddSignal(aE.Main.MouseButton1Click,function()
if aD then
aD()
end
end)

return aE
end

local function ContainsText(ay,az)
if not az or az==""then
return false
end

if not ay or ay==""then
return false
end

local aA=string.lower(ay)
local aB=string.lower(az)

return string.find(aA,aB,1,true)~=nil
end

local function Search(ay)
if not ay or ay==""then
return{}
end

local az={}
for aA,aB in next,am.Tabs do
local aC=ContainsText(aB.Title or"",ay)
local aD={}

for aE,aF in next,aB.Elements do
if aF.__type~="Section"then
local aG=ContainsText(aF.Title or"",ay)
local b=ContainsText(aF.Desc or"",ay)

if aG or b then
aD[aE]={
Title=aF.Title,
Desc=aF.Desc,
Original=aF,
__type=aF.__type,
Index=aE,
}
end
end
end

if aC or next(aD)~=nil then
az[aA]={
Tab=aB,
Title=aB.Title,
Icon=aB.Icon,
Elements=aD,
}
end
end
return az
end

ai.AddSignal(at.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

al(at,0.06,{
Size=UDim2.new(
1,
0,
0,
math.clamp(
at.UIListLayout.AbsoluteContentSize.Y+(aq.Padding*2),
0,
aq.MaxHeight
)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function aq.Open(ay)
task.spawn(function()
au.Frame.Visible=true
ax.Visible=true
al(ax.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function aq.Close(ay,az)
task.spawn(function()
ao()
au.Frame.Visible=false
al(ax.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(0.12)
ax.Visible=false
if az then
ax:Destroy()
end
end)
end

ai.AddSignal(as.TextButton.MouseButton1Click,function()
aq:Close(true)
end)

aq:Open()

function aq.Search(ay,az)
az=az or""

local aA=Search(az)

at.Visible=true
au.Frame.Results.Frame.Visible=true
for aB,aC in next,at:GetChildren()do
if aC.ClassName~="UIListLayout"and aC.ClassName~="UIPadding"then
aC:Destroy()
end
end

if aA and next(aA)~=nil then
for aD,aE in next,aA do
local aF=aq.Icons.Tab
local aG=CreateSearchTab(aE.Title,nil,aF,at,true,function()
aq:Close()
am:SelectTab(aD)
end)
if aE.Elements and next(aE.Elements)~=nil then
for b,d in next,aE.Elements do
local f=aq.Icons[d.__type]
CreateSearchTab(
d.Title,
d.Desc,
f,
aG:FindFirstChild"ParentContainer"and aG.ParentContainer.Frame
or nil,
false,
function()
aq:Close()
am:SelectTab(aD)
if aE.Tab.ScrollToTheElement then

aE.Tab:ScrollToTheElement(d.Index)
end

end
)

end
end
end
elseif az~=""then
ak("TextLabel",{
Size=UDim2.new(1,0,0,70),
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.2,
BackgroundTransparency=1,
FontFace=Font.new(ai.Font,Enum.FontWeight.Medium),
Parent=at,
Name="NotFound",
})
else
at.Visible=false
au.Frame.Results.Frame.Visible=false
end
end

ai.AddSignal(ar:GetPropertyChangedSignal"Text",function()
aq:Search(ar.Text)
end)

return aq
end

return af end function a.ad()



local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=aa(game:GetService"UserInputService")
local ai=aa(game:GetService"RunService")
local ak=aa(game:GetService"Players")

local al=workspace.CurrentCamera

local am=a.load's'

local an=a.load'd'
local ao=an.New
local aq=an.Tween


local ar=a.load'v'.New
local as=a.load'l'.New
local at=a.load'w'.New
local au=a.load'x'

local ax=a.load'y'



return function(ay)
local az={
Title=ay.Title or"UI Library",
Author=ay.Author,
Icon=ay.Icon,
IconSize=ay.IconSize or 22,
IconThemed=ay.IconThemed,
IconRadius=ay.IconRadius or 0,
Folder=ay.Folder,
Resizable=ay.Resizable~=false,
Background=ay.Background,
BackgroundImageTransparency=ay.BackgroundImageTransparency or 0,
ShadowTransparency=ay.ShadowTransparency or 0.6,
User=ay.User or{},
Footer=ay.Footer or{},
Topbar=ay.Topbar or{Height=52,ButtonsType="Default"},

Size=ay.Size,

MinSize=ay.MinSize or Vector2.new(560,350),
MaxSize=ay.MaxSize or Vector2.new(850,560),

TopBarButtonIconSize=ay.TopBarButtonIconSize,

ToggleKey=ay.ToggleKey,
ElementsRadius=ay.ElementsRadius,
Radius=ay.Radius or 16,
Transparent=ay.Transparent or false,
HideSearchBar=ay.HideSearchBar~=false,
ScrollBarEnabled=ay.ScrollBarEnabled or false,
SideBarWidth=ay.SideBarWidth or 200,
Acrylic=ay.Acrylic or false,
NewElements=ay.NewElements or false,
IgnoreAlerts=ay.IgnoreAlerts or false,
HidePanelBackground=ay.HidePanelBackground or false,
AutoScale=ay.AutoScale~=false,
OpenButton=ay.OpenButton,
DragFrameSize=160,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=ay.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=ay.Resizable~=false,
IsOpenButtonEnabled=true,

CurrentConfig=nil,
ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnOpenCallback=nil,
OnCloseCallback=nil,
OnDestroyCallback=nil,

IsPC=false,

Gap=5,

TopBarButtons={},
AllElements={},

ElementConfig={},

PendingFlags={},

IsToggleDragging=false,
}

az.UICorner=az.Radius

az.TopBarButtonIconSize=az.TopBarButtonIconSize or(az.Topbar.ButtonsType=="Mac"and 11 or 16)

az.ElementConfig={
UIPadding=(az.NewElements and 10 or 13),
UICorner=az.ElementsRadius or(az.NewElements and 23 or 16),
}

local aA=az.Size or UDim2.new(0,580,0,460)
az.Size=UDim2.new(
aA.X.Scale,
math.clamp(aA.X.Offset,az.MinSize.X,az.MaxSize.X),
aA.Y.Scale,
math.clamp(aA.Y.Offset,az.MinSize.Y,az.MaxSize.Y)
)

if az.Topbar=={}then
az.Topbar={Height=52,ButtonsType="Default"}
end

if not ai:IsStudio()and az.Folder and writefile then
if not isfolder("WindUI/"..az.Folder)then
makefolder("WindUI/"..az.Folder)
end
if not isfolder("WindUI/"..az.Folder.."/assets")then
makefolder("WindUI/"..az.Folder.."/assets")
end
if not isfolder(az.Folder)then
makefolder(az.Folder)
end
if not isfolder(az.Folder.."/assets")then
makefolder(az.Folder.."/assets")
end
end

local aB=ao("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
})

if az.Folder then
az.ConfigManager=ax:Init(az)
end

if az.Acrylic then local
aC, aD=am.AcrylicPaint{UseAcrylic=az.Acrylic}

az.AcrylicPaint=aC
end

local aC=ao("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true,
},{
ao("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})
local aD=an.NewRoundFrame(az.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
ao("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=an.Icon"expand"[1],
ImageRectOffset=an.Icon"expand"[2].ImageRectPosition,
ImageRectSize=an.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local aE=an.NewRoundFrame(az.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})









az.UIElements.SideBar=ao("ScrollingFrame",{
Size=UDim2.new(
1,
az.ScrollBarEnabled and-3-(az.UIPadding/2)or 0,
1,
not az.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
ao("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
ao("UIPadding",{



PaddingBottom=UDim.new(0,az.UIPadding/2),
}),
ao("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,az.Gap),
}),
}),
ao("UIPadding",{

PaddingLeft=UDim.new(0,az.UIPadding/2),
PaddingRight=UDim.new(0,az.UIPadding/2),
PaddingBottom=UDim.new(0,az.UIPadding/2),
}),

})

az.UIElements.SideBarContainer=ao("Frame",{
Size=UDim2.new(
0,
az.SideBarWidth,
1,
az.User.Enabled and-az.Topbar.Height-42-(az.UIPadding*2)or-az.Topbar.Height
),
Position=UDim2.new(0,0,0,az.Topbar.Height),
BackgroundTransparency=1,
Visible=true,
},{
ao("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,not az.HideSearchBar and-45-az.UIPadding or-az.UIPadding/2),
Position=UDim2.new(0,0,1,-az.UIPadding/2),
AnchorPoint=Vector2.new(0,1),
}),
az.UIElements.SideBar,
})

if az.ScrollBarEnabled then
at(
az.UIElements.SideBar,
az.UIElements.SideBarContainer.Content,
az,
3,
ay.WindUI
)
end

az.UIElements.MainBar=ao("Frame",{
Size=UDim2.new(1,-az.UIElements.SideBarContainer.AbsoluteSize.X,1,-az.Topbar.Height),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
an.NewRoundFrame(az.UICorner-(az.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="PanelBackground",
ImageTransparency="PanelBackgroundTransparency",
},


ZIndex=3,
Name="Background",
Visible=not az.HidePanelBackground,
}),
ao("UIPadding",{

PaddingLeft=UDim.new(0,az.UIPadding/2),
PaddingRight=UDim.new(0,az.UIPadding/2),
PaddingBottom=UDim.new(0,az.UIPadding/2),
}),
})

local aF=ao("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

if af.TouchEnabled and not af.KeyboardEnabled then
az.IsPC=false
elseif af.KeyboardEnabled then
az.IsPC=true
else
az.IsPC=nil
end







local aG
if az.User then
local function GetUserThumb()local
b, d=ak:GetUserThumbnailAsync(
az.User.Anonymous and 1 or ak.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return b
end

aG=ao("TextButton",{
Size=UDim2.new(
0,
az.UIElements.SideBarContainer.AbsoluteSize.X-(az.UIPadding/2),
0,
42+az.UIPadding
),
Position=UDim2.new(0,az.UIPadding/2,1,-(az.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=az.User.Enabled or false,
},{
an.NewRoundFrame(az.UICorner-(az.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline",
},{
ao("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
an.NewRoundFrame(az.UICorner-(az.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
ao("ImageLabel",{
Image=GetUserThumb(),
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=0.93,
},{
ao("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ao("TextLabel",{
Text=az.User.Anonymous and"Anonymous"or ak.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="DisplayName",
}),
ao("TextLabel",{
Text=az.User.Anonymous and"anonymous"or ak.LocalPlayer.Name,
TextSize=15,
TextTransparency=0.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="UserName",
}),
ao("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
}),
}),
ao("UIListLayout",{
Padding=UDim.new(0,az.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ao("UIPadding",{
PaddingLeft=UDim.new(0,az.UIPadding/2),
PaddingRight=UDim.new(0,az.UIPadding/2),
}),
}),
})

function az.User.Enable(b)
az.User.Enabled=true
aq(
az.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,az.SideBarWidth,1,-az.Topbar.Height-42-(az.UIPadding*2))},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aG.Visible=true
end
function az.User.Disable(b)
az.User.Enabled=false
aq(
az.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,az.SideBarWidth,1,-az.Topbar.Height)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aG.Visible=false
end
function az.User.SetAnonymous(b,d)
if d~=false then
d=true
end
az.User.Anonymous=d
aG.UserIcon.ImageLabel.Image=GetUserThumb()
aG.UserIcon.Frame.DisplayName.Text=d and"Anonymous"or ak.LocalPlayer.DisplayName
aG.UserIcon.Frame.UserName.Text=d and"anonymous"or ak.LocalPlayer.Name
end

if az.User.Enabled then
az.User:Enable()
else
az.User:Disable()
end

if az.User.Callback then
an.AddSignal(aG.MouseButton1Click,function()
az.User.Callback()
end)
an.AddSignal(aG.MouseEnter,function()
aq(aG.UserIcon,0.04,{ImageTransparency=0.95}):Play()
aq(aG.Outline,0.04,{ImageTransparency=0.85}):Play()
end)
an.AddSignal(aG.InputEnded,function()
aq(aG.UserIcon,0.04,{ImageTransparency=1}):Play()
aq(aG.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local b
local d

local f=false
local g

local h=typeof(az.Background)=="string"and string.match(az.Background,"^video:(.+)")or nil

local i=typeof(az.Background)=="string"
and not h
and string.match(az.Background,"^https?://.+")
or nil

local m=typeof(az.Background)=="string"
and not h
and string.match(az.Background,"^rbxassetid://%d+")
or nil

local function GetImageExtension(p)
if not p or typeof(p)~="string"then
return".png"
end
local r=p:match"^([^?#]+)"or p
local u=r:match"%.(%w+)$"
if u then
u=u:lower()
if u=="jpg"or u=="jpeg"or u=="png"or u=="webp"then
return"."..u
end
end
return".png"
end



if typeof(az.Background)=="string"and h then
f=true

if string.find(h,"http")then
local p=(az.Folder or"Temp").."/assets/."..an.SanitizeFilename(h)..".webm"
if not isfile(p)then
local r,u=pcall(function()





local r=game.HttpGet and game:HttpGet(h)
or an.Request{
Url=h,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(p,r)
end)
if not r then
warn("[ WindUI.Window.Background ] Failed to download video: "..tostring(u))
end
end

local r,u=pcall(function()
return getcustomasset(p)
end)
if not r then
warn("[ WindUI.Window.Background ] Failed to load custom asset: "..tostring(u))
end
warn"[ WindUI.Window.Background ] VideoFrame may not work with custom video"
h=u
end

g=ao("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=h,
Looped=true,
Volume=0,
},{
ao("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})
g:Play()
elseif i then
local p=(az.Folder or"Temp")
.."/assets/."
..an.SanitizeFilename(i)
..GetImageExtension(i)

if isfile and not isfile(p)then
local r,u=pcall(function()
local r=game.HttpGet and game:HttpGet(i)
or an.Request{
Url=i,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(p,r)
end)

if not r then
warn("[ Window.Background ] Failed to download image: "..tostring(u))
end
end

local r,u=pcall(function()
return getcustomasset(p)
end)

if not r then
warn("[ Window.Background ] Failed to load custom asset: "..tostring(u))
end

g=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=u,
ImageTransparency=0,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})
elseif m then
g=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=m,
ImageTransparency=0,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})
elseif az.Background then
g=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(az.Background)=="string"and az.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
})
end

local p=an.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
ao("TextButton",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
Name="Frame",
}),
})

function createAuthor(r)
return ao("TextLabel",{
Text=r,
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=az.UIElements.Main and az.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="WindowTopbarAuthor",
},
Name="Author",
})
end

local r
local u

if az.Author then
r=createAuthor(az.Author)
end

local v=ao("TextLabel",{
Text=az.Title,
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="WindowTopbarTitle",
},
})

az.UIElements.Main=ao("Frame",{
Size=UDim2.new(az.Size.X.Scale,az.Size.X.Offset,0,0),
Position=az.Position,
BackgroundTransparency=1,
Parent=ay.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,

},{
ay.WindUI.UIScaleObj,
az.AcrylicPaint and az.AcrylicPaint.Frame or nil,
aF,
an.NewRoundFrame(az.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="WindowBackground",
},

},{
g,
p,
aC,
}),




aB,
aD,
aE,
ao("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
ao("UICorner",{
CornerRadius=UDim.new(0,az.UICorner),
}),
az.UIElements.SideBarContainer,
az.UIElements.MainBar,

aG,

d,
ao("Frame",{
Size=UDim2.new(1,0,0,az.Topbar.Height),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar",
},{
b,






ao("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left",
},{
ao("UIListLayout",{
Padding=UDim.new(0,az.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
ao("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
v,
r,
}),
ao("UIPadding",{
PaddingLeft=UDim.new(0,4),
}),
}),
ao("CanvasGroup",{
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Center",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
AutomaticSize="Y",
Visible=false,
},{



ao("ScrollingFrame",{
Name="Holder",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(1,0,1,0),


},{

ao("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,az.UIPadding/2),
}),
}),
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(az.Topbar.ButtonsType=="Default"and 1 or 0,0,0.5,0),
AnchorPoint=Vector2.new(az.Topbar.ButtonsType=="Default"and 1 or 0,0.5),
Name="Right",
},{
ao("UIListLayout",{
Padding=UDim.new(0,az.Topbar.ButtonsType=="Default"and 9 or 0),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,az.UIPadding),
PaddingLeft=UDim.new(
0,
az.Topbar.ButtonsType=="Default"and az.UIPadding or az.UIPadding-2
),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,az.UIPadding),
}),
}),
}),
})

an.AddSignal(az.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local x=0
local z=az.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
/ay.WindUI.UIScale

x=az.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X/ay.WindUI.UIScale
if az.Topbar.ButtonsType~="Default"then
x=x+z+az.UIPadding-4
end

az.UIElements.Main.Main.Topbar.Center.Position=
UDim2.new(0,x+(az.UIPadding/ay.WindUI.UIScale),0.5,0)
az.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-x
-(az.UIPadding/ay.WindUI.UIScale)
-(az.Topbar.ButtonsType=="Default"and z+az.UIPadding or 0),
1,
0
)
end)

if az.Topbar.ButtonsType~="Default"then
an.AddSignal(az.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal"AbsoluteSize",function()
az.UIElements.Main.Main.Topbar.Left.Position=UDim2.new(
0,
(az.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/ay.WindUI.UIScale)+az.UIPadding-4,
0,
0
)
end)
end

function az.CreateTopbarButton(x,z,A,F,G,H,J,L)
local M=an.Image(
A,
A,
0,
az.Folder,
"WindowTopbarIcon",
az.Topbar.ButtonsType=="Default"and true or false,
H,
"WindowTopbarButtonIcon"
)
M.Size=az.Topbar.ButtonsType=="Default"
and UDim2.new(0,L or az.TopBarButtonIconSize,0,L or az.TopBarButtonIconSize)
or UDim2.new(0,0,0,0)
M.AnchorPoint=Vector2.new(0.5,0.5)
M.Position=UDim2.new(0.5,0,0.5,0)
M.ImageLabel.ImageTransparency=az.Topbar.ButtonsType=="Default"and 0 or 1

if az.Topbar.ButtonsType~="Default"then
M.ImageLabel.ImageColor3=an.GetTextColorForHSB(J)
end

local N=an.NewRoundFrame(
az.Topbar.ButtonsType=="Default"and az.UICorner-(az.UIPadding/2)or 999,
"Squircle",
{
Size=az.Topbar.ButtonsType=="Default"
and UDim2.new(0,az.Topbar.Height-16,0,az.Topbar.Height-16)
or UDim2.new(0,14,0,14),
LayoutOrder=G or 999,


ZIndex=9999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=az.Topbar.ButtonsType~="Default"and(J or Color3.fromHex"#ff3030")or nil,
ThemeTag=az.Topbar.ButtonsType=="Default"and{
ImageColor3="Text",
}or nil,
ImageTransparency=az.Topbar.ButtonsType=="Default"and 1 or 0,
},
{












M,
ao("UIScale",{
Scale=1,
}),
},
true
)

local O=ao("Frame",{
Size=az.Topbar.ButtonsType~="Default"and UDim2.new(0,24,0,24)
or UDim2.new(0,az.Topbar.Height-16,0,az.Topbar.Height-16),
BackgroundTransparency=1,
Parent=az.UIElements.Main.Main.Topbar.Right,
LayoutOrder=G or 999,
},{
N,
})



az.TopBarButtons[100-G]={
Name=z,
Object=O,
}

an.AddSignal(N.MouseButton1Click,function()
if F then
F()
end
end)
an.AddSignal(N.MouseEnter,function()
if az.Topbar.ButtonsType=="Default"then
aq(N,0.15,{ImageTransparency=0.93}):Play()


else

aq(
M.ImageLabel,
0.1,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aq(M,0.1,{
Size=UDim2.new(
0,
L or az.TopBarButtonIconSize,
0,
L or az.TopBarButtonIconSize
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)

an.AddSignal(N.MouseButton1Down,function()
aq(N.UIScale,0.2,{Scale=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

an.AddSignal(N.MouseLeave,function()
if az.Topbar.ButtonsType=="Default"then
aq(N,0.1,{ImageTransparency=1}):Play()


else

aq(
M.ImageLabel,
0.1,
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aq(
M,
0.1,
{Size=UDim2.new(0,0,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end)

an.AddSignal(N.InputEnded,function()
aq(N.UIScale,0.2,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end)

return N
end

function az.Topbar.Button(x,z:{
Name:string,
Icon:string,
Callback:any,
LayoutOrder:number,
IconThemed:boolean,
Color:Color3,
IconSize:number
})
return az:CreateTopbarButton(
z.Name,
z.Icon,
z.Callback,
z.LayoutOrder or 0,
z.IconThemed,
z.Color,
z.IconSize
)
end



local x=an.Drag(
az.UIElements.Main,
{az.UIElements.Main.Main.Topbar,p.Frame},
function(x,z)
if not az.Closed then
if x and z==p.Frame then
aq(p,0.1,{ImageTransparency=0.35}):Play()
else
aq(p,0.2,{ImageTransparency=0.8}):Play()
end
az.Position=az.UIElements.Main.Position
az.Dragging=x
end
end
)

if not f and az.Background and typeof(az.Background)=="table"then
local z=ao"UIGradient"
for A,F in next,az.Background do
z[A]=F
end

az.UIElements.BackgroundGradient=an.NewRoundFrame(az.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=az.UIElements.Main.Background,
ImageTransparency=az.Transparent and ay.WindUI.TransparencyValue or 0,
},{
z,
})
end














az.OpenButtonMain=a.load'z'.New(az)

task.spawn(function()
if az.Icon then
local z=ao("Frame",{
Size=UDim2.new(0,22,0,22),
BackgroundTransparency=1,
Parent=az.UIElements.Main.Main.Topbar.Left,
})

u=an.Image(
az.Icon,
az.Title,
az.IconRadius,
az.Folder,
"Window",
true,
az.IconThemed,
"WindowTopbarIcon"
)
u.Parent=z
u.Size=UDim2.new(0,az.IconSize,0,az.IconSize)
u.Position=UDim2.new(0.5,0,0.5,0)
u.AnchorPoint=Vector2.new(0.5,0.5)

az.OpenButtonMain:SetIcon(az.Icon)











else
az.OpenButtonMain:SetIcon(az.Icon)

end
end)

function az.SetToggleKey(z,A)
az.ToggleKey=A
end

function az.SetTitle(z,A)
az.Title=A
v.Text=A
end

function az.SetAuthor(z,A)
az.Author=A
if not r then
r=createAuthor(az.Author)
end

r.Text=A
end

function az.SetSize(z,A)
if typeof(A)=="UDim2"then
az.Size=A

aq(az.UIElements.Main,0.08,{Size=A},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

function az.SetBackgroundImage(z,A)
az.UIElements.Main.Background.ImageLabel.Image=A
end
function az.SetBackgroundImageTransparency(z,A)
if g and g:IsA"ImageLabel"then
g.ImageTransparency=math.floor(A*10+0.5)/10
end
az.BackgroundImageTransparency=math.floor(A*10+0.5)/10
end

function az.SetBackgroundTransparency(z,A)
local F=math.floor(tonumber(A)*10+0.5)/10
ay.WindUI.TransparencyValue=F
az:ToggleTransparency(F>0)
end

local z
local A
an.Icon"minimize"
an.Icon"maximize"

az:CreateTopbarButton(
"Fullscreen",
az.Topbar.ButtonsType=="Mac"and"rbxassetid://127426072704909"or"maximize",
function()
az:ToggleFullscreen()
end,
(az.Topbar.ButtonsType=="Default"and 998 or 999),
true,
Color3.fromHex"#60C762",
az.Topbar.ButtonsType=="Mac"and 9 or nil
)

local function SetSize(F)
aq(az.UIElements.Main,0.45,{
Size=not az.IsFullscreen and A or UDim2.new(
0,
(ay.WindUI.ScreenGui.AbsoluteSize.X-20)/ay.WindUI.UIScale,
0,
(ay.WindUI.ScreenGui.AbsoluteSize.Y-20-52)/ay.WindUI.UIScale
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

aq(
az.UIElements.Main,
0.45,
{Position=not az.IsFullscreen and z or UDim2.new(0.5,0,0.5,26)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end

function az.ToggleFullscreen(F)
local G=az.IsFullscreen

x:Set(G)

if not G then
z=az.UIElements.Main.Position
A=az.UIElements.Main.Size

az.CanResize=false
else
if az.Resizable then
az.CanResize=true
end
end

az.IsFullscreen=not G

SetSize(true)
end

an.AddSignal(ay.WindUI.ScreenGui:GetPropertyChangedSignal"AbsoluteSize",function()
if az.IsFullscreen then
SetSize()
end
end)

az:CreateTopbarButton("Minimize","minus",function()
if az.Close then
az:Close()
end






















end,(az.Topbar.ButtonsType=="Default"and 997 or 998),nil,Color3.fromHex"#F4C948")

function az.OnOpen(F,G)
az.OnOpenCallback=G
end
function az.OnClose(F,G)
az.OnCloseCallback=G
end
function az.OnDestroy(F,G)
az.OnDestroyCallback=G
end

if ay.WindUI.UseAcrylic then
az.AcrylicPaint.AddParent(az.UIElements.Main)
end

function az.SetIconSize(F,G)
local H
if typeof(G)=="number"then
H=UDim2.new(0,G,0,G)
az.IconSize=G
elseif typeof(G)=="UDim2"then
H=G
az.IconSize=G.X.Offset
end

if u then
u.Size=H
end
end

function az.Open(F)
if az.Destroyed then
return
end
task.spawn(function()
if az.OnOpenCallback then
task.spawn(function()
an.SafeCallback(az.OnOpenCallback)
end)
end

task.wait(0.06)
az.Closed=false

az.UIElements.Main.Size=UDim2.new(az.Size.X.Scale,az.Size.X.Offset,0,100)

aq(az.UIElements.Main,0.8,{

Size=az.Size,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if az.UIElements.BackgroundGradient then
aq(az.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

az.UIElements.Main.Background.ImageTransparency=1
aq(az.UIElements.Main.Background,0.4,{

ImageTransparency=az.Transparent and ay.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if g then
if g:IsA"VideoFrame"then
g.Visible=true
else
aq(g,0.2,{
ImageTransparency=az.BackgroundImageTransparency,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

if az.OpenButtonMain and az.IsOpenButtonEnabled then
az.OpenButtonMain:Visible(false)
end









aq(
aF,
0.25,
{ImageTransparency=az.ShadowTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()




aq(
p,
0.45,
{Size=UDim2.new(0,az.DragFrameSize,0,4),ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
x:Set(true)

if az.Resizable then
aq(
aC.ImageLabel,
0.45,
{ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
az.CanResize=true
end

az.CanDropdown=true
az.UIElements.Main.Visible=true



az.UIElements.Main:WaitForChild"Main".Visible=true

ay.WindUI:ToggleAcrylic(true)

end)
end
function az.Close(F)
if az.Destroyed then
return
end

local G={}

if az.OnCloseCallback then
task.spawn(function()
an.SafeCallback(az.OnCloseCallback)
end)
end

ay.WindUI:ToggleAcrylic(false)

if az.UIElements.Main and az.UIElements.Main:WaitForChild"Main"then
az.UIElements.Main.Main.Visible=false
end

az.CanDropdown=false
az.Closed=true

aq(az.UIElements.Main,0.9,{

Size=UDim2.new(az.Size.X.Scale,az.Size.X.Offset,0,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if az.UIElements.BackgroundGradient then
aq(az.UIElements.BackgroundGradient,0.2,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

aq(az.UIElements.Main.Background,0.3,{

ImageTransparency=1,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()








if g then
if g:IsA"VideoFrame"then
g.Visible=false
else
aq(g,0.3,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
aq(aF,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()




aq(
p,
0.3,
{Size=UDim2.new(0,0,0,4),ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut
):Play()
aq(
aC.ImageLabel,
0.3,
{ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
x:Set(false)
az.CanResize=false

task.spawn(function()
task.wait(0.4)

if not az.Closed then
return
end

az.UIElements.Main.Visible=false

if az.OpenButtonMain and not az.Destroyed and not az.IsPC and az.IsOpenButtonEnabled then
az.OpenButtonMain:Visible(true)
end
end)

function G.Destroy(H)
task.spawn(function()
if az.OnDestroyCallback then
task.spawn(function()
an.SafeCallback(az.OnDestroyCallback)
end)
end

if az.AcrylicPaint and az.AcrylicPaint.Model then
az.AcrylicPaint.Model:Destroy()
end

az.Destroyed=true

task.wait(0.4)

ay.WindUI.ScreenGui:Destroy()
ay.WindUI.NotificationGui:Destroy()
ay.WindUI.DropdownGui:Destroy()
ay.WindUI.TooltipGui:Destroy()

an.DisconnectAll()

return
end)
end

return G
end
function az.Destroy(F)
return az:Close():Destroy()
end
function az.Toggle(F)
if az.Closed then
az:Open()
else
az:Close()
end
end

function az.ToggleTransparency(F,G)

az.Transparent=G
ay.WindUI.Transparent=G

az.UIElements.Main.Background.ImageTransparency=G and ay.WindUI.TransparencyValue or 0


end

function az.LockAll(F)
for G,H in next,az.AllElements do
if H.Lock then
H:Lock()
end
end
end
function az.UnlockAll(F)
for G,H in next,az.AllElements do
if H.Unlock then
H:Unlock()
end
end
end
function az.GetLocked(F)
local G={}

for H,J in next,az.AllElements do
if J.Locked then
table.insert(G,J)
end
end

return G
end
function az.GetUnlocked(F)
local G={}

for H,J in next,az.AllElements do
if J.Locked==false then
table.insert(G,J)
end
end

return G
end

function az.GetUIScale(F,G)
return ay.WindUI.UIScale
end

function az.SetUIScale(F,G)
ay.WindUI.UIScale=G
aq(ay.WindUI.UIScaleObj,0.2,{Scale=G},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return az
end

function az.SetToTheCenter(F)
aq(
az.UIElements.Main,
0.45,
{Position=UDim2.new(0.5,0,0.5,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
return az
end

function az.SetCurrentConfig(F,G)
az.CurrentConfig=G
end

do
local F=40
local G=al.ViewportSize
local H=Vector2.new(az.Size.X.Offset,az.Size.Y.Offset)

if not az.IsFullscreen and az.AutoScale then
local J=G.X-(F*2)
local L=G.Y-(F*2)

local M=J/H.X
local N=L/H.Y

local O=math.min(M,N)

local P=0.3
local Q=1.0

local R=math.clamp(O,P,Q)

local S=az:GetUIScale()or 1
local T=0.05

if math.abs(R-S)>T then
az:SetUIScale(R)
end
end
end

if az.OpenButtonMain and az.OpenButtonMain.Button then
an.AddSignal(az.OpenButtonMain.Button.TextButton.MouseButton1Click,function()


az:Open()
end)
end

an.AddSignal(af.InputBegan,function(F,G)
if G then
return
end

if az.ToggleKey then
if F.KeyCode==az.ToggleKey then
az:Toggle()
end
end
end)

task.spawn(function()

az:Open()
end)

function az.EditOpenButton(F,G)
return az.OpenButtonMain:Edit(G)
end

if az.OpenButton and typeof(az.OpenButton)=="table"then
az:EditOpenButton(az.OpenButton)
end

local F=a.load'_'
local G=a.load'aa'
local H=F.Init(az,ay.WindUI,ay.WindUI.TooltipGui)
H:OnChange(function(J)
az.CurrentTab=J
end)

az.TabModule=H

function az.Tab(J,L)
L.Parent=az.UIElements.SideBar.Frame
return H.New(L,ay.WindUI.UIScale)
end

function az.SelectTab(J,L)
H:SelectTab(L)
end

function az.Section(J,L)
return G.New(
L,
az.UIElements.SideBar.Frame,
az.Folder,
ay.WindUI.UIScale,
az
)
end

function az.IsResizable(J,L)
az.Resizable=L
az.CanResize=L
end

function az.SetPanelBackground(J,L)
if typeof(L)=="boolean"then
az.HidePanelBackground=L

az.UIElements.MainBar.Background.Visible=L

if H then
for M,N in next,H.Containers do
N.ScrollingFrame.UIPadding.PaddingTop=UDim.new(0,az.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingLeft=
UDim.new(0,az.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingRight=
UDim.new(0,az.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingBottom=
UDim.new(0,az.HidePanelBackground and 20 or 10)
end
end
end
end

function az.Divider(J)
local L=ao("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
})
local M=ao("Frame",{
Parent=az.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
L,
})

return M
end

local J=a.load'n'
function az.Dialog(L,M)
local N={
Title=M.Title or"Dialog",
Width=M.Width or 320,
Content=M.Content,
Buttons=M.Buttons or{},

TextPadding=14,
}
local O=J.Create(false,"Dialog",az,ay.WindUI,az.UIElements.Main.Main)

O.UIElements.Main.Size=UDim2.new(0,N.Width,0,0)

local P=ao("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=O.UIElements.Main,
},{
ao("UIListLayout",{
FillDirection="Vertical",

Padding=UDim.new(0,O.UIPadding),
}),
})

local Q=ao("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=P,
},{
ao("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,O.UIPadding),
VerticalAlignment="Center",
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,N.TextPadding/2),
PaddingLeft=UDim.new(0,N.TextPadding/2),
PaddingRight=UDim.new(0,N.TextPadding/2),
}),
})

local R
if M.Icon then
R=an.Image(
M.Icon,
N.Title..":"..M.Icon,
0,
az,
"Dialog",
true,
M.IconThemed
)
R.Size=UDim2.new(0,22,0,22)
R.Parent=Q
end

O.UIElements.UIListLayout=ao("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
VerticalFlex="SpaceBetween",
Parent=O.UIElements.Main,
})

ao("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=O.UIElements.Main,
})

O.UIElements.Title=ao("TextLabel",{
Text=N.Title,
TextSize=20,
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,R and-26-O.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=Q,
})
if N.Content then
ao("TextLabel",{
Text=N.Content,
TextSize=18,
TextTransparency=0.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=P,
},{
ao("UIPadding",{
PaddingLeft=UDim.new(0,N.TextPadding/2),
PaddingRight=UDim.new(0,N.TextPadding/2),
PaddingBottom=UDim.new(0,N.TextPadding/2),
}),
})
end

local S=ao("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Center",
HorizontalFlex="Fill",
})

local T=ao("Frame",{
Size=UDim2.new(1,0,0,36),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=O.UIElements.Main,
LayoutOrder=4,
},{
S,






})

local U={}

for V,W in next,N.Buttons do
local X=
as(W.Title,W.Icon,W.Callback,W.Variant,T,O,true)
table.insert(U,X)
X.Size=UDim2.new(1,0,1,0)
end





















































O:Open()

return O
end

local L=false

az:CreateTopbarButton("Close","x",function()
if not L then
if not az.IgnoreAlerts then
L=true

az:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()
L=false
end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()
L=false
az:Destroy()
end,
Variant="Primary",
},
},
}
else
az:Destroy()
end
end
end,(az.Topbar.ButtonsType=="Default"and 999 or 997),nil,Color3.fromHex"#F4695F")

function az.Tag(M,N)
if az.UIElements.Main.Main.Topbar.Center.Visible==false then
az.UIElements.Main.Main.Topbar.Center.Visible=true
end
N.Window=az
return au:New(N,az.UIElements.Main.Main.Topbar.Center.Holder)
end

local M=ay.WindUI.GenerateGUID()

local function startResizing(N)
if az.CanResize then
isResizing=true
aD.Active=true
initialSize=az.UIElements.Main.Size
initialInputPosition=N.Position


aq(aC.ImageLabel,0.1,{ImageTransparency=0.35}):Play()

an.AddSignal(N.Changed,function()
if N.UserInputState==Enum.UserInputState.End then
if ay.WindUI.CurrentInput and ay.WindUI.CurrentInput~=M then
return
end

ay.WindUI.CurrentInput=nil

isResizing=false
aD.Active=false


aq(aC.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)
end
end

an.AddSignal(aC.InputBegan,function(N)
if
N.UserInputType==Enum.UserInputType.MouseButton1
or N.UserInputType==Enum.UserInputType.Touch
then
if ay.WindUI.CurrentInput and ay.WindUI.CurrentInput~=M then
return
end
ay.WindUI.CurrentInput=M

if az.CanResize then
startResizing(N)
end
end
end)

an.AddSignal(af.InputChanged,function(N)
if
N.UserInputType==Enum.UserInputType.MouseMovement
or N.UserInputType==Enum.UserInputType.Touch
then
if isResizing and az.CanResize then
local O=N.Position-initialInputPosition
local P=UDim2.new(0,initialSize.X.Offset+O.X*2,0,initialSize.Y.Offset+O.Y*2)

P=UDim2.new(
P.X.Scale,
math.clamp(P.X.Offset,az.MinSize.X,az.MaxSize.X),
P.Y.Scale,
math.clamp(P.Y.Offset,az.MinSize.Y,az.MaxSize.Y)
)

aq(az.UIElements.Main,0.08,{
Size=P,
},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

az.Size=P
end
end
end)

an.AddSignal(aC.MouseEnter,function()
if ay.WindUI.CurrentInput and ay.WindUI.CurrentInput~=M then
return
end
if not isResizing then
aq(aC.ImageLabel,0.1,{ImageTransparency=0.35}):Play()
end
end)
an.AddSignal(aC.MouseLeave,function()
if ay.WindUI.CurrentInput and ay.WindUI.CurrentInput~=M then
return
end
if not isResizing then
aq(aC.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)



local N=0
local O=0.4
local P
local Q=0

function onDoubleClick()
az:SetToTheCenter()
end

an.AddSignal(p.Frame.MouseButton1Up,function()
local R=tick()
local S=az.Position

Q=Q+1

if Q==1 then
N=R
P=S

task.spawn(function()
task.wait(O)
if Q==1 then
Q=0
P=nil
end
end)
elseif Q==2 then
if R-N<=O and S==P then
onDoubleClick()
end

Q=0
P=nil
N=0
else
Q=1
N=R
P=S
end
end)



if not az.HideSearchBar then
local R=a.load'ac'
local S=false





















local T=ar("Search","search",az.UIElements.SideBarContainer,true)
T.Size=UDim2.new(1,-az.UIPadding/2,0,39)
T.Position=UDim2.new(0,az.UIPadding/2,0,0)

an.AddSignal(T.MouseButton1Click,function()
if S then
return
end

R.new(az.TabModule,az.UIElements.Main,function()

S=false
if az.Resizable then
az.CanResize=true
end

aq(aE,0.1,{ImageTransparency=1}):Play()
aE.Active=false
end)
aq(aE,0.1,{ImageTransparency=0.65}):Play()
aE.Active=true

S=true
az.CanResize=false
end)
end



function az.DisableTopbarButtons(R,S)
for T,U in next,S do
for V,W in next,az.TopBarButtons do
if W.Name==U then
W.Object.Visible=false
end
end
end
end



























return az
end end end







local aa={
Window=nil,
Theme=nil,
Creator=a.load'd',
LocalizationModule=a.load'e',
NotificationModule=a.load'f',
Themes=nil,
Transparent=false,

TransparencyValue=0.15,
UIScale=1,

ConfigManager=nil,
Version="1.0.0",

Services=a.load'k',

OnThemeChangeFunction=nil,

cloneref=nil,
UIScaleObj=nil,
CreateWindow=nil,
CurrentInput=nil,
}

local af=(cloneref or clonereference or function(af)return af end)
aa.cloneref=af

local ai=af(game:GetService"HttpService")
local ak=af(game:GetService"Players")
local al=af(game:GetService"CoreGui")
local am=af(game:GetService"RunService")
local an=af(game:GetService"UserInputService")

function aa.GenerateGUID()
return ai:GenerateGUID(false)
end

local ao=aa.GenerateGUID()

an.InputBegan:Connect(function(aq)
task.defer(function()
if aq.UserInputType==Enum.UserInputType.MouseButton1
or aq.UserInputType==Enum.UserInputType.Touch
then
if aa.CurrentInput and aa.CurrentInput~=ao then return end
aa.CurrentInput=ao
end
end)
end)
an.InputEnded:Connect(function(aq)
if aq.UserInputType==Enum.UserInputType.MouseButton1
or aq.UserInputType==Enum.UserInputType.Touch
then
if aa.CurrentInput and aa.CurrentInput~=ao then return end
aa.CurrentInput=nil
end
end)

local aq=ak.LocalPlayer or nil

local ar=a.load'o'
local as=aa.Creator
local at=as.New
local au=a.load's'

local ax=protectgui or(syn and syn.protect_gui)or function()end
local ay=gethui and gethui()
or(al or aq:WaitForChild"PlayerGui")

local az=at("UIScale",{Scale=aa.UIScale})
aa.UIScaleObj=az


aa.ScreenGui=at("ScreenGui",{
Name="LeviathanUI",
Parent=ay,
IgnoreGuiInset=true,
ScreenInsets="None",
DisplayOrder=-99999,
},{
at("Folder",{Name="Window"}),
at("Folder",{Name="KeySystem"}),
at("Folder",{Name="Popups"}),
at("Folder",{Name="ToolTips"}),
})

aa.NotificationGui=at("ScreenGui",{
Name="LeviathanUI/Notifications",
Parent=ay,
IgnoreGuiInset=true,
})
aa.DropdownGui=at("ScreenGui",{
Name="LeviathanUI/Dropdowns",
Parent=ay,
IgnoreGuiInset=true,
})
aa.TooltipGui=at("ScreenGui",{
Name="LeviathanUI/Tooltips",
Parent=ay,
IgnoreGuiInset=true,
})

ax(aa.ScreenGui)
ax(aa.NotificationGui)
ax(aa.DropdownGui)
ax(aa.TooltipGui)

as.Init(aa)


local aA=aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(aB,aC)
aC.Holder=aA.Frame
aC.Window=aa.Window
return aa.NotificationModule.New(aC)
end

function aa.SetNotificationLower(aB,aC)
aA.SetLower(aC)
end


function aa.SetFont(aB,aC)
as.UpdateFont(aC)
end

function aa.OnThemeChange(aB,aC)
aa.OnThemeChangeFunction=aC
end

function aa.AddTheme(aB,aC)
aa.Themes[aC.Name]=aC
return aC
end

function aa.SetTheme(aB,aC)
if aa.Themes[aC]then
aa.Theme=aa.Themes[aC]
as.SetTheme(aa.Themes[aC])
if aa.OnThemeChangeFunction then
aa.OnThemeChangeFunction(aC)
end
return aa.Themes[aC]
end
return nil
end

function aa.GetThemes(aB)return aa.Themes end
function aa.GetCurrentTheme(aB)return aa.Theme.Name end
function aa.GetTransparency(aB)return aa.Transparent or false end
function aa.GetWindowSize(aB)return aa.Window.UIElements.Main.Size end


function aa.Localization(aB,aC)
return aa.LocalizationModule:New(aC,as)
end

function aa.SetLanguage(aB,aC)
if as.Localization then
return as.SetLanguage(aC)
end
return false
end


function aa.ToggleAcrylic(aB,aC)
if aa.Window and aa.Window.AcrylicPaint
and aa.Window.AcrylicPaint.Model
then
aa.Window.Acrylic=aC
aa.Window.AcrylicPaint.Model.Transparency=aC and 0.98 or 1
if aC then au.Enable()else au.Disable()end
end
end


function aa.Gradient(aB,aC,aD)
local aE,aF={},{}
for aG,b in next,aC do
local d=tonumber(aG)
if d then
d=math.clamp(d/100,0,1)
local f=b.Color
if typeof(f)=="string"and string.sub(f,1,1)=="#"then f=Color3.fromHex(f)end
table.insert(aE,ColorSequenceKeypoint.new(d,f))
table.insert(aF,NumberSequenceKeypoint.new(d,b.Transparency or 0))
end
end
table.sort(aE,function(d,f)return d.Time<f.Time end)
table.sort(aF,function(d,f)return d.Time<f.Time end)
if#aE<2 then
table.insert(aE,ColorSequenceKeypoint.new(1,aE[1].Value))
table.insert(aF,NumberSequenceKeypoint.new(1,aF[1].Value))
end
local d={
Color=ColorSequence.new(aE),
Transparency=NumberSequence.new(aF),
}
if aD then for f,g in pairs(aD)do d[f]=g end end
return d
end


function aa.Popup(aB,aC)
aC.WindUI=aa
return a.load't'.new(
aC,
aa.ScreenGui.Popups
)
end


function aa.SetParent(aB,aC)
if aa.ScreenGui then aa.ScreenGui.Parent=aC end
if aa.NotificationGui then aa.NotificationGui.Parent=aC end
if aa.DropdownGui then aa.DropdownGui.Parent=aC end
if aa.TooltipGui then aa.TooltipGui.Parent=aC end
end


aa.Themes=a.load'u'(aa,as)
as.Themes=aa.Themes

aa:SetTheme"Dark"
aa:SetLanguage(as.Language)


function aa.CreateWindow(aB,aC)
local aD=a.load'ad'

if not am:IsStudio()and writefile then
if not isfolder"LeviathanUI"then makefolder"LeviathanUI"end
if aC.Folder then makefolder(aC.Folder)
else makefolder(aC.Title)end
end

aC.WindUI=aa
aC.Window=aa.Window
aC.Parent=aa.ScreenGui.Window

if aa.Window then
warn"[ LeviathanUI ] Cannot create more than one window."
return
end

local aE=true

local aF=aa.Themes[aC.Theme or"Dark"]
as.SetTheme(aF)

local aG=gethwid or function()return ak.LocalPlayer.UserId end
local b=aG()

if aC.KeySystem then
aE=false

local function loadKeysystem()
ar.new(aC,b,function(d)
aE=d
end)
end

local d=(aC.Folder or"Temp").."/"..b..".key"

if aC.KeySystem.KeyValidator then
if aC.KeySystem.SaveKey and isfile(d)then
local f=readfile(d)
aE=aC.KeySystem.KeyValidator(f)
if not aE then loadKeysystem()end
else
loadKeysystem()
end
elseif not aC.KeySystem.API then
if aC.KeySystem.SaveKey and isfile(d)then
local f=readfile(d)
local g=(type(aC.KeySystem.Key)=="table")
and table.find(aC.KeySystem.Key,f)
or tostring(aC.KeySystem.Key)==tostring(f)
aE=g
if not g then loadKeysystem()end
else
loadKeysystem()
end
else
if isfile(d)then
local f=readfile(d)
local g=false
for h,i in next,aC.KeySystem.API do
local m=aa.Services[i.Type]
if m then
local p={}
for r,u in next,m.Args do
table.insert(p,i[u])
end
local v=m.New(table.unpack(p))
if v.Verify(f)then
g=true
break
end
end
end
aE=g
if not g then loadKeysystem()end
else
loadKeysystem()
end
end

repeat task.wait()until aE
end

local d=aD(aC)

aa.Transparent=aC.Transparent
aa.Window=d

if aC.Acrylic then au.init()end

return d
end

return aa