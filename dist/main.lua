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
local H=GetShape(p.Type)
local J=math.max(F/H.Radius,0.0001)
A.SliceScale=J
return p
end

function p.SetType(C,F)
p.Type=F
local H=GetShape(F)
A.Image=H.Image
A.SliceCenter=H.Rect
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
local H=string.find(p.Type,"Outline")and"Outline"or nil
local J=H or F or""

local L=math.round(A.AbsoluteSize.X/b.UIScale)
local M=math.round(A.AbsoluteSize.Y/b.UIScale)
if L==0 or M==0 then return end

local N=p.Radius~=0 and p.Radius or math.min(L,M)/2
local O=d.Shapes.Squircle.Radius/1024
local P=N/math.min(L,M)

local Q
if L>M then
Q=P>=O
and("SquircleH"..J)
or("Squircle"..J)
elseif L<M then
Q=P>=O
and("SquircleV"..J)
or("Squircle"..J)
else
Q=P>=O
and("Circle"..J)
or("Squircle"..J)
end

if Q~=p:GetType()then
p:SetType(Q)
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

Primary="Button",
White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),
SubText="Text",


Dialog="Accent",


Background="Accent",
BackgroundTransparency=0,
Hover="Text",

WindowBackground="Background",
WindowShadow="Black",

PanelBackground="White",
PanelBackgroundTransparency=0.95,
LabelBackground="White",
LabelBackgroundTransparency=0.95,


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
TabTextTransparency=0.30,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.40,
TabIconTransparencyActive=0.10,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",


ElementBackground="Text",
ElementBackgroundTransparency=0.93,
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


Checkbox="Button",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=0.75,


Slider="Button",
SliderThumb="White",
SliderIcon="Icon",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",


ProgressBar="Button",
ProgressBarTrack="Text",
ProgressBarTrackTransparency=0.90,
ProgressBarText="Text",


Tooltip=Color3.fromHex"#4C4C4C",
TooltipText="White",
TooltipBackground="Background",
TooltipSecondary="Button",
TooltipSecondaryText="White",


SectionIcon="Icon",
TabSectionIcon="Icon",
SectionExpandIcon="Icon",
SectionExpandIconTransparency=0.40,


SectionBox="Text",
SectionBoxTransparency=0.95,
SectionBoxBackground="Text",
SectionBoxBackgroundTransparency=0.97,

SectionBoxBorder="Button",
SectionBoxBorderTransparency=0.72,


SearchBarBorder="White",
SearchBarBorderTransparency=0.75,


Notification="Background",
Notification2="White",
Notification2Transparency=0.92,
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=0.40,

NotificationDuration="Button",
NotificationDurationTransparency=0.45,
NotificationBorder="White",
NotificationBorderTransparency=0.75,


DropdownTabBorder="White",
DropdownTabBackground="ElementBackground",
DropdownBackground="Background",


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
table.sort(z,function(F,H)return F.Time<H.Time end)
table.sort(A,function(F,H)return F.Time<H.Time end)
if#z<2 then error"ColorSequence requires at least 2 keypoints"end
local F={
Color=ColorSequence.new(z),
Transparency=NumberSequence.new(A),
}
if x then
for H,J in pairs(x)do F[H]=J end
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
for H,J in pairs(F.Properties or{})do
local L=u.GetThemeProperty(J,u.Theme)
if L~=nil then
if typeof(L)=="Color3"then
local M=F.Object:FindFirstChild"LibraryGradient"
if M then M:Destroy()end
if z then
u.Tween(
F.Object,
A or 0.2,
{[H]=L},
B or Enum.EasingStyle.Quint,
C or Enum.EasingDirection.Out
):Play()
elseif x then
u.Tween(F.Object,0.08,{[H]=L}):Play()
else
F.Object[H]=L
end

elseif typeof(L)=="table"and L.Color and L.Transparency then
F.Object[H]=Color3.new(1,1,1)
local M=F.Object:FindFirstChild"LibraryGradient"
if not M then
M=Instance.new"UIGradient"
M.Name="LibraryGradient"
M.Parent=F.Object
end
M.Color=L.Color
M.Transparency=L.Transparency
for N,O in pairs(L)do
if N~="Color"and N~="Transparency"and M[N]~=nil then
M[N]=O
end
end

elseif typeof(L)=="number"then
if z then
u.Tween(
F.Object,
A or 0.2,
{[H]=L},
B or Enum.EasingStyle.Quint,
C or Enum.EasingDirection.Out
):Play()
elseif x then
u.Tween(F.Object,0.08,{[H]=L}):Play()
else
F.Object[H]=L
end
end
else
local M=F.Object:FindFirstChild"LibraryGradient"
if M then M:Destroy()end
end
end
end

if v then
local F=u.Objects[v]
if F then ApplyTheme(F)end
else
for F,H in pairs(u.Objects)do ApplyTheme(H)end
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

for F,H in next,x or{}do
if F~="ThemeTag"then
A[F]=H
end
if u.Localization and u.Localization.Enabled and F=="Text"then
local J=string.match(H,"^"..u.Localization.Prefix.."(.+)")
if J then
local L=#u.LocalizationObjects+1
u.LocalizationObjects[L]={
TranslationId=J,
Object=A,
}
u.SetLangForObject(L)
end
end
end

for J,L in next,z or{}do
if L then L.Parent=A end
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




function u.NewRoundFrame(v,x,z,A,F,H)
return i:New(v,x,z,A,F,nil)
end


local v=u.New local x=
u.Tween




function u.SetDraggable(z)
u.CanDraggable=z
end

function u.Drag(z,A,F)
local H=r.GenerateGUID()

local J
local L=false
local M,N
local O

local P={
CanDraggable=true,
}

if not A or typeof(A)~="table"then
A={z}
end

local function update(Q)
if not L or not P.CanDraggable then return end
local R=Q.Position-M
u.Tween(z,0.02,{
Position=UDim2.new(
N.X.Scale,N.X.Offset+R.X,
N.Y.Scale,N.Y.Offset+R.Y
),
}):Play()
end

for Q,R in pairs(A)do
R.InputBegan:Connect(function(S)
if not P.CanDraggable or L then return end
if S.UserInputType==Enum.UserInputType.MouseButton1
or S.UserInputType==Enum.UserInputType.Touch
then
if r and r.CurrentInput and r.CurrentInput~=H then return end
r.CurrentInput=H
L=true
O=S
J=R
M=S.Position
N=z.Position
if F and typeof(F)=="function"then
F(true,J)
end
end
end)
end

e.InputChanged:Connect(function(S)
if not L then return end
if r.CurrentInput and r.CurrentInput~=H then return end
if O.UserInputType==Enum.UserInputType.MouseButton1 then
if S.UserInputType==Enum.UserInputType.MouseMovement then update(S)end
elseif O.UserInputType==Enum.UserInputType.Touch then
if S==O then update(S)end
end
end)

e.InputEnded:Connect(function(S)
if not L or r.CurrentInput~=H then return end
if S==O
or(
O.UserInputType==Enum.UserInputType.MouseButton1
and S.UserInputType==Enum.UserInputType.MouseButton1
)
then
r.CurrentInput=nil
L=false
O=nil
J=nil
if F and typeof(F)=="function"then
F(false,nil)
end
end
end)

function P.Set(S,T)
P.CanDraggable=T
end

return P
end


p.Init(v,"Icon")




function u.SanitizeFilename(z)
local A=z:match"([^/]+)$"or z
A=A:gsub("%.[^%.]+$","")
A=A:gsub("[^%w%-_]","_")
if#A>50 then A=A:sub(1,50)end
return A
end

function u.Image(z,A,F,H,J,L,M,N)
H=H or"Temp"
A=u.SanitizeFilename(A)

local O=v("Frame",{
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
v("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(u.Icon(z)or M)and{
ImageColor3=L and(N or"Icon")or nil,
}or nil,
},{
v("UICorner",{CornerRadius=UDim.new(0,F)}),
}),
})

if u.Icon(z)then
O.ImageLabel:Destroy()
local P=p.Image{
Icon=z,
Size=UDim2.new(1,0,1,0),
Colors={
(L and(N or"Icon")or false),
"Button",
},
}.IconFrame
P.Parent=O

elseif string.find(z,"http")and not string.find(z,"roblox.com")then
local P="LeviathanUI/"..H.."/assets/."..J.."-"..A..".png"
local Q=pcall(function()
task.spawn(function()
local Q=u.Request
and u.Request{Url=z,Method="GET"}.Body
or{}
if not d:IsStudio()and writefile then
writefile(P,Q)
end
local R,S=pcall(getcustomasset,P)
if R then
O.ImageLabel.Image=S
else
warn(string.format(
"[ LeviathanUI.Creator ] Failed custom asset '%s': %s",
P,tostring(S)
))
O:Destroy()
end
end)
end)
if not Q then
O:Destroy()
end

elseif z==""then
O.Visible=false
else
O.ImageLabel.Image=z
end

return O
end




function u.Color3ToHSB(z)
local A,F,H=z.R,z.G,z.B
local J=math.max(A,F,H)
local L=math.min(A,F,H)
local M=J-L
local N=0
if M~=0 then
if J==A then
N=(F-H)/M%6
elseif J==F then
N=(H-A)/M+2
else
N=(A-F)/M+4
end
N=N*60
end
return{
h=math.floor(N+0.5),
s=J==0 and 0 or M/J,
b=J,
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
local A,F,H=0,0,0
local J=z.Color.Keypoints
for L,M in ipairs(J)do
A=A+M.Value.R
F=F+M.Value.G
H=H+M.Value.B
end
local N=#J
return Color3.new(A/N,F/N,H/N)
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





function u.AddColor(z,A,F,H)
H=math.clamp(H or 1,0,1)
if typeof(F)=="string"then F=Color3.fromHex(F)end
return function(J)
local L
if typeof(A)=="string"and string.sub(A,1,1)~="#"then
L=u.GetThemeProperty(A,J)
elseif typeof(A)=="string"then
L=Color3.fromHex(A)
else
L=A
end
if not L or typeof(L)~="Color3"then return nil end
return Color3.new(
math.clamp(L.R+F.R*H,0,1),
math.clamp(L.G+F.G*H,0,1),
math.clamp(L.B+F.B*H,0,1)
)
end
end






function u.GetElementPosition(z,A,F,H)
if type(F)~="number"or F~=math.floor(F)then
return nil,1
end

local J=#A
if J==0 or F<1 or F>J then
return nil,2
end

local function isDelimiter(L)
if L==nil then return true end
local M=L.__type
return M=="Divider"or M=="Space"or M=="Section"
end

if isDelimiter(A[F])then return nil,3 end

local function calculate(L,M)
if M==1 then return"Squircle"end
if L==1 then
return H and"SquircleH-TL-TR"or"Squircle-TL-TR"
end
if L==M then
return H and"SquircleH-BL-BR"or"Squircle-BL-BR"
end
return"Square"
end

local L=1
local M=0

for N=1,J do
local O=A[N]
if isDelimiter(O)then
if F>=L and F<=N-1 then
local P=F-L+1
return calculate(P,M)
end
L=N+1
M=0
else
M=M+1
end
end

if F>=L and F<=J then
local N=F-L+1
return calculate(N,M)
end

return nil,4
end












function u.HoverEffect(z,A)
A=A or{}
local F=A.HoverTransparency~=nil and A.HoverTransparency or 0.88
local H=A.NormalTransparency~=nil and A.NormalTransparency or 1
local J=A.Duration or u.Anim.Fast
local L=A.Property or"ImageTransparency"

local M=z.MouseEnter:Connect(function()
u.QuickTween(z,J,{[L]=F})
end)
local N=z.MouseLeave:Connect(function()
u.QuickTween(z,J,{[L]=H})
end)

return function()
M:Disconnect()
N:Disconnect()
end
end







function u.PressEffect(z,A,F)
F=F or{}
local H=F.PressScale or 0.97
local J=F.NormalScale or 1.00
local L=F.Duration or u.Anim.Fast


local M=A:FindFirstChildOfClass"UIScale"
if not M then
M=Instance.new"UIScale"
M.Scale=J
M.Parent=A
end

z.MouseButton1Down:Connect(function()
u.QuickTween(M,L,{Scale=H},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
end)
z.MouseButton1Up:Connect(function()
u.QuickTween(M,L*1.5,{Scale=J},
Enum.EasingStyle.Back,Enum.EasingDirection.Out)
end)
z.MouseLeave:Connect(function()
u.QuickTween(M,L,{Scale=J},
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
Info={Color=Color3.fromHex"#3B82F6",Icon="info"},
Success={Color=Color3.fromHex"#22C55E",Icon="check-circle-2"},
Warning={Color=Color3.fromHex"#F59E0B",Icon="alert-triangle"},
Error={Color=Color3.fromHex"#EF4444",Icon="x-circle"},
}

local g={

Size=UDim2.new(0,300,1,-76),
SizeLower=UDim2.new(0,300,1,-20),
UICorner=18,
UIPadding=14,
MaxVisible=3,
NotificationIndex=0,
Notifications={},
ActiveCount=0,
}

function g.Init(h)
local i={Lower=false}

function i.SetLower(m)
i.Lower=m
i.Frame.Size=m and g.SizeLower or g.Size
end

i.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=g.Size,
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
Icon=h.Icon or nil,
IconThemed=h.IconThemed,
Background=h.Background,
BackgroundImageTransparency=h.BackgroundImageTransparency,
Duration=h.Duration~=nil and h.Duration or 5,
Buttons=h.Buttons or{},
CanClose=h.CanClose~=false,
UIElements={},
Closed=false,
}

g.NotificationIndex=g.NotificationIndex+1
g.Notifications[g.NotificationIndex]=u


g.ActiveCount=(g.ActiveCount or 0)+1
if g.ActiveCount>g.MaxVisible then

for v=1,g.NotificationIndex-1 do
local x=g.Notifications[v]
if x and not x.Closed then
x:Close()
break
end
end
end


local v
if u.Icon then
v=b.Image(
u.Icon,
u.Title..":"..u.Icon,
0,h.Window,"Notification",u.IconThemed
)
v.Size=UDim2.new(0,26,0,26)
v.Position=UDim2.new(0,i,0,i)
end


local x
if u.CanClose then
x=d("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-i,0,i),
AnchorPoint=Vector2.new(1,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=0.4,
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})
end


local z=b.NewRoundFrame(m,"Squircle",{
Size=UDim2.new(0,0,1,0),

ImageColor3=r.Color,
ImageTransparency=0.45,
})


local A=d("Frame",{
Size=UDim2.new(0,3,1,-(i*2)),
Position=UDim2.new(0,6,0,i),
BackgroundColor3=r.Color,
BackgroundTransparency=0.15,
ZIndex=5,
},{
d("UICorner",{CornerRadius=UDim.new(0,999)}),
})


local F=d("Frame",{
Size=UDim2.new(1,u.Icon and-28-i or 0,1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,i),
PaddingLeft=UDim.new(0,i+3+6),
PaddingRight=UDim.new(0,i),
PaddingBottom=UDim.new(0,i),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,x and(-30-i)or 0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=18,
ThemeTag={
TextColor3="NotificationTitle",
TextTransparency="NotificationTitleTransparency",
},
Text=u.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
}),
d("UIListLayout",{
Padding=UDim.new(0,i/3),
}),
})

if u.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=15,
ThemeTag={
TextColor3="NotificationContent",
TextTransparency="NotificationContentTransparency",
},
Text=u.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=F,
})
end


local H=b.NewRoundFrame(m,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
ImageTransparency=0.05,
ThemeTag={ImageColor3="Notification"},
},{
b.NewRoundFrame(m,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Notification2",
ImageTransparency="Notification2Transparency",
},
}),

d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="DurationFrame",
},{
d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClipsDescendants=true,
},{
z,
}),
}),
d("ImageLabel",{
Name="Background",
Image=u.Background or"",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=u.BackgroundImageTransparency or 1,
},{
d("UICorner",{CornerRadius=UDim.new(0,m)}),
}),
A,
F,
v,
x,
})

local J=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=h.Holder,
},{H})

