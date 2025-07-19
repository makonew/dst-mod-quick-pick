local quick_pick_list = {"sapling", "marsh_bush", "reeds", "grass", "berrybush2", "berrybush", "flower_cave",
                         "flower_cave_double", "flower_cave_triple", "red_mushroom", "green_mushroom", "blue_mushroom",
                         "wormlight_plant", "rock_avocado_bush", "bullkelp_plant", "carrat_planted", "sapling_moon"}

-- Quick Pick Cactus or Lichen
if GetModConfigData("quick_pick_cactus") then
    local quick_pick_list2 = {"cactus", "oasis_cactus", "lichen"}
    for k, v in pairs(quick_pick_list2) do
        table.insert(quick_pick_list, v)
    end
end

-- Quick Pick Wormwood's plant
if GetModConfigData("quick_pick_plant_normal_ground") then
    table.insert(quick_pick_list, "plant_normal_ground")
end

-- For the mod of Coffee
if GLOBAL.KnownModIndex:IsModEnabled("workshop-1463489316") then
    table.insert(quick_pick_list, "coffeebush")
end

-- Quick pick from cookpots, dryers and farms
if GetModConfigData("quick_harvest") then
    AddStategraphPostInit("wilson", function(sg)
        local actionhandler = GLOBAL.ActionHandler(GLOBAL.ACTIONS.HARVEST, "doshortaction")
        sg.actionhandlers[GLOBAL.ACTIONS.HARVEST] = actionhandler
    end)
end

-- Quick cooking on firepit
if GetModConfigData("quick_cook_on_fire") then
    AddStategraphPostInit("wilson", function(sg)
        local actionhandler = GLOBAL.ActionHandler(GLOBAL.ACTIONS.COOK, "doshortaction")
        sg.actionhandlers[GLOBAL.ACTIONS.COOK] = actionhandler
    end)
end
--Moon quay stuff
if GetModConfigData("quick_pick_moon_quay") then
    local quick_pick_list2 = {
        "monkeytail",
        "bananabush",
    }
    for k,v in pairs(quick_pick_list2) do
        table.insert(quick_pick_list, v)
    end
end



-- Quick pick when riding on Beefalo
if GetModConfigData("quick_on_riding") then
    AddStategraphPostInit("wilson", function(sg)
        local actionhandler_pick = GLOBAL.ActionHandler(GLOBAL.ACTIONS.PICK, function(inst, action)
            if action.target ~= nil and action.target.prefab == "otterden" then
                return "doshortaction"
            end
            return (action.target ~= nil and action.target.prefab ~= "otterden" and action.target.components.pickable ~= nil and
                       ((action.target.components.pickable.jostlepick and "dojostleaction") or
                           (action.target.components.pickable.quickpick and "doshortaction") or
                           (inst:HasTag("fastpicker") and "doshortaction") or
                           (inst:HasTag("quagmire_fasthands") and "domediumaction") or "dolongaction")) or nil
        end)
        sg.actionhandlers[GLOBAL.ACTIONS.PICK] = actionhandler_pick

        local actionhandler_pickup = GLOBAL.ActionHandler(GLOBAL.ACTIONS.PICKUP, function(inst, action)
            return (action.target ~= nil and  action.target.prefab ~= "otterden" and action.target:HasTag("minigameitem") and "dosilentshortaction") or
                       "doshortaction"
        end)
        sg.actionhandlers[GLOBAL.ACTIONS.PICKUP] = actionhandler_pickup
    end)
end


for k, v in pairs(quick_pick_list) do
    AddPrefabPostInit(v, function(inst)
        if inst.components.pickable then
            inst.components.pickable.quickpick = true
        end
    end)
end


-- Quick talk when farming
if GetModConfigData("quick_plant_interact") then
    AddStategraphPostInit("wilson", function(sg)
        local actionhandler_pick = GLOBAL.ActionHandler(GLOBAL.ACTIONS.INTERACT_WITH, "doshortaction")
        sg.actionhandlers[GLOBAL.ACTIONS.INTERACT_WITH] = actionhandler_pick
    end)
end