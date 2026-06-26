-- ================================================================
-- Postman's Local Speech Helper
-- Last update 9/19/2025
-- Find more scripts at https://github.com/Postman67/postmans-figura-helpers
-- Buy me a coffee at https://buymeacoffee.com/postman67
-- ================================================================

-- ================================
-- CONFIGURATION VARIABLES
-- ================================
local ColorLerp = require("colorLerpName")



local model_path = models.model.root.Head

-- Text Appearance Settings
local hide_nameplate_during_speech = true
local default_text_color = "#FFFFFF"
local text_scale = 0.4
local text_x_position = -19.2
local text_y_position = 22
local text_z_position = 0
local text_alignment = "CENTER"
local text_width = 150
local text_bold = false
local text_light_level = 15

-- Typing Sound Settings
local typing_sound = ""
local normal_pitch_range = {50, 80}
local high_pitch_range = {200, 220}
local dots_pitch_range = {10, 30}
local dots_slowdown_multiplier = 10
local sound_volume = 0.6

-- Chat Override Settings
local enable_chat_override = true
local chat_override_prefix = "\\"
local globalandlocal_chat_prefix = ">"
local global_chat_toggle = false  -- tracks current mode
local global_toggle_keybind = keybinds:newKeybind("Toggle Global Chat", "key.keyboard.backslash")

-- Visual Effects Settings
local enable_text_shake = true
local shake_intensity = 0.2
local caps_shake_multiplier = 2
local enable_outline = true
local outline_color = {0.0, 0.0, 0.0}
local enable_shadow = true
local enable_see_through = true
local enable_text_hover = true
local hover_intensity = 0.1
local hover_speed = 0.03

-- Text Display Settings
local chars_delay = 1
local use_auto_hold_duration = true
local manual_hold_duration = 500

-- Hold Duration Settings
local message_hold_time = 200

-- Stack Settings
local max_bubbles = 3       -- how many messages can stack on screen at once
local bubble_spacing = 6   -- vertical gap between stacked messages

-- Typing Indicator Settings
local enable_typing_indicator = true
local typing_indicator_text = "scuttle "
local typing_indicator_scale = 0.2
local typing_indicator_x = 0
local typing_indicator_y = 24
local typing_indicator_z = -5
local typing_indicator_color = "#FFC56D"
local typing_dots_speed = 40
local typing_dots_max = 1
local typing_indicator_alignment = "CENTER"

-- Menu Indicator Settings
local menu_indicator_text = "BRB"
local menu_indicator_color = "#FFC56D"
local enable_back_copy = true
-- ================================
-- KEYBINDS
-- ================================

global_toggle_keybind:onPress(function()
    global_chat_toggle = not global_chat_toggle
    local status = global_chat_toggle and "§aGLOBAL" or "§cLOCAL"
    host:setActionbar('{"text":"Chat mode: ' .. (global_chat_toggle and "GLOBAL" or "LOCAL") .. '","color":"' .. (global_chat_toggle and "green" or "red") .. '"}')
end)

-- ================================
-- COLOR AND GRADIENT DEFINITIONS
-- ================================

