--  	Gradient Scroll Nickname module by:
	
--		   _______           __                           _           
--		  / ____(_)_________/ /__  ____ ___  ____ _____  (_)___ ______
--		 / /   / / ___/ ___/ / _ \/ __ `__ \/ __ `/ __ \/ / __ `/ ___/
--		/ /___/ / /  / /__/ /  __/ / / / / / /_/ / / / / / /_/ / /__  
--		\____/_/_/   \___/_/\___/_/ /_/ /_/\__,_/_/ /_/_/\__,_/\___/  

--		This module (v1.i_am_currently_in_immense_pain.1) takes your nickname (or any string you set it to)
--		and makes it a custom animated color gradient through JSON. Note that it WILL NOT WORK
--		if the string you give it is already in JSON format.


-- CONFIG --

local ColorLerp = {}


local username = ""
function events.entity_init()
username = "Centi"				-- ur name string
end

local colors = {"#900000", "#070707", "#900000"} 	-- this array can be of any length		{"#5BCEFA","#F5A9B8","#FFFFFF","#F5A9B8"} for trans flag
ColorLerp.colors = colors
local speed = 0.1								-- color scroll per letter, 1 - one color in the array
local letterSpeed	= 0.1							-- how fast color spreads from letter to letter
local affectFiguraMark = true						-- self explanatory
--------------------------------
colors[#colors + 1] = colors[1]
speed = speed / letterSpeed

local function interpolateColor(color1, color2, t)

color1 = vectors.hexToRGB(color1)
color2 = vectors.hexToRGB(color2)

  local yourmom = math.lerp(color1,color2,t)

  return yourmom
end

function events.render(delta)
    
  character = {}
  local newName = '['
  for i=1,string.len(username),1 do
    local counter = (((world:getTime() + delta) + speed * i) * letterSpeed - (math.floor((((world:getTime() + delta) + speed * i) * letterSpeed)/(#colors - 1))) * (#colors - 1)) + 1
    local counterFloored = math.floor(counter)
    character[i] = string.sub(username,i,i)
    local color = interpolateColor(colors[counterFloored],colors[counterFloored + 1],counter - counterFloored)
    newName = newName .. '{"text":"' .. character[i] .. '","color":"#' .. vectors.rgbToHex(color) .. '"},'
    if i == #character then
      if affectFiguraMark == true then
        avatar:setColor(color)
      end
    end
  end
  newName = string.sub(newName,1,string.len(newName)-1) .. ']'
  nameplate.ALL:setText(newName)
end

return ColorLerp