--!nolint
--!nocheck
--!native
--!optimize 2

--[[
    EspKit | Pre-Alpha Distribution | LuaU

    Base by Stefanuk12
    Fixed and improved for framework use by biggaboy212

    This file was built with DarkLua, it is not intended for manual editing.
--]]

local a a={cache={},load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}
end return a.cache[b].c end}do function a.a()local b,c,d,e,f=game:GetService
'Workspace',Vector2.zero,Drawing.Fonts.Monospace,{Vector3.new(-1,-1,-1),Vector3.
new(-1,1,-1),Vector3.new(-1,1,1),Vector3.new(-1,-1,1),Vector3.new(1,-1,-1),
Vector3.new(1,1,-1),Vector3.new(1,1,1),Vector3.new(1,-1,1)},{}do local g,h=math.
clamp,Color3.new local i=h(0,0,0)function f.RgbToLuv13(j)assert(typeof(j)==
'Color3','invalid type for c (expected Color3)')local k,l,m=j.R,j.G,j.B k=k<
0.0404482362771076 and k/12.92 or 0.87941546140213*(k+0.055)^2.4 l=l<
0.0404482362771076 and l/12.92 or 0.87941546140213*(l+0.055)^2.4 m=m<
0.0404482362771076 and m/12.92 or 0.87941546140213*(m+0.055)^2.4 local n,o=
0.2125862307855956*k+0.7151703037034108*l+0.0722004986433362*m,
3.6590806972265884*k+11.442689580057424*l+4.114991502426484*m local p=n>
0.008856451679035631 and 116*n^(0.3333333333333333)-16 or 903.296296296296*n if
o>1e-15 then local q=0.9257063972951867*k-0.8333736323779866*l-
0.09209820666085898*m return p,p*q/o,p*(9*n/o-0.46832)else return p,-0.19783*p,-
0.46832*p end end function f.Lerp(j,k,l)assert(typeof(j)=='number',
'invalid type for t (expected number)')assert(typeof(k)=='Color3',
'invalid type for c0 (expected Color3)')assert(typeof(l)=='Color3',
'invalid type for c1 (expected Color3)')local m,n,o=f.RgbToLuv13(k)local p,q,r=f
.RgbToLuv13(l)local s=(1-j)*m+j*p if s<0.0197955 then return i end local t,u,v=(
(1-j)*n+j*q)/s+0.19783,((1-j)*o+j*r)/s+0.46832,(s+16)/116 v=v>
0.20689655172413793 and v*v*v or 0.12841854934601665*v-0.01771290335807126 local
w,x=v*t/u,v*((3-0.75*t)/u-5)local y,z,A=7.2914074*w-1.537208*v-0.4986286*x,-
2.180094*w+1.8757561*v+0.0415175*x,0.1253477*w-0.2040211*v+1.0569959*x if y<0
and y<z and y<A then y,z,A=0,z-y,A-y elseif z<0 and z<A then y,z,A=y-z,0,A-z
elseif A<0 then y,z,A=y-A,z-A,0 end return h(g(y<3.1306684425e-3 and 12.92*y or
1.055*y^(0.4166666666666667)-0.055,0,1),g(z<3.1306684425e-3 and 12.92*z or 1.055
*z^(0.4166666666666667)-0.055,0,1),g(A<3.1306684425e-3 and 12.92*A or 1.055*A^(
0.4166666666666667)-0.055,0,1))end end local g={}do function g.GetCurrentCamera(
)return b.CurrentCamera end function g.ApplyVector2(h,i)assert(typeof(h)==
'Vector2','invalid type for Vector. (expected Vector2)')assert(typeof(i)==
'function','invalid type for f. (expected function)')return Vector2.new(i(h.X),
i(h.Y))end function g.CombineTables(h,i)h=h or{}i=i or{}for j,k in pairs(i)do
local l=h[j]or false if(typeof(k)=='table'and typeof(l)=='table')then g.
CombineTables(l,k)continue end h[j]=k end return h end function g.DeepCopy(h)
assert(typeof(h)=='table','invalid type for Original (expected table)')local i={
}for j,k in pairs(h)do if(typeof(k)=='table')then k=g.DeepCopy(k)end i[j]=k end
return i end end local h,i=function(h)local i,j=b.CurrentCamera,{}for k,l in
pairs(h)do j[k]=g.ConvertV3toV2(i:WorldToViewportPoint(l))end return j end,{}i.
__index=i i.__type='Polygon'do function i.new(j)j=j or{}assert(typeof(j)==
'table','invalid type for Points (expected table)')local k=setmetatable({Lines=i
.Create(j,{}),Points=j,Properties={}},i)return k end function i.Create(j,k)
assert(typeof(j)=='table','invalid type for Points (expected table)')assert(
typeof(k)=='table','invalid type for Properties (expected table)')local l={}for
m=1,#j do k=g.DeepCopy(k)local n,o,p=j[m],j[m+1]or j[1],Drawing.new'Line'l[m]=p
g.SetDrawingProperties(p,g.CombineTables(k,{From=n,To=o}))end return l end
function i:Remove()for j,k in ipairs(rawget(self,'Lines'))do k:Remove()end end
function i:__index(j)local k=rawget(self,'Properties')return k[j]or rawget(self,
j)or i[j]end function i:__newindex(j,k)local l=rawget(self,'Properties')if(j==
'Points')then self:Destroy()rawset(self,'Lines',i.Create(k,l))end l[j]=k for m,n
in ipairs(rawget(self,'Lines'))do n[j]=k end end end do function g.ConvertV3toV2
(j)local k=typeof(j)if(k=='Vector3')then return Vector2.new(j.X,j.Y)elseif(k==
'Vector2')then return j end assert(k=='table',
'invalid type for Vector (expected Vector3 or table)')local l={}for m,n in
ipairs(j)do l[m]=g.ConvertV3toV2(n)end return l end function g.CalculateCorners(
j,k)assert(typeof(j)=='CFrame','invalid type for PartCFrame (expected CFrame)')
assert(typeof(k)=='Vector3','invalid type for PartSize (expected Vector3)')local
l,m=k/2,table.create(#e)for n,o in ipairs(e)do m[n]=(j+(l*o)).Position end local
p=h(m)local q,r=g.ConvertV3toV2(p),g.GetCurrentCamera()local s,t,u,v=r.
ViewportSize:Min(unpack(q)),c:Max(unpack(q)),math.floor,g.ApplyVector2 local w={
Corners=p,Centre3D=j.Position,TopLeft=v(s,u),TopRight=v(Vector2.new(t.X,s.Y),u),
BottomLeft=v(Vector2.new(s.X,t.Y),u),BottomRight=v(t,u)}local x,y=r:
WorldToViewportPoint(w.Centre3D)w.Centre=x w.OnScreen=y return w end function g.
RotateVector2(j,k)assert(typeof(j)=='Vector2',
'invalid type for Vector (expected Vector2)')assert(typeof(k)=='number',
'invalid type for Angle (expected number)')local l,m=math.cos(k),math.sin(k)
return Vector2.new((l*j.X)-(m*j.Y),(m*j.X)+(l*j.Y))end g.
IgnoredDrawingProperties={'Type','SubType'}function g.SetDrawingProperties(j,k)
assert(typeof(k)=='table','invalid type for Properties (expected table)')for l,m
in pairs(k)do if(table.find(g.IgnoredDrawingProperties,l))then continue end j[l]
=m end return j end function g.CreateDrawing(j)assert(typeof(j)=='table',
'invalid type for Properties (expected table)')local k,l=(j.Type)if(k==
'PolyLineDynamic')then l=i.new()else l=Drawing.new(k)end return g.
SetDrawingProperties(l,j)end end local j={}j.__index=j j.__type='Base'do
function j.new(k,l)k=k or{}l=l or{}assert(typeof(k)=='table',
'invalid type for Data (expected table)')assert(typeof(l)=='table',
'invalid type for Properties (expected table)')local m=setmetatable({},j)m.
Objects=m:InitialiseObjects(k,l)return m end function j:InitialiseObjects(k,l)k=
k or{}assert(typeof(k)=='table','invalid type for Data (expected table)')assert(
typeof(l)=='table','invalid type for Properties (expected table)')local m={}for
n,o in pairs(l)do if(typeof(o)~='table')then continue end m[n]=g.CreateDrawing(o
)end return m end function j:Destroy(k)k=k or self.Objects assert(typeof(k)==
'table','invalid type for TableObject (expected table)')for l,m in pairs(k)do if
(typeof(m)=='table')then self:Destroy(m)continue end m:Remove()k[l]=nil end end
function j:Update(k)assert(typeof(k)=='table',
'invalid type for Corners (expected table)')local l,m,n=self.Data.Enabled,{self.
AdditionalData.ColorTransparency(self)},{self.AdditionalData.
ColorTransparencyOutline(self)}g.SetDrawingProperties(self.Objects.Main,{Color=m
[1],Transparency=m[2],Visible=l})g.SetDrawingProperties(self.Objects.Main,{Color
=n[1],Transparency=n[2],Visible=l and self.Data.OutlineEnabled})end end local k=
{}k.__index=k k.__type='BoxSquare'setmetatable(k,j)do k.DefaultData={Enabled=
true,OutlineEnabled=true}k.DefaultProperties={Main={Type='Square',Thickness=1,
Color=Color3.new(1,0,0),Transparency=1,Filled=false,Visible=false}}function k.
new(l,m)l=l or{}m=m or{}assert(typeof(l)=='table',
'invalid type for Data (expected table)')assert(typeof(m)=='table',
'invalid type for Properties (expected table)')local n=setmetatable({},k)n.Data=
g.CombineTables(g.DeepCopy(k.DefaultData),l)n.Properties=g.CombineTables(g.
DeepCopy(k.DefaultProperties),m)n.Objects=n:InitialiseObjects(n.Data,n.
Properties)return n end function k:Update(l)assert(typeof(l)=='table',
'invalid type for Corners (expected table)')local m,n=self.Data,g.DeepCopy(self.
Properties)local o=m.Enabled and l.OnScreen g.SetDrawingProperties(self.Objects.
Main,g.CombineTables(n.Main,{Position=l.TopLeft,Size=l.BottomRight-l.TopLeft,
Visible=o}))end end local l={}l.__index=l l.__type='Tracer'setmetatable(l,j)do l
.DefaultData={Enabled=true,OutlineEnabled=true,TracerOrigin='Bottom'}l.
DefaultProperties={Main={Type='Line',Thickness=1,Color=Color3.new(1,0,0),
Transparency=1,Visible=false}}function l.new(m,n)m=m or{}n=n or{}assert(typeof(m
)=='table','invalid type for Data (expected table)')assert(typeof(n)=='table',
'invalid type for Properties (expected table)')local o=setmetatable({},l)o.Data=
g.CombineTables(g.DeepCopy(l.DefaultData),m)o.Properties=g.CombineTables(g.
DeepCopy(l.DefaultProperties),n)o.Objects=o:InitialiseObjects(o.Data,o.
Properties)return o end function l:Update(m)assert(typeof(m)=='table',
'invalid type for Corners (expected table)')local n,o=self.Data,g.DeepCopy(self.
Properties)local p,q,r=n.Enabled and m.OnScreen,g.GetCurrentCamera().
ViewportSize,(m.BottomLeft+m.BottomRight)/2 local s=n.TracerOrigin=='Middle'and
q/2 or n.TracerOrigin=='Top'and q*Vector2.new(0.5,0)or n.TracerOrigin=='Bottom'
and q*Vector2.new(0.5,1)g.SetDrawingProperties(self.Objects.Main,g.
CombineTables(o.Main,{To=r,From=s,Visible=p}))end end local m={}m.__index=m m.
__type='Header'setmetatable(m,j)do m.DefaultData={Enabled=true,OutlineEnabled=
true,Type='Name',Value='N/A',Formats={Name='%s',Weapon='%s',Distance=
'%0.1f studs',MiscTop='%s',MiscBottom='%s'},Mounts={Name='Top',MiscTop='Top',
Distance='Bottom',Weapon='Bottom',MiscBottom='Bottom'},Offset=Vector2.new(0,0)}m
.DefaultProperties={Main={Type='Text',Text='',Font=d,Size=13,Center=true,Color=
Color3.new(1,0,0),Transparency=1,Visible=false}}function m.new(n,o)n=n or{}o=o
or{}assert(typeof(n)=='table','invalid type for Data (expected table)')assert(
typeof(o)=='table','invalid type for Properties (expected table)')local p=
setmetatable({},m)p.Data=g.CombineTables(g.DeepCopy(m.DefaultData),n)p.
Properties=g.CombineTables(g.DeepCopy(m.DefaultProperties),o)p.Objects=p:
InitialiseObjects(p.Data,p.Properties)return p end function m:GetPosition(n)
assert(typeof(n)=='table','invalid type for Corners (expected table)')local o=
self.Data local p,q,r=o.Type,self.Objects.Main,typeof(o.Offset)=='function'and o
.Offset(self)or o.Offset local s=o.Mounts[p]if(s=='Top')then return((n.TopLeft+n
.TopRight)/2)-(q.TextBounds*Vector2.yAxis)-r end if(s=='Bottom')then return((n.
BottomLeft+n.BottomRight)/2)+r end return Vector2.zero end function m:Update(n)
assert(typeof(n)=='table','invalid type for Corners (expected table)')local o,p=
self.Data,g.DeepCopy(self.Properties)local q=o.Enabled and n.OnScreen local r=q
and o.OutlineEnabled g.SetDrawingProperties(self.Objects.Main,g.CombineTables(p.
Main,{Position=self:GetPosition(n),Text=o.Formats[o.Type]:format(o.Value),
Outline=r,Visible=q}))end end local n={}n.__index=n n.__type='Healthbar'
setmetatable(n,j)do n.DefaultData={Enabled=true,OutlineEnabled=true,Suffix='HP',
ShowHP=true,Value=0,MaxValue=100,MinColour=Color3.new(1,0,0),MaxColour=Color3.
new(0,1,0),Offset=Vector2.new(0,0),TextOffset=Vector2.new(5,0),WidthOffset=5}n.
DefaultProperties={Main={Type='Line',Thickness=1,Color=Color3.new(1,0,0),
Transparency=1,Visible=false},Text={Type='Text',Text='',Font=d,Size=13,Center=
true,Color=Color3.new(1,0,0),Transparency=1,OutlineColor=Color3.new(0,0,0),
Visible=false}}function n.new(o,p)o=o or{}p=p or{}assert(typeof(o)=='table',
'invalid type for Data (expected table)')assert(typeof(p)=='table',
'invalid type for Properties (expected table)')local q=setmetatable({},n)q.Data=
g.CombineTables(g.DeepCopy(n.DefaultData),o)q.Properties=g.CombineTables(g.
DeepCopy(n.DefaultProperties),p)q.Objects=q:InitialiseObjects(q.Data,q.
Properties)return q end function n:Update(o)assert(typeof(o)=='table',
'invalid type for Corners (expected table)')local p,q=self.Data,g.DeepCopy(self.
Properties)local r=p.Enabled and o.OnScreen local s,t,u=r and p.OutlineEnabled,(
o.TopLeft-o.BottomRight)*(p.WidthOffset/100)*Vector2.xAxis,typeof(p.Offset)==
'function'and p.Offset(self)or p.Offset local v=t-u local w,x,y=o.BottomLeft+v,o
.TopLeft+v,p.Value/p.MaxValue local z,A=w:Lerp(x,y),f.Lerp(y,p.MinColour,p.
MaxColour)g.SetDrawingProperties(self.Objects.Main,g.CombineTables(q.Main,{To=w,
From=z,Color=A,Visible=r}))local B=self.Objects.Text g.SetDrawingProperties(B,g.
CombineTables(q.Text,{Text=math.round(p.Value)..p.Suffix,Position=z-p.TextOffset
-B.TextBounds/2,Outline=s,Visible=p.ShowHP and r}))end end local o={}o.__index=o
o.__type='OffArrow'setmetatable(o,j)do o.DefaultData={Enabled=true,
OutlineEnabled=true,Radius=150,Size=15,Offset=Vector2.new(0,0)}o.
DefaultProperties={Main={Type='PolyLineDynamic',Thickness=1,Color=Color3.new(1,0
,0),Transparency=1,Visible=false}}function o.new(p,q)p=p or{}q=q or{}assert(
typeof(p)=='table','invalid type for Data (expected table)')assert(typeof(q)==
'table','invalid type for Properties (expected table)')local r=setmetatable({},o
)r.Data=g.CombineTables(g.DeepCopy(o.DefaultData),p)r.Properties=g.
CombineTables(g.DeepCopy(o.DefaultProperties),q)r.Objects=r:InitialiseObjects(r.
Data,r.Properties)return r end function o:Direction(p,q)q=q or g.
GetCurrentCamera().CFrame assert(typeof(p)=='Vector3',
'invalid type for Destination (expected Vector3)')assert(typeof(q)=='CFrame',
'invalid type for Origin (expected CFrame)')local r,s,t=q:ToOrientation()local u
=CFrame.Angles(0,s,t)+q.Position local v=u:PointToObjectSpace(p)local w=math.
atan2(v.Z,v.X)return Vector2.new(math.cos(w),math.sin(w))end function o:Update(p
)assert(typeof(p)=='table','invalid type for Corners (expected table)')local q,r
,s=self.Data,g.DeepCopy(self.Properties),p.Centre3D local t,u,v,w,x=q.Enabled
and not p.OnScreen,g.GetCurrentCamera().ViewportSize,Vector2.one*25,q.Value or
self:Direction(s),q.Size local y=(u/2+w*q.Radius):Max(v):Min(u-v)local z,A=y-g.
RotateVector2(w,0.45)*x,y-g.RotateVector2(w,-0.45)*x g.SetDrawingProperties(self
.Objects.Main,g.CombineTables(r.Main,{Points={y,z,A},Visible=t}))end end local p
={}p.__index=p p.__type='Box3D'setmetatable(p,j)do p.DefaultData={Enabled=true,
OutlineEnabled=true}p.DefaultProperties=table.create(4,{Type='PolyLineDynamic',
Thickness=1,Visible=false,ZIndex=-1})function p.new(q,r)q=q or{}r=r or{}assert(
typeof(q)=='table','invalid type for Data (expected table)')assert(typeof(r)==
'table','invalid type for Properties (expected table)')local s=setmetatable({},p
)s.Data=g.CombineTables(g.DeepCopy(p.DefaultData),q)s.Properties=g.
CombineTables(g.DeepCopy(p.DefaultProperties),r)s.Objects=s:InitialiseObjects(s.
Data,s.Properties)return s end function p:Update(q)assert(typeof(q)=='table',
'invalid type for Corners (expected table)')local r,s=self.Data,g.DeepCopy(self.
Properties)local t,u,v=r.Enabled and q.OnScreen,g.ConvertV3toV2(q.Corners),{1,5,
4}for w=1,#s do local x={u[w]}for y=1,2 do local z=u[(w%4)+v[y] ]table.insert(x,
z)end table.insert(x,u[w==4 and 8 or(w+v[3])])g.SetDrawingProperties(self.
Objects[w],g.CombineTables(s[w],{Points=x,Visible=t}))end end end local q={
Utilities=g,Base=j,BoxSquare=k,Tracer=l,Header=m,Healthbar=n,OffArrow=o,Box3D=p}
return q end function a.b()local b,c,d=a.load'a',game:GetService'Players',game:
GetService'RunService'local e,f,g,h=c.LocalPlayer,{},getboundingbox or function(
e)local f=e[1]if(f:IsA'Model')then return f:GetBoundingBox()end return f.CFrame,
f.Size end,{}h.__index=h h.__type='InstanceObject'do function h.new(i,j)j=j or
false assert(table.find({'Instance','nil'},typeof(i)),
'invalid type for Object (expecting Instance or nil)')assert(i and(i:IsA
'BasePart'or i:IsA'Model')or not i,
[[invalid type for Object (expecting BasePart or Model or nil)]])assert(typeof(j
)=='boolean','invalid type for NoInsert (expecting boolean)')local k=
setmetatable({},h)k.Corners=nil k.Instance=i k.Objects={}if(not j)then table.
insert(f,k)end return k end function h:Get(i,j)assert(typeof(i)=='string',
'invalid type for Type (expecting string)')assert(table.find({'nil','string'},
typeof(j)),'invalid type for SubType (expecting string or nil)')local k={}for l,
m in ipairs(self.Objects)do if(m.__type==i and(j==m.Data.Type or not j))then
table.insert(k,m)end end return k end function h:Has(i,j)assert(typeof(i)==
'string','invalid type for Type (expecting string)')assert(table.find({'nil',
'string'},typeof(j)),'invalid type for SubType (expecting string or nil)')local
k=self:Get(i,j)if(i=='Header')then local l={}for m,n in ipairs(k)do local o=n.
Data.Type if(table.find(l,o))then return true end table.insert(l,o)end return
false end return#k>0 end function h:Add(i,j,k)j=j or{}k=k or{}assert(typeof(i)==
'string','invalid type for Type (expecting string)')assert(typeof(j)=='table',
'invalid type for Data (expected table)')assert(typeof(k)=='table',
'invalid type for Properties (expected table)')local l=b[i]assert(l,
'type does not exist - invalid object type')local m=l.new(j,k)table.insert(self.
Objects,m)if(i=='Header')then m.Data.Offset=function()return self:HeaderOffset(m
)end elseif(i=='Healthbar')then m.Data.Offset=function()return self:
HealthbarOffset(m)end end return m end function h:Render()if(#self.Objects==0 or
not self.Instance)then return false end local i=self.Instance local j,k=g{i}
local l=b.Utilities.CalculateCorners(j,k)self.Corners=l for m,n in ipairs(self.
Objects)do local o=n.Data local p=o.Type if(n.__type=='Header')then if(p==
'Weapon')then o.Value=o.Weapon or self:Weapon()end if(p=='Name')then o.Value=o.
Name or self:Name()end if(p=='Distance')then o.Value=o.Distance or self:
Distance()end end if(n.__type=='Healthbar')then local q=o.Health or{self:Health(
)}o.Value=q[1]o.MaxValue=q[2]end n:Update(l)end return nil end function h:
Destroy()for i=#self.Objects,1,-1 do self.Objects[i]:Destroy()table.remove(self.
Objects,i)end end function h:HeaderOffset(i)assert(typeof(i)=='table'and i.
__type=='Header','invalid type for HeaderObject (expecting Header)')local j,k,l=
Vector2.new(0,2),i.Data,self:Get'Header'local m,n=k.Mounts,k.Mounts[k.Type]for o
=#l,1,-1 do local p=l[o]if(m[p.Data.Type]~=n)then table.remove(l,o)end end local
o=table.find(l,i)if(not o)then return j end for p=1,o do j=j+l[p].Objects.Main.
TextBounds*Vector2.yAxis end return j end function h:HealthbarOffset(i)assert(
typeof(i)=='table'and i.__type=='Healthbar',
'invalid type for HealthbarObject (expecting Healthbar)')local j,k=Vector2.new(2
,0),self:Get'Healthbar'local l=table.find(k,i)if(not l)then return j end local m
=self.Corners local n=(m.BottomRight-m.TopLeft)*Vector2.xAxis*(0.1)for o=1,l do
j=j+n+(k[o].Objects.Main.Thickness*Vector2.xAxis)end return j end function h:
Name()return self.Instance.Name end function h:Weapon()return'N/A'end function h
:Health()if not(self.Instance and self.Instance.Parent)then return 100,100 end
local i=self.Instance:FindFirstChildWhichIsA'Humanoid'if(not i)then return 100,
100 end return i.Health,i.MaxHealth end function h:Distance()return e:
DistanceFromCharacter(self.Instance:GetPivot().Position)end end local i={}i.
__index=i i.__type='PlayerManager'do function i.new(j,k)k=k or false assert(
typeof(j)=='Instance'and j:IsA'Player',
'invalid type for Player (expecting Player)')assert(typeof(k)=='boolean',
'invalid type for NoInsert (expecting boolean)')local l=setmetatable({},i)l.
Player=j l.InstanceObject=h.new(nil,true)if(not k)then table.insert(f,l)end
return l end function i:Character()return self.Player.Character end function i:
Add(...)return self.InstanceObject:Add(...)end function i:Render()self.
InstanceObject.Instance=self:Character()if(not self.InstanceObject)then return
end self.InstanceObject:Render()end function i:Destroy()if(self.InstanceObject)
then self.InstanceObject:Destroy()self.InstanceObject=nil end end end local j={}
j.__index=j j.__type='PlayersManager'do function j.new()local k=setmetatable({},
j)k.Managers={}return k end function j:Add(...)local k={}for l,m in ipairs(self.
Managers)do table.insert(k,m:Add(...))end return k end function j:OnPlayerAdded(
k)assert(typeof(k)=='Instance'and k:IsA'Player',
'invalid type for Player (expecting Player)')table.insert(self.Managers,i.new(k)
)end function j:Destroy()if(self.PlayerAddedConnection)then self.
PlayerAddedConnection:Disconnect()end for k=#self.Managers,1,-1 do self.Managers
[k]:Destroy()table.remove(self.Managers,k)end end function j:
InitialiseConnections()self.PlayerAddedConnection=c.PlayerAdded:Connect(function
(k)self:OnPlayerAdded(k)end)end function j:Initialise()self:Destroy()for k,l in
ipairs(c:GetPlayers())do if(l==e)then continue end self:OnPlayerAdded(l)end self
:InitialiseConnections()end end d:BindToRenderStep('R-ESP-Render',0,function(k)
for l,m in ipairs(f)do m:Render(k)end end)local k={Base=b,InstanceObject=h,
PlayerManager=i,PlayersManager=j,InstanceObjects=f}return k end end return a.
load'b'