function u.Close(L)
if u.Closed then return end
u.Closed=true
g.ActiveCount=math.max(0,(g.ActiveCount or 1)-1)
e(J,0.45,{Size=UDim2.new(1,0,0,-8)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(H,0.55,{Position=UDim2.new(2,0,1,0)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(0.45)
if J and J.Parent then
J:Destroy()
end
end

task.spawn(function()
task.wait()
e(J,0.45,{Size=UDim2.new(1,0,0,H.AbsoluteSize.Y)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(H,0.45,{Position=UDim2.new(0,0,1,0)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if u.Duration and u.Duration>0 then

z.Size=UDim2.new(0,H.DurationFrame.AbsoluteSize.X,1,0)
e(H.DurationFrame.Frame,u.Duration,{
Size=UDim2.new(0,0,1,0),
},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(u.Duration)
u:Close()
end
end)

if x then
b.AddSignal(x.TextButton.MouseButton1Click,function()
u:Close()
end)
end

return u
end

return g end function a.g()












local b=4294967296;local d=b-1;local function c(e,f)local g,h=0,1;while e~=0 or f~=0 do local i,m=e%2,f%2;local p=(i+m)%2;g=g+p*h;e=math.floor(e/2)f=math.floor(f/2)h=h*2 end;return g%b end;local function k(e,f,g,...)local h;if f then e=e%b;f=f%b;h=c(e,f)if g then h=k(h,g,...)end;return h elseif e then return e%b else return 0 end end;local function n(e,f,g,...)local h;if f then e=e%b;f=f%b;h=(e+f-c(e,f))/2;if g then h=n(h,g,...)end;return h elseif e then return e%b else return d end end;local function o(e)return d-e end;local function q(e,f)if f<0 then return lshift(e,-f)end;return math.floor(e%4294967296/2^f)end;local function s(e,f)if f>31 or f<-31 then return 0 end;return q(e%b,f)end;local function lshift(e,f)if f<0 then return s(e,-f)end;return e*2^f%4294967296 end;local function t(e,f)e=e%b;f=f%32;local g=n(e,2^f-1)return s(e,f)+lshift(g,32-f)end;local e={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(f)return string.gsub(f,".",function(g)return string.format("%02x",string.byte(g))end)end;local function y(f,g)local h=""for i=1,g do local m=f%256;h=string.char(m)..h;f=(f-m)/256 end;return h end;local function D(f,g)local h=0;for i=g,g+3 do h=h*256+string.byte(f,i)end;return h end;local function E(f,g)local h=64-(g+9)%64;g=y(8*g,8)f=f.."\128"..string.rep("\0",h)..g;assert(#f%64==0)return f end;local function I(f)f[1]=0x6a09e667;f[2]=0xbb67ae85;f[3]=0x3c6ef372;f[4]=0xa54ff53a;f[5]=0x510e527f;f[6]=0x9b05688c;f[7]=0x1f83d9ab;f[8]=0x5be0cd19;return f end;local function K(f,g,h)local i={}for m=1,16 do i[m]=D(f,g+(m-1)*4)end;for m=17,64 do local p=i[m-15]local r=k(t(p,7),t(p,18),s(p,3))p=i[m-2]i[m]=(i[m-16]+r+i[m-7]+k(t(p,17),t(p,19),s(p,10)))%b end;local m,p,r,u,v,x,z,A=h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]for F=1,64 do local H=k(t(m,2),t(m,13),t(m,22))local J=k(n(m,p),n(m,r),n(p,r))local L=(H+J)%b;local M=k(t(v,6),t(v,11),t(v,25))local N=k(n(v,x),n(o(v),z))local O=(A+M+N+e[F]+i[F])%b;A=z;z=x;x=v;v=(u+O)%b;u=r;r=p;p=m;m=(O+L)%b end;h[1]=(h[1]+m)%b;h[2]=(h[2]+p)%b;h[3]=(h[3]+r)%b;h[4]=(h[4]+u)%b;h[5]=(h[5]+v)%b;h[6]=(h[6]+x)%b;h[7]=(h[7]+z)%b;h[8]=(h[8]+A)%b end;local function Z(f)f=E(f,#f)local g=I{}for h=1,#f,64 do K(f,h,g)end;return w(y(g[1],4)..y(g[2],4)..y(g[3],4)..y(g[4],4)..y(g[5],4)..y(g[6],4)..y(g[7],4)..y(g[8],4))end;local f;local g={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local h={["/"]="/"}for i,m in pairs(g)do h[m]=i end;local p=function(p)return"\\"..(g[p]or string.format("u%04x",p:byte()))end;local r=function(r)return"null"end;local u=function(u,v)local x={}v=v or{}if v[u]then error"circular reference"end;v[u]=true;if rawget(u,1)~=nil or next(u)==nil then local z=0;for A in pairs(u)do if type(A)~="number"then error"invalid table: mixed or invalid key types"end;z=z+1 end;if z~=#u then error"invalid table: sparse array"end;for F,H in ipairs(u)do table.insert(x,f(H,v))end;v[u]=nil;return"["..table.concat(x,",").."]"else for z,A in pairs(u)do if type(z)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(x,f(z,v)..":"..f(A,v))end;v[u]=nil;return"{"..table.concat(x,",").."}"end end;local v=function(v)return'"'..v:gsub('[%z\1-\31\\"]',p)..'"'end;local x=function(x)if x~=x or x<=-math.huge or x>=math.huge then error("unexpected number value '"..tostring(x).."'")end;return string.format("%.14g",x)end;local z={["nil"]=r,table=u,string=v,number=x,boolean=tostring}f=function(A,F)local H=type(A)local J=z[H]if J then return J(A,F)end;error("unexpected type '"..H.."'")end;local A=function(A)return f(A)end;local F;local H=function(...)local H={}for J=1,select("#",...)do H[select(J,...)]=true end;return H end;local J=H(" ","\t","\r","\n")local L=H(" ","\t","\r","\n","]","}",",")local M=H("\\","/",'"',"b","f","n","r","t","u")local N=H("true","false","null")local O={["true"]=true,["false"]=false,null=nil}local P=function(P,Q,R,S)for T=Q,#P do if R[P:sub(T,T)]~=S then return T end end;return#P+1 end;local Q=function(Q,R,S)local T=1;local U=1;for V=1,R-1 do U=U+1;if Q:sub(V,V)=="\n"then T=T+1;U=1 end end;error(string.format("%s at line %d col %d",S,T,U))end;local R=function(R)local S=math.floor;if R<=0x7f then return string.char(R)elseif R<=0x7ff then return string.char(S(R/64)+192,R%64+128)elseif R<=0xffff then return string.char(S(R/4096)+224,S(R%4096/64)+128,R%64+128)elseif R<=0x10ffff then return string.char(S(R/262144)+240,S(R%262144/4096)+128,S(R%4096/64)+128,R%64+128)end;error(string.format("invalid unicode codepoint '%x'",R))end;local S=function(S)local T=tonumber(S:sub(1,4),16)local U=tonumber(S:sub(7,10),16)if U then return R((T-0xd800)*0x400+U-0xdc00+0x10000)else return R(T)end end;local aa=function(T,U)local V=""local W=U+1;local X=W;while W<=#T do local Y=T:byte(W)if Y<32 then Q(T,W,"control character in string")elseif Y==92 then V=V..T:sub(X,W-1)W=W+1;local _=T:sub(W,W)if _=="u"then local aa=T:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",W+1)or T:match("^%x%x%x%x",W+1)or Q(T,W-1,"invalid unicode escape in string")V=V..S(aa)W=W+#aa else if not M[_]then Q(T,W-1,"invalid escape char '".._.."' in string")end;V=V..h[_]end;X=W+1 elseif Y==34 then V=V..T:sub(X,W-1)return V,W+1 end;W=W+1 end;Q(T,U,"expected closing quote for string")end;local T=function(T,U)local V=P(T,U,L)local W=T:sub(U,V-1)local X=tonumber(W)if not X then Q(T,U,"invalid number '"..W.."'")end;return X,V end;local U=function(U,V)local W=P(U,V,L)local X=U:sub(V,W-1)if not N[X]then Q(U,V,"invalid literal '"..X.."'")end;return O[X],W end;local ab=function(V,W)local X={}local Y=1;W=W+1;while 1 do local _;W=P(V,W,J,true)if V:sub(W,W)=="]"then W=W+1;break end;_,W=F(V,W)X[Y]=_;Y=Y+1;W=P(V,W,J,true)local ab=V:sub(W,W)W=W+1;if ab=="]"then break end;if ab~=","then Q(V,W,"expected ']' or ','")end end;return X,W end;local ac=function(V,W)local X={}W=W+1;while 1 do local Y,_;W=P(V,W,J,true)if V:sub(W,W)=="}"then W=W+1;break end;if V:sub(W,W)~='"'then Q(V,W,"expected string for key")end;Y,W=F(V,W)W=P(V,W,J,true)if V:sub(W,W)~=":"then Q(V,W,"expected ':' after key")end;W=P(V,W+1,J,true)_,W=F(V,W)X[Y]=_;W=P(V,W,J,true)local ac=V:sub(W,W)W=W+1;if ac=="}"then break end;if ac~=","then Q(V,W,"expected '}' or ','")end end;return X,W end;local V={['"']=aa,["0"]=T,["1"]=T,["2"]=T,["3"]=T,["4"]=T,["5"]=T,["6"]=T,["7"]=T,["8"]=T,["9"]=T,["-"]=T,t=U,f=U,n=U,["["]=ab,["{"]=ac}F=function(W,X)local Y=W:sub(X,X)local _=V[Y]if _ then return _(W,X)end;Q(W,X,"unexpected character '"..Y.."'")end;local W=function(W)if type(W)~="string"then error("expected argument of type string, got "..type(W))end;local X,Y=F(W,P(W,1,J,true))Y=P(W,Y,J,true)if Y<=#W then Q(W,Y,"trailing garbage")end;return X end;
local X,Y,_=A,W,Z;





local ad={}

local ae=(cloneref or clonereference or function(ae)return ae end)


function ad.New(af,ag)

local ah=af;
local ai=ag;
local aj=true;


local ak=function(ak)end;


repeat task.wait(1)until game:IsLoaded();


local al=false;
local am,an,ao,ap,aq,ar,as,at,au=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return ae(game:GetService"Players").LocalPlayer.UserId end
local av,aw="",0;


local ax="https://api.platoboost.app";
local ay=an{
Url=ax.."/public/connectivity",
Method="GET"
};
if ay.StatusCode~=200 and ay.StatusCode~=429 then
ax="https://api.platoboost.net";
end


function cacheLink()
if aw+(600)<ar()then
local az=an{
Url=ax.."/public/start",
Method="POST",
Body=X{
service=ah,
identifier=_(au())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if az.StatusCode==200 then
local aA=Y(az.Body);

if aA.success==true then
av=aA.data.url;
aw=ar();
return true,av
else
ak(aA.message);
return false,aA.message
end
elseif az.StatusCode==429 then
local aA="you are being rate limited, please wait 20 seconds and try again.";
ak(aA);
return false,aA
end

local aA="Failed to cache link.";
ak(aA);
return false,aA
else
return true,av
end
end

cacheLink();


local az=function()
local az=""
for aA=1,16 do
az=az..ao(at(as()*(26))+97)
end
return az
end


for aA=1,5 do
local aB=az();
task.wait(0.2)
if az()==aB then
local aC="platoboost nonce error.";
ak(aC);
error(aC);
end
end


local aA=function()
local aA,aB=cacheLink();

if aA then
am(aB);
end
end


local aB=function(aB)
local aC=az();
local aD=ax.."/public/redeem/"..ap(ah);

local aE={
identifier=_(au()),
key=aB
}

if aj then
aE.nonce=aC;
end

local aF=an{
Url=aD,
Method="POST",
Body=X(aE),
Headers={
["Content-Type"]="application/json"
}
};

if aF.StatusCode==200 then
local aG=Y(aF.Body);

if aG.success==true then
if aG.data.valid==true then
if aj then
if aG.data.hash==_("true".."-"..aC.."-"..ai)then
return true
else
ak"failed to verify integrity.";
return false
end
else
return true
end
else
ak"key is invalid.";
return false
end
else
if aq(aG.message,1,27)=="unique constraint violation"then
ak"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
ak(aG.message);
return false
end
end
elseif aF.StatusCode==429 then
ak"you are being rate limited, please wait 20 seconds and try again.";
return false
else
ak"server returned an invalid status code, please try again later.";
return false
end
end


local aC=function(aC)
if al==true then
return false,("A request is already being sent, please slow down.")
else
al=true;
end

local aD=az();
local aE=ax.."/public/whitelist/"..ap(ah).."?identifier=".._(au()).."&key="..aC;

if aj then
aE=aE.."&nonce="..aD;
end

local aF=an{
Url=aE,
Method="GET",
};

al=false;

if aF.StatusCode==200 then
local aG=Y(aF.Body);

if aG.success==true then
if aG.data.valid==true then
if aj then
if aG.data.hash==_("true".."-"..aD.."-"..ai)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if aq(aC,1,4)=="KEY_"then
return true,aB(aC)
else
return false,("Key is invalid.")
end
end
else
return false,(aG.message)
end
elseif aF.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local aD=function(aD)
local aE=az();
local aF=ax.."/public/flag/"..ap(ah).."?name="..aD;

if aj then
aF=aF.."&nonce="..aE;
end

local aG=an{
Url=aF,
Method="GET",
};

if aG.StatusCode==200 then
local aH=Y(aG.Body);

if aH.success==true then
if aj then
if aH.data.hash==_(ap(aH.data.value).."-"..aE.."-"..ai)then
return aH.data.value
else
ak"failed to verify integrity.";
return nil
end
else
return aH.data.value
end
else
ak(aH.message);
return nil
end
else
return nil
end
end


return{
Verify=aC,
GetFlag=aD,
Copy=aA,
}
end


return ad end function a.h()






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



return[[
{
    "name": "windui",
    "version": "1.6.65",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Footagesus/WindUI",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "bash build/build.sh dev $INPUT_FILE",
        "build": "bash build/build.sh build $INPUT_FILE",
        "live": "python3 -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "example-live-build": "INPUT_FILE=main_example.lua npm run live-build",
        "updater": "python3 updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}
]]end function a.m()




local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

function aa.New(ae,af,ag,ah,ai,aj,ak,al)
ah=ah or"Primary"
al=al or(not ak and 10 or 999)

local am
if af and af~=""then
local an=ab.Icon(af)
if an then
am=ac("ImageLabel",{
Image=an[1],
ImageRectSize=an[2].ImageRectSize,
ImageRectOffset=an[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=ah=="White"and 0.4 or 0,
ThemeTag={ImageColor3=ah~="White"and"Icon"or nil},
})
end
end


local an=ac("UIScale",{Scale=1})

local ao=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=ai,
BackgroundTransparency=1,
},{
an,


ab.NewRoundFrame(al,"Shadow-sm",{
ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,8,1,8),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,3),
Name="Shadow",
ImageTransparency=ak and 1 or 0.45,
Visible=not ak,
ZIndex=-1,
}),


ab.NewRoundFrame(al,"Squircle",{
ThemeTag={ImageColor3=ah~="White"and"Button"or nil},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0
or ah=="White"and 0
or 0.9,
}),


ab.NewRoundFrame(al,"Squircle",{
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1,
}),


ab.NewRoundFrame(al,"SquircleGlass",{
ThemeTag={ImageColor3="White"},
Size=UDim2.new(1,1,1,1),
ImageTransparency=0.88,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Outline",
}),


ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={ImageColor3=ah~="White"and"Text"or nil},
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1,
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
am,
ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ae or"Button",
ThemeTag={TextColor3=(ah~="Primary"and ah~="White")and"Text"or nil},
TextColor3=ah=="Primary"and Color3.new(1,1,1)
or ah=="White"and Color3.new(0,0,0)
or nil,
AutomaticSize="XY",
TextSize=18,
}),
}),
})


ab.AddSignal(ao.MouseEnter,function()
ad(ao.Frame,0.10,{ImageTransparency=0.94}):Play()
ad(ao.Special,0.10,{ImageTransparency=ah=="Secondary"and 0.88 or 0.96}):Play()

if not ak then
ad(ao.Shadow,0.10,{ImageTransparency=0.38,Position=UDim2.new(0.5,0,0.5,5)}):Play()
end
end)
ab.AddSignal(ao.MouseLeave,function()
ad(ao.Frame,0.10,{ImageTransparency=1}):Play()
ad(ao.Special,0.10,{ImageTransparency=ah=="Secondary"and 0.95 or 1}):Play()
ad(an,0.18,{Scale=1},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
if not ak then
ad(ao.Shadow,0.10,{ImageTransparency=0.45,Position=UDim2.new(0.5,0,0.5,3)}):Play()
end
end)


ab.AddSignal(ao.MouseButton1Down,function()
ad(an,0.10,{Scale=0.95},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if not ak then
ad(ao.Shadow,0.08,{ImageTransparency=0.60,Position=UDim2.new(0.5,0,0.5,1)}):Play()
end
end)
ab.AddSignal(ao.MouseButton1Up,function()
ad(an,0.30,{Scale=1},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
if not ak then
ad(ao.Shadow,0.18,{ImageTransparency=0.45,Position=UDim2.new(0.5,0,0.5,3)}):Play()
end
end)

ab.AddSignal(ao.MouseButton1Click,function()
if aj then aj:Close()()end
if ag then ab.SafeCallback(ag)end
end)

return ao
end

return aa end function a.n()

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

return aa end function a.o()

local aa=a.load'd'
local ab=aa.New
local ac=aa.Tween




local ad={
Holder=nil,

Parent=nil,
}

function ad.Create(ae,af,ag,ah,ai)
local aj={
UICorner=28,
UIPadding=12,

Window=ag,
WindUI=ah,

UIElements={},
}

if ae then
aj.UIPadding=0
end
if ae then
aj.UICorner=26
end

af=af or"Dialog"

if not ae then
aj.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=ad.Parent
or(ag and ag.UIElements and ag.UIElements.Main and ag.UIElements.Main.Main),
},{
ab("UICorner",{
CornerRadius=UDim.new(0,ag.UICorner),
}),
})
end

ab("ImageLabel",{
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

aj.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3=af.."Background",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,aj.UIPadding),
PaddingLeft=UDim.new(0,aj.UIPadding),
PaddingRight=UDim.new(0,aj.UIPadding),
PaddingBottom=UDim.new(0,aj.UIPadding),
}),
})

aj.UIElements.MainContainer=aa.NewRoundFrame(aj.UICorner,"Squircle",{
Visible=false,

ImageTransparency=ae and 0.15 or 0,
Parent=ai or aj.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3=af.."Background",
ImageTransparency=af.."BackgroundTransparency",
},
ZIndex=9999,
},{






aj.UIElements.Main,




















})

function aj.Open(ak)
if not ae then
aj.UIElements.FullScreen.Visible=true
aj.UIElements.FullScreen.Active=true
end

task.spawn(function()
aj.UIElements.MainContainer.Visible=true

if not ae then
ac(aj.UIElements.FullScreen,0.1,{BackgroundTransparency=0.65}):Play()
end
ac(aj.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()


task.spawn(function()
task.wait(0.05)
aj.UIElements.Main.Visible=true
end)
end)
end
function aj.Close(ak)
if not ae then
ac(aj.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
aj.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(0.1)
aj.UIElements.FullScreen.Visible=false
end)
end
aj.UIElements.Main.Visible=false

ac(aj.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()



task.spawn(function()
task.wait(0.1)
if not ae then
aj.UIElements.FullScreen:Destroy()
else
aj.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return aj
end

return ad end function a.p()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=a.load'm'.New
local af=a.load'n'.New

function aa.new(ag,ah,ai,aj)
local ak=a.load'o'
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

for aH,b in next,ag.KeySystem.API do
local d=ag.WindUI.Services[b.Type]
if d then
local f={}
for g,h in next,d.Args do
table.insert(f,b[h])
end

local i=d.New(table.unpack(f))
i.Type=b.Type
table.insert(am,i)

local m=ab.Image(
b.Icon or d.Icon or Icons[b.Type]or"user",
b.Icon or d.Icon or Icons[b.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
m.Size=UDim2.new(0,24,0,24)

local p=ab.NewRoundFrame(10,"Squircle",{
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
m,
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
Text=b.Title or d.Name,
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
Text=b.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=b.Desc and true or false,
TextXAlignment="Left",
}),
}),
},true)

ab.AddSignal(p.MouseEnter,function()
ad(p,0.08,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(p.InputEnded,function()
ad(p,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(p.MouseButton1Click,function()
i.Copy()
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
local aG,aH=aF.Verify(aA)
if aG then
aC,aD=true,aH
break
end
aD=aH
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

return aa end function a.q()




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

return{viewportPointToWorld,getOffset}end function a.r()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=a.load'd'
local ac=ab.New


local ad,ae=unpack(a.load'q')
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
end end function a.s()


local aa=a.load'd'
local ab=a.load'r'

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
end end function a.t()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab={
AcrylicBlur=a.load'r',

AcrylicPaint=a.load's',
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

return ab end function a.u()

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

local ah=a.load'o'
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

local as=a.load'm'.New

for at,au in next,ag.Buttons do
as(au.Title,au.Icon,au.Callback,au.Variant,aq,ai)
end

ai:Open()


return ag
end

return aa end function a.v()










return function(aa,ab)


local function G(ac,ad)
local ae={}
for af,ag in pairs(ac)do
ae[tostring(af)]={Color=Color3.fromHex(ag),Transparency=0}
end
return aa:Gradient(ae,{Rotation=ad or 45})
end

return{





Dark={
Name="Dark",
Background=Color3.fromHex"#101010",
Accent=Color3.fromHex"#18181b",
Dialog=Color3.fromHex"#1a1a1a",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#a1a1a1",
Button=Color3.fromHex"#52525b",
Icon=Color3.fromHex"#a1a1aa",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",
PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,
ElementBackground=Color3.fromHex"#2A2A2C",
ElementBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.83,
},

Light={
Name="Light",
Background=Color3.fromHex"#FFFFFF",
Accent=Color3.fromHex"#efefef",
Dialog=Color3.fromHex"#f4f4f5",
Text=Color3.fromHex"#000000",
Placeholder=Color3.fromHex"#555555",
Button=Color3.fromHex"#18181b",
Icon=Color3.fromHex"#52525b",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",
PanelBackground=Color3.fromHex"#efefef",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#efefef",
LabelBackgroundTransparency=0,
ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0,
TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#f3f3f3",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#efefef",
TabBackgroundActiveTransparency=0,
DropdownBackground=Color3.fromHex"#ffffff",
},

Rose={
Name="Rose",
Background=Color3.fromHex"#1f0308",
Accent=Color3.fromHex"#be185d",
Dialog=Color3.fromHex"#4c0519",
Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#d67aa6",
Button=Color3.fromHex"#e95f74",
Icon=Color3.fromHex"#fb7185",
ElementBackground=Color3.fromHex"#381E23",
ElementBackgroundTransparency=0,
},

Plant={
Name="Plant",
Background=Color3.fromHex"#0a1b0f",
Accent=Color3.fromHex"#166534",
Dialog=Color3.fromHex"#052e16",
Text=Color3.fromHex"#f0fdf4",
Placeholder=Color3.fromHex"#4fbf7a",
Button=Color3.fromHex"#16a34a",
Icon=Color3.fromHex"#4ade80",
ElementBackground=Color3.fromHex"#28342A",
ElementBackgroundTransparency=0,
},

Red={
Name="Red",
Background=Color3.fromHex"#1c0606",
Accent=Color3.fromHex"#991b1b",
Dialog=Color3.fromHex"#450a0a",
Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#d95353",
Button=Color3.fromHex"#dc2626",
Icon=Color3.fromHex"#ef4444",
ElementBackground=Color3.fromHex"#322221",
ElementBackgroundTransparency=0,
},

Indigo={
Name="Indigo",
Background=Color3.fromHex"#0f0a2e",
Accent=Color3.fromHex"#3730a3",
Dialog=Color3.fromHex"#1e1b4b",
Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#7078d9",
Button=Color3.fromHex"#4f46e5",
Icon=Color3.fromHex"#6366f1",
ElementBackground=Color3.fromHex"#282543",
ElementBackgroundTransparency=0,
},

Sky={
Name="Sky",
Background=Color3.fromHex"#051a26",
Accent=Color3.fromHex"#00d4ff",
Dialog=Color3.fromHex"#0a4d66",
Text=Color3.fromHex"#e6f7ff",
Placeholder=Color3.fromHex"#66b3cc",
Button=Color3.fromHex"#00a8cc",
Icon=Color3.fromHex"#2db8d9",
Toggle=Color3.fromHex"#00d9d9",
Slider=Color3.fromHex"#00d4ff",
Checkbox=Color3.fromHex"#00d4ff",
ElementBackground=Color3.fromHex"#172E3B",
ElementBackgroundTransparency=0,
},

Violet={
Name="Violet",
Background=Color3.fromHex"#1e0a3e",
Accent=Color3.fromHex"#6d28d9",
Dialog=Color3.fromHex"#3c1361",
Text=Color3.fromHex"#faf5ff",
Placeholder=Color3.fromHex"#8f7ee0",
Button=Color3.fromHex"#7c3aed",
Icon=Color3.fromHex"#8b5cf6",
ElementBackground=Color3.fromHex"#342650",
ElementBackgroundTransparency=0,
},

Amber={
Name="Amber",
Background=G({[0]="#1c1003",[100]="#3f210d"},90),
Accent=G({[0]="#b45309",[100]="#d97706"},45),
Dialog=G({[0]="#451a03",[100]="#6b2e05"},90),
Text=Color3.fromHex"#fffbeb",
Placeholder=Color3.fromHex"#d1a326",
Button=G({[0]="#d97706",[100]="#f59e0b"},45),
Icon=Color3.fromHex"#f59e0b",
Toggle=G({[0]="#d97706",[100]="#f59e0b"},45),
Slider=Color3.fromHex"#d97706",
Checkbox=G({[0]="#d97706",[100]="#fbbf24"},45),
ElementBackground=Color3.fromHex"#3A2E22",
ElementBackgroundTransparency=0,
},

Emerald={
Name="Emerald",
Background=Color3.fromHex"#011411",
Accent=Color3.fromHex"#047857",
Dialog=Color3.fromHex"#022c22",
Text=Color3.fromHex"#ecfdf5",
Placeholder=Color3.fromHex"#3fbf8f",
Button=Color3.fromHex"#059669",
Icon=Color3.fromHex"#10b981",
ElementBackground=Color3.fromHex"#202E2A",
ElementBackgroundTransparency=0,
},

Midnight={
Name="Midnight",
Background=Color3.fromHex"#0a0f1e",
Accent=Color3.fromHex"#1e3a8a",
Dialog=Color3.fromHex"#0c1e42",
Text=Color3.fromHex"#dbeafe",
Placeholder=Color3.fromHex"#2f74d1",
Button=Color3.fromHex"#2563eb",
Icon=Color3.fromHex"#5591f4",
ElementBackground=Color3.fromHex"#242836",
ElementBackgroundTransparency=0,
},

Crimson={
Name="Crimson",
Background=Color3.fromHex"#0c0404",
Accent=Color3.fromHex"#b91c1c",
Dialog=Color3.fromHex"#450a0a",
Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#6f757b",
Button=Color3.fromHex"#991b1b",
Icon=Color3.fromHex"#dc2626",
ElementBackground=Color3.fromHex"#251F1F",
ElementBackgroundTransparency=0,
},

MonokaiPro={
Name="Monokai Pro",
Background=Color3.fromHex"#191622",
Accent=Color3.fromHex"#fc9867",
Dialog=Color3.fromHex"#1e1e1e",
Text=Color3.fromHex"#fcfcfa",
Placeholder=Color3.fromHex"#afafaf",
Button=Color3.fromHex"#ab9df2",
Icon=Color3.fromHex"#a9dc76",
ElementBackground=Color3.fromHex"#323039",
ElementBackgroundTransparency=0,
},

CottonCandy={
Name="Cotton Candy",
Background=Color3.fromHex"#1a0b2e",
Accent=Color3.fromHex"#ec4899",
Dialog=Color3.fromHex"#2d1b3d",
Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#8a5fd3",
Button=Color3.fromHex"#d946ef",
Icon=Color3.fromHex"#06b6d4",
Slider=Color3.fromHex"#d946ef",
ElementBackground=Color3.fromHex"#312643",
ElementBackgroundTransparency=0,
},

Mellowsi={
Name="Mellowsi",
Background=Color3.fromHex"#1C1002",
Accent=Color3.fromHex"#342A1E",
Dialog=Color3.fromHex"#291C13",
Text=Color3.fromHex"#F5EBDD",
Placeholder=Color3.fromHex"#9C8A73",
Button=Color3.fromHex"#342A1E",
Icon=Color3.fromHex"#C9B79C",
Toggle=Color3.fromHex"#a9873f",
Slider=Color3.fromHex"#C9A24D",
Checkbox=Color3.fromHex"#C9A24D",
ElementBackground=Color3.fromHex"#33291E",
ElementBackgroundTransparency=0,
},


Rainbow={
Name="Rainbow",
Background=G({[0]="#ff0040",[20]="#ff4000",[40]="#ffff00",[60]="#00ff40",[80]="#0040ff",[100]="#4000ff"},90),
Accent=G({[0]="#00ff41",[33]="#00ffff",[66]="#0080ff",[100]="#8000ff"},45),
Dialog=G({[0]="#ff0080",[25]="#8000ff",[50]="#0080ff",[75]="#00ff80",[100]="#ff8000"},135),
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#00ff80",
Button=G({[0]="#ff0080",[25]="#ff8000",[50]="#ffff00",[75]="#80ff00",[100]="#00ffff"},60),
Icon=Color3.fromHex"#ffffff",
Toggle=G({[0]="#00ff80",[100]="#00ffff"},45),
Slider=G({[0]="#ff0080",[50]="#ffff00",[100]="#00ffff"},45),
Checkbox=G({[0]="#00ffff",[100]="#ff00ff"},45),
ElementBackground=G({[0]="#200040",[100]="#002020"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0a0015",
PanelBackgroundTransparency=0,
},







Leviathan={
Name="Leviathan",
Background=G({[0]="#000d1a",[33]="#040010",[66]="#001020",[100]="#000d1a"},135),
Accent=G({[0]="#0033ff",[25]="#0077ff",[50]="#00bbff",[75]="#aaddff",[100]="#0055ff"},45),
Dialog=G({[0]="#001433",[50]="#0a0022",[100]="#002244"},90),
Text=Color3.fromHex"#ddf0ff",
Placeholder=Color3.fromHex"#3366aa",
Button=G({[0]="#0044ff",[25]="#0088ff",[50]="#44ccff",[75]="#88ddff",[100]="#00aacc"},45),
Icon=Color3.fromHex"#66ccff",
Toggle=G({[0]="#0099ff",[50]="#00ccdd",[100]="#00aaff"},45),
Slider=G({[0]="#0033ee",[50]="#0088ff",[100]="#66ddff"},45),
Checkbox=G({[0]="#0055ff",[100]="#00ccff"},45),
ElementBackground=G({[0]="#001022",[50]="#080018",[100]="#002244"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#000d1a",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#001428",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#000a18",
TabBackgroundHover=Color3.fromHex"#001122",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=G({[0]="#001a44",[100]="#002255"},90),
TabBackgroundActiveTransparency=0,
},

LeviathanDeep={
Name="Leviathan Deep",
Background=Color3.fromHex"#020818",
Accent=G({[0]="#0047ff",[50]="#0099ff",[100]="#00d4ff"},45),
Dialog=G({[0]="#040c24",[100]="#060f30"},90),
Text=Color3.fromHex"#e8f4ff",
Placeholder=Color3.fromHex"#4a7aaa",
Button=G({[0]="#0052ff",[100]="#00aaff"},45),
Icon=Color3.fromHex"#00c8ff",
Toggle=G({[0]="#0099ff",[100]="#00ccff"},45),
Slider=G({[0]="#0052ff",[100]="#0099ff"},45),
Checkbox=G({[0]="#0052ff",[100]="#00aaff"},45),
ElementBackground=Color3.fromHex"#0a1a3a",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#040c24",
PanelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#030e22",
TabBackgroundHover=Color3.fromHex"#071428",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#0a1e40",
TabBackgroundActiveTransparency=0,
},

LeviathanAurora={
Name="Leviathan Aurora",
Background=G({[0]="#030816",[100]="#08031e"},135),
Accent=G({[0]="#4400ff",[50]="#0077ff",[100]="#00ffcc"},45),
Dialog=Color3.fromHex"#060316",
Text=Color3.fromHex"#e0eeff",
Placeholder=Color3.fromHex"#5544aa",
Button=G({[0]="#5500ff",[50]="#0077ff",[100]="#00ddff"},45),
Icon=Color3.fromHex"#44ddff",
Toggle=G({[0]="#00ffcc",[100]="#0077ff"},45),
Slider=G({[0]="#5500ff",[100]="#00ddff"},45),
Checkbox=G({[0]="#5500ff",[100]="#00ccff"},45),
ElementBackground=Color3.fromHex"#08031e",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#060316",
PanelBackgroundTransparency=0,
},

LeviathanVoid={
Name="Leviathan Void",
Background=Color3.fromHex"#000000",
Accent=G({[0]="#001aff",[100]="#00aaff"},90),
Dialog=Color3.fromHex"#050505",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#335577",
Button=G({[0]="#0033ff",[100]="#0099ff"},45),
Icon=Color3.fromHex"#0099ff",
Toggle=G({[0]="#0066ff",[100]="#00aaff"},45),
Slider=G({[0]="#0033ff",[100]="#0088ff"},45),
Checkbox=G({[0]="#0055ff",[100]="#00aaff"},45),
ElementBackground=Color3.fromHex"#080808",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#050505",
PanelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#000000",
TabBackgroundHover=Color3.fromHex"#080808",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#050a18",
TabBackgroundActiveTransparency=0,
},





Ocean={
Name="Ocean",
Background=G({[0]="#020d1a",[100]="#051a2e"},135),
Accent=G({[0]="#0066aa",[100]="#00bbdd"},45),
Dialog=G({[0]="#03101f",[100]="#062035"},90),
Text=Color3.fromHex"#e8f4fd",
Placeholder=Color3.fromHex"#5ba3c9",
Button=G({[0]="#1155aa",[100]="#00aacc"},45),
Icon=Color3.fromHex"#48c0e0",
Toggle=G({[0]="#00aacc",[100]="#00d4aa"},45),
Slider=G({[0]="#1155aa",[100]="#00aacc"},45),
Checkbox=G({[0]="#1155aa",[100]="#00aacc"},45),
ElementBackground=G({[0]="#06182a",[100]="#0a2035"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#020d1a",
PanelBackgroundTransparency=0,
},

Blurple={
Name="Blurple",
Background=Color3.fromHex"#1e1f22",
Accent=Color3.fromHex"#5865F2",
Dialog=Color3.fromHex"#2b2d31",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#949BA4",
Button=Color3.fromHex"#5865F2",
Icon=Color3.fromHex"#b5bac1",
Toggle=Color3.fromHex"#23A55A",
Slider=Color3.fromHex"#5865F2",
Checkbox=Color3.fromHex"#5865F2",
ElementBackground=Color3.fromHex"#313338",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#2b2d31",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#313338",
LabelBackgroundTransparency=0,
},

Matrix={
Name="Matrix",
Background=Color3.fromHex"#000800",
Accent=Color3.fromHex"#003300",
Dialog=Color3.fromHex"#001100",
Text=Color3.fromHex"#00FF41",
Placeholder=Color3.fromHex"#007722",
Button=G({[0]="#003300",[100]="#00aa33"},90),
Icon=Color3.fromHex"#00CC33",
Toggle=G({[0]="#00aa33",[100]="#00FF41"},45),
Slider=G({[0]="#006622",[100]="#00CC33"},45),
Checkbox=G({[0]="#00aa33",[100]="#00FF41"},45),
ElementBackground=Color3.fromHex"#001A00",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#000800",
PanelBackgroundTransparency=0,
},

Frost={
Name="Frost",
Background=Color3.fromHex"#f5f5f7",
Accent=Color3.fromHex"#f0f0f5",
Dialog=Color3.fromHex"#e8e8f0",
Text=Color3.fromHex"#1c1c1e",
Placeholder=Color3.fromHex"#8e8e93",
Button=Color3.fromHex"#007AFF",
Icon=Color3.fromHex"#636366",
Toggle=Color3.fromHex"#34C759",
Slider=Color3.fromHex"#007AFF",
Checkbox=Color3.fromHex"#007AFF",
ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#ffffff",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#f2f2f7",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#f2f2f7",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#e5e5ea",
TabBackgroundActiveTransparency=0,
},

Cyberpunk={
Name="Cyberpunk",
Background=G({[0]="#050510",[100]="#0d0d1a"},135),
Accent=G({[0]="#ff00aa",[100]="#00ffee"},45),
Dialog=Color3.fromHex"#0d0d1a",
Text=Color3.fromHex"#f0f0ff",
Placeholder=Color3.fromHex"#8888bb",
Button=G({[0]="#cc0088",[50]="#8800cc",[100]="#00cccc"},45),
Icon=Color3.fromHex"#ff44cc",
Toggle=G({[0]="#00ffee",[100]="#ff00aa"},45),
Slider=G({[0]="#ff00aa",[100]="#00cccc"},45),
Checkbox=G({[0]="#00ffee",[100]="#ff00aa"},45),
ElementBackground=G({[0]="#0d0d22",[100]="#1a0a1a"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0a0a16",
PanelBackgroundTransparency=0,
},

Sunset={
Name="Sunset",
Background=G({[0]="#180808",[100]="#200a00"},135),
Accent=G({[0]="#c2410c",[100]="#db2777"},45),
Dialog=Color3.fromHex"#2d1010",
Text=Color3.fromHex"#fff7ed",
Placeholder=Color3.fromHex"#c87050",
Button=G({[0]="#ea580c",[50]="#e8307a",[100]="#ec4899"},45),
Icon=Color3.fromHex"#fb923c",
Toggle=G({[0]="#f97316",[100]="#ec4899"},45),
Slider=G({[0]="#ea580c",[100]="#e8307a"},45),
Checkbox=G({[0]="#f97316",[100]="#ec4899"},45),
ElementBackground=G({[0]="#2a1510",[100]="#200a1a"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#180808",
PanelBackgroundTransparency=0,
},

NeonCity={
Name="Neon City",
Background=G({[0]="#080811",[100]="#110811"},135),
Accent=G({[0]="#ff00aa",[50]="#aa00ff",[100]="#0033ff"},45),
Dialog=Color3.fromHex"#0c0c1a",
Text=Color3.fromHex"#f5f0ff",
Placeholder=Color3.fromHex"#664488",
Button=G({[0]="#dd0099",[50]="#7700dd",[100]="#0033cc"},45),
Icon=Color3.fromHex"#ff44dd",
Toggle=G({[0]="#00ffcc",[100]="#ff00aa"},45),
Slider=G({[0]="#ff00aa",[100]="#aa00ff"},45),
Checkbox=G({[0]="#ff00aa",[100]="#00ffcc"},45),
ElementBackground=G({[0]="#0d0d1a",[100]="#1a0a1a"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0a0a16",
PanelBackgroundTransparency=0,
},

Holographic={
Name="Holographic",
Background=G({[0]="#0a0015",[50]="#001510",[100]="#150010"},135),
Accent=G({[0]="#ff00ff",[33]="#00ffff",[66]="#ff00aa",[100]="#00aaff"},45),
Dialog=Color3.fromHex"#0d001a",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#667788",
Button=G({[0]="#cc00cc",[33]="#0099cc",[66]="#cc00aa",[100]="#00aacc"},60),
Icon=Color3.fromHex"#ffffff",
Toggle=G({[0]="#00ffcc",[100]="#ff00ff"},45),
Slider=G({[0]="#ff00aa",[100]="#00ffff"},45),
Checkbox=G({[0]="#00ffff",[100]="#ff00ff"},45),
ElementBackground=G({[0]="#0a0012",[100]="#001212"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#080010",
PanelBackgroundTransparency=0,
},





Vampire={
Name="Vampire",
Background=Color3.fromHex"#110000",
Accent=Color3.fromHex"#6b0000",
Dialog=Color3.fromHex"#2a0000",
Text=Color3.fromHex"#f8e8e8",
Placeholder=Color3.fromHex"#994444",
Button=Color3.fromHex"#8b0000",
Icon=Color3.fromHex"#cc2222",
ElementBackground=Color3.fromHex"#220000",
ElementBackgroundTransparency=0,
},

Nord={
Name="Nord",
Background=Color3.fromHex"#242933",
Accent=Color3.fromHex"#3b4252",
Dialog=Color3.fromHex"#2e3440",
Text=Color3.fromHex"#eceff4",
Placeholder=Color3.fromHex"#7a8499",
Button=Color3.fromHex"#5e81ac",
Icon=Color3.fromHex"#88c0d0",
Toggle=Color3.fromHex"#a3be8c",
Slider=Color3.fromHex"#5e81ac",
Checkbox=Color3.fromHex"#81a1c1",
ElementBackground=Color3.fromHex"#3b4252",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#3b4252",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#3b4252",
LabelBackgroundTransparency=0,
},

Dracula={
Name="Dracula",
Background=Color3.fromHex"#1e1f29",
Accent=Color3.fromHex"#44475a",
Dialog=Color3.fromHex"#282a36",
Text=Color3.fromHex"#f8f8f2",
Placeholder=Color3.fromHex"#6272a4",
Button=Color3.fromHex"#bd93f9",
Icon=Color3.fromHex"#ff79c6",
Toggle=Color3.fromHex"#50fa7b",
Slider=Color3.fromHex"#bd93f9",
Checkbox=Color3.fromHex"#bd93f9",
ElementBackground=Color3.fromHex"#44475a",
ElementBackgroundTransparency=0,
},

Solarized={
Name="Solarized",
Background=Color3.fromHex"#001f27",
Accent=Color3.fromHex"#073642",
Dialog=Color3.fromHex"#002b36",
Text=Color3.fromHex"#fdf6e3",
Placeholder=Color3.fromHex"#657b83",
Button=Color3.fromHex"#268bd2",
Icon=Color3.fromHex"#2aa198",
Toggle=Color3.fromHex"#859900",
Slider=Color3.fromHex"#268bd2",
Checkbox=Color3.fromHex"#268bd2",
ElementBackground=Color3.fromHex"#073642",
ElementBackgroundTransparency=0,
},

TokyoNight={
Name="Tokyo Night",
Background=Color3.fromHex"#0d0e17",
Accent=Color3.fromHex"#1a1b2e",
Dialog=Color3.fromHex"#16161e",
Text=Color3.fromHex"#c0caf5",
Placeholder=Color3.fromHex"#565f89",
Button=Color3.fromHex"#7aa2f7",
Icon=Color3.fromHex"#bb9af7",
Toggle=Color3.fromHex"#9ece6a",
Slider=Color3.fromHex"#7aa2f7",
Checkbox=Color3.fromHex"#7aa2f7",
ElementBackground=Color3.fromHex"#1f2335",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#24283b",
PanelBackgroundTransparency=0,
},

Catppuccin={
Name="Catppuccin",
Background=Color3.fromHex"#11111b",
Accent=Color3.fromHex"#313244",
Dialog=Color3.fromHex"#1e1e2e",
Text=Color3.fromHex"#cdd6f4",
Placeholder=Color3.fromHex"#6c7086",
Button=Color3.fromHex"#cba6f7",
Icon=Color3.fromHex"#89b4fa",
Toggle=Color3.fromHex"#a6e3a1",
Slider=Color3.fromHex"#cba6f7",
Checkbox=Color3.fromHex"#cba6f7",
ElementBackground=Color3.fromHex"#313244",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#313244",
PanelBackgroundTransparency=0,
},

OneDark={
Name="One Dark",
Background=Color3.fromHex"#181a1f",
Accent=Color3.fromHex"#21252b",
Dialog=Color3.fromHex"#1d2026",
Text=Color3.fromHex"#abb2bf",
Placeholder=Color3.fromHex"#5c6370",
Button=Color3.fromHex"#61afef",
Icon=Color3.fromHex"#c678dd",
Toggle=Color3.fromHex"#98c379",
Slider=Color3.fromHex"#61afef",
Checkbox=Color3.fromHex"#61afef",
ElementBackground=Color3.fromHex"#2c313a",
ElementBackgroundTransparency=0,
},

Abyss={
Name="Abyss",
Background=Color3.fromHex"#000000",
Accent=Color3.fromHex"#000000",
Dialog=Color3.fromHex"#0a0a0a",
Text=Color3.fromHex"#e8e8e8",
Placeholder=Color3.fromHex"#555555",
Button=Color3.fromHex"#1a1a1a",
Icon=Color3.fromHex"#666666",
Toggle=Color3.fromHex"#448844",
Slider=Color3.fromHex"#446688",
Checkbox=Color3.fromHex"#446688",
ElementBackground=Color3.fromHex"#111111",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#111111",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0,
},

Slate={
Name="Slate",
Background=Color3.fromHex"#0f172a",
Accent=Color3.fromHex"#334155",
Dialog=Color3.fromHex"#1e293b",
Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#94a3b8",
Button=Color3.fromHex"#38bdf8",
Icon=Color3.fromHex"#94a3b8",
Toggle=Color3.fromHex"#38bdf8",
Slider=Color3.fromHex"#38bdf8",
Checkbox=Color3.fromHex"#38bdf8",
ElementBackground=Color3.fromHex"#1e293b",
ElementBackgroundTransparency=0,
},

Sand={
Name="Sand",
Background=Color3.fromHex"#1a1208",
Accent=Color3.fromHex"#92703b",
Dialog=Color3.fromHex"#4a3520",
Text=Color3.fromHex"#fdf6e3",
Placeholder=Color3.fromHex"#b8966e",
Button=Color3.fromHex"#c4924e",
Icon=Color3.fromHex"#d4a96a",
ElementBackground=Color3.fromHex"#2e2010",
ElementBackgroundTransparency=0,
},

Pastel={
Name="Pastel",
Background=Color3.fromHex"#f5eeff",
Accent=Color3.fromHex"#c9b8e8",
Dialog=Color3.fromHex"#e8daf5",
Text=Color3.fromHex"#3d2b5e",
Placeholder=Color3.fromHex"#9980bb",
Button=Color3.fromHex"#b39ddb",
Icon=Color3.fromHex"#9575cd",
Toggle=Color3.fromHex"#81c784",
Slider=Color3.fromHex"#b39ddb",
Checkbox=Color3.fromHex"#b39ddb",
ElementBackground=Color3.fromHex"#ede7f6",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#ede7f6",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#e8daf5",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#e8daf5",
TabBackgroundHover=Color3.fromHex"#ddd0f0",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#d0bfec",
TabBackgroundActiveTransparency=0,
},

Obsidian={
Name="Obsidian",
Background=Color3.fromHex"#0c0c0e",
Accent=Color3.fromHex"#2a2a2e",
Dialog=Color3.fromHex"#141416",
Text=Color3.fromHex"#d8d8e0",
Placeholder=Color3.fromHex"#505058",
Button=Color3.fromHex"#28282e",
Icon=Color3.fromHex"#8888a0",
Toggle=Color3.fromHex"#5577ff",
Slider=Color3.fromHex"#4466ee",
Checkbox=Color3.fromHex"#4466ee",
ElementBackground=Color3.fromHex"#181818",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#101012",
PanelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#0e0e10",
TabBackgroundHover=Color3.fromHex"#141416",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#1e1e22",
TabBackgroundActiveTransparency=0,
},

Terminal={
Name="Terminal",
Background=Color3.fromHex"#000000",
Accent=Color3.fromHex"#003300",
Dialog=Color3.fromHex"#001100",
Text=Color3.fromHex"#00ff00",
Placeholder=Color3.fromHex"#005500",
Button=G({[0]="#003300",[100]="#00aa00"},90),
Icon=Color3.fromHex"#00cc00",
Toggle=Color3.fromHex"#00ff00",
Slider=G({[0]="#006600",[100]="#00dd00"},45),
Checkbox=Color3.fromHex"#00dd00",
ElementBackground=Color3.fromHex"#000d00",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#000800",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.5,
TabBackground=Color3.fromHex"#000000",
TabBackgroundHover=Color3.fromHex"#001100",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#002200",
TabBackgroundActiveTransparency=0,
},





Lava={
Name="Lava",
Background=G({[0]="#0d0000",[100]="#1a0500"},135),
Accent=G({[0]="#ff2200",[100]="#ff7700"},45),
Dialog=Color3.fromHex"#1a0800",
Text=Color3.fromHex"#fff0e8",
Placeholder=Color3.fromHex"#994422",
Button=G({[0]="#cc2200",[100]="#ff6600"},45),
Icon=Color3.fromHex"#ff6622",
Toggle=G({[0]="#ff4400",[100]="#ff8800"},45),
Slider=G({[0]="#cc3300",[100]="#ff5500"},45),
Checkbox=G({[0]="#ff4400",[100]="#ff7700"},45),
ElementBackground=G({[0]="#1a0a00",[100]="#100500"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0d0500",
PanelBackgroundTransparency=0,
},

Mint={
Name="Mint",
Background=Color3.fromHex"#f2fcf8",
Accent=Color3.fromHex"#00c896",
Dialog=Color3.fromHex"#e0f5ee",
Text=Color3.fromHex"#0d2b22",
Placeholder=Color3.fromHex"#5a9e88",
Button=Color3.fromHex"#00a87c",
Icon=Color3.fromHex"#009970",
Toggle=Color3.fromHex"#00c896",
Slider=Color3.fromHex"#00a87c",
Checkbox=Color3.fromHex"#00a87c",
ElementBackground=Color3.fromHex"#ddf2ea",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#eef9f4",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#e0f5ee",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#eef9f4",
TabBackgroundHover=Color3.fromHex"#e0f5ee",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#c8eedd",
TabBackgroundActiveTransparency=0,
},

Sakura={
Name="Sakura",
Background=Color3.fromHex"#fff5f8",
Accent=Color3.fromHex"#ff6b9d",
Dialog=Color3.fromHex"#ffe0eb",
Text=Color3.fromHex"#3d1025",
Placeholder=Color3.fromHex"#cc7799",
Button=Color3.fromHex"#e05580",
Icon=Color3.fromHex"#cc4466",
Toggle=Color3.fromHex"#ff6b9d",
Slider=Color3.fromHex"#e05580",
Checkbox=Color3.fromHex"#e05580",
ElementBackground=Color3.fromHex"#ffe0eb",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#fff0f4",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#ffe8f0",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#fff5f8",
TabBackgroundHover=Color3.fromHex"#ffe8f2",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#ffd5e5",
TabBackgroundActiveTransparency=0,
},

Gold={
Name="Gold",
Background=Color3.fromHex"#0d0900",
Accent=G({[0]="#ffaa00",[100]="#ffdd44"},45),
Dialog=Color3.fromHex"#1a1100",
Text=Color3.fromHex"#fff8e0",
Placeholder=Color3.fromHex"#886600",
Button=G({[0]="#cc8800",[100]="#ffcc00"},45),
Icon=Color3.fromHex"#ffcc33",
Toggle=G({[0]="#ffaa00",[100]="#ffdd44"},45),
Slider=G({[0]="#cc8800",[100]="#ffaa00"},45),
Checkbox=G({[0]="#ffaa00",[100]="#ffdd44"},45),
ElementBackground=Color3.fromHex"#1a1200",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#110e00",
PanelBackgroundTransparency=0,
},

Titanium={
Name="Titanium",
Background=Color3.fromHex"#111215",
Accent=G({[0]="#888899",[100]="#ccccdd"},45),
Dialog=Color3.fromHex"#1c1e22",
Text=Color3.fromHex"#e8eaf0",
Placeholder=Color3.fromHex"#6a6c78",
Button=G({[0]="#555566",[100]="#9999aa"},45),
Icon=Color3.fromHex"#aaaacc",
Toggle=G({[0]="#8899cc",[100]="#aabbdd"},45),
Slider=G({[0]="#7788aa",[100]="#99aacc"},45),
Checkbox=G({[0]="#8899cc",[100]="#aabbdd"},45),
ElementBackground=Color3.fromHex"#1c1e22",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#181a1e",
PanelBackgroundTransparency=0,
},

Forest={
Name="Forest",
Background=Color3.fromHex"#050e06",
Accent=G({[0]="#1a6b2a",[100]="#2db84d"},45),
Dialog=Color3.fromHex"#081408",
Text=Color3.fromHex"#d4f0d8",
Placeholder=Color3.fromHex"#3d7a45",
Button=G({[0]="#155522",[100]="#22aa44"},45),
Icon=Color3.fromHex"#44cc66",
Toggle=G({[0]="#33bb55",[100]="#44dd66"},45),
Slider=G({[0]="#1d8833",[100]="#33aa44"},45),
Checkbox=G({[0]="#33bb55",[100]="#44dd66"},45),
ElementBackground=Color3.fromHex"#081408",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#060f07",
PanelBackgroundTransparency=0,
},

Coffee={
Name="Coffee",
Background=Color3.fromHex"#0d0800",
Accent=G({[0]="#6b3d1a",[100]="#c8813a"},45),
Dialog=Color3.fromHex"#1a0f05",
Text=Color3.fromHex"#f5e8d8",
Placeholder=Color3.fromHex"#8a6040",
Button=G({[0]="#7a4422",[100]="#cc8844"},45),
Icon=Color3.fromHex"#cc9966",
Toggle=G({[0]="#cc8833",[100]="#ddaa55"},45),
Slider=G({[0]="#996633",[100]="#cc8833"},45),
Checkbox=G({[0]="#cc8833",[100]="#ddaa55"},45),
ElementBackground=Color3.fromHex"#1a1005",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#110b03",
PanelBackgroundTransparency=0,
},

Arctic={
Name="Arctic",
Background=Color3.fromHex"#eaf4ff",
Accent=G({[0]="#0077cc",[100]="#00aaff"},45),
Dialog=Color3.fromHex"#d8eeff",
Text=Color3.fromHex"#0a2040",
Placeholder=Color3.fromHex"#5588aa",
Button=G({[0]="#0066bb",[100]="#0099ee"},45),
Icon=Color3.fromHex"#0066aa",
Toggle=G({[0]="#0099ff",[100]="#00bbff"},45),
Slider=G({[0]="#0077dd",[100]="#0099ff"},45),
Checkbox=G({[0]="#0099ff",[100]="#00bbff"},45),
ElementBackground=Color3.fromHex"#d0e8ff",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#e0f0ff",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#d5ebff",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#e0f0ff",
TabBackgroundHover=Color3.fromHex"#cce4ff",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#bbdaff",
TabBackgroundActiveTransparency=0,
},

Grape={
Name="Grape",
Background=Color3.fromHex"#0d0014",
Accent=G({[0]="#6600aa",[100]="#aa44ff"},45),
Dialog=Color3.fromHex"#14001f",
Text=Color3.fromHex"#f0e0ff",
Placeholder=Color3.fromHex"#7744aa",
Button=G({[0]="#550099",[100]="#9933ee"},45),
Icon=Color3.fromHex"#bb66ff",
Toggle=G({[0]="#9944ff",[100]="#bb66ff"},45),
Slider=G({[0]="#7733cc",[100]="#9944ff"},45),
Checkbox=G({[0]="#9944ff",[100]="#bb66ff"},45),
ElementBackground=Color3.fromHex"#14001f",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0e0018",
PanelBackgroundTransparency=0,
},

Sunrise={
Name="Sunrise",
Background=G({[0]="#1a0500",[100]="#2a0a00"},135),
Accent=G({[0]="#ff6600",[50]="#ff9900",[100]="#ffcc00"},45),
Dialog=Color3.fromHex"#2a0d00",
Text=Color3.fromHex"#fff3e0",
Placeholder=Color3.fromHex"#aa5522",
Button=G({[0]="#ee5500",[100]="#ffaa00"},45),
Icon=Color3.fromHex"#ff9933",
Toggle=G({[0]="#ff7700",[100]="#ffbb00"},45),
Slider=G({[0]="#ee6600",[100]="#ff9900"},45),
Checkbox=G({[0]="#ff7700",[100]="#ffbb00"},45),
ElementBackground=G({[0]="#1f0a00",[100]="#150800"},90),
ElementBackgroundTransparency=0,
},

Jade={
Name="Jade",
Background=Color3.fromHex"#040d0a",
Accent=G({[0]="#006644",[100]="#00aa77"},45),
Dialog=Color3.fromHex"#061410",
Text=Color3.fromHex"#d4f5e9",
Placeholder=Color3.fromHex"#338866",
Button=G({[0]="#005533",[100]="#009966"},45),
Icon=Color3.fromHex"#00cc88",
Toggle=G({[0]="#00aa66",[100]="#00cc88"},45),
Slider=G({[0]="#009955",[100]="#00bb77"},45),
Checkbox=G({[0]="#00aa66",[100]="#00cc88"},45),
ElementBackground=Color3.fromHex"#06120e",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#040d09",
PanelBackgroundTransparency=0,
},

Flamingo={
Name="Flamingo",
Background=Color3.fromHex"#150008",
Accent=G({[0]="#cc0066",[100]="#ff44aa"},45),
Dialog=Color3.fromHex"#220010",
Text=Color3.fromHex"#ffe0f0",
Placeholder=Color3.fromHex"#883366",
Button=G({[0]="#bb0055",[100]="#ee3388"},45),
Icon=Color3.fromHex"#ff55aa",
Toggle=G({[0]="#ff2277",[100]="#ff55aa"},45),
Slider=G({[0]="#dd1166",[100]="#ff3388"},45),
Checkbox=G({[0]="#ff2277",[100]="#ff55aa"},45),
ElementBackground=Color3.fromHex"#1e0010",
ElementBackgroundTransparency=0,
},

Steel={
Name="Steel",
Background=Color3.fromHex"#0c1018",
Accent=G({[0]="#2255aa",[100]="#4488cc"},45),
Dialog=Color3.fromHex"#141a24",
Text=Color3.fromHex"#ccd8ee",
Placeholder=Color3.fromHex"#556688",
Button=G({[0]="#1e4488",[100]="#3366bb"},45),
Icon=Color3.fromHex"#5599dd",
Toggle=G({[0]="#3377cc",[100]="#5599dd"},45),
Slider=G({[0]="#2266bb",[100]="#4488cc"},45),
Checkbox=G({[0]="#3377cc",[100]="#5599dd"},45),
ElementBackground=Color3.fromHex"#141c28",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0e141e",
PanelBackgroundTransparency=0,
},

Parchment={
Name="Parchment",
Background=Color3.fromHex"#f5f0e8",
Accent=Color3.fromHex"#8b6914",
Dialog=Color3.fromHex"#ebe5d5",
Text=Color3.fromHex"#2a1f0a",
Placeholder=Color3.fromHex"#8a7055",
Button=Color3.fromHex"#7a5c11",
Icon=Color3.fromHex"#6b4f0e",
ElementBackground=Color3.fromHex"#e0d9c5",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#ede8da",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#e5dfc8",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#ede8da",
TabBackgroundHover=Color3.fromHex"#e5dec8",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#d8d0b5",
TabBackgroundActiveTransparency=0,
},

Cosmos={
Name="Cosmos",
Background=G({[0]="#000008",[50]="#050010",[100]="#000005"},135),
Accent=G({[0]="#4400cc",[33]="#0044ff",[66]="#8800ff",[100]="#cc00aa"},45),
Dialog=Color3.fromHex"#08000f",
Text=Color3.fromHex"#eeddff",
Placeholder=Color3.fromHex"#554488",
Button=G({[0]="#5500ee",[100]="#9900ff"},45),
Icon=Color3.fromHex"#aa66ff",
Toggle=G({[0]="#7733ff",[100]="#aa55ff"},45),
Slider=G({[0]="#5500ee",[100]="#8844ff"},45),
Checkbox=G({[0]="#7733ff",[100]="#aa55ff"},45),
ElementBackground=G({[0]="#060010",[100]="#0a0018"},90),
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#05000c",
PanelBackgroundTransparency=0,
},

RoseGold={
Name="Rose Gold",
Background=Color3.fromHex"#120608",
Accent=G({[0]="#b5485a",[50]="#c9737a",[100]="#d4a0aa"},45),
Dialog=Color3.fromHex"#1e0c10",
Text=Color3.fromHex"#fce8ec",
Placeholder=Color3.fromHex"#886070",
Button=G({[0]="#a03348",[100]="#c97080"},45),
Icon=Color3.fromHex"#d49090",
Toggle=G({[0]="#cc5566",[100]="#dd7788"},45),
Slider=G({[0]="#bb4455",[100]="#cc6677"},45),
Checkbox=G({[0]="#cc5566",[100]="#dd7788"},45),
ElementBackground=Color3.fromHex"#1c0c10",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#150810",
PanelBackgroundTransparency=0,
},

Lavender={
Name="Lavender",
Background=Color3.fromHex"#f5f0ff",
Accent=Color3.fromHex"#7c5cbf",
Dialog=Color3.fromHex"#ebe0ff",
Text=Color3.fromHex"#22103a",
Placeholder=Color3.fromHex"#8866aa",
Button=Color3.fromHex"#6a44aa",
Icon=Color3.fromHex"#5533aa",
Toggle=Color3.fromHex"#7755cc",
Slider=Color3.fromHex"#6644bb",
Checkbox=Color3.fromHex"#7755cc",
ElementBackground=Color3.fromHex"#ddd0ff",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#ede5ff",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#e5daff",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#ede5ff",
TabBackgroundHover=Color3.fromHex"#e0d5ff",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#cfc0f5",
TabBackgroundActiveTransparency=0,
},

Toxic={
Name="Toxic",
Background=Color3.fromHex"#050a00",
Accent=G({[0]="#44dd00",[100]="#aaff00"},45),
Dialog=Color3.fromHex"#081200",
Text=Color3.fromHex"#eeffcc",
Placeholder=Color3.fromHex"#557722",
Button=G({[0]="#33bb00",[100]="#88ee00"},45),
Icon=Color3.fromHex"#88ff22",
Toggle=G({[0]="#66ee00",[100]="#aaff00"},45),
Slider=G({[0]="#55cc00",[100]="#88ee00"},45),
Checkbox=G({[0]="#66ee00",[100]="#aaff00"},45),
ElementBackground=Color3.fromHex"#081000",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#060c00",
PanelBackgroundTransparency=0,
},

Cocoa={
Name="Cocoa",
Background=Color3.fromHex"#0d0700",
Accent=G({[0]="#5c3317",[100]="#8b5a2b"},45),
Dialog=Color3.fromHex"#160e00",
Text=Color3.fromHex"#f5e8d8",
Placeholder=Color3.fromHex"#7a5535",
Button=G({[0]="#4a2810",[100]="#7a4a22"},45),
Icon=Color3.fromHex"#bb8855",
Toggle=G({[0]="#996633",[100]="#bb8844"},45),
Slider=G({[0]="#7a5522",[100]="#996633"},45),
Checkbox=G({[0]="#996633",[100]="#bb8844"},45),
ElementBackground=Color3.fromHex"#150d00",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#100a00",
PanelBackgroundTransparency=0,
},

Ink={
Name="Ink",
Background=Color3.fromHex"#050810",
Accent=G({[0]="#112255",[100]="#224488"},45),
Dialog=Color3.fromHex"#080c1a",
Text=Color3.fromHex"#c8d8f0",
Placeholder=Color3.fromHex"#445577",
Button=G({[0]="#0e1e44",[100]="#1e3366"},45),
Icon=Color3.fromHex"#6688bb",
Toggle=G({[0]="#3355aa",[100]="#5577cc"},45),
Slider=G({[0]="#224488",[100]="#3355aa"},45),
Checkbox=G({[0]="#3355aa",[100]="#5577cc"},45),
ElementBackground=Color3.fromHex"#080c18",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#060910",
PanelBackgroundTransparency=0,
},

Electric={
Name="Electric",
Background=Color3.fromHex"#0a0a00",
Accent=G({[0]="#cccc00",[100]="#ffff00"},45),
Dialog=Color3.fromHex"#111100",
Text=Color3.fromHex"#ffffe0",
Placeholder=Color3.fromHex"#777700",
Button=G({[0]="#aaaa00",[100]="#eeee00"},45),
Icon=Color3.fromHex"#ffff33",
Toggle=G({[0]="#dddd00",[100]="#ffff00"},45),
Slider=G({[0]="#bbbb00",[100]="#dddd00"},45),
Checkbox=G({[0]="#dddd00",[100]="#ffff00"},45),
ElementBackground=Color3.fromHex"#111100",
ElementBackgroundTransparency=0,
},

Tron={
Name="Tron",
Background=Color3.fromHex"#000c0c",
Accent=G({[0]="#007799",[100]="#00cccc"},45),
Dialog=Color3.fromHex"#001414",
Text=Color3.fromHex"#ccffff",
Placeholder=Color3.fromHex"#336666",
Button=G({[0]="#006688",[100]="#00aaaa"},45),
Icon=Color3.fromHex"#00eeee",
Toggle=G({[0]="#00cccc",[100]="#00eeee"},45),
Slider=G({[0]="#00aaaa",[100]="#00cccc"},45),
Checkbox=G({[0]="#00cccc",[100]="#00eeee"},45),
ElementBackground=Color3.fromHex"#001111",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#000d0d",
PanelBackgroundTransparency=0,
},

Blood={
Name="Blood",
Background=Color3.fromHex"#080000",
Accent=G({[0]="#660000",[100]="#aa0000"},45),
Dialog=Color3.fromHex"#100000",
Text=Color3.fromHex"#ffdddd",
Placeholder=Color3.fromHex"#661111",
Button=G({[0]="#550000",[100]="#990000"},45),
Icon=Color3.fromHex"#dd2222",
Toggle=G({[0]="#cc1111",[100]="#ee2222"},45),
Slider=G({[0]="#aa0000",[100]="#cc1111"},45),
Checkbox=G({[0]="#cc1111",[100]="#ee2222"},45),
ElementBackground=Color3.fromHex"#0e0000",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0a0000",
PanelBackgroundTransparency=0,
},

Seafoam={
Name="Seafoam",
Background=Color3.fromHex"#eefaf5",
Accent=Color3.fromHex"#2a9d8f",
Dialog=Color3.fromHex"#d8f0eb",
Text=Color3.fromHex"#0a2822",
Placeholder=Color3.fromHex"#558877",
Button=Color3.fromHex"#219a8c",
Icon=Color3.fromHex"#1b8a7e",
Toggle=Color3.fromHex"#2a9d8f",
Slider=Color3.fromHex"#219a8c",
Checkbox=Color3.fromHex"#2a9d8f",
ElementBackground=Color3.fromHex"#c8eae3",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#e0f5ee",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#d5efea",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#e0f5ee",
TabBackgroundHover=Color3.fromHex"#d0ede4",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#b8e0d8",
TabBackgroundActiveTransparency=0,
},

Monochrome={
Name="Monochrome",
Background=Color3.fromHex"#000000",
Accent=Color3.fromHex"#1a1a1a",
Dialog=Color3.fromHex"#111111",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#555555",
Button=Color3.fromHex"#222222",
Icon=Color3.fromHex"#aaaaaa",
Toggle=Color3.fromHex"#ffffff",
Slider=Color3.fromHex"#888888",
Checkbox=Color3.fromHex"#aaaaaa",
ElementBackground=Color3.fromHex"#141414",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0d0d0d",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.5,
TabBackground=Color3.fromHex"#000000",
TabBackgroundHover=Color3.fromHex"#111111",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#1c1c1c",
TabBackgroundActiveTransparency=0,
},

Retro={
Name="Retro",
Background=Color3.fromHex"#0a0800",
Accent=G({[0]="#aa6600",[100]="#ffaa00"},45),
Dialog=Color3.fromHex"#140f00",
Text=Color3.fromHex"#ffcc66",
Placeholder=Color3.fromHex"#886622",
Button=G({[0]="#995500",[100]="#dd8800"},45),
Icon=Color3.fromHex"#ffaa33",
Toggle=G({[0]="#dd8800",[100]="#ffaa00"},45),
Slider=G({[0]="#cc7700",[100]="#dd8800"},45),
Checkbox=G({[0]="#dd9900",[100]="#ffaa00"},45),
ElementBackground=Color3.fromHex"#120e00",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0d0a00",
PanelBackgroundTransparency=0,
},

Bubblegum={
Name="Bubblegum",
Background=Color3.fromHex"#fff0f8",
Accent=Color3.fromHex"#ff66cc",
Dialog=Color3.fromHex"#ffe0f5",
Text=Color3.fromHex"#440022",
Placeholder=Color3.fromHex"#cc66aa",
Button=Color3.fromHex"#ee44bb",
Icon=Color3.fromHex"#dd33aa",
Toggle=Color3.fromHex"#ff55cc",
Slider=Color3.fromHex"#ee44bb",
Checkbox=Color3.fromHex"#ff66cc",
ElementBackground=Color3.fromHex"#ffd5ee",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#ffe8f5",
PanelBackgroundTransparency=0,
LabelBackground=Color3.fromHex"#ffd5ee",
LabelBackgroundTransparency=0,
TabBackground=Color3.fromHex"#ffe8f5",
TabBackgroundHover=Color3.fromHex"#ffd5ec",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#ffbfe0",
TabBackgroundActiveTransparency=0,
},

NightSakura={
Name="Night Sakura",
Background=Color3.fromHex"#0d0008",
Accent=G({[0]="#880044",[100]="#cc3377"},45),
Dialog=Color3.fromHex"#160010",
Text=Color3.fromHex"#ffe0f0",
Placeholder=Color3.fromHex"#7a3358",
Button=G({[0]="#770033",[100]="#bb2266"},45),
Icon=Color3.fromHex"#ff5599",
Toggle=G({[0]="#ee3377",[100]="#ff5599"},45),
Slider=G({[0]="#cc2266",[100]="#ee3377"},45),
Checkbox=G({[0]="#ee3377",[100]="#ff5599"},45),
ElementBackground=Color3.fromHex"#140010",
ElementBackgroundTransparency=0,
PanelBackground=Color3.fromHex"#0e000c",
PanelBackgroundTransparency=0,
},

}
end end function a.w()

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

return aa end function a.x()

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

return aa end function a.y()




local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

function aa.New(ae,af,ag)
local ah={
Title=af.Title or"Tag",
Icon=af.Icon,
Color=af.Color or Color3.fromHex"#315dff",
Radius=af.Radius or 999,
Border=af.Border or false,
TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
IconSize=16,
}

local ai
if ah.Icon then
ai=ab.Image(ah.Icon,ah.Icon,0,af.Window,"Tag",false)
ai.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
ai.ImageLabel.ImageColor3=typeof(ah.Color)=="Color3"
and ab.GetTextColorForHSB(ah.Color)
or typeof(ah.Color)=="string"
and(ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color,ab.Theme)))
or Color3.new(1,1,1)
end

local aj=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ah.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ah.Title,
TextColor3=typeof(ah.Color)=="Color3"
and ab.GetTextColorForHSB(ah.Color)
or typeof(ah.Color)=="string"
and(ab.GetTextColorForHSB(ab.GetThemeProperty(ah.Color,ab.Theme)))
or Color3.new(1,1,1),
})

local ak

if typeof(ah.Color)=="table"then
ak=ac"UIGradient"
for al,am in next,ah.Color do
ak[al]=am
end
local an=ab.GetAverageColor(ak)
aj.TextColor3=ab.GetTextColorForHSB(an)
if ai then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(an)
end
end

local al=ab.NewRoundFrame(ah.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ah.Height),
Parent=ag,
ImageColor3=typeof(ah.Color)=="Color3"and ah.Color
or typeof(ah.Color)=="table"and Color3.new(1,1,1)
or nil,
ThemeTag=typeof(ah.Color)=="string"and{
ImageColor3=ah.Color,
},
},{
ak,
ab.NewRoundFrame(ah.Radius+1,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={ImageColor3="White"},
ImageTransparency=0.75,
}),
ac("Frame",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Name="Content",
BackgroundTransparency=1,
},{
ai,
aj,
ac("UIPadding",{
PaddingLeft=UDim.new(0,ah.Padding),
PaddingRight=UDim.new(0,ah.Padding),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,ah.Padding/1.5),
}),
}),
})

ah.TagFrame=al

function ah.SetTitle(am,an)
ah.Title=an
aj.Text=an
return ah
end

function ah.SetColor(am,an)
ah.Color=an
if typeof(an)=="table"then
local ao=ab.GetAverageColor(an)
ad(aj,0.06,{TextColor3=ab.GetTextColorForHSB(ao)}):Play()
local ap=al:FindFirstChildOfClass"UIGradient"
or ac("UIGradient",{Parent=al})
for aq,ar in next,an do ap[aq]=ar end
ad(al,0.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if ak then ak:Destroy()end
ad(aj,0.06,{TextColor3=ab.GetTextColorForHSB(an)}):Play()
if ai then
ad(ai.ImageLabel,0.06,{ImageColor3=ab.GetTextColorForHSB(an)}):Play()
end
ad(al,0.06,{ImageColor3=an}):Play()
end
return ah
end

function ah.SetIcon(am,an)
ah.Icon=an
if an then
ai=ab.Image(an,an,0,af.Window,"Tag",false)
ai.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
ai.Parent=al.Content
if typeof(ah.Color)=="Color3"then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ah.Color)
elseif typeof(ah.Color)=="table"and ak then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(
ab.GetAverageColor(ak)
)
end
else
if ai then ai:Destroy();ai=nil end
end
return ah
end

function ah.Destroy(am)
al:Destroy()
return ah
end


ab:OnThemeChange(function(am,an)
if typeof(ah.Color)=="string"then
local ao=ab.GetThemeProperty(ah.Color,ab.Theme)
if ao then
aj.TextColor3=ab.GetTextColorForHSB(ao)
if ai then
ai.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ao)
end
end
end
end)

return ah
end

return aa end function a.z()

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

return ae end function a.A()
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



return aa end function a.B()
local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween


function aa.New(ae,af,ag,ah,ai,aj)
local ak={
Container=nil,
TooltipSize=16,

TooltipArrowSizeX=ai=="Small"and 16 or 24,
TooltipArrowSizeY=ai=="Small"and 6 or 9,

PaddingX=ai=="Small"and 12 or 14,
PaddingY=ai=="Small"and 7 or 9,

Radius=999,

TitleFrame=nil,
}

ah=ah or""
aj=aj~=false

local al=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=aj,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=ae,
TextSize=ai=="Small"and 15 or 17,
TextTransparency=1,
ThemeTag={
TextColor3="Tooltip"..ah.."Text",
}
})

ak.TitleFrame=al

local am=ac("UIScale",{
Scale=.9
})

local an=ac("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=af,

Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=ag,
Name="Arrow",
},{
ac("ImageLabel",{
Size=UDim2.new(0,ak.TooltipArrowSizeX,0,ak.TooltipArrowSizeY),
BackgroundTransparency=1,

Image="rbxassetid://105854070513330",
ThemeTag={
ImageColor3="Tooltip"..ah,
},
},{










}),
}),
ab.NewRoundFrame(ak.Radius,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Tooltip"..ah,
},
ImageTransparency=1,
Name="Background",
},{



ac("Frame",{



AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

al,
ac("UIPadding",{
PaddingTop=UDim.new(0,ak.PaddingY),
PaddingLeft=UDim.new(0,ak.PaddingX),
PaddingRight=UDim.new(0,ak.PaddingX),
PaddingBottom=UDim.new(0,ak.PaddingY),
}),
})
}),
am,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
ak.Container=an

function ak.Open(ao)
an.Visible=true


ad(an.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an.Arrow.ImageLabel,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.22,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function ak.Close(ao,ap)

ad(an.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an.Arrow.ImageLabel,.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(al,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()

ap=ap~=false
if ap then
task.wait(.35)

an.Visible=false
an:Destroy()
end
end

return ak
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

local af=a.load'y'

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

local aH,b=ac(ah.UICorner,"Squircle",{
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

ah.UIElements.Main=aH
ah.UIElements.Locked=ax

if ah.Hover then
aa.AddSignal(aH.MouseEnter,function()
if am then

ad(aF,0.12,{ImageTransparency=0.9}):Play()
ad(aD,0.12,{ImageTransparency=0.8}):Play()
aa.AddSignal(aH.MouseMoved,function(d,f)
aF.HoverGradient.Offset=
Vector2.new(((d-aH.AbsolutePosition.X)/aH.AbsoluteSize.X)-0.5,0)
aD.HoverGradient.Offset=
Vector2.new(((d-aH.AbsolutePosition.X)/aH.AbsoluteSize.X)-0.5,0)
end)
end
end)
aa.AddSignal(aH.InputEnded,function()
if am then

ad(aF,0.12,{ImageTransparency=1}):Play()
ad(aD,0.12,{ImageTransparency=1}):Play()
end
end)
end

function ah.SetTitle(d,f)
ah.Title=f
aq.Text=f
end

function ah.SetDesc(d,f)
ah.Desc=f
ar.Text=f or""
if not f then
ar.Visible=false
elseif not ar.Visible then
ar.Visible=true
end
end

function ah.Colorize(d,f,g)
if ah.Color then
f[g]=typeof(ah.Color)=="string"
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





function ah.SetThumbnail(d,f,g)
ah.Thumbnail=f
if g then
ah.ThumbnailSize=g
al=g
end

if ao then
if f then
ao:Destroy()
ao=aa.Image(
f,
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
local h=ah.UIElements.Container:FindFirstChild"UIListLayout"
if h then
ao.LayoutOrder=-1
end
end
else
ao.Visible=false
end
else
if f then
ao=aa.Image(
f,
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
local h=ah.UIElements.Container:FindFirstChild"UIListLayout"
if h then
ao.LayoutOrder=-1
end
end
end
end
end

function ah.SetImage(d,f,g)
ah.Image=f
if g then
ah.ImageSize=g
ak=g
end

if f then
local h=ap and ap.Parent or ah.UIElements.Container.TitleFrame
if ap then
ap:Destroy()
end

ap=aa.Image(
f,
f,
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
ap.Parent=h
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

function ah.Destroy(d)
aH:Destroy()
end

function ah.Lock(d,f)
am=false
ax.Active=true
ax.Visible=true
av.Text=f or"Locked"
end

function ah.Unlock(d)
am=true
ax.Active=false
ax.Visible=false
end

function ah.Highlight(d)
local f=ab("UIGradient",{
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

local g=ab("UIGradient",{
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

ad(f,0.75,{
Offset=Vector2.new(1,0),
}):Play()

ad(g,0.75,{
Offset=Vector2.new(1,0),
}):Play()

task.spawn(function()
task.wait(0.75)
az.ImageTransparency=1
aB.ImageTransparency=1
f:Destroy()
g:Destroy()
end)
end

function ah.UpdateShape(d)
if ag.Window.NewElements then
local f=aa:GetElementPosition(
d.Elements,
ah.Index,
ag.ParentConfig.ParentTable.__type=="HStack"or ag.ParentConfig.ParentTable.__type=="Group"
)

if f and aH then
b:SetType(f)
ay:SetType(f)
aC:SetType(f)

aG:SetType(f)

end
end
end





return ah
end end function a.D()

local aa=a.load'd'
local ab=aa.New

local ac={}

local ad=a.load'm'.New

function ac.New(ae,af)
af.Hover=false
af.TextOffset=0
af.ParentConfig=af
af.IsButtons=af.Buttons and#af.Buttons>0 and true or false

local ag={
__type="Paragraph",
Title=af.Title or"Paragraph",
Desc=af.Desc or nil,

Locked=af.Locked or false,
}
local ah=a.load'C'(af)

ag.ParagraphFrame=ah
if af.Buttons and#af.Buttons>0 then
local ai=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ah.UIElements.Container,
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
}),
})

for aj,ak in next,af.Buttons do
local al=ad(
ak.Title,
ak.Icon,
ak.Callback,
ak.Variant or"White",
ai,
nil,
nil,
af.Window.NewElements and 999 or 10
)
al.Size=UDim2.new(1,0,0,38)

end
end

return ag.__type,ag
end

return ac end function a.E()

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

return ac end function a.F()

local aa={}

local ab=a.load'd'
local ac=ab.New
local ad=ab.Tween

local ae=game:GetService"UserInputService"

function aa.New(af,ag,ah,ai,aj,ak,al)
local am={
GlassSpritesheet={
Id="rbxassetid://77297718671545",
MirroredId="rbxassetid://92258969882244",
Size=Vector2.new(102,128),
Total=80,
Cols=10,
},
}

function am.GetGlassFrame(an,ao)
local ap=am.GlassSpritesheet
local aq
if ao<=0.4 then
aq=math.floor((ao/0.4)*(ap.Total-1))
elseif ao<0.6 then
aq=ap.Total-1
else
aq=math.floor(((ao-0.6)/0.4)*(ap.Total-1))
end
aq=math.clamp(aq,0,ap.Total-1)
local ar=ao>=0.6
if ar then aq=(ap.Total-1)-aq end
local as=ar and ap.MirroredId or ap.Id
return as,ap.Size,Vector2.new((aq%ap.Cols)*ap.Size.X,math.floor(aq/ap.Cols)*ap.Size.Y)
end

local an=12

local ao
if ag and ag~=""then
ao=ac("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(ag)[1],
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local ap=ac("Frame",{
Size=UDim2.new(0,2,0,26),
BackgroundTransparency=1,
Parent=ai,
})

local aq=ab.NewRoundFrame(an,"Squircle",{
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=ap,
Size=UDim2.new(0,ak and(52)or math.floor(40.8),0,24),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,0,0.5,0),
Name="ToggleFrame",
},{

ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={ImageColor3="Toggle"},
ImageTransparency=1,
}),


ab.NewRoundFrame(an,"SquircleOutline",{
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
}),


ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(0,ak and 30 or 20,0,20),
Position=UDim2.new(0,2,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=1,
Name="Frame",
},{
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Bar",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=1,
Name="Highlight",
},{

ab.NewRoundFrame(9999,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
ImageColor3=Color3.new(1,1,1),
Name="SquircleGlass",
ImageTransparency=0.5,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
}),




ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="GlassBackground",
ImageTransparency=0,
ThemeTag={ImageColor3="PanelBackground"},
ZIndex=-1,
}),


ac("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Glass",
ImageTransparency=0,
},{
ac("UICorner",{CornerRadius=UDim.new(1,0)}),
}),


ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="BarOverlay",
ThemeTag={ImageColor3="ToggleBar"},
ZIndex=999,
}),
}),

ao,
ac("UIScale",{Scale=1}),
}),
}),


ac("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Name="Hitbox",
Text="",
}),
})

local ar=aq.Size.X.Offset
local as=ak and 30 or 20
local at,au

function am.Set(av,aw,ax,ay)
if not ay then
if aw then
ad(aq.Frame,0.32,{
Position=UDim2.new(0,ar-as-2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
else
ad(aq.Frame,0.32,{
Position=UDim2.new(0,2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
end
else
aq.Frame.Position=aw
and UDim2.new(0,ar-as-2,0.5,0)
or UDim2.new(0,2,0.5,0)
end

if aw then
ad(aq.Layer,0.12,{ImageTransparency=0}):Play()
ab.SetThemeTag(aq.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.1)
ad(aq.Frame.Bar.Highlight.Glass,0.1,{ImageTransparency=0}):Play()
if ao then
ad(ao,0.1,{ImageTransparency=0}):Play()
end
else
ad(aq.Layer,0.12,{ImageTransparency=1}):Play()
ab.SetThemeTag(aq.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.1)
ad(aq.Frame.Bar.Highlight.Glass,0.1,{ImageTransparency=0.85}):Play()
if ao then
ad(ao,0.1,{ImageTransparency=1}):Play()
end
end

local az,aA,aB=am:GetGlassFrame(aw and 1 or 0)
aq.Frame.Bar.Highlight.Glass.Image=az
aq.Frame.Bar.Highlight.Glass.ImageRectSize=aA
aq.Frame.Bar.Highlight.Glass.ImageRectOffset=aB

if ax~=false and aj then
task.spawn(function()ab.SafeCallback(aj,aw)end)
end
end

function am.Animate(av,aw,ax)
if al.Window.IsToggleDragging then return end
al.Window.IsToggleDragging=true

local ay=aw.Position.X
local az=aq.Frame.Position.X.Offset
local aA=false

ad(aq.Frame.Bar.UIScale,0.28,{Scale=1.5},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(aq.Frame.Bar.Highlight.BarOverlay,0.28,{ImageTransparency=0.86}):Play()

if at then at:Disconnect()end
at=ae.InputChanged:Connect(function(aB)
if not al.Window.IsToggleDragging then return end
if aB.UserInputType~=Enum.UserInputType.MouseMovement
and aB.UserInputType~=Enum.UserInputType.Touch then return end

local aC=aB.Position.X-ay
if math.abs(aC)>5 then aA=true end
local aD=math.clamp(az+aC,2,ar-as-2)
local aE=(aD-2)/math.max(ar-as-4,1)

local aF,aG,aH=am:GetGlassFrame(aE)
aq.Frame.Bar.Highlight.Glass.Image=aF
aq.Frame.Bar.Highlight.Glass.ImageRectSize=aG
aq.Frame.Bar.Highlight.Glass.ImageRectOffset=aH

ad(aq.Frame,0.10,{Position=UDim2.new(0,aD,0.5,0)},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

if au then au:Disconnect()end
au=ae.InputEnded:Connect(function(aB)
if not al.Window.IsToggleDragging then return end
if aB.UserInputType~=Enum.UserInputType.MouseButton1
and aB.UserInputType~=Enum.UserInputType.Touch then return end

al.Window.IsToggleDragging=false
if at then at:Disconnect();at=nil end
if au then au:Disconnect();au=nil end
al.WindUI.CurrentInput=nil

ad(aq.Frame.Bar.UIScale,0.24,{Scale=1},
Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ad(aq.Frame.Bar.Highlight.BarOverlay,0.20,{ImageTransparency=0}):Play()

if not aA then
ax:Set(not ax.Value,true,false)
else
local aC=aq.Frame.Position.X.Offset+as/2
ax:Set(aC>ar/2,true,false)
end
end)
end

return ap,am
end

return aa end function a.G()

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


return aa end function a.H()
local aa=a.load'd'local ab=
aa.New local ac=
aa.Tween

local ad=a.load'F'.New
local ae=a.load'G'.New

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

return af end function a.I()

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


local ax=ae.NewRoundFrame(99,"Shadow-sm",{
ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,4,1,6),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,3),
ImageTransparency=0.55,
ZIndex=-1,
})

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
ax,
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

local ay
if al.IsTooltip then
ay=a.load'B'.New(
ap,
al.UIElements.SliderIcon.Frame.Thumb,
true,
"Secondary",
"Small",
false
)
ay.Container.AnchorPoint=Vector2.new(0.5,1)
ay.Container.Position=UDim2.new(0.5,0,0,-8)
end

function al.Lock(az)
al.Locked=true
as=false
return al.SliderFrame:Lock(al.LockedTitle)
end
function al.Unlock(az)
al.Locked=false
as=true
return al.SliderFrame:Unlock()
end

if al.Locked then
al:Lock()
end


local az=ak.Tab.UIElements.ContainerFrame

function al.Set(aA,aB,aC)
if as then
if
not al.IsFocusing
and not ai
and(
not aC
or(
aC.UserInputType==Enum.UserInputType.MouseButton1
or aC.UserInputType==Enum.UserInputType.Touch
)
)
then
if aC then
am=(aC.UserInputType==Enum.UserInputType.Touch)
az.ScrollingEnabled=false
ai=true

local aD=am and aC.Position.X or ac:GetMouseLocation().X
local aE=math.clamp(
(aD-al.UIElements.SliderIcon.AbsolutePosition.X)
/al.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aB=CalculateValue(al.Value.Min+aE*(al.Value.Max-al.Value.Min))
aB=math.clamp(aB,al.Value.Min or 0,al.Value.Max or 100)

if aB~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(aE,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aB)
if ay then
ay.TitleFrame.Text=FormatValue(aB)
end
al.Value.Default=FormatValue(aB)
aq=aB
ae.SafeCallback(al.Callback,FormatValue(aB))
end

an=ad.RenderStepped:Connect(function()
local aF=am and aC.Position.X or ac:GetMouseLocation().X
local aG=math.clamp(
(aF-al.UIElements.SliderIcon.AbsolutePosition.X)
/al.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
aB=CalculateValue(al.Value.Min+aG*(al.Value.Max-al.Value.Min))

if aB~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(aG,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aB)
if ay then
ay.TitleFrame.Text=FormatValue(aB)
end
al.Value.Default=FormatValue(aB)
aq=aB
ae.SafeCallback(al.Callback,FormatValue(aB))
end
end)


ao=ac.InputEnded:Connect(function(aF)
if
(
aF.UserInputType==Enum.UserInputType.MouseButton1
or aF.UserInputType==Enum.UserInputType.Touch
)and aC==aF
then
an:Disconnect()
ao:Disconnect()
ai=false
az.ScrollingEnabled=true

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
if ay then
ay:Close(false)
end
end
end)
else
aB=math.clamp(aB,al.Value.Min or 0,al.Value.Max or 100)

local aD=math.clamp(
(aB-(al.Value.Min or 0))/((al.Value.Max or 100)-(al.Value.Min or 0)),
0,
1
)
aB=CalculateValue(al.Value.Min+aD*(al.Value.Max-al.Value.Min))

if aB~=aq then
ag(al.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(aD,0,1,0)}):Play()
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aB)
if ay then
ay.TitleFrame.Text=FormatValue(aB)
end
al.Value.Default=FormatValue(aB)
aq=aB
ae.SafeCallback(al.Callback,FormatValue(aB))
end
end
end
end
end

function al.SetMax(aA,aB)
al.Value.Max=aB

local aC=tonumber(al.Value.Default)or aq
if aC>aB then
al:Set(aB)
else
local aD=
math.clamp((aC-(al.Value.Min or 0))/(aB-(al.Value.Min or 0)),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(aD,0,1,0)}):Play()
end
end

function al.SetMin(aA,aB)
al.Value.Min=aB

local aC=tonumber(al.Value.Default)or aq
if aC<aB then
al:Set(aB)
else
local aD=math.clamp((aC-aB)/((al.Value.Max or 100)-aB),0,1)
ag(al.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(aD,0,1,0)}):Play()
end
end

ae.AddSignal(al.UIElements.SliderContainer.TextBox.FocusLost,function(aA)
local aB=tonumber(al.UIElements.SliderContainer.TextBox.Text)
if aB then
al:Set(aB)
else
al.UIElements.SliderContainer.TextBox.Text=FormatValue(aq)
if ay then
ay.TitleFrame.Text=FormatValue(aq)
end
end
end)

local aA=ak.WindUI.GenerateGUID()

ae.AddSignal(al.UIElements.SliderContainer.InputBegan,function(aB)
if al.Locked or ai then
return
end
if
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
then
if ak.WindUI.CurrentInput and ak.WindUI.CurrentInput~=aA then
return
end
ak.WindUI.CurrentInput=aA

al:Set(ap,aB)


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
if ay then
ay:Open()
end

end
end)

return al.__type,al
end

return ah end function a.J()

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

return ae end function a.K()

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

local ah=a.load'w'.New

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

return ag end function a.L()

local aa=a.load'd'local ac=
aa.New local ad=
aa.Tween

local ae={
UICorner=8,
UIPadding=8,
}local af=a.load'm'

.New
local ag=a.load'n'.New

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

return ae end function a.M()





local aa=a.load'd'
local ae=aa.New

local af={}

function af.New(ag,ah)
local ai=ah.ParentType=="Group"or ah.ParentType=="HStack"


local aj=ae("Frame",{
Size=ai
and UDim2.new(0,1,1,0)
or UDim2.new(1,0,0,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=0.82,
ThemeTag={BackgroundColor3="Text"},
})


local ak
if ah.Title and ah.Title~=""and not ai then

ak=ae("Frame",{
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
},{
ae("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=12,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
ThemeTag={TextColor3="Text"},
TextTransparency=0.45,
Text=ah.Title,
}),
ae("UIPadding",{
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
}),
})
ak.Parent=aj.Parent
end


local al=ae("Frame",{
Parent=ah.Parent,
Size=ai
and UDim2.new(0,20,1,-8)
or UDim2.new(1,-8,0,20),
BackgroundTransparency=1,
ClipsDescendants=false,
},{
aj,
ak,
})

return"Divider",{__type="Divider",ElementFrame=al}
end

return af end function a.N()

local aa={}

local ae=(cloneref or clonereference or function(ae)
return ae
end)

local af=ae(game:GetService"UserInputService")
local ag=ae(game:GetService"Players").LocalPlayer:GetMouse()
local ah=ae(game:GetService"Workspace").CurrentCamera local ai=

workspace.CurrentCamera

local aj=a.load'n'.New

local ak=a.load'd'
local al=ak.New
local am=ak.Tween

local an=0.67

function aa.New(ao,ap,aq,ar)
local as={}

if not ap.Callback then
ar="Menu"
end

ap.UIElements.UIListLayout=al("UIListLayout",{
Padding=UDim.new(0,aq.MenuPadding/1.5),
FillDirection="Vertical",
HorizontalAlignment="Center",
})

ap.UIElements.Menu=ak.NewRoundFrame(aq.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="DropdownBackground",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
al("UIPadding",{
PaddingTop=UDim.new(0,aq.MenuPadding),
PaddingLeft=UDim.new(0,aq.MenuPadding),
PaddingRight=UDim.new(0,aq.MenuPadding),
PaddingBottom=UDim.new(0,aq.MenuPadding),
}),
al("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,aq.MenuPadding),
}),
al("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,ap.SearchBarEnabled and-aq.MenuPadding-aq.SearchBarHeight),

ClipsDescendants=true,
LayoutOrder=999,
Name="Frame",
},{
al("UICorner",{
CornerRadius=UDim.new(0,aq.MenuCorner-aq.MenuPadding),
}),
al("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
ap.UIElements.UIListLayout,
}),
}),
})

ap.UIElements.MenuCanvas=al("Frame",{
Size=UDim2.new(0,ap.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=ao.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
ap.UIElements.Menu,
al("UISizeConstraint",{
MinSize=Vector2.new(170,0),
MaxSize=Vector2.new(300,400),
}),
})

local function RecalculateCanvasSize()
ap.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=
UDim2.fromOffset(0,ap.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
local at=ao.WindUI.DropdownGui.AbsoluteSize.Y



local au=math.max(0,
ap.UIElements.UIListLayout.AbsoluteContentSize.Y/ao.UIScale
-aq.MenuPadding
)

local av=ap.SearchBarEnabled
and(aq.SearchBarHeight+(aq.MenuPadding*3))
or(aq.MenuPadding*2)

local aw=au+av

if aw>at then
ap.UIElements.MenuCanvas.Size=
UDim2.fromOffset(ap.UIElements.MenuCanvas.AbsoluteSize.X,at)
else
ap.UIElements.MenuCanvas.Size=
UDim2.fromOffset(ap.UIElements.MenuCanvas.AbsoluteSize.X,aw)
end
end

function UpdatePosition()
local at=ap.UIElements.Dropdown or ap.DropdownFrame.UIElements.Main
local au=ap.UIElements.MenuCanvas

local av=ah.ViewportSize.Y
-(at.AbsolutePosition.Y+at.AbsoluteSize.Y)
-aq.MenuPadding
-54
local aw=au.AbsoluteSize.Y+aq.MenuPadding

local ax=-54
if av<aw then
ax=aw-av-54
end

au.Position=UDim2.new(
0,
at.AbsolutePosition.X+at.AbsoluteSize.X,
0,
at.AbsolutePosition.Y+at.AbsoluteSize.Y-ax+(aq.MenuPadding*2)
)
end

local at

function as.Display(au)
local av=ap.Values
local aw=""

if ap.Multi then
local ax={}
if typeof(ap.Value)=="table"then
for ay,az in ipairs(ap.Value)do
local aA=typeof(az)=="table"and az.Title or az
ax[aA]=true
end
end

for ay,az in ipairs(av)do
local aA=typeof(az)=="table"and az.Title or az
if ax[aA]then
aw=aw..aA..", "
end
end

if#aw>0 then
aw=aw:sub(1,#aw-2)
end
else
aw=typeof(ap.Value)=="table"and(ap.Value.Title or ap.Value[1])
or ap.Value
or""
end

if ap.UIElements.Dropdown then
ap.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(aw==""and"--"or aw)
end
end

local function Callback(au)
as:Display()
if ap.Locked then
return
end

if ap.Callback then
task.spawn(function()
if ap.Locked then
return
end
ak.SafeCallback(ap.Callback,ap.Value)
end)
else
task.spawn(function()
if ap.Locked then
return
end
ak.SafeCallback(au)
end)
end
end

function as.LockValues(au,av)
if not av then
return
end

for aw,ax in next,ap.Tabs do
if ax and ax.UIElements and ax.UIElements.TabItem then
local ay=ax.Name
local az=false

for aA,aB in next,av do
if ay==aB then
az=true
break
end
end

if az then
am(ax.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.6}):Play()
if ax.UIElements.TabIcon then
am(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.6}):Play()
end

ax.UIElements.TabItem.Active=false
ax.Locked=true
else
if ax.Selected then
am(ax.UIElements.TabItem,0.1,{ImageTransparency=an}):Play()

am(ax.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ax.UIElements.TabIcon then
am(ax.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
else
am(ax.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(
ax.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=ar=="Dropdown"and 0.4 or 0.05}
):Play()
if ax.UIElements.TabIcon then
am(
ax.UIElements.TabIcon.ImageLabel,
0.1,
{ImageTransparency=ar=="Dropdown"and 0.2 or 0}
):Play()
end
end

ax.UIElements.TabItem.Active=true
ax.Locked=false
end
end
end
end

function as.Refresh(au,av)
if ao.Window.Destroyed then
return
end

for aw,ax in next,ap.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not ax:IsA"UIListLayout"then
ax:Destroy()
end
end

ap.Tabs={}

if ap.SearchBarEnabled then
if not at then
at=aj("Search...","search",ap.UIElements.Menu,nil,function(ay)
for az,aA in next,ap.Tabs do
if string.find(string.lower(aA.Name),string.lower(ay),1,true)then
aA.UIElements.TabItem.Visible=true
else
aA.UIElements.TabItem.Visible=false
end
RecalculateListSize()
RecalculateCanvasSize()
end
end,true)
at.Size=UDim2.new(1,0,0,aq.SearchBarHeight)
at.Position=UDim2.new(0,0,0,0)
at.Name="SearchBar"
end
end

for ay,az in next,av do
if az.Type~="Divider"then
local aA={
Name=typeof(az)=="table"and az.Title or az,
Desc=typeof(az)=="table"and az.Desc or nil,
Icon=typeof(az)=="table"and az.Icon or nil,
IconSize=typeof(az)=="table"and az.IconSize or nil,
Original=az,
Selected=false,
Locked=typeof(az)=="table"and az.Locked or false,
UIElements={},
}
local aB
if aA.Icon then
aB=ak.Image(aA.Icon,aA.Icon,0,ao.Window.Folder,"Dropdown",true)
aB.Size=
UDim2.new(0,aA.IconSize or aq.TabIcon,0,aA.IconSize or aq.TabIcon)
aB.ImageLabel.ImageTransparency=ar=="Dropdown"and 0.2 or 0
aA.UIElements.TabIcon=aB
end
aA.UIElements.TabItem=ak.NewRoundFrame(
aq.MenuCorner-aq.MenuPadding,
"Squircle",
{
Size=UDim2.new(1,0,0,36),
AutomaticSize=aA.Desc and"Y",
ImageTransparency=1,
Parent=ap.UIElements.Menu.Frame.ScrollingFrame,

ThemeTag={
ImageColor3="DropdownTabBackground",
},
Active=not aA.Locked,
},
{
ak.NewRoundFrame(aq.MenuCorner-aq.MenuPadding,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="DropdownTabBorder",
},
ImageTransparency=1,
Name="Highlight",
},{













}),
al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
al("UIListLayout",{
Padding=UDim.new(0,aq.TabPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("UIPadding",{
PaddingTop=UDim.new(0,aq.TabPadding),
PaddingLeft=UDim.new(0,aq.TabPadding),
PaddingRight=UDim.new(0,aq.TabPadding),
PaddingBottom=UDim.new(0,aq.TabPadding),
}),
al("UICorner",{
CornerRadius=UDim.new(0,aq.MenuCorner-aq.MenuPadding),
}),
aB,
al("Frame",{
Size=UDim2.new(1,aB and-aq.TabPadding-aq.TabIcon or 0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Name="Title",
},{
al("TextLabel",{
Text=aA.Name,
TextXAlignment="Left",
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=ar=="Dropdown"and 0.4 or 0.05,
LayoutOrder=999,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
}),
al("TextLabel",{
Text=aA.Desc or"",
TextXAlignment="Left",
FontFace=Font.new(ak.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=ar=="Dropdown"and 0.6 or 0.35,
LayoutOrder=999,
AutomaticSize="Y",
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
Visible=aA.Desc and true or false,
Name="Desc",
}),
al("UIListLayout",{
Padding=UDim.new(0,aq.TabPadding/3),
FillDirection="Vertical",
}),
}),
}),
},
true
)

if aA.Locked then
aA.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0.6
if aA.UIElements.TabIcon then
aA.UIElements.TabIcon.ImageLabel.ImageTransparency=0.6
end
end

if ap.Multi and typeof(ap.Value)=="string"then
for aC,aD in next,ap.Values do
if typeof(aD)=="table"then
if aD.Title==ap.Value then
ap.Value={aD}
end
else
if aD==ap.Value then
ap.Value={ap.Value}
end
end
end
end

if ap.Multi then
local aC=false
if typeof(ap.Value)=="table"then
for aD,aE in ipairs(ap.Value)do
local aF=typeof(aE)=="table"and aE.Title or aE
if aF==aA.Name then
aC=true
break
end
end
end
aA.Selected=aC
else
local aC=typeof(ap.Value)=="table"and ap.Value.Title or ap.Value
aA.Selected=aC==aA.Name
end

if aA.Selected and not aA.Locked then
aA.UIElements.TabItem.ImageTransparency=an

aA.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0
if aA.UIElements.TabIcon then
aA.UIElements.TabIcon.ImageLabel.ImageTransparency=0
end
end

ap.Tabs[ay]=aA

as:Display()

if ar=="Dropdown"then
ak.AddSignal(aA.UIElements.TabItem.MouseButton1Click,function()
if ap.Locked or aA.Locked then
return
end

if ap.Multi then
if not aA.Selected then
aA.Selected=true
am(
aA.UIElements.TabItem,
0.1,
{ImageTransparency=an}
):Play()

am(aA.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if aA.UIElements.TabIcon then
am(aA.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
table.insert(ap.Value,aA.Original)
else
if not ap.AllowNone and#ap.Value==1 then
return
end
aA.Selected=false
am(aA.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(aA.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.4}):Play()
if aA.UIElements.TabIcon then
am(aA.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end

for aC,aD in next,ap.Value do
if typeof(aD)=="table"and(aD.Title==aA.Name)or(aD==aA.Name)then
table.remove(ap.Value,aC)
break
end
end
end
else
for aC,aD in next,ap.Tabs do
am(aD.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

am(
aD.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=0.4}
):Play()
if aD.UIElements.TabIcon then
am(aD.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end
aD.Selected=false
end
aA.Selected=true
am(aA.UIElements.TabItem,0.1,{ImageTransparency=an}):Play()

am(aA.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if aA.UIElements.TabIcon then
am(aA.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
ap.Value=aA.Original
end
Callback()
end)
elseif ar=="Menu"then
if not aA.Locked then
ak.AddSignal(aA.UIElements.TabItem.MouseEnter,function()
am(aA.UIElements.TabItem,0.08,{ImageTransparency=an}):Play()
end)
ak.AddSignal(aA.UIElements.TabItem.InputEnded,function()
am(aA.UIElements.TabItem,0.08,{ImageTransparency=1}):Play()
end)
end
ak.AddSignal(aA.UIElements.TabItem.MouseButton1Click,function()
if ap.Locked or aA.Locked then
return
end
Callback(az.Callback or function()end)
end)
end

RecalculateCanvasSize()
RecalculateListSize()
else a.load'M'
:New{Parent=ap.UIElements.Menu.Frame.ScrollingFrame}
end
end










ap.UIElements.MenuCanvas.Size=UDim2.new(
0,
ap.MenuWidth+6+6+5+5+18+6+6,
ap.UIElements.MenuCanvas.Size.Y.Scale,
ap.UIElements.MenuCanvas.Size.Y.Offset
)
Callback()

ap.Values=av
end

as:Refresh(ap.Values)

function as.Select(au,av)
if av then
ap.Value=av
else
if ap.Multi then
ap.Value={}
else
ap.Value=nil
end
end
as:Refresh(ap.Values)
end

RecalculateListSize()
RecalculateCanvasSize()

function as.Open(au)
if not ap.Locked then
ap.UIElements.Menu.Visible=true
ap.UIElements.MenuCanvas.Visible=true
ap.UIElements.MenuCanvas.Active=true
ap.UIElements.Menu.Size=UDim2.new(1,0,0,0)
am(ap.UIElements.Menu,0.1,{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.1)
if ap.Locked then
return
end
ap.Opened=true
end)

UpdatePosition()
end
end

function as.Close(au)
ap.Opened=false

am(ap.UIElements.Menu,0.25,{
Size=UDim2.new(1,0,0,0),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.1)
ap.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(0.25)
ap.UIElements.MenuCanvas.Visible=false
ap.UIElements.MenuCanvas.Active=false
end)
end

ak.AddSignal(
(
ap.UIElements.Dropdown and ap.UIElements.Dropdown.MouseButton1Click
or ap.DropdownFrame.UIElements.Main.MouseButton1Click
),
function()
as:Open()
end
)

ak.AddSignal(af.InputBegan,function(au)
if
au.UserInputType==Enum.UserInputType.MouseButton1
or au.UserInputType==Enum.UserInputType.Touch
then
local av=ap.UIElements.MenuCanvas
local aw,ax=av.AbsolutePosition,av.AbsoluteSize

local ay=ap.UIElements.Dropdown or ap.DropdownFrame.UIElements.Main
local az=ay.AbsolutePosition
local aA=ay.AbsoluteSize

local aB=ag.X>=az.X
and ag.X<=az.X+aA.X
and ag.Y>=az.Y
and ag.Y<=az.Y+aA.Y

local aC=ag.X>=aw.X
and ag.X<=aw.X+ax.X
and ag.Y>=aw.Y
and ag.Y<=aw.Y+ax.Y

if ao.Window.CanDropdown and ap.Opened and not aB and not aC then
as:Close()
end
end
end)

ak.AddSignal(
ap.UIElements.Dropdown and ap.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition"
or ap.DropdownFrame.UIElements.Main:GetPropertyChangedSignal"AbsolutePosition",
UpdatePosition
)

return as
end

return aa end function a.O()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")
aa(game:GetService"Players").LocalPlayer:GetMouse()local ae=
aa(game:GetService"Workspace").CurrentCamera

local af=a.load'd'
local ag=af.New local ah=
af.Tween

local ai=a.load'w'.New local aj=a.load'n'
.New
local ak=a.load'N'.New local al=

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

return am end function a.P()




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

return aa end function a.Q()

local aa={}

local af=a.load'd'
local ag=af.New
local ai=af.Tween

local ak=a.load'P'

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

return aa end function a.R()

local aa=a.load'd'local af=
aa.New


local ag=a.load'Q'

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

return ai end function a.S()

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

local aq=a.load'm'.New
local ar=a.load'n'.New

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

local aC=a.load'o'
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





local aH=af("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local b=af("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aH,
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

b,
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





local d=af("Frame",{
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







d,
})

local f=af("Frame",{
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
f,
})

local g={}

for h=0,1,0.1 do
table.insert(g,ColorSequenceKeypoint.new(h,Color3.fromHSV(h,1,1)))
end

local h=af("UIGradient",{
Color=ColorSequence.new(g),
Rotation=90,
})

local i=af("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=aH,


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

local m=af("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+az.TextPadding),
Parent=aD.UIElements.Main,
},{
af("UICorner",{
CornerRadius=UDim.new(1,0),
}),
h,
aH,
})

local function CreateNewInput(p,r)
local u=ar(p,nil,az.UIElements.Inputs,nil,nil,nil,nil,nil,true)

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
Parent=u.Frame,
Text=p,
})

af("UIScale",{
Parent=u,
Scale=0.85,
})

u.Frame.Frame.TextBox.Text=r
u.Size=UDim2.new(0,150,0,42)

return u
end

local function ToRGB(p)
return{
R=math.floor(p.R*255),
G=math.floor(p.G*255),
B=math.floor(p.B*255),
}
end

local p=CreateNewInput("Hex","#"..az.Default:ToHex())

local r=CreateNewInput("Red",ToRGB(az.Default).R)
local u=CreateNewInput("Green",ToRGB(az.Default).G)
local v=CreateNewInput("Blue",ToRGB(az.Default).B)
local x
if aB then
x=CreateNewInput("Alpha",((1-az.Transparency)*100).."%")
end

local z=af("Frame",{
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
z.Size=UDim2.new(
0,
aD.UIElements.Main.AbsoluteSize.X/av.UIScale-aD.UIPadding*2,
0,
40
)
end)

local A={
{
Title="Cancel",
Variant="Secondary",
Callback=function()
av.IsShowed=false
for A,F in next,aA do
F:Disconnect()
end
aA={}
end,
},
{
Title="Apply",

Variant="Primary",
Callback=function()
av.IsShowed=false
for A,F in next,aA do
F:Disconnect()
end
aA={}

ay(Color3.fromHSV(az.Hue,az.Sat,az.Vib),az.Transparency)
end,
},
}

for F,H in next,A do
local J=aq(
H.Title,
H.Icon,
H.Callback,
H.Variant,
z,
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
b.Position=UDim2.new(aF,0,1-aG,0)
b.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
f.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
i.BackgroundColor3=Color3.fromHSV(aE,1,1)
i.Position=UDim2.new(0.5,0,aE,0)

p.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(aE,aF,aG):ToHex()
r.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aE,aF,aG)).R
u.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aE,aF,aG)).G
v.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(aE,aF,aG)).B

if P or aB then
f.BackgroundTransparency=az.Transparency or P
M.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
L.BackgroundColor3=Color3.fromHSV(aE,aF,aG)
L.BackgroundTransparency=az.Transparency or P
L.Position=UDim2.new(0.5,0,1-az.Transparency or P,0)
x.Frame.Frame.TextBox.Text=az:Round(
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
aa.AddSignal(p.Frame.Frame.TextBox.FocusLost,function(N)
if N then
local O=p.Frame.Frame.TextBox.Text:gsub("#","")
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

updateColorFromInput(r,"R")
updateColorFromInput(u,"G")
updateColorFromInput(v,"B")

if aB then
aa.AddSignal(x.Frame.Frame.TextBox.FocusLost,function(N)
if N then
local O=x.Frame.Frame.TextBox
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
UpdateHue(m,az)
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
m.InputBegan:Connect(function(O)
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

UpdateHue(m,az)
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

return as end function a.T()





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
if ao then ao:Destroy()end
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

if an.Icon then an:SetIcon(an.Icon)end

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
ThemeTag={TextColor3="Text"},
FontFace=Font.new(aa.Font,au=="Title"and an.FontWeight or an.DescFontWeight),
Text=at,
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
Parent=aq,
})
end

ar=createTitle(an.Title,"Title")
if an.Desc then as=createTitle(an.Desc,"Desc")end

local function UpdateTitleSize()
local at=0
if ao then at=at-(an.IconSize+8)end
if ap.Visible then at=at-(an.IconSize+8)end
aq.Size=UDim2.new(1,at,0,0)
end







local at
if an.Box and an.BoxBorder then
at=aa.NewRoundFrame(am.Window.ElementConfig.UICorner+1,"SquircleOutline",{

Size=UDim2.new(1,2,1,2),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={ImageColor3="SectionBoxBorder"},
ImageTransparency=0.28,
Name="GlowBorder",
ZIndex=3,
})
end

local au=aa.NewRoundFrame(am.Window.ElementConfig.UICorner,"Squircle",{
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

ImageTransparency=an.Box and(not an.BoxBorder and 0.92 or 0.94)or 1,
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
PaddingTop=UDim.new(0,am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)),
PaddingLeft=UDim.new(0,am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)),
PaddingRight=UDim.new(0,am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)),
PaddingBottom=UDim.new(0,am.Window.ElementConfig.UIPadding+(am.Window.NewElements and 4 or 0)),
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
at,
})

an.ElementFrame=au

au.Outline.Top:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
au.Outline.Content.Position=UDim2.new(0,0,0,(au.Outline.Top.AbsoluteSize.Y/am.UIScale)+10)
if an.Opened then
an:Open(true)
else
an.Close(true)
end
end)

local av=am.ElementsModule
av.Load(
an,
au.Outline.Content,
av.Elements,
am.Window,
am.WindUI,
function()
if not an.Expandable then
an.Expandable=true
ap.Visible=true
UpdateTitleSize()
end
end,
av,
am.UIScale,
am.Tab
)

UpdateTitleSize()

function an.SetTitle(aw,ax)
an.Title=ax
ar.Text=ax
end

function an.SetDesc(aw,ax)
an.Desc=ax
if not as then as=createTitle(ax,"Desc")end
as.Text=ax
end

function an.Destroy(aw)
for ax,ay in next,an.Elements do
ay:Destroy()
end
au:Destroy()
end

function an.Open(aw,ax)
if an.Expandable then
an.Opened=true
local ay=au.Outline.Top.AbsoluteSize.Y/am.UIScale
+(au.Outline.Content.AbsoluteSize.Y/am.UIScale)
+10
if ax then
au.Size=UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,ay)
ap.ImageLabel.Rotation=180
else
ai(au,0.33,{
Size=UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,ay),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ai(ap.ImageLabel,0.2,{Rotation=180},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

if at then
ai(at,0.25,{ImageTransparency=0.35}):Play()
end
end
end

function an.Close(aw,ax)
if an.Expandable then
an.Opened=false
local ay=au.Outline.Top.AbsoluteSize.Y/am.UIScale
if ax then
au.Size=UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,ay)
ap.ImageLabel.Rotation=0
else
ai(au,0.26,{
Size=UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,ay),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ai(ap.ImageLabel,0.2,{Rotation=0},
Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

if at then
ai(at,0.25,{ImageTransparency=0.55}):Play()
end
end
end

aa.AddSignal(au.Outline.Top.MouseButton1Click,function()
if an.Expandable then
if an.Opened then an:Close()else an:Open()end
end
end)

aa.AddSignal(au.Outline.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if an.Opened then an:Open(true)else an:Close(true)end
end)

task.defer(function()
if an.Expandable then
au.Size=UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,au.Outline.Top.AbsoluteSize.Y/am.UIScale)
au.AutomaticSize="None"
au.Outline.Top.Size=UDim2.new(1,0,0,(not as and an.HeaderSize or 0))
au.Outline.Top.AutomaticSize=(not an.Expandable or as)and"Y"or"None"
au.Outline.Content.Visible=true
end
if an.Opened then an:Open()else an:Close(true)end
end)

return an.__type,an
end

return ak end function a.U()




local aa=a.load'd'
local af=aa.New

local ai={}

function ai.New(ak,al)
local am=al.Columns or 1
local an=al.ParentType=="Group"or al.ParentType=="HStack"


local ao=math.max(16,8*am)

local ap=af("Frame",{
Parent=al.Parent,
Size=an
and UDim2.new(0,ao,0,0)
or UDim2.new(1,-8,0,ao),
BackgroundTransparency=1,
})

return"Space",{__type="Space",ElementFrame=ap}
end

return ai end function a.V()

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

return ai end function a.W()
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

return ai end function a.X()
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

return ai end function a.Y()

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

return ai end function a.Z()
local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=aa(game:GetService"UserInputService")

local ai=a.load'd'
local ak=ai.New

local al={}

type ConfigType={
Object:Instance,
Camera:Instance?,
Interactive:boolean?,
Height:number?,
Focused:boolean,

Window:any,
WindUI:any,
Tab:any,
Parent:Instance
}

function al.New(am,an:ConfigType)
local ao={
__type="Viewport",
Object=an.Object,
Camera=an.Camera or Instance.new"Camera",
Interactive=an.Interactive or false,
Height=an.Height or 200,
Focused=an.Focused~=false,
}

local ap=false
local aq=false
local ar,as=0

local at=ai.NewRoundFrame(an.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,ao.Height),
Parent=an.Parent,
ThemeTag={
ImageColor3="ViewportBackground",
ImageTransparency="ViewportBackgroundTransparency",
},
},{
ak("CanvasGroup",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ak("UICorner",{
CornerRadius=UDim.new(0,an.Window.ElementConfig.UICorner),
}),
ak("ViewportFrame",{
Name="Viewport",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
CurrentCamera=ao.Camera,
Active=ao.Interactive,
},{
ao.Object,
}),
}),
})

local function IsTouchInsideViewport(au)
local ax=at.CanvasGroup.Viewport.AbsolutePosition
local ay=at.CanvasGroup.Viewport.AbsoluteSize

return au.X>=ax.X
and au.X<=ax.X+ay.X
and au.Y>=ax.Y
and au.Y<=ax.Y+ay.Y
end

local au=an.WindUI.GenerateGUID()

ai.AddSignal(at.CanvasGroup.Viewport.MouseEnter,function()
if ao.Interactive then
an.Tab.UIElements.ContainerFrame.ScrollingEnabled=false
end
end)

ai.AddSignal(at.CanvasGroup.Viewport.InputEnded,function(ax)
if
ax.UserInputType==Enum.UserInputType.MouseMovement
or ax.UserInputType==Enum.UserInputType.Touch
then
an.Tab.UIElements.ContainerFrame.ScrollingEnabled=true
end
end)

ai.AddSignal(at.CanvasGroup.Viewport.InputBegan,function(ax)
if ao.Interactive then
if
(ax.UserInputType==Enum.UserInputType.MouseButton1)
or(ax.UserInputType==Enum.UserInputType.Touch and not aq)
then
if an.WindUI.CurrentInput and an.WindUI.CurrentInput~=au then
return
end

an.WindUI.CurrentInput=au

ap=true
as=ax.Position
end
end
end)

ai.AddSignal(af.InputEnded,function(ax)
if ao.Interactive then
if
ax.UserInputType==Enum.UserInputType.MouseButton1
or ax.UserInputType==Enum.UserInputType.Touch
then
if an.WindUI.CurrentInput and an.WindUI.CurrentInput~=au then
return
end

an.WindUI.CurrentInput=nil

ap=false
end
end
end)

ai.AddSignal(af.InputChanged,function(ax)
if ao.Interactive and ap and not aq then
if
ax.UserInputType==Enum.UserInputType.MouseMovement
or ax.UserInputType==Enum.UserInputType.Touch
then
local ay=ax.Position-as
as=ax.Position

local az=ao.Object:GetPivot().Position
local aA=ao.Camera

local aB=CFrame.fromAxisAngle(Vector3.new(0,1,0),-ay.X*0.02)
aA.CFrame=CFrame.new(az)*aB*CFrame.new(-az)*aA.CFrame

local aC=CFrame.fromAxisAngle(aA.CFrame.RightVector,-ay.Y*0.02)
local aD=CFrame.new(az)*aC*CFrame.new(-az)*aA.CFrame

if aD.UpVector.Y>0.1 then
aA.CFrame=aD
end
end
end
end)

ai.AddSignal(at.CanvasGroup.Viewport.InputChanged,function(ax)
if ao.Interactive then
if ax.UserInputType==Enum.UserInputType.MouseWheel then
local ay=ax.Position.Z*2
ao.Camera.CFrame+=ao.Camera.CFrame.LookVector*ay
end
end
end)

ai.AddSignal(af.TouchPinch,function(ax,ay,az,aA)
if not IsTouchInsideViewport(ax[1])or not IsTouchInsideViewport(ax[2])then
return
end
if ao.Interactive then
if aA==Enum.UserInputState.Begin then
aq=true
ap=false
ar=(ax[1]-ax[2]).Magnitude
elseif aA==Enum.UserInputState.Change then
if aq then
local aB=(ax[1]-ax[2]).Magnitude
local aC=(aB-ar)*0.03
ar=aB
ao.Camera.CFrame+=ao.Camera.CFrame.LookVector*aC
end
elseif aA==Enum.UserInputState.End or aA==Enum.UserInputState.Cancel then
aq=false
end
end
end)

local function FocusCamera()
local ax=ao.Object:IsA"BasePart"and ao.Object.Size
or select(2,ao.Object:GetBoundingBox(0))
local ay=math.max(ax.X,ax.Y,ax.Z)
local az=ay*2
local aA=ao.Object:GetPivot().Position

ao.Camera.CFrame=
CFrame.new(aA+Vector3.new(0,ay/2,az),aA)
end

if ao.Focused then
FocusCamera()
end

function ao.SetObject(ax,ay,az)
if az then
ay=ay:Clone()
end
if ao.Object then
ao.Object:Destroy()
end

ao.Object=ay
ao.Object.Parent=at.CanvasGroup.Viewport
end

function ao.SetHeight(ax,ay)
at.Size=UDim2.new(1,0,0,ay)
end

function ao.Focus(ax)
if ao.Object then
FocusCamera()
end
end

function ao.SetCamera(ax,ay)
ao.Camera=ay
at.CanvasGroup.Viewport.CurrentCamera=ay
end

function ao.SetInteractive(ax,ay)
ao.Interactive=ay
at.CanvasGroup.Viewport.Active=ay
end

ao.Main=at

return ao.__type,ao
end

return al end function a._()

return{
Elements={
Paragraph=a.load'D',
Button=a.load'E',
Toggle=a.load'H',
Slider=a.load'I',
ProgressBar=a.load'J',
Keybind=a.load'K',
Input=a.load'L',
Dropdown=a.load'O',
Code=a.load'R',
Colorpicker=a.load'S',
Section=a.load'T',
Divider=a.load'M',
Space=a.load'U',
Image=a.load'V',
Group=a.load'W',
HStack=a.load'X',
VStack=a.load'Y',
Viewport=a.load'Z',

},
Load=function(aa,af,ai,ak,al,am,an,ao,ap)
for aq,ar in next,ai do
aa[aq]=function(as,at)
at=at or{}
at.Tab=ap or aa
at.ParentType=aa.__type
at.ParentTable=aa
at.Index=#aa.Elements+1
at.GlobalIndex=#ak.AllElements+1
at.Parent=af
at.Window=ak
at.WindUI=al
at.UIScale=ao
at.ElementsModule=an local

au, ax=ar:New(at)

if at.Flag and typeof(at.Flag)=="string"then
if ak.CurrentConfig then
ak.CurrentConfig:Register(at.Flag,ax)

if ak.PendingConfigData and ak.PendingConfigData[at.Flag]then
local ay=ak.PendingConfigData[at.Flag]

local az=ak.ConfigManager
if az.Parser[ay.__type]then
task.defer(function()
local aA,aB=pcall(function()
az.Parser[ay.__type].Load(ax,ay)
end)

if aA then
ak.PendingConfigData[at.Flag]=nil
else
warn(
"[ WindUI ] Failed to apply pending config for '"
..at.Flag
.."': "
..tostring(aB)
)
end
end)
end
end
else
ak.PendingFlags=ak.PendingFlags or{}
ak.PendingFlags[at.Flag]=ax
end
end

local ay
for az,aA in next,ax do
if typeof(aA)=="table"and az~="ElementFrame"and az:match"Frame$"then
ay=aA
break
end
end

if ay then
ax.ElementFrame=ay.UIElements.Main
function ax.SetTitle(aB,aC)
return ay.SetTitle and ay:SetTitle(aC)
end
function ax.SetDesc(aB,aC)
return ay.SetDesc and ay:SetDesc(aC)
end
function ax.SetImage(aB,aC,aD)
return ay.SetImage and ay:SetImage(aC,aD)
end
function ax.SetThumbnail(aB,aC,aD)
return ay.SetThumbnail and ay:SetThumbnail(aC,aD)
end
function ax.Highlight(aB)
ay:Highlight()
end
function ax.Destroy(aB)
ay:Destroy()

table.remove(ak.AllElements,at.GlobalIndex)
table.remove(aa.Elements,at.Index)
table.remove(ap.Elements,at.Index)
aa:UpdateAllElementShapes(aa)
end
end

ak.AllElements[at.Index]=ax
aa.Elements[at.Index]=ax
if ap then
ap.Elements[at.Index]=ax
end

if ak.NewElements then
aa:UpdateAllElementShapes(aa)
end

if am then
am(ax,aa.Elements)
end
return ax
end
end
function aa.UpdateAllElementShapes(as,at)
for au,ax in next,at.Elements do
local ay
for az,aA in pairs(ax)do
if typeof(aA)=="table"and az:match"Frame$"then
ay=aA
break
end
end

if not ay and ax.UpdateShape then
ay=ax
end

if ay then

ay.Index=au
if ay.UpdateShape then

ay.UpdateShape(at)
end
end
end
end
end,
}end function a.aa()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=game:GetService"Players"

aa(game:GetService"UserInputService")
local ai=af.LocalPlayer:GetMouse()

local ak=a.load'd'
local al=ak.New

local am=a.load'B'.New
local an=a.load'x'.New



local ao={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ao)end,
}

function ao.Init(ap,aq,ar,as)
Window=ap
WindUI=aq
ao.ToolTipParent=ar
ao.TabHighlight=as
return ao
end

function ao.New(ap,aq)
local ar={
__type="Tab",
Title=ap.Title or"Tab",
Desc=ap.Desc,
Icon=ap.Icon,
IconColor=ap.IconColor,
IconShape=ap.IconShape,
IconThemed=ap.IconThemed,
Locked=ap.Locked,
ShowTabTitle=ap.ShowTabTitle,
TabTitleAlign=ap.TabTitleAlign or"Left",
CustomEmptyPage=(ap.CustomEmptyPage and next(ap.CustomEmptyPage)~=nil)and ap.CustomEmptyPage
or{Icon="lucide:frown",IconSize=48,Title="This tab is Empty",Desc=nil},
Border=ap.Border,
Selected=false,
Index=nil,
Parent=ap.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),

Gap=Window.NewElements and 1 or 6,

TabPaddingX=4+(Window.UIPadding/2),
TabPaddingY=3+(Window.UIPadding/2),
TitlePaddingY=0,
}









if ar.IconShape then
ar.TabPaddingX=2+(Window.UIPadding/4)
ar.TabPaddingY=2+(Window.UIPadding/4)
ar.TitlePaddingY=2+(Window.UIPadding/4)
end

ao.TabCount=ao.TabCount+1

local as=ao.TabCount
ar.Index=as

ar.UIElements.Main=ak.NewRoundFrame(ar.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=ap.Parent,
ThemeTag={
ImageColor3="TabBackground",
},
ImageTransparency=1,
},{
ak.NewRoundFrame(ar.UICorner-1,"Glass-1.4",{
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
ak.NewRoundFrame(ar.UICorner,"Squircle",{
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
Text=ar.Title,
ThemeTag={
TextColor3="TabTitle",
},
TextTransparency=not ar.Locked and 0.4 or 0.7,
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
PaddingTop=UDim.new(0,ar.TitlePaddingY),


PaddingBottom=UDim.new(0,ar.TitlePaddingY),
}),
}),
al("UIPadding",{
PaddingTop=UDim.new(0,ar.TabPaddingY),
PaddingLeft=UDim.new(0,ar.TabPaddingX),
PaddingRight=UDim.new(0,ar.TabPaddingX),
PaddingBottom=UDim.new(0,ar.TabPaddingY),
}),
}),
},true)

local at=0
local au
local ax

if ar.Icon then
au=ak.Image(
ar.Icon,
ar.Icon..":"..ar.Title,
0,
Window.Folder,
ar.__type,
ar.IconColor and false or true,
ar.IconThemed,
"TabIcon"
)
au.Size=UDim2.new(0,16,0,16)
if ar.IconColor then
au.ImageLabel.ImageColor3=ar.IconColor
end
if not ar.IconShape then
au.Parent=ar.UIElements.Main.Frame
ar.UIElements.Icon=au
au.ImageLabel.ImageTransparency=not ar.Locked and 0 or 0.7
at=-18-(Window.UIPadding/2)
ar.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,at,0,0)
elseif ar.IconColor then
ak.NewRoundFrame(
ar.IconShape~="Circle"and(ar.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Squircle",
{
Size=UDim2.new(0,26,0,26),
ImageColor3=ar.IconColor,
Parent=ar.UIElements.Main.Frame,
},
{
au,
ak.NewRoundFrame(
ar.IconShape~="Circle"and(ar.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
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
au.AnchorPoint=Vector2.new(0.5,0.5)
au.Position=UDim2.new(0.5,0,0.5,0)
au.ImageLabel.ImageTransparency=0
au.ImageLabel.ImageColor3=ak.GetTextColorForHSB(ar.IconColor,0.68)
at=-28-(Window.UIPadding/2)
ar.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,at,0,0)
end

ax=
ak.Image(ar.Icon,ar.Icon..":"..ar.Title,0,Window.Folder,ar.__type,true,ar.IconThemed)
ax.Size=UDim2.new(0,16,0,16)
ax.ImageLabel.ImageTransparency=not ar.Locked and 0 or 0.7
at=-30




end

ar.UIElements.ContainerFrame=al("ScrollingFrame",{
Size=UDim2.new(1,0,1,ar.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
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
Padding=UDim.new(0,ar.Gap),
HorizontalAlignment="Center",
}),
})





ar.UIElements.ContainerFrameCanvas=al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
ar.UIElements.ContainerFrame,
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
Visible=ar.ShowTabTitle or false,
Name="TabTitle",
},{
ax,
al("TextLabel",{
Text=ar.Title,
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
HorizontalAlignment=ar.TabTitleAlign,
}),
}),
al("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=ar.ShowTabTitle or false,
}),
})

ao.Containers[as]=ar.UIElements.ContainerFrameCanvas
ao.Tabs[as]=ar

ar.ContainerFrame=ar.UIElements.ContainerFrameCanvas

ak.AddSignal(ar.UIElements.Main.MouseButton1Click,function()
if not ar.Locked then
ao:SelectTab(as)
end
end)

if Window.ScrollBarEnabled then
an(
ar.UIElements.ContainerFrame,
ar.UIElements.ContainerFrameCanvas.ScrollSliderHolder,
Window,
4,
WindUI
)
end

local ay
local az
local aA
local aB=false


if ar.Desc then
ak.AddSignal(ar.UIElements.Main.InputBegan,function()
aB=true
az=task.spawn(function()
task.wait(0.35)
if aB and not ay then
ay=am(ar.Desc,ao.ToolTipParent,true)
ay.Container.AnchorPoint=Vector2.new(0.5,0.5)

local function updatePosition()
if ay then
ay.Container.Position=UDim2.new(0,ai.X,0,ai.Y-4)
end
end

updatePosition()
aA=ai.Move:Connect(updatePosition)
ay:Open()
end
end)
end)
end

ak.AddSignal(ar.UIElements.Main.MouseEnter,function()
if not ar.Locked then
ak.SetThemeTag(ar.UIElements.Main.Frame,{
ImageTransparency="TabBackgroundHoverTransparency",
ImageColor3="TabBackgroundHover",
},0.1)
end
end)
ak.AddSignal(ar.UIElements.Main.InputEnded,function()
if ar.Desc then
aB=false
if az then
task.cancel(az)
az=nil
end
if aA then
aA:Disconnect()
aA=nil
end
if ay then
ay:Close()
ay=nil
end
end

if not ar.Locked then
ak.SetThemeTag(ar.UIElements.Main.Frame,{
ImageTransparency="TabBorderTransparency",
},0.1)
end
end)

function ar.ScrollToTheElement(aC,aD)
ar.UIElements.ContainerFrame.ScrollingEnabled=false

ak.Tween(ar.UIElements.ContainerFrame,0.45,{
CanvasPosition=Vector2.new(
0,
ar.Elements[aD].ElementFrame.AbsolutePosition.Y
-ar.UIElements.ContainerFrame.AbsolutePosition.Y
-ar.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.48)

if ar.Elements[aD].Highlight then
ar.Elements[aD]:Highlight()
end
ar.UIElements.ContainerFrame.ScrollingEnabled=true
end)

return ar
end



local aC=a.load'_'

aC.Load(
ar,
ar.UIElements.ContainerFrame,
aC.Elements,
Window,
WindUI,
nil,
aC,
aq,
ar
)

function ar.LockAll(aD)

for aE,aF in next,Window.AllElements do
if aF.Tab and aF.Tab.Index and aF.Tab.Index==ar.Index and aF.Lock then
aF:Lock()
end
end
end
function ar.UnlockAll(aD)
for aE,aF in next,Window.AllElements do
if aF.Tab and aF.Tab.Index and aF.Tab.Index==ar.Index and aF.Unlock then
aF:Unlock()
end
end
end
function ar.GetLocked(aD)
local aE={}

for aF,aG in next,Window.AllElements do
if aG.Tab and aG.Tab.Index and aG.Tab.Index==ar.Index and aG.Locked==true then
table.insert(aE,aG)
end
end

return aE
end
function ar.GetUnlocked(aD)
local aE={}

for aF,aG in next,Window.AllElements do
if aG.Tab and aG.Tab.Index and aG.Tab.Index==ar.Index and aG.Locked==false then
table.insert(aE,aG)
end
end

return aE
end

function ar.Select(aD)
return ao:SelectTab(ar.Index)
end

task.spawn(function()
local aD
if ar.CustomEmptyPage.Icon then
aD=
ak.Image(ar.CustomEmptyPage.Icon,ar.CustomEmptyPage.Icon,0,"Temp","EmptyPage",true)
aD.Size=
UDim2.fromOffset(ar.CustomEmptyPage.IconSize or 48,ar.CustomEmptyPage.IconSize or 48)
end

local aE=al("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=ar.UIElements.ContainerFrame,
},{
al("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),











aD,
ar.CustomEmptyPage.Title and al("TextLabel",{
AutomaticSize="XY",
Text=ar.CustomEmptyPage.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
TextTransparency=0.5,
BackgroundTransparency=1,
FontFace=Font.new(ak.Font,Enum.FontWeight.Medium),
})or nil,
ar.CustomEmptyPage.Desc and al("TextLabel",{
AutomaticSize="XY",
Text=ar.CustomEmptyPage.Desc,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.65,
BackgroundTransparency=1,
FontFace=Font.new(ak.Font,Enum.FontWeight.Regular),
})or nil,
})





local aF
aF=ak.AddSignal(ar.UIElements.ContainerFrame.ChildAdded,function()
aE.Visible=false
aF:Disconnect()
end)
end)

return ar
end

function ao.OnChange(ap,aq)
ao.OnChangeFunc=aq
end

function ao.SelectTab(ap,aq)
if not ao.Tabs[aq].Locked then
ao.SelectedTab=aq

for ar,as in next,ao.Tabs do
if not as.Locked then
ak.SetThemeTag(as.UIElements.Main,{
ImageTransparency="TabBorderTransparency",
},0.15)
if as.Border then
ak.SetThemeTag(as.UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparency",
},0.15)
end
ak.SetThemeTag(as.UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparency",
},0.15)
if as.UIElements.Icon and not as.IconColor then
ak.SetThemeTag(as.UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparency",
},0.15)
end
as.Selected=false
end
end
ak.SetThemeTag(ao.Tabs[aq].UIElements.Main,{
ImageColor3="TabBackgroundActive",
ImageTransparency="TabBackgroundActiveTransparency",
},0.15)
if ao.Tabs[aq].Border then
ak.SetThemeTag(ao.Tabs[aq].UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparencyActive",
},0.15)
end
ak.SetThemeTag(ao.Tabs[aq].UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparencyActive",
},0.15)
if ao.Tabs[aq].UIElements.Icon and not ao.Tabs[aq].IconColor then
ak.SetThemeTag(ao.Tabs[aq].UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparencyActive",
},0.15)
end
ao.Tabs[aq].Selected=true

