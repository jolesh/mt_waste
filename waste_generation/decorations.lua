--Simple

--[[
minetest.register_decoration({
    deco_type = "simple",
    place_on = {"group:sand", "group:stone", "group:soil", },
    sidelen = 16,
    fill_ratio = 11,
    --biomes = {"grassy_plains"},
    y_max = 200,
    y_min = -10,
	 height_max = 3,
	 flags = "force_placement, all_floors",
    decoration = "waste_materials:waste_mixed_node",
})
]]

--More Advanced

----Huge waste island

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"group:sand", "group:stone", "group:soil", "default:clay"},
    sidelen = 2,
    --fill_ratio = 11,
	 noise_params = {
            offset = 0,
            scale = 3,
            spread = {x = 100, y = 100, z = 100},
            seed = 0,
            octaves = 2,
            persistence = 0.4,
            lacunarity = 2.0,
				--noise_threshold = 1,
            --flags = "absvalue"
        },
    y_max = 200,
    y_min = -20,
	 flags = "force_placement, all_floors",
    decoration = "waste_materials:waste_mixed_node",
})

---Small waste islands

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"group:sand", "group:stone", "group:soil", "default:clay"},
    sidelen = 2,
    --fill_ratio = 11,
	 noise_params = {
            offset = 0,
            scale = 1,
            spread = {x = 10, y = 10, z = 10},
            seed = 0,
            octaves = 2,
            persistence = 0.4,
            lacunarity = 2.0,
				--noise_threshold = 1,
            --flags = "absvalue"
        },
    y_max = 200,
    y_min = -20,
	 flags = "force_placement, all_floors",
    decoration = "waste_materials:waste_mixed_node",
})

---Single Waste Nodes

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"group:sand", "group:stone", "group:soil", "default:clay"},
    sidelen = 2,
    --fill_ratio = 11,
	 noise_params = {
            offset = 0,
            scale = 1,
            spread = {x = 1, y = 1, z = 1},
            seed = 0,
            octaves = 1,
            persistence = 0.4,
            lacunarity = 2.0,
				--noise_threshold = 1,
            --flags = "absvalue"
        },
    y_max = 200,
    y_min = -20,
	 flags = "force_placement, all_floors",
    decoration = "waste_materials:waste_mixed_node",
})