local color_words = {
    ["yellow"] = "#fff200",
    ["leak"] = "#fff200",
    ["aga"] = "#fff200",
    ["minecraft"] = "#fff200",
    ["join"] = "#fff200",
    ["bird"] = "#fff200",
    ["key"] = "#fff200",
    ["item"] = "#fff200",
    ["cool"] = "#fff200",
    ["piss"] = "#fff200",
    ["gold"] = "#fff200",
    ["must"] = "#fff200",
    ["ball"] = "#fff200",
    ["love"] = "#d535d9",
    ["tits"] = "#FC68B2",
    ["boobs"] = "#FC68B2",
    ["jesus"] = "#fff200",
    ["much"] = "#fff200",
    ["depress"] = "#fff200",
    ["big"] = "#fff200",
    ["definitely"] = "#fff200",
    ["fabulous"] = "#fff200",
    ["bee"] = "#fff200",
    [":3"] = "#fff200",
    ["red"] = "#ff0000",
    ["loki"] = "#ff0000",
    ["run"] = "#ff0000",
    ["dead"] = "#ff0000",
    ["death"] = "#ff0000",
    ["died"] = "#ff0000",
    ["die"] = "#ff0000",
    ["brutus"] = "#ff0000",
    ["2001"] = "#ff0000",
    ["9/11"] = "#ff0000",
    ["genocide"] = "#ff0000",
    ["hate"] = "#ff0000",
    ["redstone"] = "#ff0000",
    ["blood"] = "#ff0000",
    ["kill"] = "#ff0000",
    ["sucks"] = "#ff0000",
    ["nether"] = "#940000",
    ["orange"] = "#fca600",
    ["break"] = "#fca600",
    ["copper"] = "#fca600",
    ["lava"] = "#fca600",
    ["brown"] = "#7f4b3a",
    ["horse"] = "#7f4b3a",
    ["shit"] = "#7f4b3a",
    ["green"] = "#00c000",
    ["emerald"] = "#00c000",
    ["please"] = "#00c000",
    ["moss"] = "#00c000",
    ["unpleasant"] = "#25D22B",
    ["snake"] = "#25D22B",
    ["starbucks"] = "#006241",
    ["cyan"] = "#40fcff",
    ["olyy"] = "#40fcff",
    ["yeer"] = "#40fcff",
    ["miku"] = "#40fcff",
    ["cozr"] = "#40fcff",
    ["aqua"] = "#40fcff",
    ["diamond"] = "#40fcff",
    ["Caarsun"] = "#40fcff",
    ["blue"] = "#003cff",
    ["water"] = "#003cff",
    ["rain"] = "#003cff",
    ["lapis"] = "#003cff",
    ["navy"] = "#023542",
    ["sculk"] = "#023542",
    ["discord"] = "#7289da",
    ["purple"] = "#d535d9",
    ["burple"] = "#35063e",
    ["breed"] = "#d535d9",
    ["end"] = "#d535d9",
    ["twitch"] = "#d535d9",
    ["amethyst"] = "#d535d9",
    ["spider"] = "#d535d9",
    ["pink"] = "#FC68B2",
    ["cute"] = "#FC68B2",
    ["sylveon"] = "#FC68B2",
    ["rawr"] = "#FC68B2",
    ["UwU"] = "#FC68B2",
    ["white"] = "#FFFFFF",
    ["grey"] = "#808080",
    ["gray"] = "#808080",
    ["news"] = "#808080",
    ["black"] = "#000000",
    ["void"] = "#000000",
    ["nsfw"] = "#000000",
    ["dark"] = "#000000",
    ["twisted"] = "#000000",
    ["money"] = "#25D22B",
    ["baba"] = "#d9386a",
    ["you"] = "#d9386a",
    ["is"] = "#FFFFFF",
    ["murder"] = "#ff0000",
    ["Tim"] = "#ff0000",
    ["cyan"] = "#14b8b8",
    ["teto"] = "#ff4271",
}

