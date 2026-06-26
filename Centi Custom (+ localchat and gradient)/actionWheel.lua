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
    :item("minecraft:barrier")
    :toggleItem("minecraft:iron_chestplate")
    :onToggle(function(state)
        if state then
            pings.armorShow()
        else
            pings.armorHide()
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