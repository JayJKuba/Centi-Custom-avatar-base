local wheel = {}
local actionPage = action_wheel:newPage("actionPage")


armorVisible=false
vanilla_model.ARMOR:setVisible(false)

function pings.armorShow()
    vanilla_model.ARMOR:setVisible(true)
    armorVisible=true
end

function pings.armorHide()
    vanilla_model.ARMOR:setVisible(false)
    armorVisible=false
end

actionPage:newAction()
    :title("Armor Toggle")
    :item("minecraft:iron_chestplate")
    :hoverItem("minecraft:barrier")
    :color(0.8, 0.8, 0.8)
    :hoverColor(1, 0.3, 0.3)
    :onLeftClick(function()
        if armorVisible then
            pings.armorHide()
        else
            pings.armorShow()
        end
    end)




actionPage:newAction()
    :title("Big Text")
    :item("minecraft:spyglass")
    :onToggle(function(val)
        pings.setTextScale(val and 1 or 0.4)
        pings.setTextY(val and 14 or 22)
        pings.setTextZ(val and -5 or 0)
        pings.setMaxBubbles(val and 1 or 3)
        pings.setLifetime(val and 10000 or 200)
        pings.toggleBackCopy()
        pings.clearBubbles()
    end)

action_wheel:setPage("actionPage")
return wheel