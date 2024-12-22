local Lg = locale == "zh" or locale == "zhr"
name = Lg and "快速采集" or "Quick Pick Improved"
description = Lg and "快速采集几乎所有东西" or "It makes almost everything pick quickly."
author = "Makonew (Origin.PiaoYang (Origin.辣椒小皇纸))"
version = "1.8.1"
forumthread = ""

api_version = 10

all_clients_require_mod = false
client_only_mod = false
dst_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"Quick Pick"}

----------------------
-- General settings --
----------------------

local boolean_option = {{
    description = "No",
    data = false,
    hover = ""
}, {
    description = "Yes",
    data = true,
    hover = ""
}}

configuration_options = {{
    name = "quick_pick_cactus",
    label = Lg and "快速采集仙人掌或苔藓" or "Quick Pick Cactus or Lichen",
    hover = Lg and "快速采集仙人掌或苔藓" or "Quick picking cactus or lichen",
    options = boolean_option,
    default = true
}, {
    name = "quick_pick_plant_normal_ground",
    label = Lg and "快速采集沃姆伍德的植物" or "Quick Pick Wormwood's plant",
    hover = Lg and "快速采集沃姆伍德种在地上的植物" or"Quick picking the plants that Wormwood planted on the groud",
    options = boolean_option,
    default = true
}, {
    name = "quick_harvest",
    label = Lg and "快速收获" or "Quick Harvest",
    hover = Lg and "快速收获锅炉、晾肉架、农场" or "Quick picking from cookpots, dryers and farms",
    options = boolean_option,
    default = true
}, {
    name = "quick_cook_on_fire",
    label = Lg and "快速在火上烹饪食物" or "Quick Cook on Fire",
    hover = Lg and "快速在篝火上烹饪食物" or "Quick cooking foods on firepit.",
    options = boolean_option,
    default = true
}, {
    name = "quick_on_riding",
    label = Lg and "骑行时快速采集" or "Quick pick when riding",
    hover = Lg and "骑行皮弗娄牛时快速采集" or "Quick pick when riding on Beefalo.",
    options = boolean_option,
    default = true
}, {
    name = "quick_plant_interact",
    label = Lg and "快速植物对话" or "Quick Talk whih Plants",
    hover = Lg and "种田时快速与植物对话" or "Quick talk to plants when farming.",
    options = boolean_option,
    default = false
},  {
    name = "quick_pick_moon_quay",
    label = "Quick Pick on Banana Bushes and Monkeytails",
    hover = "Quick Pick on Banana Bushes and Monkeytails.",
    options = boolean_option,
    default = true
},  {
    name = "quick_pick_tallbird",
    label = "Quick Pick on Tallbird nests.",
    hover = "Quick Pick on Tallbird nests.",
    options = boolean_option,
    default = true
},  {
    name = "quick_pick_oceanvine",
    label = "Quick Pick on Mossy Vine.",
    hover = "Quick Pick on Mossy Vine.",
    options = boolean_option,
    default = true
},  {
    name = "quick_takeitem",
    label = "Quick Pick on Meat Bulb.",
    hover = "Quick Pick on Meat Bulb.",
    options = boolean_option,
    default = true
                                },

}