task.spawn(function()
for at,au in next,ao.Containers do
au.Visible=false
end

local ax=ao.Containers[aq]
ax.AnchorPoint=Vector2.new(0,0.04)
ax.Visible=true
game:GetService"TweenService":Create(
ax,
TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
{AnchorPoint=Vector2.new(0,0)}
):Play()
end)

ao.OnChangeFunc(aq)
end
end

return ao end function a.ab()

local aa={}


local af=a.load'd'
local ai=af.New
local ak=af.Tween

local al=a.load'aa'

function aa.New(am,an,ao,ap,aq)
local ar={
Title=am.Title or"Section",
Icon=am.Icon,
IconThemed=am.IconThemed,
Opened=am.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local as
if ar.Icon then
as=af.Image(
ar.Icon,
ar.Icon,
0,
ao,
"Section",
true,
ar.IconThemed,
"TabSectionIcon"
)

as.Size=UDim2.new(0,ar.IconSize,0,ar.IconSize)
as.ImageLabel.ImageTransparency=.25
end

local at=ai("Frame",{
Size=UDim2.new(0,ar.IconSize,0,ar.IconSize),
BackgroundTransparency=1,
Visible=false
},{
ai("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=af.Icon"chevron-down"[1],
ImageRectSize=af.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=af.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local au=ai("Frame",{
Size=UDim2.new(1,0,0,ar.HeaderSize),
BackgroundTransparency=1,
Parent=an,
ClipsDescendants=true,
},{
ai("TextButton",{
Size=UDim2.new(1,0,0,ar.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
as,
ai("TextLabel",{
Text=ar.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
as and(-ar.IconSize-10)*2
or(-ar.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(af.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
ai("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
at,
ai("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
ai("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,ar.HeaderSize)
},{
ai("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,aq.Gap),
VerticalAlignment="Bottom",
}),
})
})


function ar.Tab(ax,ay)
if not ar.Expandable then
ar.Expandable=true
at.Visible=true
end
ay.Parent=au.Content
return al.New(ay,ap)
end

function ar.Open(ax)
if ar.Expandable then
ar.Opened=true
ak(au,0.33,{
Size=UDim2.new(1,0,0,ar.HeaderSize+(au.Content.AbsoluteSize.Y/ap))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ak(at.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function ar.Close(ax)
if ar.Expandable then
ar.Opened=false
ak(au,0.26,{
Size=UDim2.new(1,0,0,ar.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ak(at.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

af.AddSignal(au.TextButton.MouseButton1Click,function()
if ar.Expandable then
if ar.Opened then
ar:Close()
else
ar:Open()
end
end
end)

af.AddSignal(au.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if ar.Opened then
ar:Open()
end
end)

if ar.Opened then
task.spawn(function()
task.wait()
ar:Open()
end)
end



return ar
end


return aa end function a.ac()
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
}end function a.ad()
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
local ap={
IconSize=18,
Padding=14,
Radius=22,
Width=400,
MaxHeight=380,

Icons=a.load'ac',
}

local aq=ak("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(1,-((ap.IconSize*2)+(ap.Padding*2)),0,0),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ai.Font,Enum.FontWeight.Regular),
TextSize=18,
})

local ar=ak("ImageLabel",{
Image=ai.Icon"x"[1],
ImageRectSize=ai.Icon"x"[2].ImageRectSize,
ImageRectOffset=ai.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
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

local as=ak("ScrollingFrame",{
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
PaddingTop=UDim.new(0,ap.Padding),
PaddingLeft=UDim.new(0,ap.Padding),
PaddingRight=UDim.new(0,ap.Padding),
PaddingBottom=UDim.new(0,ap.Padding),
}),
})

local at=ai.NewRoundFrame(ap.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="WindowSearchBarBackground",
},
ImageTransparency=0,
},{
ai.NewRoundFrame(ap.Radius,"Squircle",{
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
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
}),
aq,
ar,
ak("UIListLayout",{
Padding=UDim.new(0,ap.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ak("UIPadding",{
PaddingLeft=UDim.new(0,ap.Padding),
PaddingRight=UDim.new(0,ap.Padding),
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
as,
ak("UISizeConstraint",{
MaxSize=Vector2.new(ap.Width,ap.MaxHeight),
}),
}),
ak("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
})

local au=ak("Frame",{
Size=UDim2.new(0,ap.Width,0,0),
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
at,















})

local function CreateSearchTab(ax,ay,az,aA,aB,aC)
local aD=ak("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=aA or nil,
},{
ai.NewRoundFrame(ap.Radius-11,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main",
},{
ai.NewRoundFrame(ap.Radius-11,"Glass-1",{
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
PaddingTop=UDim.new(0,ap.Padding-2),
PaddingLeft=UDim.new(0,ap.Padding),
PaddingRight=UDim.new(0,ap.Padding),
PaddingBottom=UDim.new(0,ap.Padding-2),
}),
ak("ImageLabel",{
Image=ai.Icon(az)[1],
ImageRectSize=ai.Icon(az)[2].ImageRectSize,
ImageRectOffset=ai.Icon(az)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,ap.IconSize,0,ap.IconSize),
}),
ak("Frame",{
Size=UDim2.new(1,-ap.IconSize-ap.Padding,0,0),
BackgroundTransparency=1,
},{
ak("TextLabel",{
Text=ax,
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
Text=ay or"",
Visible=ay and true or false,
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
Padding=UDim.new(0,ap.Padding),
FillDirection="Horizontal",
}),
}),
},true),
ak("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-ap.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=aB,

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
Size=UDim2.new(1,-ap.Padding-2,0,0),
Position=UDim2.new(0,ap.Padding+2,0,0),
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



aD.Main.Size=UDim2.new(
1,
0,
0,
aD.Main.Outline.Frame.Desc.Visible
and(((ap.Padding-2)*2)+aD.Main.Outline.Frame.Title.TextBounds.Y+6+aD.Main.Outline.Frame.Desc.TextBounds.Y)
or(((ap.Padding-2)*2)+aD.Main.Outline.Frame.Title.TextBounds.Y)
)

ai.AddSignal(aD.Main.MouseEnter,function()
al(aD.Main,0.04,{ImageTransparency=0.95}):Play()

end)
ai.AddSignal(aD.Main.InputEnded,function()
al(aD.Main,0.08,{ImageTransparency=1}):Play()

end)
ai.AddSignal(aD.Main.MouseButton1Click,function()
if aC then
aC()
end
end)

return aD
end

local function ContainsText(ax,ay)
if not ay or ay==""then
return false
end

if not ax or ax==""then
return false
end

local az=string.lower(ax)
local aA=string.lower(ay)

return string.find(az,aA,1,true)~=nil
end

local function Search(ax)
if not ax or ax==""then
return{}
end

local ay={}
for az,aA in next,am.Tabs do
local aB=ContainsText(aA.Title or"",ax)
local aC={}

for aD,aE in next,aA.Elements do
if aE.__type~="Section"then
local aF=ContainsText(aE.Title or"",ax)
local aG=ContainsText(aE.Desc or"",ax)

if aF or aG then
aC[aD]={
Title=aE.Title,
Desc=aE.Desc,
Original=aE,
__type=aE.__type,
Index=aD,
}
end
end
end

if aB or next(aC)~=nil then
ay[az]={
Tab=aA,
Title=aA.Title,
Icon=aA.Icon,
Elements=aC,
}
end
end
return ay
end

ai.AddSignal(as.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

al(as,0.06,{
Size=UDim2.new(
1,
0,
0,
math.clamp(
as.UIListLayout.AbsoluteContentSize.Y+(ap.Padding*2),
0,
ap.MaxHeight
)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function ap.Open(ax)
task.spawn(function()
at.Frame.Visible=true
au.Visible=true
al(au.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function ap.Close(ax,ay)
task.spawn(function()
ao()
at.Frame.Visible=false
al(au.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(0.12)
au.Visible=false
if ay then
au:Destroy()
end
end)
end

ai.AddSignal(ar.TextButton.MouseButton1Click,function()
ap:Close(true)
end)

ap:Open()

function ap.Search(ax,ay)
ay=ay or""

local az=Search(ay)

as.Visible=true
at.Frame.Results.Frame.Visible=true
for aA,aB in next,as:GetChildren()do
if aB.ClassName~="UIListLayout"and aB.ClassName~="UIPadding"then
aB:Destroy()
end
end

if az and next(az)~=nil then
for aC,aD in next,az do
local aE=ap.Icons.Tab
local aF=CreateSearchTab(aD.Title,nil,aE,as,true,function()
ap:Close()
am:SelectTab(aC)
end)
if aD.Elements and next(aD.Elements)~=nil then
for aG,aH in next,aD.Elements do
local b=ap.Icons[aH.__type]
CreateSearchTab(
aH.Title,
aH.Desc,
b,
aF:FindFirstChild"ParentContainer"and aF.ParentContainer.Frame
or nil,
false,
function()
ap:Close()
am:SelectTab(aC)
if aD.Tab.ScrollToTheElement then

aD.Tab:ScrollToTheElement(aH.Index)
end

end
)

end
end
end
elseif ay~=""then
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
Parent=as,
Name="NotFound",
})
else
as.Visible=false
at.Frame.Results.Frame.Visible=false
end
end

ai.AddSignal(aq:GetPropertyChangedSignal"Text",function()
ap:Search(aq.Text)
end)

return ap
end

return af end function a.ae()



local aa=(cloneref or clonereference or function(aa)
return aa
end)

local af=aa(game:GetService"UserInputService")
local ai=aa(game:GetService"RunService")
local ak=aa(game:GetService"Players")

local al=workspace.CurrentCamera

local am=a.load't'

local an=a.load'd'
local ao=an.New
local ap=an.Tween


local aq=a.load'w'.New
local ar=a.load'm'.New
local as=a.load'x'.New
local at=a.load'y'

local au=a.load'z'



return function(ax)
local ay={
Title=ax.Title or"UI Library",
Author=ax.Author,
Icon=ax.Icon,
IconSize=ax.IconSize or 22,
IconThemed=ax.IconThemed,
IconRadius=ax.IconRadius or 0,
Folder=ax.Folder,
Resizable=ax.Resizable~=false,
Background=ax.Background,
BackgroundImageTransparency=ax.BackgroundImageTransparency or 0,
ShadowTransparency=ax.ShadowTransparency or 0.6,
User=ax.User or{},
Footer=ax.Footer or{},
Topbar=ax.Topbar or{Height=52,ButtonsType="Default"},

Size=ax.Size,

MinSize=ax.MinSize or Vector2.new(560,350),
MaxSize=ax.MaxSize or Vector2.new(850,560),

TopBarButtonIconSize=ax.TopBarButtonIconSize,

ToggleKey=ax.ToggleKey,
ElementsRadius=ax.ElementsRadius,
Radius=ax.Radius or 16,
Transparent=ax.Transparent or false,
HideSearchBar=ax.HideSearchBar~=false,
ScrollBarEnabled=ax.ScrollBarEnabled or false,
SideBarWidth=ax.SideBarWidth or 200,
Acrylic=ax.Acrylic or false,
NewElements=ax.NewElements or false,
IgnoreAlerts=ax.IgnoreAlerts or false,
HidePanelBackground=ax.HidePanelBackground or false,
AutoScale=ax.AutoScale~=false,
OpenButton=ax.OpenButton,
DragFrameSize=160,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=ax.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=ax.Resizable~=false,
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

ay.UICorner=ay.Radius

ay.TopBarButtonIconSize=ay.TopBarButtonIconSize or(ay.Topbar.ButtonsType=="Mac"and 11 or 16)

ay.ElementConfig={
UIPadding=(ay.NewElements and 10 or 13),
UICorner=ay.ElementsRadius or(ay.NewElements and 23 or 16),
}

local az=ay.Size or UDim2.new(0,580,0,460)
ay.Size=UDim2.new(
az.X.Scale,
math.clamp(az.X.Offset,ay.MinSize.X,ay.MaxSize.X),
az.Y.Scale,
math.clamp(az.Y.Offset,ay.MinSize.Y,ay.MaxSize.Y)
)

if ay.Topbar=={}then
ay.Topbar={Height=52,ButtonsType="Default"}
end

if not ai:IsStudio()and ay.Folder and writefile then
if not isfolder("WindUI/"..ay.Folder)then
makefolder("WindUI/"..ay.Folder)
end
if not isfolder("WindUI/"..ay.Folder.."/assets")then
makefolder("WindUI/"..ay.Folder.."/assets")
end
if not isfolder(ay.Folder)then
makefolder(ay.Folder)
end
if not isfolder(ay.Folder.."/assets")then
makefolder(ay.Folder.."/assets")
end
end

local aA=ao("UICorner",{
CornerRadius=UDim.new(0,ay.UICorner),
})

if ay.Folder then
ay.ConfigManager=au:Init(ay)
end

if ay.Acrylic then local
aB, aC=am.AcrylicPaint{UseAcrylic=ay.Acrylic}

ay.AcrylicPaint=aB
end

local aB=ao("Frame",{
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
local aC=an.NewRoundFrame(ay.UICorner,"Squircle",{
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

local aD=an.NewRoundFrame(ay.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})









ay.UIElements.SideBar=ao("ScrollingFrame",{
Size=UDim2.new(
1,
ay.ScrollBarEnabled and-3-(ay.UIPadding/2)or 0,
1,
not ay.HideSearchBar and-45 or 0
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



PaddingBottom=UDim.new(0,ay.UIPadding/2),
}),
ao("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,ay.Gap),
}),
}),
ao("UIPadding",{

PaddingLeft=UDim.new(0,ay.UIPadding/2),
PaddingRight=UDim.new(0,ay.UIPadding/2),
PaddingBottom=UDim.new(0,ay.UIPadding/2),
}),

})

ay.UIElements.SideBarContainer=ao("Frame",{
Size=UDim2.new(
0,
ay.SideBarWidth,
1,
ay.User.Enabled and-ay.Topbar.Height-42-(ay.UIPadding*2)or-ay.Topbar.Height
),
Position=UDim2.new(0,0,0,ay.Topbar.Height),
BackgroundTransparency=1,
Visible=true,
},{
ao("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,not ay.HideSearchBar and-45-ay.UIPadding or-ay.UIPadding/2),
Position=UDim2.new(0,0,1,-ay.UIPadding/2),
AnchorPoint=Vector2.new(0,1),
}),
ay.UIElements.SideBar,
})

if ay.ScrollBarEnabled then
as(
ay.UIElements.SideBar,
ay.UIElements.SideBarContainer.Content,
ay,
3,
ax.WindUI
)
end

ay.UIElements.MainBar=ao("Frame",{
Size=UDim2.new(1,-ay.UIElements.SideBarContainer.AbsoluteSize.X,1,-ay.Topbar.Height),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
an.NewRoundFrame(ay.UICorner-(ay.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="PanelBackground",
ImageTransparency="PanelBackgroundTransparency",
},


ZIndex=3,
Name="Background",
Visible=not ay.HidePanelBackground,
}),
ao("UIPadding",{

PaddingLeft=UDim.new(0,ay.UIPadding/2),
PaddingRight=UDim.new(0,ay.UIPadding/2),
PaddingBottom=UDim.new(0,ay.UIPadding/2),
}),
})

local aE=ao("ImageLabel",{
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
ay.IsPC=false
elseif af.KeyboardEnabled then
ay.IsPC=true
else
ay.IsPC=nil
end







local aF
if ay.User then
local function GetUserThumb()local
aG, aH=ak:GetUserThumbnailAsync(
ay.User.Anonymous and 1 or ak.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return aG
end

aF=ao("TextButton",{
Size=UDim2.new(
0,
ay.UIElements.SideBarContainer.AbsoluteSize.X-(ay.UIPadding/2),
0,
42+ay.UIPadding
),
Position=UDim2.new(0,ay.UIPadding/2,1,-(ay.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=ay.User.Enabled or false,
},{
an.NewRoundFrame(ay.UICorner-(ay.UIPadding/2),"SquircleOutline",{
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
an.NewRoundFrame(ay.UICorner-(ay.UIPadding/2),"Squircle",{
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
Text=ay.User.Anonymous and"Anonymous"or ak.LocalPlayer.DisplayName,
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
Text=ay.User.Anonymous and"anonymous"or ak.LocalPlayer.Name,
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
Padding=UDim.new(0,ay.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ao("UIPadding",{
PaddingLeft=UDim.new(0,ay.UIPadding/2),
PaddingRight=UDim.new(0,ay.UIPadding/2),
}),
}),
})

function ay.User.Enable(aG)
ay.User.Enabled=true
ap(
ay.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,ay.SideBarWidth,1,-ay.Topbar.Height-42-(ay.UIPadding*2))},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aF.Visible=true
end
function ay.User.Disable(aG)
ay.User.Enabled=false
ap(
ay.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,ay.SideBarWidth,1,-ay.Topbar.Height)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aF.Visible=false
end
function ay.User.SetAnonymous(aG,aH)
if aH~=false then
aH=true
end
ay.User.Anonymous=aH
aF.UserIcon.ImageLabel.Image=GetUserThumb()
aF.UserIcon.Frame.DisplayName.Text=aH and"Anonymous"or ak.LocalPlayer.DisplayName
aF.UserIcon.Frame.UserName.Text=aH and"anonymous"or ak.LocalPlayer.Name
end

if ay.User.Enabled then
ay.User:Enable()
else
ay.User:Disable()
end

if ay.User.Callback then
an.AddSignal(aF.MouseButton1Click,function()
ay.User.Callback()
end)
an.AddSignal(aF.MouseEnter,function()
ap(aF.UserIcon,0.04,{ImageTransparency=0.95}):Play()
ap(aF.Outline,0.04,{ImageTransparency=0.85}):Play()
end)
an.AddSignal(aF.InputEnded,function()
ap(aF.UserIcon,0.04,{ImageTransparency=1}):Play()
ap(aF.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local aG
local aH

local b=false
local d

local f=typeof(ay.Background)=="string"and string.match(ay.Background,"^video:(.+)")or nil

local g=typeof(ay.Background)=="string"
and not f
and string.match(ay.Background,"^https?://.+")
or nil

local h=typeof(ay.Background)=="string"
and not f
and string.match(ay.Background,"^rbxassetid://%d+")
or nil

local function GetImageExtension(i)
if not i or typeof(i)~="string"then
return".png"
end
local m=i:match"^([^?#]+)"or i
local p=m:match"%.(%w+)$"
if p then
p=p:lower()
if p=="jpg"or p=="jpeg"or p=="png"or p=="webp"then
return"."..p
end
end
return".png"
end



if typeof(ay.Background)=="string"and f then
b=true

if string.find(f,"http")then
local i=(ay.Folder or"Temp").."/assets/."..an.SanitizeFilename(f)..".webm"
if not isfile(i)then
local m,p=pcall(function()





local m=game.HttpGet and game:HttpGet(f)
or an.Request{
Url=f,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(i,m)
end)
if not m then
warn("[ WindUI.Window.Background ] Failed to download video: "..tostring(p))
end
end

local m,p=pcall(function()
return getcustomasset(i)
end)
if not m then
warn("[ WindUI.Window.Background ] Failed to load custom asset: "..tostring(p))
end
warn"[ WindUI.Window.Background ] VideoFrame may not work with custom video"
f=p
end

d=ao("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=f,
Looped=true,
Volume=0,
},{
ao("UICorner",{
CornerRadius=UDim.new(0,ay.UICorner),
}),
})
d:Play()
elseif g then
local i=(ay.Folder or"Temp")
.."/assets/."
..an.SanitizeFilename(g)
..GetImageExtension(g)

if isfile and not isfile(i)then
local m,p=pcall(function()
local m=game.HttpGet and game:HttpGet(g)
or an.Request{
Url=g,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(i,m)
end)

if not m then
warn("[ Window.Background ] Failed to download image: "..tostring(p))
end
end

local m,p=pcall(function()
return getcustomasset(i)
end)

if not m then
warn("[ Window.Background ] Failed to load custom asset: "..tostring(p))
end

d=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=p,
ImageTransparency=0,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,ay.UICorner),
}),
})
elseif h then
d=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=h,
ImageTransparency=0,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,ay.UICorner),
}),
})
elseif ay.Background then
d=ao("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(ay.Background)=="string"and ay.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
ao("UICorner",{
CornerRadius=UDim.new(0,ay.UICorner),
}),
})
end

local i=an.NewRoundFrame(99,"Squircle",{
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

function createAuthor(m)
return ao("TextLabel",{
Text=m,
FontFace=Font.new(an.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=ay.UIElements.Main and ay.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="WindowTopbarAuthor",
},
Name="Author",
})
end

local m
local p

if ay.Author then
m=createAuthor(ay.Author)
end

local r=ao("TextLabel",{
Text=ay.Title,
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

ay.UIElements.Main=ao("Frame",{
Size=UDim2.new(ay.Size.X.Scale,ay.Size.X.Offset,0,0),
Position=ay.Position,
BackgroundTransparency=1,
Parent=ax.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,

},{
ax.WindUI.UIScaleObj,
ay.AcrylicPaint and ay.AcrylicPaint.Frame or nil,
aE,
an.NewRoundFrame(ay.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="WindowBackground",
},

},{
d,
i,
aB,
}),




aA,
aC,
aD,
ao("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
ao("UICorner",{
CornerRadius=UDim.new(0,ay.UICorner),
}),
ay.UIElements.SideBarContainer,
ay.UIElements.MainBar,

aF,

aH,
ao("Frame",{
Size=UDim2.new(1,0,0,ay.Topbar.Height),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar",
},{
aG,






ao("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left",
},{
ao("UIListLayout",{
Padding=UDim.new(0,ay.UIPadding+4),
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
r,
m,
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
Padding=UDim.new(0,ay.UIPadding/2),
}),
}),
}),
ao("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(ay.Topbar.ButtonsType=="Default"and 1 or 0,0,0.5,0),
AnchorPoint=Vector2.new(ay.Topbar.ButtonsType=="Default"and 1 or 0,0.5),
Name="Right",
},{
ao("UIListLayout",{
Padding=UDim.new(0,ay.Topbar.ButtonsType=="Default"and 9 or 0),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,ay.UIPadding),
PaddingLeft=UDim.new(
0,
ay.Topbar.ButtonsType=="Default"and ay.UIPadding or ay.UIPadding-2
),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,ay.UIPadding),
}),
}),
}),
})

an.AddSignal(ay.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local u=0
local v=ay.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
/ax.WindUI.UIScale

u=ay.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X/ax.WindUI.UIScale
if ay.Topbar.ButtonsType~="Default"then
u=u+v+ay.UIPadding-4
end

ay.UIElements.Main.Main.Topbar.Center.Position=
UDim2.new(0,u+(ay.UIPadding/ax.WindUI.UIScale),0.5,0)
ay.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-u
-(ay.UIPadding/ax.WindUI.UIScale)
-(ay.Topbar.ButtonsType=="Default"and v+ay.UIPadding or 0),
1,
0
)
end)

if ay.Topbar.ButtonsType~="Default"then
an.AddSignal(ay.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal"AbsoluteSize",function()
ay.UIElements.Main.Main.Topbar.Left.Position=UDim2.new(
0,
(ay.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/ax.WindUI.UIScale)+ay.UIPadding-4,
0,
0
)
end)
end

function ay.CreateTopbarButton(u,v,x,z,A,F,H,J)
local L=an.Image(
x,
x,
0,
ay.Folder,
"WindowTopbarIcon",
ay.Topbar.ButtonsType=="Default"and true or false,
F,
"WindowTopbarButtonIcon"
)
L.Size=ay.Topbar.ButtonsType=="Default"
and UDim2.new(0,J or ay.TopBarButtonIconSize,0,J or ay.TopBarButtonIconSize)
or UDim2.new(0,0,0,0)
L.AnchorPoint=Vector2.new(0.5,0.5)
L.Position=UDim2.new(0.5,0,0.5,0)
L.ImageLabel.ImageTransparency=ay.Topbar.ButtonsType=="Default"and 0 or 1

if ay.Topbar.ButtonsType~="Default"then
L.ImageLabel.ImageColor3=an.GetTextColorForHSB(H)
end

local M=an.NewRoundFrame(
ay.Topbar.ButtonsType=="Default"and ay.UICorner-(ay.UIPadding/2)or 999,
"Squircle",
{
Size=ay.Topbar.ButtonsType=="Default"
and UDim2.new(0,ay.Topbar.Height-16,0,ay.Topbar.Height-16)
or UDim2.new(0,14,0,14),
LayoutOrder=A or 999,


ZIndex=9999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=ay.Topbar.ButtonsType~="Default"and(H or Color3.fromHex"#ff3030")or nil,
ThemeTag=ay.Topbar.ButtonsType=="Default"and{
ImageColor3="Text",
}or nil,
ImageTransparency=ay.Topbar.ButtonsType=="Default"and 1 or 0,
},
{












L,
ao("UIScale",{
Scale=1,
}),
},
true
)

local N=ao("Frame",{
Size=ay.Topbar.ButtonsType~="Default"and UDim2.new(0,24,0,24)
or UDim2.new(0,ay.Topbar.Height-16,0,ay.Topbar.Height-16),
BackgroundTransparency=1,
Parent=ay.UIElements.Main.Main.Topbar.Right,
LayoutOrder=A or 999,
},{
M,
})



ay.TopBarButtons[100-A]={
Name=v,
Object=N,
}

an.AddSignal(M.MouseButton1Click,function()
if z then
z()
end
end)
an.AddSignal(M.MouseEnter,function()
if ay.Topbar.ButtonsType=="Default"then
ap(M,0.15,{ImageTransparency=0.93}):Play()


else

ap(
L.ImageLabel,
0.1,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ap(L,0.1,{
Size=UDim2.new(
0,
J or ay.TopBarButtonIconSize,
0,
J or ay.TopBarButtonIconSize
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)

an.AddSignal(M.MouseButton1Down,function()
ap(M.UIScale,0.2,{Scale=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

an.AddSignal(M.MouseLeave,function()
if ay.Topbar.ButtonsType=="Default"then
ap(M,0.1,{ImageTransparency=1}):Play()


else

ap(
L.ImageLabel,
0.1,
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ap(
L,
0.1,
{Size=UDim2.new(0,0,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end)

an.AddSignal(M.InputEnded,function()
ap(M.UIScale,0.2,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end)

return M
end

function ay.Topbar.Button(u,v:{
Name:string,
Icon:string,
Callback:any,
LayoutOrder:number,
IconThemed:boolean,
Color:Color3,
IconSize:number
})
return ay:CreateTopbarButton(
v.Name,
v.Icon,
v.Callback,
v.LayoutOrder or 0,
v.IconThemed,
v.Color,
v.IconSize
)
end



local u=an.Drag(
ay.UIElements.Main,
{ay.UIElements.Main.Main.Topbar,i.Frame},
function(u,v)
if not ay.Closed then
if u and v==i.Frame then
ap(i,0.1,{ImageTransparency=0.35}):Play()
else
ap(i,0.2,{ImageTransparency=0.8}):Play()
end
ay.Position=ay.UIElements.Main.Position
ay.Dragging=u
end
end
)

if not b and ay.Background and typeof(ay.Background)=="table"then
local v=ao"UIGradient"
for x,z in next,ay.Background do
v[x]=z
end

ay.UIElements.BackgroundGradient=an.NewRoundFrame(ay.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=ay.UIElements.Main.Background,
ImageTransparency=ay.Transparent and ax.WindUI.TransparencyValue or 0,
},{
v,
})
end














ay.OpenButtonMain=a.load'A'.New(ay)

task.spawn(function()
if ay.Icon then
local v=ao("Frame",{
Size=UDim2.new(0,22,0,22),
BackgroundTransparency=1,
Parent=ay.UIElements.Main.Main.Topbar.Left,
})

p=an.Image(
ay.Icon,
ay.Title,
ay.IconRadius,
ay.Folder,
"Window",
true,
ay.IconThemed,
"WindowTopbarIcon"
)
p.Parent=v
p.Size=UDim2.new(0,ay.IconSize,0,ay.IconSize)
p.Position=UDim2.new(0.5,0,0.5,0)
p.AnchorPoint=Vector2.new(0.5,0.5)

ay.OpenButtonMain:SetIcon(ay.Icon)











else
ay.OpenButtonMain:SetIcon(ay.Icon)

end
end)

function ay.SetToggleKey(v,x)
ay.ToggleKey=x
end

function ay.SetTitle(v,x)
ay.Title=x
r.Text=x
end

function ay.SetAuthor(v,x)
ay.Author=x
if not m then
m=createAuthor(ay.Author)
end

m.Text=x
end

function ay.SetSize(v,x)
if typeof(x)=="UDim2"then
ay.Size=x

ap(ay.UIElements.Main,0.08,{Size=x},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

function ay.SetBackgroundImage(v,x)
ay.UIElements.Main.Background.ImageLabel.Image=x
end
function ay.SetBackgroundImageTransparency(v,x)
if d and d:IsA"ImageLabel"then
d.ImageTransparency=math.floor(x*10+0.5)/10
end
ay.BackgroundImageTransparency=math.floor(x*10+0.5)/10
end

function ay.SetBackgroundTransparency(v,x)
local z=math.floor(tonumber(x)*10+0.5)/10
ax.WindUI.TransparencyValue=z
ay:ToggleTransparency(z>0)
end

local v
local x
an.Icon"minimize"
an.Icon"maximize"

ay:CreateTopbarButton(
"Fullscreen",
ay.Topbar.ButtonsType=="Mac"and"rbxassetid://127426072704909"or"maximize",
function()
ay:ToggleFullscreen()
end,
(ay.Topbar.ButtonsType=="Default"and 998 or 999),
true,
Color3.fromHex"#60C762",
ay.Topbar.ButtonsType=="Mac"and 9 or nil
)

local function SetSize(z)
ap(ay.UIElements.Main,0.45,{
Size=not ay.IsFullscreen and x or UDim2.new(
0,
(ax.WindUI.ScreenGui.AbsoluteSize.X-20)/ax.WindUI.UIScale,
0,
(ax.WindUI.ScreenGui.AbsoluteSize.Y-20-52)/ax.WindUI.UIScale
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ap(
ay.UIElements.Main,
0.45,
{Position=not ay.IsFullscreen and v or UDim2.new(0.5,0,0.5,26)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end

function ay.ToggleFullscreen(z)
local A=ay.IsFullscreen

u:Set(A)

if not A then
v=ay.UIElements.Main.Position
x=ay.UIElements.Main.Size

ay.CanResize=false
else
if ay.Resizable then
ay.CanResize=true
end
end

ay.IsFullscreen=not A

SetSize(true)
end

an.AddSignal(ax.WindUI.ScreenGui:GetPropertyChangedSignal"AbsoluteSize",function()
if ay.IsFullscreen then
SetSize()
end
end)

ay:CreateTopbarButton("Minimize","minus",function()
if ay.Close then
ay:Close()
end






















end,(ay.Topbar.ButtonsType=="Default"and 997 or 998),nil,Color3.fromHex"#F4C948")

function ay.OnOpen(z,A)
ay.OnOpenCallback=A
end
function ay.OnClose(z,A)
ay.OnCloseCallback=A
end
function ay.OnDestroy(z,A)
ay.OnDestroyCallback=A
end

if ax.WindUI.UseAcrylic then
ay.AcrylicPaint.AddParent(ay.UIElements.Main)
end

function ay.SetIconSize(z,A)
local F
if typeof(A)=="number"then
F=UDim2.new(0,A,0,A)
ay.IconSize=A
elseif typeof(A)=="UDim2"then
F=A
ay.IconSize=A.X.Offset
end

if p then
p.Size=F
end
end

function ay.Open(z)
if ay.Destroyed then
return
end
task.spawn(function()
if ay.OnOpenCallback then
task.spawn(function()
an.SafeCallback(ay.OnOpenCallback)
end)
end

task.wait(0.06)
ay.Closed=false


ay.UIElements.Main.Size=UDim2.new(ay.Size.X.Scale,ay.Size.X.Offset,0,60)
if not ay.UIElements.Main:FindFirstChild"LevScale"then
local A=Instance.new"UIScale";A.Scale=0.88;A.Name="LevScale"
A.Parent=ay.UIElements.Main
end
ay.UIElements.Main.LevScale.Scale=0.88

ap(ay.UIElements.Main,0.55,{
Size=ay.Size,
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ap(ay.UIElements.Main.LevScale,0.50,{
Scale=1,
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()

if ay.UIElements.BackgroundGradient then
ap(ay.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ay.UIElements.Main.Background.ImageTransparency=1
ap(ay.UIElements.Main.Background,0.4,{

ImageTransparency=ay.Transparent and ax.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if d then
if d:IsA"VideoFrame"then
d.Visible=true
else
ap(d,0.2,{
ImageTransparency=ay.BackgroundImageTransparency,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

if ay.OpenButtonMain and ay.IsOpenButtonEnabled then
ay.OpenButtonMain:Visible(false)
end









ap(
aE,
0.25,
{ImageTransparency=ay.ShadowTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()




ap(
i,
0.45,
{Size=UDim2.new(0,ay.DragFrameSize,0,4),ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
u:Set(true)

if ay.Resizable then
ap(
aB.ImageLabel,
0.45,
{ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
ay.CanResize=true
end

ay.CanDropdown=true
ay.UIElements.Main.Visible=true



ay.UIElements.Main:WaitForChild"Main".Visible=true

ax.WindUI:ToggleAcrylic(true)

end)
end
function ay.Close(z)
if ay.Destroyed then
return
end

local A={}

if ay.OnCloseCallback then
task.spawn(function()
an.SafeCallback(ay.OnCloseCallback)
end)
end

ax.WindUI:ToggleAcrylic(false)

if ay.UIElements.Main and ay.UIElements.Main:WaitForChild"Main"then
ay.UIElements.Main.Main.Visible=false
end

ay.CanDropdown=false
ay.Closed=true


if ay.UIElements.Main:FindFirstChild"LevScale"then
ap(ay.UIElements.Main.LevScale,0.20,{
Scale=0.92,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
task.delay(0.08,function()
ap(ay.UIElements.Main,0.40,{
Size=UDim2.new(ay.Size.X.Scale,ay.Size.X.Offset,0,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
if ay.UIElements.BackgroundGradient then
ap(ay.UIElements.BackgroundGradient,0.2,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

ap(ay.UIElements.Main.Background,0.3,{

ImageTransparency=1,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()








if d then
if d:IsA"VideoFrame"then
d.Visible=false
else
ap(d,0.3,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
ap(aE,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()




ap(
i,
0.3,
{Size=UDim2.new(0,0,0,4),ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut
):Play()
ap(
aB.ImageLabel,
0.3,
{ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
u:Set(false)
ay.CanResize=false

task.spawn(function()
task.wait(0.4)

if not ay.Closed then
return
end

ay.UIElements.Main.Visible=false

if ay.OpenButtonMain and not ay.Destroyed and not ay.IsPC and ay.IsOpenButtonEnabled then
ay.OpenButtonMain:Visible(true)
end
end)

function A.Destroy(F)
task.spawn(function()
if ay.OnDestroyCallback then
task.spawn(function()
an.SafeCallback(ay.OnDestroyCallback)
end)
end

if ay.AcrylicPaint and ay.AcrylicPaint.Model then
ay.AcrylicPaint.Model:Destroy()
end

ay.Destroyed=true

task.wait(0.4)

ax.WindUI.ScreenGui:Destroy()
ax.WindUI.NotificationGui:Destroy()
ax.WindUI.DropdownGui:Destroy()
ax.WindUI.TooltipGui:Destroy()

an.DisconnectAll()

return
end)
end

return A
end
function ay.Destroy(z)
return ay:Close():Destroy()
end
function ay.Toggle(z)
if ay.Closed then
ay:Open()
else
ay:Close()
end
end

function ay.ToggleTransparency(z,A)

ay.Transparent=A
ax.WindUI.Transparent=A

ay.UIElements.Main.Background.ImageTransparency=A and ax.WindUI.TransparencyValue or 0


end

function ay.LockAll(z)
for A,F in next,ay.AllElements do
if F.Lock then
F:Lock()
end
end
end
function ay.UnlockAll(z)
for A,F in next,ay.AllElements do
if F.Unlock then
F:Unlock()
end
end
end
function ay.GetLocked(z)
local A={}

for F,H in next,ay.AllElements do
if H.Locked then
table.insert(A,H)
end
end

return A
end
function ay.GetUnlocked(z)
local A={}

for F,H in next,ay.AllElements do
if H.Locked==false then
table.insert(A,H)
end
end

return A
end

function ay.GetUIScale(z,A)
return ax.WindUI.UIScale
end

function ay.SetUIScale(z,A)
ax.WindUI.UIScale=A
ap(ax.WindUI.UIScaleObj,0.2,{Scale=A},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return ay
end

function ay.SetToTheCenter(z)
ap(
ay.UIElements.Main,
0.45,
{Position=UDim2.new(0.5,0,0.5,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
return ay
end

function ay.SetCurrentConfig(z,A)
ay.CurrentConfig=A
end

do
local z=40
local A=al.ViewportSize
local F=Vector2.new(ay.Size.X.Offset,ay.Size.Y.Offset)

if not ay.IsFullscreen and ay.AutoScale then
local H=A.X-(z*2)
local J=A.Y-(z*2)

local L=H/F.X
local M=J/F.Y

local N=math.min(L,M)

local O=0.3
local P=1.0

local Q=math.clamp(N,O,P)

local R=ay:GetUIScale()or 1
local S=0.05

if math.abs(Q-R)>S then
ay:SetUIScale(Q)
end
end
end

if ay.OpenButtonMain and ay.OpenButtonMain.Button then
an.AddSignal(ay.OpenButtonMain.Button.TextButton.MouseButton1Click,function()


ay:Open()
end)
end

an.AddSignal(af.InputBegan,function(z,A)
if A then
return
end

if ay.ToggleKey then
if z.KeyCode==ay.ToggleKey then
ay:Toggle()
end
end
end)

task.spawn(function()

ay:Open()
end)

function ay.EditOpenButton(z,A)
return ay.OpenButtonMain:Edit(A)
end

if ay.OpenButton and typeof(ay.OpenButton)=="table"then
ay:EditOpenButton(ay.OpenButton)
end

local z=a.load'aa'
local A=a.load'ab'
local F=z.Init(ay,ax.WindUI,ax.WindUI.TooltipGui)
F:OnChange(function(H)
ay.CurrentTab=H
end)

ay.TabModule=F

function ay.Tab(H,J)
J.Parent=ay.UIElements.SideBar.Frame
return F.New(J,ax.WindUI.UIScale)
end

function ay.SelectTab(H,J)
F:SelectTab(J)
end

function ay.Section(H,J)
return A.New(
J,
ay.UIElements.SideBar.Frame,
ay.Folder,
ax.WindUI.UIScale,
ay
)
end

function ay.IsResizable(H,J)
ay.Resizable=J
ay.CanResize=J
end

function ay.SetPanelBackground(H,J)
if typeof(J)=="boolean"then
ay.HidePanelBackground=J

ay.UIElements.MainBar.Background.Visible=J

if F then
for L,M in next,F.Containers do
M.ScrollingFrame.UIPadding.PaddingTop=UDim.new(0,ay.HidePanelBackground and 20 or 10)
M.ScrollingFrame.UIPadding.PaddingLeft=
UDim.new(0,ay.HidePanelBackground and 20 or 10)
M.ScrollingFrame.UIPadding.PaddingRight=
UDim.new(0,ay.HidePanelBackground and 20 or 10)
M.ScrollingFrame.UIPadding.PaddingBottom=
UDim.new(0,ay.HidePanelBackground and 20 or 10)
end
end
end
end

function ay.Divider(H)
local J=ao("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
})
local L=ao("Frame",{
Parent=ay.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
J,
})

return L
end

local H=a.load'o'
function ay.Dialog(J,L)
local M={
Title=L.Title or"Dialog",
Width=L.Width or 320,
Content=L.Content,
Buttons=L.Buttons or{},

TextPadding=14,
}
local N=H.Create(false,"Dialog",ay,ax.WindUI,ay.UIElements.Main.Main)

N.UIElements.Main.Size=UDim2.new(0,M.Width,0,0)

local O=ao("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=N.UIElements.Main,
},{
ao("UIListLayout",{
FillDirection="Vertical",

Padding=UDim.new(0,N.UIPadding),
}),
})

local P=ao("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=O,
},{
ao("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,N.UIPadding),
VerticalAlignment="Center",
}),
ao("UIPadding",{
PaddingTop=UDim.new(0,M.TextPadding/2),
PaddingLeft=UDim.new(0,M.TextPadding/2),
PaddingRight=UDim.new(0,M.TextPadding/2),
}),
})

local Q
if L.Icon then
Q=an.Image(
L.Icon,
M.Title..":"..L.Icon,
0,
ay,
"Dialog",
true,
L.IconThemed
)
Q.Size=UDim2.new(0,22,0,22)
Q.Parent=P
end

N.UIElements.UIListLayout=ao("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
VerticalFlex="SpaceBetween",
Parent=N.UIElements.Main,
})

ao("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=N.UIElements.Main,
})

N.UIElements.Title=ao("TextLabel",{
Text=M.Title,
TextSize=20,
FontFace=Font.new(an.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,Q and-26-N.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=P,
})
if M.Content then
ao("TextLabel",{
Text=M.Content,
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
Parent=O,
},{
ao("UIPadding",{
PaddingLeft=UDim.new(0,M.TextPadding/2),
PaddingRight=UDim.new(0,M.TextPadding/2),
PaddingBottom=UDim.new(0,M.TextPadding/2),
}),
})
end

local R=ao("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Center",
HorizontalFlex="Fill",
})

local S=ao("Frame",{
Size=UDim2.new(1,0,0,36),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=N.UIElements.Main,
LayoutOrder=4,
},{
R,






})

local T={}

for U,V in next,M.Buttons do
local W=
ar(V.Title,V.Icon,V.Callback,V.Variant,S,N,true)
table.insert(T,W)
W.Size=UDim2.new(1,0,1,0)
end





















































N:Open()

return N
end

local J=false

ay:CreateTopbarButton("Close","x",function()
if not J then
if not ay.IgnoreAlerts then
J=true

ay:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()
J=false
end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()
J=false
ay:Destroy()
end,
Variant="Primary",
},
},
}
else
ay:Destroy()
end
end
end,(ay.Topbar.ButtonsType=="Default"and 999 or 997),nil,Color3.fromHex"#F4695F")

function ay.Tag(L,M)
if ay.UIElements.Main.Main.Topbar.Center.Visible==false then
ay.UIElements.Main.Main.Topbar.Center.Visible=true
end
M.Window=ay
return at:New(M,ay.UIElements.Main.Main.Topbar.Center.Holder)
end

local L=ax.WindUI.GenerateGUID()

local function startResizing(M)
if ay.CanResize then
isResizing=true
aC.Active=true
initialSize=ay.UIElements.Main.Size
initialInputPosition=M.Position


ap(aB.ImageLabel,0.1,{ImageTransparency=0.35}):Play()

an.AddSignal(M.Changed,function()
if M.UserInputState==Enum.UserInputState.End then
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=L then
return
end

ax.WindUI.CurrentInput=nil

isResizing=false
aC.Active=false


ap(aB.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)
end
end

an.AddSignal(aB.InputBegan,function(M)
if
M.UserInputType==Enum.UserInputType.MouseButton1
or M.UserInputType==Enum.UserInputType.Touch
then
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=L then
return
end
ax.WindUI.CurrentInput=L

if ay.CanResize then
startResizing(M)
end
end
end)

an.AddSignal(af.InputChanged,function(M)
if
M.UserInputType==Enum.UserInputType.MouseMovement
or M.UserInputType==Enum.UserInputType.Touch
then
if isResizing and ay.CanResize then
local N=M.Position-initialInputPosition
local O=UDim2.new(0,initialSize.X.Offset+N.X*2,0,initialSize.Y.Offset+N.Y*2)

O=UDim2.new(
O.X.Scale,
math.clamp(O.X.Offset,ay.MinSize.X,ay.MaxSize.X),
O.Y.Scale,
math.clamp(O.Y.Offset,ay.MinSize.Y,ay.MaxSize.Y)
)

ap(ay.UIElements.Main,0.08,{
Size=O,
},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

ay.Size=O
end
end
end)

an.AddSignal(aB.MouseEnter,function()
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=L then
return
end
if not isResizing then
ap(aB.ImageLabel,0.1,{ImageTransparency=0.35}):Play()
end
end)
an.AddSignal(aB.MouseLeave,function()
if ax.WindUI.CurrentInput and ax.WindUI.CurrentInput~=L then
return
end
if not isResizing then
ap(aB.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)



local M=0
local N=0.4
local O
local P=0

function onDoubleClick()
ay:SetToTheCenter()
end

an.AddSignal(i.Frame.MouseButton1Up,function()
local Q=tick()
local R=ay.Position

P=P+1

if P==1 then
M=Q
O=R

task.spawn(function()
task.wait(N)
if P==1 then
P=0
O=nil
end
end)
elseif P==2 then
if Q-M<=N and R==O then
onDoubleClick()
end

P=0
O=nil
M=0
else
P=1
M=Q
O=R
end
end)



if not ay.HideSearchBar then
local Q=a.load'ad'
local R=false





















local S=aq("Search","search",ay.UIElements.SideBarContainer,true)
S.Size=UDim2.new(1,-ay.UIPadding/2,0,39)
S.Position=UDim2.new(0,ay.UIPadding/2,0,0)

an.AddSignal(S.MouseButton1Click,function()
if R then
return
end

Q.new(ay.TabModule,ay.UIElements.Main,function()

R=false
if ay.Resizable then
ay.CanResize=true
end

ap(aD,0.1,{ImageTransparency=1}):Play()
aD.Active=false
end)
ap(aD,0.1,{ImageTransparency=0.65}):Play()
aD.Active=true

R=true
ay.CanResize=false
end)
end



function ay.DisableTopbarButtons(Q,R)
for S,T in next,R do
for U,V in next,ay.TopBarButtons do
if V.Name==T then
V.Object.Visible=false
end
end
end
end



























return ay
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

local af=(cloneref or clonereference or function(af)
return af
end)

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

an.InputBegan:Connect(function(ap,aq)




task.defer(function()
if
ap.UserInputType==Enum.UserInputType.MouseButton1
or ap.UserInputType==Enum.UserInputType.Touch
then
if aa.CurrentInput and aa.CurrentInput~=ao then
return
end

aa.CurrentInput=ao


end
end)
end)
an.InputEnded:Connect(function(ap,aq)
if ap.UserInputType==Enum.UserInputType.MouseButton1 or ap.UserInputType==Enum.UserInputType.Touch then
if aa.CurrentInput and aa.CurrentInput~=ao then
return
end

aa.CurrentInput=nil
end
end)

local ap=ak.LocalPlayer or nil

local aq=ai:JSONDecode(a.load'l')
if aq then
aa.Version=aq.version
end

local ar=a.load'p'

local as=aa.Creator

local at=as.New




local au=a.load't'

local ax=protectgui or(syn and syn.protect_gui)or function()end

local ay=gethui and gethui()or(al or ap:WaitForChild"PlayerGui")

local az=at("UIScale",{
Scale=aa.UIScale,
})

aa.UIScaleObj=az

aa.ScreenGui=at("ScreenGui",{
Name="WindUI",
Parent=ay,
IgnoreGuiInset=true,
ScreenInsets="None",
DisplayOrder=-99999,
},{

at("Folder",{
Name="Window",
}),






at("Folder",{
Name="KeySystem",
}),
at("Folder",{
Name="Popups",
}),
at("Folder",{
Name="ToolTips",
}),
})

aa.NotificationGui=at("ScreenGui",{
Name="WindUI/Notifications",
Parent=ay,
IgnoreGuiInset=true,
})
aa.DropdownGui=at("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=ay,
IgnoreGuiInset=true,
})
aa.TooltipGui=at("ScreenGui",{
Name="WindUI/Tooltips",
Parent=ay,
IgnoreGuiInset=true,
})
ax(aa.ScreenGui)
ax(aa.NotificationGui)
ax(aa.DropdownGui)
ax(aa.TooltipGui)

as.Init(aa)

function aa.SetParent(aA,aB)
if aa.ScreenGui then
aa.ScreenGui.Parent=aB
end
if aa.NotificationGui then
aa.NotificationGui.Parent=aB
end
if aa.DropdownGui then
aa.DropdownGui.Parent=aB
end
if aa.TooltipGui then
aa.TooltipGui.Parent=aB
end
end
math.clamp(aa.TransparencyValue,0,1)

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

function aa.GetThemes(aB)
return aa.Themes
end
function aa.GetCurrentTheme(aB)
return aa.Theme.Name
end
function aa.GetTransparency(aB)
return aa.Transparent or false
end
function aa.GetWindowSize(aB)
return aa.Window.UIElements.Main.Size
end
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
if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
aa.Window.Acrylic=aC
aa.Window.AcrylicPaint.Model.Transparency=aC and 0.98 or 1
if aC then
au.Enable()
else
au.Disable()
end
end
end

function aa.Gradient(aB,aC,aD)
local aE={}
local aF={}

for aG,aH in next,aC do
local b=tonumber(aG)
if b then
b=math.clamp(b/100,0,1)

local d=aH.Color
if typeof(d)=="string"and string.sub(d,1,1)=="#"then
d=Color3.fromHex(d)
end

local f=aH.Transparency or 0

table.insert(aE,ColorSequenceKeypoint.new(b,d))
table.insert(aF,NumberSequenceKeypoint.new(b,f))
end
end

table.sort(aE,function(b,d)
return b.Time<d.Time
end)
table.sort(aF,function(b,d)
return b.Time<d.Time
end)

if#aE<2 then
table.insert(aE,ColorSequenceKeypoint.new(1,aE[1].Value))
table.insert(aF,NumberSequenceKeypoint.new(1,aF[1].Value))
end

local b={
Color=ColorSequence.new(aE),
Transparency=NumberSequence.new(aF),
}

if aD then
for d,f in pairs(aD)do
b[d]=f
end
end

return b
end

function aa.Popup(aB,aC)
aC.WindUI=aa
return a.load'u'.new(aC,aa.ScreenGui.Popups)
end

aa.Themes=a.load'v'(aa,as)

as.Themes=aa.Themes

aa:SetTheme"Dark"
aa:SetLanguage(as.Language)

function aa.CreateWindow(aB,aC)
local aD=a.load'ae'

if not am:IsStudio()and writefile then
if not isfolder"WindUI"then
makefolder"WindUI"
end
if aC.Folder then
makefolder(aC.Folder)
else
makefolder(aC.Title)
end
end

aC.WindUI=aa
aC.Window=aa.Window
aC.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local aE=true

local aF=aa.Themes[aC.Theme or"Dark"]


as.SetTheme(aF)

local aG=gethwid or function()
return ak.LocalPlayer.UserId
end

local aH=aG()

if aC.KeySystem then
aE=false

local function loadKeysystem()
ar.new(aC,aH,function(b)
aE=b
end)
end

local b=(aC.Folder or"Temp").."/"..aH..".key"

if aC.KeySystem.KeyValidator then
if aC.KeySystem.SaveKey and isfile(b)then
local d=readfile(b)
local f=aC.KeySystem.KeyValidator(d)

if f then
aE=true
else
loadKeysystem()
end
else
loadKeysystem()
end
elseif not aC.KeySystem.API then
if aC.KeySystem.SaveKey and isfile(b)then
local d=readfile(b)
local f=(type(aC.KeySystem.Key)=="table")and table.find(aC.KeySystem.Key,d)
or tostring(aC.KeySystem.Key)==tostring(d)

if f then
aE=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(b)then
local d=readfile(b)
local f=false

for g,h in next,aC.KeySystem.API do
local i=aa.Services[h.Type]
if i then
local m={}
for p,r in next,i.Args do
table.insert(m,h[r])
end

local u=i.New(table.unpack(m))
local v=u.Verify(d)
if v then
f=true
break
end
end
end

aE=f
if not f then
loadKeysystem()
end
else
loadKeysystem()
end
end

repeat
task.wait()
until aE
end

local b=aD(aC)

aa.Transparent=aC.Transparent
aa.Window=b

if aC.Acrylic then
au.init()
end













return b
end

return aa