local gradient_words = {
    ["rainbow"] = {"#ff0000", "#ff8000", "#ffff00", "#00ff00", "#0080ff", "#8000ff"},
    ["fire"] = {"#ff0000", "#ff4000", "#ff8000", "#ffff00"},
    ["ocean"] = {"#000080", "#0040ff", "#0080ff", "#00ffff"},
    ["sunset"] = {"#ff4000", "#ff8000", "#ffff00", "#ff8040"},
    ["galaxy"] = {"#200040", "#400080", "#8000ff", "#ff00ff"},
    ["forest"] = {"#004000", "#008000", "#40ff40", "#80ff80"},
    ["breed?"] = {"#83007F", "#EE0BD7", "#FC00F4", "#FF1E9A"},
    ["cozr"] = {"#fcfcfc", "#fcb4bf", "#b3fcec", "#7e7e7e"},
    ["unpleasant"] = {"#25d22b", "#ff3afc", "#9e5206"},
    ["unplsnt_gradient"] = {"#25d22b", "#ff3afc", "#9e5206"},
    ["gradient"] = {"#25d22b", "#ff3afc", "#9e5206"},
    ["colors"] = {"#ff0000", "#00ff00", "#0000ff"},
    ["carson"] = {"#990000", "#FFB0B0", "#888888"},
    ["jayjkuba"] = {"#9C654A", "#E4945A", "#FFB900"},
    ["redkuba"] = {"#b40000", "#ff0000", "#ff6565"},
    ["bluekuba"] = {"#004cbe", "#0080ff", "#7bb0ff"},
    ["greenkuba"] = {"#008a00", "#00ff00", "#89ff89"},
    ["yellowkuba"] = {"#FFD700", "#FFFF66", "#FFD700"},
    ["burplekuba"] = {"#1a021f", "#6a0dad",  "#CF9FFF"},
    ["orangekuba"] = {"#ce7202", "#FF8C00", "#FFB347"},
    ["pinkkuba"] = {"#b42a6f", "#FF69B4", "#FFB6C1"},
    ["graykuba"] = {"#585858", "#919191", "#bbbbbb"},
    ["greykuba"] = {"#585858", "#919191", "#bbbbbb"},
    ["glasskuba"] = {"#ffffff", "#a1a1a1", "#666666"},
    ["ghostkuba"] = {"#ffffff", "#d8d8d8", "#c0c0c0"},
    ["pisskuba"] = {"#FFD700", "#FFFF66", "#FFD700"},
    ["pride"] = {"#e40303", "#ff8c00", "#ffed00", "#008018", "#004cff", "#732982"},
    ["gay"] = {"#078d70", "#98e8c1", "#ffffff", "#7bade2", "#3d1a78"},
    ["lesbian"] = {"#d62900", "#ff9b55", "#ffffff", "#d462a6", "#a40062"},
    ["bi"] = {"#d60270", "#d60270", "#9b59b6", "#0038a8", "#0038a8"},
    ["bisexual"] = {"#d60270", "#d60270", "#9b59b6", "#0038a8", "#0038a8"},
    ["trans"] = {"#5bcefa", "#f5a9b8", "#ffffff", "#f5a9b8", "#5bcefa"},
    ["transgender"] = {"#5bcefa", "#f5a9b8", "#ffffff", "#f5a9b8", "#5bcefa"},
    ["nb"] = {"#fcf434", "#ffffff", "#9c59d1", "#000000"},
    ["nonbinary"] = {"#fcf434", "#ffffff", "#9c59d1", "#000000"},
    ["enby"] = {"#fcf434", "#ffffff", "#9c59d1", "#000000"},
    ["pan"] = {"#ff218c", "#ffd800", "#21b1ff"},
    ["pansexual"] = {"#ff218c", "#ffd800", "#21b1ff"},
    ["ace"] = {"#000000", "#a3a3a3", "#ffffff", "#800080"},
    ["asexual"] = {"#000000", "#a3a3a3", "#ffffff", "#800080"},
    ["aro"] = {"#3da542", "#a7d379", "#ffffff", "#a9a9a9", "#000000"},
    ["aromantic"] = {"#3da542", "#a7d379", "#ffffff", "#a9a9a9", "#000000"},
    ["demi"] = {"#000000", "#a3a3a3", "#ffffff", "#800080"},
    ["demisexual"] = {"#000000", "#a3a3a3", "#ffffff", "#800080"},
    ["fluid"] = {"#ff75a2", "#ffffff", "#be18d6", "#000000", "#333ebd"},
    ["genderfluid"] = {"#ff75a2", "#ffffff", "#be18d6", "#000000", "#333ebd"},
    ["agender"] = {"#000000", "#c4c4c4", "#ffffff", "#b7f684", "#ffffff", "#c4c4c4", "#000000"},
    ["poly"] = {"#f714ba", "#01d66a", "#1594f6"},
    ["polysexual"] = {"#f714ba", "#01d66a", "#1594f6"},
    ["omni"] = {"#fe9ace", "#ff66cc", "#660099", "#0066cc", "#3333cc"},
    ["omnisexual"] = {"#fe9ace", "#ff66cc", "#660099", "#0066cc", "#3333cc"},
    ["queer"] = {"#000000", "#99d9ea", "#b19cd9", "#ffffff", "#f5a9b8"},
    ["questioning"] = {"#678094", "#b3d6ed", "#ffffff", "#e8b5e8", "#9b4f96"},
    ["usa"] = {"#b22234", "#ffffff", "#3c3b6e"},
    ["america"] = {"#b22234", "#ffffff", "#3c3b6e"},
    ["canada"] = {"#ff0000", "#ffffff", "#ff0000"},
    ["uk"] = {"#012169", "#ffffff", "#c8102e"},
    ["britain"] = {"#012169", "#ffffff", "#c8102e"},
    ["england"] = {"#ffffff", "#ce1126"},
    ["france"] = {"#0055a4", "#ffffff", "#ef4135"},
    ["germany"] = {"#000000", "#dd0000", "#ffce00"},
    ["italy"] = {"#009246", "#ffffff", "#ce2b37"},
    ["spain"] = {"#aa151b", "#f1bf00", "#aa151b"},
    ["netherlands"] = {"#21468b", "#ffffff", "#ae1c28"},
    ["holland"] = {"#21468b", "#ffffff", "#ae1c28"},
    ["russia"] = {"#ffffff", "#0039a6", "#d52b1e"},
    ["japan"] = {"#ffffff", "#bc002d", "#ffffff"},
    ["china"] = {"#de2910", "#ffde00", "#de2910"},
    ["india"] = {"#ff9933", "#ffffff", "#138808"},
    ["brazil"] = {"#009c3b", "#ffdf00", "#002776"},
    ["brazilian"] = {"#009c3b", "#ffdf00", "#002776"},
    ["australia"] = {"#00008b", "#ffffff", "#ff0000"},
    ["mexico"] = {"#006847", "#ffffff", "#ce1126"},
    ["sweden"] = {"#006aa7", "#fecc00", "#006aa7"},
    ["norway"] = {"#ef2b2d", "#ffffff", "#002868"},
    ["finland"] = {"#ffffff", "#003580", "#ffffff"},
    ["denmark"] = {"#c8102e", "#ffffff", "#c8102e"},
    ["ireland"] = {"#169b62", "#ffffff", "#ff883e"},
    ["scotland"] = {"#005eb8", "#ffffff", "#005eb8"},
    ["Pixel"] = {"#005eb8", "#678094", "#005eb8","#678094", "#005eb8"},
    ["wales"] = {"#00b04f", "#ffffff", "#dd2d26"},
    ["poland"] = {"#ffffff", "#dc143c"},
    ["ukraine"] = {"#005bbb", "#ffd700"},
}

