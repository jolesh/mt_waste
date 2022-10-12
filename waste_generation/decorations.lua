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