-- ================================
-- INTERNAL VARIABLES
-- ================================

-- bubble_stack[1] = newest (shown at bottom), bubble_stack[#] = oldest (shown highest)
-- Each entry: { msg, msg_len, current_char, chars_delay_countdown, hiding, hide_ticks, task_name }
local bubble_stack = {}
local bubble_id_counter = 0

local hover_animation_time = 0
local typing_dot_animation = 0
local typing_indicator_visible = false
local remote_typing_indicator = false
local menu_indicator_visible = false

if not model_path then
    error("No localspeech model found. Did you download it? Make sure to place the localspeech.bbmodel file in your avatar root folder.")
end


-- ================================
-- DYNAMIC TIMING
-- ================================

local function calculate_dynamic_hold_time(message)
    local total_time = 0
    for i = 1, #message do
        local char = message:sub(i, i)
        if char == "." then
            total_time = total_time + dot_char_hold_time
        elseif char == "," or char == ";" or char == ":" or char == "!" or char == "?" then
            total_time = total_time + slow_char_hold_time
        else
            total_time = total_time + base_char_hold_time
        end
    end
    return math.max(math.floor(total_time * hold_time_multiplier), minimum_hold_time)
end

-- ================================
-- UTF-8 HELPERS
-- ================================

local function utf8_len(str)
    local _, count = string.gsub(str, "[^\128-\191]", "")
    return count
end

local function utf8_char_len(c)
    if c < 0x80 then return 1
    elseif c < 0xE0 then return 2
    elseif c < 0xF0 then return 3
    else return 4 end
end

local function utf8_nth_from_end(str, n)
    local i = #str
    local count = 0
    while i > 0 do
        local c = str:byte(i)
        if c < 0x80 or c >= 0xC0 then
            count = count + 1
            if count == n then
                return str:sub(i, i + utf8_char_len(c) - 1)
            end
        end
        i = i - 1
    end
    return ""
end

local function utf8_sub(str, n)
    local i = 1
    local len = 0
    while i <= #str do
        len = len + 1
        if len > n then return str:sub(1, i - 1) end
        local c = str:byte(i)
        if c < 0x80 then i = i + 1
        elseif c < 0xE0 then i = i + 2
        elseif c < 0xF0 then i = i + 3
        else i = i + 4 end
    end
    return str
end

local function utf8_char_at(str, pos)
    local byte_pos = 1
    local char_count = 0
    while byte_pos <= #str do
        char_count = char_count + 1
        if char_count == pos then
            local c = str:byte(byte_pos)
            return str:sub(byte_pos, byte_pos + utf8_char_len(c) - 1)
        end
        local c = str:byte(byte_pos)
        byte_pos = byte_pos + utf8_char_len(c)
    end
    return ""
end

-- ================================
-- COLOR HELPERS
-- ================================

local function hex_to_rgb(hex)
    local r, g, b = hex:match("#(%x%x)(%x%x)(%x%x)")
    if r and g and b then
        return tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
    end
    return 255, 255, 255
end

local function rgb_to_hex(r, g, b)
    return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

local function lerp_color(color1, color2, t)
    local r1, g1, b1 = hex_to_rgb(color1)
    local r2, g2, b2 = hex_to_rgb(color2)
    return rgb_to_hex(r1+(r2-r1)*t, g1+(g2-g1)*t, b1+(b2-b1)*t)
end

local function create_gradient_segments(word, colors)
    local segments = {}
    local word_len = utf8_len(word)
    if word_len <= 1 or #colors < 2 then
        table.insert(segments, { type = "color", text = word, color = colors[1] or "#ffffff" })
        return segments
    end
    for i = 1, word_len do
        local char = utf8_char_at(word, i)
        local progress = (i - 1) / (word_len - 1)
        local segment_size = 1 / (#colors - 1)
        local segment_index = math.floor(progress / segment_size) + 1
        local local_progress = (progress % segment_size) / segment_size
        if segment_index >= #colors then
            segment_index = #colors - 1
            local_progress = 1
        end
        local color = lerp_color(colors[segment_index], colors[segment_index+1], local_progress)
        table.insert(segments, { type = "color", text = char, color = color })
    end
    return segments
end

local function get_typing_indicator_text()
    local dots_count = math.floor(typing_dot_animation / typing_dots_speed) % (typing_dots_max + 1)
    local full_text = typing_indicator_text .. string.rep(typing_indicator_text, dots_count)
    local palette = ColorLerp.colors or {typing_indicator_color}
    local gradient_segs = create_gradient_segments(full_text, palette)
    local parts = {'""'}
    for _, seg in ipairs(gradient_segs) do
        table.insert(parts, string.format('{"text":%q,"color":"%s","bold":true}', seg.text, seg.color))
    end
    return "[" .. table.concat(parts, ",") .. "]"
end

local function get_menu_indicator_text()
    local palette = ColorLerp.colors or {menu_indicator_color}
    local gradient_segs = create_gradient_segments(menu_indicator_text, palette)
    local parts = {'""'}
    for _, seg in ipairs(gradient_segs) do
        table.insert(parts, string.format('{"text":%q,"color":"%s","bold":true}', seg.text, seg.color))
    end
    return "[" .. table.concat(parts, ",") .. "]"
end

local function is_in_menu()
    local screen = host:getScreen()
    return screen == "net.minecraft.class_433"
end

local function is_entire_message_caps(text)
    local has_letters = false
    for i = 1, #text do
        local char = text:sub(i, i)
        if char:match("%a") then
            has_letters = true
            if char:lower() == char then return false end
        end
    end
    return has_letters
end


-- ================================
-- TEXT PROCESSING
-- ================================

local function truncate_color_json(text, max_chars)
    local segments = {}
    local last_end = 1

    while true do
        local s, e = string.find(text, "%S+", last_end)
        if not s then break end
        local prefix = text:sub(last_end, s - 1)
        local word = text:sub(s, e)

        if #segments == 0 then
            table.insert(segments, { type = "text", text = "" })
        end
        if prefix ~= "" then
            table.insert(segments, { type = "text", text = prefix })
        end

        local word_lower = word:lower()
        local is_asterisked = word:sub(1,1) == "*" and word:sub(-1) == "*" and #word > 2

        if is_asterisked then
            word = word:sub(2, -2)
            table.insert(segments, { type = "color", text = word, color = "#fff200" })
        else
            local gradient_colors = gradient_words[word_lower]
            if gradient_colors then
                for _, gs in ipairs(create_gradient_segments(word, gradient_colors)) do
                    table.insert(segments, gs)
                end
            else
                local match_color, longest_match = nil, 0
                for key, color in pairs(color_words) do
                    if word_lower:sub(1, #key) == key and #key > longest_match then
                        match_color = color
                        longest_match = #key
                    end
                end
                if match_color then
                    table.insert(segments, { type = "color", text = word, color = match_color })
                else
                    table.insert(segments, { type = "text", text = word })
                end
            end
        end
        last_end = e + 1
    end

    local suffix = text:sub(last_end)
    if suffix ~= "" then
        table.insert(segments, { type = "text", text = suffix })
    end

    local used = 0
    local out_segs = {}
    for _, seg in ipairs(segments) do
        local seg_len = utf8_len(seg.text) or 0
        if used + seg_len < max_chars then
            table.insert(out_segs, seg)
            used = used + seg_len
        else
            local remaining = max_chars - used
            if remaining > 0 then
                local part = utf8_sub(seg.text, remaining)
                if seg.type == "color" then
                    table.insert(out_segs, { type = "color", text = part, color = seg.color })
                else
                    table.insert(out_segs, { type = "text", text = part })
                end
            end
            break
        end
    end

    local parts = {}
    for _, seg in ipairs(out_segs) do
        local active_color = (ColorLerp.colors and ColorLerp.colors[2]) or default_text_color
        if seg.type == "text" then
            if text_bold then
                table.insert(parts, string.format("{\"text\":%q,\"color\":%q,\"bold\":true}", seg.text, active_color))
            else
                table.insert(parts, string.format("{\"text\":%q,\"color\":%q}", seg.text, active_color))
            end
        else
            table.insert(parts, string.format("{\"text\":%q,\"color\":%q,\"bold\":true}", seg.text, seg.color))
        end
    end

    return "[" .. table.concat(parts, ",") .. "]"
end

-- ================================
-- BUBBLE HELPERS
-- ================================

local function remove_bubble_task(b)
    if model_path.localspeech.text:getTask(b.task_name) then
        model_path.localspeech.text:removeTask(b.task_name)
    end
    if model_path.localspeech.text:getTask(b.task_name .. "_back") then
        model_path.localspeech.text:removeTask(b.task_name .. "_back")
    end
end

-- Y position for a bubble at slot index (1 = newest/bottom, higher = older/above)
local function y_for_slot(slot)
    local y = text_y_position
    for i = 1, slot - 1 do
        y = y + (bubble_stack[i].height or bubble_spacing) + 2
    end
    -- offset the bubble upward by its own height so multiline messages don't sink down
    y = y + (bubble_stack[slot] and bubble_stack[slot].height or bubble_spacing) - bubble_spacing
    return y
end
local function draw_bubble(b, slot, extra_shake)
    local shake_x, shake_y = 0, 0
    if enable_text_shake and is_entire_message_caps(b.msg) then
        shake_x = (math.random() - 0.5) * 2 * shake_intensity * caps_shake_multiplier
        shake_y = (math.random() - 0.5) * 2 * shake_intensity * caps_shake_multiplier
    end
    if extra_shake then
        shake_x = (math.random() - 0.5) * 2 * shake_intensity
        shake_y = (math.random() - 0.5) * 2 * shake_intensity
    end

    local ypos = y_for_slot(slot)
    local json = truncate_color_json(b.msg, b.current_char)

    local t = model_path.localspeech.text:newText(b.task_name)
    t:setText(json)
     :setPos(text_x_position + shake_x, ypos + shake_y, text_z_position)
     :setScale(text_scale)
     :setAlignment(text_alignment)
     :setWidth(text_width)
     :setLight(text_light_level, text_light_level)
     :setOutline(enable_outline)
     :setOutlineColor(outline_color[1], outline_color[2], outline_color[3])
     :setShadow(enable_shadow)
     :setSeeThrough(enable_see_through)
    if enable_back_copy then
        local t2 = model_path.localspeech.text:newText(b.task_name .. "_back")
        t2:setText(json)
        :setPos(text_x_position + shake_x, ypos + shake_y, text_z_position - 0.1)
        :setRot(0, 180, 0)
        :setScale(text_scale)
        :setAlignment(text_alignment)
        :setWidth(text_width)
        :setLight(text_light_level, text_light_level)
        :setOutline(enable_outline)
        :setOutlineColor(outline_color[1], outline_color[2], outline_color[3])
        :setShadow(enable_shadow)
        :setSeeThrough(enable_see_through)
    end
end
-- ================================
-- RENDER
-- ================================

events.RENDER:register(function(d)
    if not player:isLoaded() then return end

    if enable_text_hover then
        hover_animation_time = hover_animation_time + hover_speed
    end

    if enable_text_hover and #bubble_stack > 0 then
        model_path.localspeech:setPos(
            math.sin(hover_animation_time) * hover_intensity,
            math.cos(hover_animation_time * 0.7) * hover_intensity * 0.5,
            0
        )
    else
        model_path.localspeech:setPos(0, 0, 0)
    end

    if enable_typing_indicator then
        if typing_indicator_visible or remote_typing_indicator then
            typing_dot_animation = typing_dot_animation + 1
            local t = model_path.localspeech:newText("typing_indicator")
            t:setText(get_typing_indicator_text())
             :setPos(typing_indicator_x-1, typing_indicator_y, typing_indicator_z)
             :setScale(typing_indicator_scale)
             :setAlignment(typing_indicator_alignment)
             :setWidth(100)
             :setLight(15, 15)
             :setOutline(true)
             :setOutlineColor(0, 0, 0)
             :setShadow(true)
             :setSeeThrough(true)
             :setVisible(true)
        else
            if model_path.localspeech:getTask("typing_indicator") then
                model_path.localspeech:removeTask("typing_indicator")
            end
        end

        if menu_indicator_visible then
            local t = model_path.localspeech:newText("menu_indicator")
            t:setText(get_menu_indicator_text())
             :setPos(typing_indicator_x, typing_indicator_y + 4, typing_indicator_z)
             :setScale(typing_indicator_scale*1.2)
             :setAlignment(typing_indicator_alignment)
             :setWidth(100)
             :setLight(15, 15)
             :setOutline(true)
             :setOutlineColor(0, 0, 0)
             :setShadow(true)
             :setSeeThrough(true)
             :setVisible(true)
        else
            if model_path.localspeech:getTask("menu_indicator") then
                model_path.localspeech:removeTask("menu_indicator")
            end
        end
    end
end)

-- ================================
-- TICK
-- ================================

function events.tick()
    if not player:isLoaded() then return end
    local idx = 1
    while idx <= #bubble_stack do
        local b = bubble_stack[idx]
        -- slot 1 = newest at bottom, older ones are higher up
        local slot = idx

        if b.current_char < b.msg_len then
            -- Still typing out characters
            b.chars_delay_countdown = b.chars_delay_countdown + 1

            local current_delay = chars_delay
            local next_char = utf8_char_at(b.msg, b.current_char + 1)
            if next_char == "." then
                current_delay = chars_delay * dots_slowdown_multiplier
            end

            if b.chars_delay_countdown >= current_delay then
                b.current_char = b.current_char + 1
                b.chars_delay_countdown = 0

                -- Normal typing shake
                local shake_x, shake_y = 0, 0
                if enable_text_shake then
                    local intensity = shake_intensity
                    if is_entire_message_caps(b.msg) then
                        intensity = shake_intensity * caps_shake_multiplier
                    end
                    shake_x = (math.random() - 0.5) * 2 * intensity
                    shake_y = (math.random() - 0.5) * 2 * intensity
                end

                local ypos = y_for_slot(slot)
                local json = truncate_color_json(b.msg, b.current_char)

                local t1 = model_path.localspeech.text:newText(b.task_name)
                t1:setText(truncate_color_json(b.msg, b.current_char))
                 :setPos(text_x_position + shake_x, y_for_slot(slot) + shake_y, text_z_position)
                 :setScale(text_scale)
                 :setAlignment(text_alignment)
                 :setWidth(text_width)
                 :setLight(text_light_level, text_light_level)
                 :setOutline(enable_outline)
                 :setOutlineColor(outline_color[1], outline_color[2], outline_color[3])
                 :setShadow(enable_shadow)
                 :setSeeThrough(enable_see_through)
                if enable_back_copy then
                    local t2 = model_path.localspeech.text:newText(b.task_name .. "_back")
                    t2:setText(truncate_color_json(b.msg, b.current_char))
                    :setPos(text_x_position + shake_x, y_for_slot(slot) + shake_y, text_z_position-0.1)
                    :setRot(0, 180, 0)
                    :setScale(text_scale)
                    :setAlignment(text_alignment)
                    :setWidth(text_width)
                    :setLight(text_light_level, text_light_level)
                    :setOutline(enable_outline)
                    :setOutlineColor(outline_color[1], outline_color[2], outline_color[3])
                    :setShadow(enable_shadow)
                    :setSeeThrough(enable_see_through)
                end
                -- Play letter sound
                local visible_text = utf8_sub(b.msg, b.current_char)
                local last_char = utf8_nth_from_end(visible_text, 3)
                if last_char ~= " " then
                    local cur = utf8_char_at(b.msg, b.current_char)
                    if cur == "." then
                        sounds:playSound(typing_sound, player:getPos(), sound_volume,
                            math.random(dots_pitch_range[1], dots_pitch_range[2]) / 100)
                    elseif cur:match("^[A-Za-z]$") then
                        sounds:playSound("entity.spider.step", player:getPos(), sound_volume - 0.4 , 4.0 + math.random() * 1.0) 

                    elseif cur:match("^\?$") then
                         sounds:playSound("minecraft:entity.villager.trade", player:getPos(), sound_volume,
                            math.random(high_pitch_range[1], high_pitch_range[2]) / 100)
                        
                    else
                        sounds:playSound(typing_sound, player:getPos(), sound_volume,
                            math.random(normal_pitch_range[1], normal_pitch_range[2]) / 100)
                    end
                end
            else
                -- Not yet time to type next char, but still update Y in case stack shifted
                draw_bubble(b, slot, false)
            end

        elseif not b.hiding then
            -- Just finished typing, start hold timer
            b.hiding = true
            b.hide_ticks = message_hold_time
            draw_bubble(b, slot, false)

        else
            -- Counting down, update position each tick so shifting works smoothly
            draw_bubble(b, slot, is_entire_message_caps(b.msg))

            b.hide_ticks = b.hide_ticks - 1
            if b.hide_ticks <= 0 then
                remove_bubble_task(b)
                table.remove(bubble_stack, idx)
                if #bubble_stack == 0 and hide_nameplate_during_speech then
                    nameplate.ENTITY:setVisible(true)
                end
                -- Don't increment idx, the next bubble is now at this same index
                goto continue
            end
        end

        idx = idx + 1
        ::continue::
    end

    -- Typing indicator detection
    if enable_typing_indicator then
        local chat_open = host:isChatOpen()
        if chat_open and not typing_indicator_visible then
            typing_indicator_visible = true
            typing_dot_animation = 0
            pings.typing_indicator(true)
        elseif not chat_open and typing_indicator_visible then
            typing_indicator_visible = false
            pings.typing_indicator(false)
        end

        -- Menu indicator detection (separate from typing indicator)
        local in_menu = is_in_menu()
        if in_menu and not menu_indicator_visible then
            menu_indicator_visible = true
        elseif not in_menu and menu_indicator_visible then
            menu_indicator_visible = false
        end
    end
end

-- ================================
-- SPEECH GENERATION
-- ================================

local function generate_speech(msg)
    bubble_id_counter = bubble_id_counter + 1
    local task_name = "bubble_" .. bubble_id_counter

    -- If already at max, kill the oldest bubble (last in stack)
    if #bubble_stack >= max_bubbles then
        local oldest = bubble_stack[#bubble_stack]
        remove_bubble_task(oldest)
        table.remove(bubble_stack, #bubble_stack)
    end

    -- New message goes to front (slot 1 = bottom/newest)
    table.insert(bubble_stack, 1, {
        msg = msg,
        msg_len = utf8_len(msg),
        current_char = 0,
        chars_delay_countdown = 0,
        hiding = false,
        hide_ticks = 0,
        task_name = task_name,
        height = math.max(client.getTextDimensions(msg, text_width, true)[2] * text_scale, bubble_spacing),
    })  

    if hide_nameplate_during_speech then
        nameplate.ENTITY:setVisible(false)
    end

    if enable_text_hover then
        pings.sync_hover_animation(hover_animation_time)
    end

    model_path.localspeech.text:setVisible(true)
end

-- ================================
-- PINGS
-- ================================

function pings.chat_msg(msg)
    generate_speech(msg)
end

function pings.play_voice_sound(sound_file, pitch)
    if sound_file and pitch then
        local speak = sounds[sound_file]
        speak:setPos(player:getPos())
        speak:setPitch(pitch)
        speak:setVolume(sound_volume)
        speak:setSubtitle("Postman67 Speaks")
        speak:play()
    end
end

function pings.sync_hover_animation(animation_time)
    if enable_text_hover then
        hover_animation_time = animation_time
    end
end

function pings.typing_indicator(is_visible)
    if enable_typing_indicator then
        remote_typing_indicator = is_visible
        if is_visible then typing_dot_animation = 0 end
    end
end

-- ================================
-- CHAT SEND
-- ================================

function events.CHAT_SEND_MESSAGE(msg)
    if not player:isLoaded() then return end
    if not msg or msg == "" then return msg end
    if msg:sub(1, 1) == "/" then return msg end

    -- One-time global only, no bubble
    if msg:sub(1, 1) == chat_override_prefix then
        local override_msg = msg:sub(2)
        if enable_chat_override then
            return override_msg
        else
            pings.chat_msg(override_msg)
            host:appendChatHistory(override_msg)
            return nil
        end
    end

    -- One-time global+local with prefix
    if msg:sub(1, 1) == globalandlocal_chat_prefix then
        local global_msg = msg:sub(2)
        pings.chat_msg(global_msg)
        return global_msg
    end

    -- Normal message — behavior depends on toggle
    if enable_chat_override then
        if global_chat_toggle then
            return msg  -- send globally 
        else
            pings.chat_msg(msg)
            host:appendChatHistory(msg)
            return nil  -- local bubble only
        end
    else
        return msg
    end
end

-- ================================
-- PINGS
-- ================================
function pings.setTextScale(scale)
    text_scale = scale
end
function pings.setTextX(X)
    text_x_position = X
end
function pings.setTextY(Y)
    text_y_position = Y
end
function pings.setTextZ(Z)
    text_z_position = Z
end
function pings.setMaxBubbles(bubbles)
    max_bubbles = bubbles
end
function pings.setLifetime(lifetime)
    message_hold_time = lifetime
end
function pings.toggleBackCopy()
    enable_back_copy = not enable_back_copy
end
function pings.clearBubbles()
    for _, b in ipairs(bubble_stack) do
        remove_bubble_task(b)
    end
    bubble_stack = {}
    if hide_nameplate_during_speech then
        nameplate.ENTITY:setVisible(true)
    end
end